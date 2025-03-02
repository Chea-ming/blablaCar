import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

enum ButtonType { primary, secondary}

/// This is a custom button widget that can be used to create buttons with different styles.
/// The button can have an icon, text, or both.
/// The button style can be set using the buttonType parameter.

class BlaButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final ButtonType buttonType;
  final VoidCallback? onPressed;

  const BlaButton({
    super.key,
    required this.text,
    this.icon,
    this.buttonType = ButtonType.primary,
    required this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
    
    // Define the button style

    Color backgroundColor;
    Color textColor;
    double borderRadius = 20.0;
    double width = 500.0;
    double height = 40.0;
    Color borderColor;

    // Set the button style based on the button type
    switch (buttonType) {
      case ButtonType.primary:
        backgroundColor = BlaColors.primary;
        textColor = BlaColors.white;
        borderColor = Colors.transparent;
        break;
      case ButtonType.secondary:
        backgroundColor = BlaColors.white;
        textColor = BlaColors.primary;
        borderColor = BlaColors.greyLight;
        break;
    }

    Widget buttonContent = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: textColor, size: 20),
        Text(
          text,
          style: BlaTextStyles.button.copyWith(color: textColor),
        ),
      ],
    );

    return SizedBox(
      width: width,
      height: height,
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Ink(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: borderColor,
                width: borderColor != Colors.transparent ? 1.5 : 0,
              ),
            ),
            child: Center(
              child: buttonContent,
            ),
          ),
        ),
      ),
    );
  }
}
