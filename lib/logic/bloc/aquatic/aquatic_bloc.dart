import 'dart:async';

import 'package:aquatic_ar_app/logic/model/aquatic.dart';
import 'package:aquatic_ar_app/logic/repository/aquatic_repository.dart';
import 'package:bloc/bloc.dart';

part 'aquatic_event.dart';
part 'aquatic_state.dart';

class AquaticBloc extends Bloc<AquaticEvent, AquaticState> {
  final AquaticRepository _repository;

  AquaticBloc(this._repository) : super(AquaticInitial()) {
    on<AquaticGetAllType>(_getAllAquatics);
    on<AquaticGetSpecificAnimal>(_getSpecificAnimals);
  }

  Future<FutureOr<void>> _getAllAquatics(
      AquaticGetAllType event, Emitter<AquaticState> emit) async {
    try {
      final aquatics = await _repository.getAllAquatics();
      emit(AquaticLoaded(aquatics));
    } catch (e) {
      emit(AquaticError(e.toString()));
    }
  }

  FutureOr<void> _getSpecificAnimals(
      AquaticGetSpecificAnimal event, Emitter<AquaticState> emit) {
    final state = this.state;
    if (state is AquaticLoaded) {
      final aquatic = state.aquatics[event.aquaticIndex];
      emit(AquaticAnimalsLoaded(aquatic.animals ?? []));
    }
  }
}
