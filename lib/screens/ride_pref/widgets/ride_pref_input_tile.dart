import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/widgets/actions/bla_icon_button.dart';

class RidePrefInputTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData leftIcon;
  final bool isSelcted;

  // A right button can be optionally provided
  final IconData? rightIcon;
  final VoidCallback? onRightIconPressed;

  const RidePrefInputTile({
    super.key,
    required this.title,
    required this.onTap, 
    this.rightIcon, 
    this.onRightIconPressed, 
    required this.leftIcon, 
    required this.isSelcted,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        leftIcon,
        size: BlaSize.icon,
        color: BlaColors.iconLight,
      ),
      title: Text(
        title,
        style: BlaTextStyles.button.copyWith(
          color: isSelcted ? BlaColors.neutralDark : BlaColors.neutralLight,
        ),
      ),
      trailing: rightIcon != null
          ? BlaIconButton(icon: rightIcon, onPressed: onRightIconPressed)
          : null,
      onTap: onTap,
    );
  }
}