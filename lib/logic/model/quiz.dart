import 'dart:convert';

List<QuizModels> quizModelsFromJson(String str) =>
    List<QuizModels>.from(json.decode(str).map((x) => QuizModels.fromJson(x)));

String quizModelsToJson(List<QuizModels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizModels {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  QuizModels({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });

  factory QuizModels.fromJson(Map<String, dynamic> json) => QuizModels(
        question: json["question"],
        options: List<String>.from(json["options"].map((x) => x)),
        correctAnswerIndex: json["correctAnswerIndex"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "options": List<dynamic>.from(options.map((x) => x)),
        "correctAnswerIndex": correctAnswerIndex,
      };
}
