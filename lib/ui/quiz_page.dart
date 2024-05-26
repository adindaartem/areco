import 'package:aquatic_ar_app/logic/model/quiz.dart';
import 'package:aquatic_ar_app/logic/repository/quiz_repository.dart';
import 'package:aquatic_ar_app/ui/result_page.dart';
import 'package:aquatic_ar_app/widget/loading_screen.dart';
import 'package:aquatic_ar_app/widget/theme/color_theme.dart';
import 'package:aquatic_ar_app/widget/theme/text_theme.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final QuizRepository quizRepository = QuizRepository();
  late Future<List<QuizModels>> quizFuture;

  int currentQuestionIndex = 0;
  List<int?> selectedAnswers = [];
  List<QuizModels> quizzes = [];

  @override
  void initState() {
    super.initState();
    quizFuture = quizRepository.getAllQuiz();
  }

  void _nextQuestion() {
    setState(() {
      if (currentQuestionIndex < (quizzes.length - 1)) {
        currentQuestionIndex++;
      }
    });
  }

  void _previousQuestion() {
    setState(() {
      if (currentQuestionIndex > 0) {
        currentQuestionIndex--;
      }
    });
  }

  void _submitQuiz() {
    int correctAnswers = 0;
    for (int i = 0; i < quizzes.length; i++) {
      if (selectedAnswers[i] == quizzes[i].correctAnswerIndex) {
        correctAnswers++;
      }
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ResultPage(
          correctAnswers: correctAnswers,
          totalQuestions: quizzes.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purpleJustDark,
        title: Text(
          'Quiz Page',
          style: headerTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: FutureBuilder<List<QuizModels>>(
        future: quizFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No quizzes available.'));
          }

          quizzes = snapshot.data!;
          if (selectedAnswers.isEmpty) {
            selectedAnswers = List<int?>.filled(quizzes.length, null);
          }

          final quiz = quizzes[currentQuestionIndex];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Question ${currentQuestionIndex + 1} of ${quizzes.length}',
                  style: subheaderTextStyle.copyWith(
                      fontSize: 16, color: Colors.black),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  quiz.question,
									textAlign: TextAlign.center,
                  style: headerTextStyle.copyWith(
                      fontSize: 18, color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                ...quiz.options.map((option) {
                  int optionIndex = quiz.options.indexOf(option);
                  return ListTile(
                    title: Text(option),
                    leading: Radio<int>(
                      activeColor: purpleJustDark,
                      value: optionIndex,
                      groupValue: selectedAnswers[currentQuestionIndex],
                      onChanged: (int? value) {
                        setState(() {
                          selectedAnswers[currentQuestionIndex] = value;
                        });
                      },
                    ),
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: currentQuestionIndex > 0,
                        child: ElevatedButton(
                          onPressed: currentQuestionIndex > 0
                              ? _previousQuestion
                              : null,
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust as desired
                              ),
                              backgroundColor: purpleJustDark,
                              foregroundColor: Colors.white
                              // Add other styling options here (optional)
                              ),
                          child: const Text('Back'),
                        ),
                      ),
                      if (currentQuestionIndex < quizzes.length - 1)
                        ElevatedButton(
                          onPressed: _nextQuestion,
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust as desired
                              ),
                              backgroundColor: purpleJustDark,
                              foregroundColor: Colors.white
                              // Add other styling options here (optional)
                              ),
                          child: const Text('Next'),
                        )
                      else
                        ElevatedButton(
                          onPressed: _submitQuiz,
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust as desired
                              ),
                              backgroundColor: purpleJustDark,
                              foregroundColor: Colors.white
                              // Add other styling options here (optional)
                              ),
                          child: const Text('Submit'),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
