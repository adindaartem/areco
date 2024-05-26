import 'package:aquatic_ar_app/widget/theme/color_theme.dart';
import 'package:aquatic_ar_app/widget/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ResultPage extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  const ResultPage({
    super.key,
    required this.correctAnswers,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    double percentage = (correctAnswers / totalQuestions) * 100;
    String resultMessage = percentage == 100 ? 'Congratulations!' : 'Retry';
    String resultImage =
        percentage == 100 ? 'assets/congratulations.json' : 'assets/retry.json';

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: purpleJustDark,
        title: Text(
          'Quiz Result',
          style: headerTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Lottie.asset(
                    resultImage,
                    width: 200,
                    height: 200,
                  ),
                  if (percentage == 100)
                    Lottie.asset(
                      'assets/suprise.json',
                      width: MediaQuery.of(context).size.width,
                      height: 280,
                    ),
                ],
              ),
              Text(
                resultMessage,
                style: headerTextStyle.copyWith(
                  fontSize: 24,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'You got $correctAnswers out of $totalQuestions correct!',
                style: subheaderTextStyle.copyWith(
                    fontSize: 18, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Your score: ${percentage.toStringAsFixed(0)} %',
                style: headerTextStyle.copyWith(
                  fontSize: 22,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Adjust as desired
                    ),
                    backgroundColor: purpleJustDark,
                    foregroundColor: Colors.white
                    // Add other styling options here (optional)
                    ),
                child: const Text('Home'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
