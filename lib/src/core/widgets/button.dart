import 'package:flutter/material.dart';
import 'package:uni_verse/src/core/constants/colors.dart';

class UniverseButton extends StatelessWidget {
  final String label;
  final bool? loading;
  final Function()? onPressed;

  const UniverseButton(
      {super.key, required this.label, this.onPressed, this.loading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 52,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            color: UniVerseColours.kPurple,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: loading != null && loading == true
              ? const Padding(
                padding: EdgeInsets.all(10.0),
                child: CircularProgressIndicator(
                    color: UniVerseColours.kWhite,
                  ),
              )
              : Text(
                  label,
                  style: const TextStyle(
                      fontSize: 16, color: UniVerseColours.kWhite),
                ),
        ),
      ),
    );
  }
}
