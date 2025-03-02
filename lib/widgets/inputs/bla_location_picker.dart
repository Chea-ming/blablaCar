import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/dummy_data/dummy_data.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/widgets/display/bla_divider.dart';

class BlaLocationPicker extends StatefulWidget {
  const BlaLocationPicker({super.key});

  @override
  State<BlaLocationPicker> createState() => _BlaLocationPickerState();
}

class _BlaLocationPickerState extends State<BlaLocationPicker> {

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  String _searchQuery = "";
  List<SearchResult> _allSearchResults = [];
  List<SearchResult> _filteredResults = [];

  @override
  void initState() {
    super.initState();
    _searchController.text = _searchQuery;
    _initializeSearchResults();
    _filterResults();

    // Add listener to update filtered locations when text changes
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
        _filterResults();
      });
    });

    // Focus the search field on startup
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
  }

  // Initialize search results with recent locations
  void _initializeSearchResults() {
    _allSearchResults = fakeLocations.map((location) => SearchResult(item: location)).toList();
    _allSearchResults.addAll(fakeStreets.map((street) => SearchResult(item: street)).toList());
  }

  void _filterResults() {
    if (_searchQuery.isEmpty) {
      // Show only recent items when search is empty
      _filteredResults =
          _allSearchResults.where((result) => result.isRecent).toList();
    } else {
      // Filter based on search query
      _filteredResults = _allSearchResults
          .where((result) =>
              result.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              result.description
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _searchQuery = "";
      _filterResults();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlaColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Search header
            Container(
              decoration: BoxDecoration(
                color: BlaColors.greyLight,
                borderRadius: BorderRadius.circular(BlaSpacings.radiusSmall),
              ),
              margin: const EdgeInsets.all(BlaSpacings.m),
              padding: const EdgeInsets.symmetric(horizontal: BlaSpacings.xs, vertical: BlaSpacings.xs),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios,
                        size: BlaSize.iconSmall, 
                        color: BlaColors.neutral),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      decoration: InputDecoration(
                        hintText: 'Search for a destination',
                        border: InputBorder.none,
                        hintStyle: BlaTextStyles.body.copyWith(
                          color: BlaColors.neutralLight,
                        ),
                      ),
                      style: BlaTextStyles.body.copyWith(
                        color: BlaColors.neutralDark,
                      ),
                    ),
                  ),
                  if (_searchQuery.isNotEmpty)
                    IconButton(
                      icon: Icon(Icons.close,
                          size: BlaSize.iconSmall, 
                          color: BlaColors.neutral),
                      onPressed: _clearSearch,
                    ),
                ],
              ),
            ),

            // Location list
            Expanded(
              child: ListView.separated(
                itemCount: _filteredResults.length,
                separatorBuilder: (context, index) => BlaDivider(),
                itemBuilder: (context, index) {
                  final result = _filteredResults[index];
                  return ListTile(
                    leading: result.isRecent
                        ? Icon(Icons.access_time, color: BlaColors.greyLight)
                        : null,
                    title: Text(
                      result.name,
                      style: BlaTextStyles.body.copyWith(
                        color: BlaColors.neutralDark,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    subtitle: Text(
                      result.description,
                      style: BlaTextStyles.button.copyWith(
                        color: BlaColors.neutralLight,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: BlaColors.greyLight,
                    ),
                    onTap: () {
                      // Handle location selection
                      if (result.isCity) {
                        final city = result.item as Location;
                        setState(() {
                          Navigator.of(context).pop(city);
                        });
                      } else if (result.isStreet) {
                        final street = result.item as Street;
                        setState(() {
                          Navigator.of(context).pop(street);
                        });
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
