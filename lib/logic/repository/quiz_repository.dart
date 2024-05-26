import 'dart:convert';

import 'package:aquatic_ar_app/logic/model/quiz.dart';
import 'package:flutter/services.dart';

class QuizRepository {
  Future<List<QuizModels>> getAllQuiz() async {
    final jsonString = await rootBundle.loadString('assets/quiz.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => QuizModels.fromJson(json)).toList();
  }
}