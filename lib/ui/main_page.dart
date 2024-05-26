import 'package:aquatic_ar_app/ui/home_page.dart';
import 'package:aquatic_ar_app/ui/quiz_page.dart';
import 'package:aquatic_ar_app/widget/image_button.dart';
import 'package:aquatic_ar_app/widget/theme/color_theme.dart';
import 'package:aquatic_ar_app/widget/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purpleJustDark,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'ARECO',
              style: headerTextStyle.copyWith(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Lottie.asset(
              'assets/hai.json',
              width: 32,
              height: 32,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageButton(
              title: 'Material',
              image: 'assets/material.png',
              opacity: 0.7,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ImageButton(
              title: 'Quiz',
              image: 'assets/quiz.png',
              opacity: 0.8,
              aligment: Alignment.center,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const QuizPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
