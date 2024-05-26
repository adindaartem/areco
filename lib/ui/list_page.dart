import 'package:aquatic_ar_app/logic/model/aquatic.dart';
import 'package:aquatic_ar_app/ui/detail_page.dart';
import 'package:aquatic_ar_app/ui/scan_page.dart';
import 'package:aquatic_ar_app/widget/card.dart';
import 'package:aquatic_ar_app/widget/loading_screen.dart';
import 'package:aquatic_ar_app/widget/theme/color_theme.dart';
import 'package:aquatic_ar_app/widget/theme/text_theme.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  final List<Animals> animals;
  final String environment;

  const ListPage({super.key, required this.animals, required this.environment});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // cuma melakukan penundaan bukan loading beneran
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purpleJustDark,
        title: Text(
          'List Page',
          style: headerTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: _isLoading
            ? const LoadingScreen()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Stack(
                  children: [
                    ListView.builder(
                      itemCount: widget.animals.length,
                      itemBuilder: (context, index) {
                        return CardHewan(
                          image: widget.animals[index].imgUrl,
                          title: widget.animals[index].name,
                          deskripsi: widget.animals[index].desc,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                        animal: widget.animals[index])));
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
