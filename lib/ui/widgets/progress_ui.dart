import 'package:bridgebank_social_app/configuration/colors.dart';
import 'package:flutter/material.dart';

class ProgressUi extends StatelessWidget {
  const ProgressUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Center(
          child: CircularProgressIndicator(
            color: AppColors.secondary,
          ),
        )
      ],
    );
  }
}
