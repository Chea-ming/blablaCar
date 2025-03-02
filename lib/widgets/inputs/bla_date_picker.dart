import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

/// This is a custom date picker widget that can be used to select a date.
/// The date picker allows the user to select a date from the current month and the next two months.
/// The selected date is highlighted in blue.
/// Past dates are greyed out and cannot be selected.
/// The date picker is displayed in a modal screen.
/// The date picker is used in the RidePrefForm to select a departure date.

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({super.key});

  @override
  _DatePickerScreenState createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  DateTime _selectedDate = DateTime.now();
  late DateTime _currentMonth;
  late DateTime _nextMonth;
  late DateTime _thirdMonth;

  @override
  void initState() {
    super.initState();
    _currentMonth = DateTime(_selectedDate.year, _selectedDate.month, 1);
    _nextMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
    _thirdMonth = DateTime(_currentMonth.year, _currentMonth.month + 2, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.blue, size: 30),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(''),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'When are you going?',
              style: TextStyle(
                color: Color(0xFF0A535F),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildWeekdaysHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMonthCalendar(_currentMonth, DateFormat('MMMM').format(_currentMonth)),
                    _buildMonthCalendar(_nextMonth, DateFormat('MMMM').format(_nextMonth)),
                    _buildMonthCalendar(_thirdMonth, DateFormat('MMMM').format(_thirdMonth)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeekdaysHeader() {
    final weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: weekdays
          .map((day) => Expanded(
                child: Center(
                  child: Text(
                    day,
                    style: BlaTextStyles.body.copyWith(
                      color: Color(0xFF0A535F),
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildMonthCalendar(DateTime month, String monthName) {
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final firstWeekdayOfMonth = firstDayOfMonth.weekday % 7;

    List<Widget> dayWidgets = [];

    // Month header
    dayWidgets.add(
      Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Text(
          monthName,
          style: TextStyle(
            color: Color(0xFF0A535F),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    // Empty grid for days of the week
    List<Widget> daysGrid =
        List.generate(firstWeekdayOfMonth, (index) => const SizedBox());

    // Add actual days
    for (int day = 1; day <= daysInMonth; day++) {
      final date = DateTime(month.year, month.month, day);
      final isSelected = date.year == _selectedDate.year &&
          date.month == _selectedDate.month &&
          date.day == _selectedDate.day;
      final isPastDate =
          date.isBefore(DateTime.now().subtract(Duration(days: 1)));

      daysGrid.add(
        GestureDetector(
          onTap: isPastDate
              ? null
              : () {
                  setState(() {
                    _selectedDate = date;
                  });
                  Navigator.of(context).pop(_selectedDate);
                },
          child: Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.blue : Colors.transparent,
            ),
            child: Center(
              child: Text(
                day.toString(),
                style: TextStyle(
                  color: isPastDate
                      ? Colors.grey.shade300
                      : isSelected
                          ? Colors.white
                          : Colors.grey.shade600,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      );
    }

    // Create rows with 7 days each
    List<Widget> rows = [];
    for (int i = 0; i < daysGrid.length; i += 7) {
      final end = (i + 7 < daysGrid.length) ? i + 7 : daysGrid.length;
      rows.add(
        Row(
          children: daysGrid
              .sublist(i, end)
              .map((widget) =>
                  Expanded(child: AspectRatio(aspectRatio: 1, child: widget)))
              .toList(),
        ),
      );
    }

    // Add a spacer if the last row isn't complete
    if (rows.isNotEmpty && (firstWeekdayOfMonth + daysInMonth) % 7 != 0) {
      rows.last = Row(
        children: [
          ...List.generate(
              (firstWeekdayOfMonth + daysInMonth) % 7,
              (index) => Expanded(
                  child: AspectRatio(
                      aspectRatio: 1,
                      child: daysGrid[daysGrid.length -
                          (firstWeekdayOfMonth + daysInMonth) % 7 +
                          index]))),
          ...List.generate(
              7 - (firstWeekdayOfMonth + daysInMonth) % 7,
              (index) => Expanded(
                  child: AspectRatio(aspectRatio: 1, child: const SizedBox()))),
        ],
      );
    }

    dayWidgets.addAll(rows);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: dayWidgets,
    );
  }
}
