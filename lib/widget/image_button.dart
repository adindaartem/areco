import 'package:aquatic_ar_app/widget/theme/text_theme.dart';
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String title;
  final String image;
  final double? opacity;
  final Alignment? aligment;
  final VoidCallback? onTap;
  const ImageButton(
      {super.key,
      required this.title,
      required this.image,
      this.opacity,
      this.onTap,
      this.aligment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: AssetImage(
                image,
              ),
              opacity: opacity ?? 1.0,
              alignment: aligment ?? Alignment.bottomCenter,
              fit: BoxFit.cover),
          color: Colors.black),
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
        child: InkWell(
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Center(
            child: Text(
              title,
              style: headerTextStyle.copyWith(
                fontSize: 40,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
