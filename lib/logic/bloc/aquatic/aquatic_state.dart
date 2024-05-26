part of 'aquatic_bloc.dart';

abstract class AquaticState {}

class AquaticInitial extends AquaticState {}

class AquaticLoading extends AquaticState {}

class AquaticLoaded extends AquaticState {
  final List<Aquatic> aquatics;
  AquaticLoaded(this.aquatics);
}

class AquaticAnimalsLoaded extends AquaticState {
  final List<Animals> animals;
  AquaticAnimalsLoaded(this.animals);
}

class AquaticError extends AquaticState {
  final String error;
  AquaticError(this.error);
}
