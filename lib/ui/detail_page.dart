import 'package:aquatic_ar_app/logic/model/aquatic.dart';
import 'package:aquatic_ar_app/widget/detail_appbar.dart';
import 'package:aquatic_ar_app/widget/theme/color_theme.dart';
import 'package:aquatic_ar_app/widget/theme/text_theme.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Animals animal;

  const DetailPage({super.key, required this.animal});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final player = AudioPlayer();

  @override
  void dispose() {
    player.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Page',
          style: headerTextStyle.copyWith(fontSize: 20),
        ),
        backgroundColor: purpleJustDark,
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          DetailAppbar(
            animals: widget.animal,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.animal.name!,
                    style: headerTextStyle.copyWith(
                      color: Colors.black,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Voice',
                    style: subheaderTextStyle.copyWith(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Builder(builder: (context) {
                    if (widget.animal.audio!.isNotEmpty) {
                      return ElevatedButton(
                          onPressed: () {
                            player.play(AssetSource(widget.animal.audio!));
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust as desired
                              ),
                              backgroundColor: purpleJustDark,
                              foregroundColor: Colors.white
                              // Add other styling options here (optional)
                              ),
                          child: const Icon(
                            Icons.volume_up,
                            color: Colors.white,
                          ));
                    } else {
                      return ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust as desired
                              ),
                              backgroundColor: purpleJustDark,
                              foregroundColor: Colors.white
                              // Add other styling options here (optional)
                              ),
                          child: const Icon(
                            Icons.volume_up,
                            color: Colors.white,
                          ));
                    }
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Description',
                    style: subheaderTextStyle.copyWith(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    widget.animal.desc!,
                    style: contentTextStyle.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
