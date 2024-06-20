import 'package:flutter/material.dart';
import '../../configuration/colors.dart';
import '../../configuration/constants.dart';

class CustomerButton extends StatelessWidget {
  final Function () onTap;
  final String title;
  final Color? color;
  final Color? titleColor;

  const CustomerButton({super.key,
  required this.title,
    required this.onTap,
     this.color,
     this.titleColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(color??AppColors.secondary)
          ),
          child:  Text(title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
                color: titleColor??AppColors.thirdly
            ),
          )
      ),
    );
  }
}
