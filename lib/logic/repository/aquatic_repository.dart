import 'dart:convert';

import 'package:aquatic_ar_app/logic/model/aquatic.dart';
import 'package:flutter/services.dart';

class AquaticRepository {
  Future<List<Aquatic>> getAllAquatics() async {
    final jsonString = await rootBundle.loadString('assets/aquatic.json');
    final jsonList = jsonDecode(jsonString);
      return List<Aquatic>.generate(
      jsonList.length,
      (index) => Aquatic.fromJson(jsonList[index]),
    );}
}
