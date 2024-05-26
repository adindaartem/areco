import 'package:aquatic_ar_app/utils.dart';
import 'package:aquatic_ar_app/widget/theme/text_theme.dart';
import 'package:flutter/material.dart';

class CardHewan extends StatefulWidget {
  final String? title;
  final String? deskripsi;
  final String? image;
  final VoidCallback? onTap;
  const CardHewan(
      {super.key, this.title, this.deskripsi, this.image, this.onTap});

  @override
  State<CardHewan> createState() => _CardHewanState();
}

class _CardHewanState extends State<CardHewan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 115,
      width: MediaQuery.of(context).size.width,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
        child: InkWell(
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: showImage(widget.image!),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        widget.title ?? "",
                        style: headerTextStyle.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        widget.deskripsi ?? "",
                        style: contentTextStyle.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
