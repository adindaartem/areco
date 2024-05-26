import 'package:aquatic_ar_app/logic/model/aquatic.dart';
import 'package:aquatic_ar_app/widget/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailAppbar extends StatelessWidget {
  final Animals animals;
  const DetailAppbar({super.key, required this.animals});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      expandedHeight: 500,
      backgroundColor: purpleJustDark,
      elevation: 0.0,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Builder(builder: (context) {
          if (animals.imgUrl!.contains("http")) {
            return Image.network(
              "${animals.imgUrl}",
              width: MediaQuery.of(context).size.width,
              height: 550,
              fit: BoxFit.cover,
            );
          } else {
            return Image.asset(
              animals.imgUrl!,
              width: MediaQuery.of(context).size.width,
              height: 550,
              fit: BoxFit.cover,
            );
          }
        }),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          height: 32,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32))),
          child: Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(100)),
          ),
        ),
      ),
    );
  }
}
