import 'package:aquatic_ar_app/widget/theme/color_theme.dart';
import 'package:aquatic_ar_app/widget/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class ScanPage extends StatefulWidget {
  final String environment;
  const ScanPage({super.key, required this.environment});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  UnityWidgetController? _unityWidgetController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purpleJustDark,
        title: Text(
          'Scan page',
          style: headerTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: UnityWidget(
          onUnityCreated: onUnityCreated,
          useAndroidViewSurface: true,
          runImmediately: true,
        ),
      ),
    );
  }

  void onUnityCreated(controller) {
    _unityWidgetController = controller;
  }
}
