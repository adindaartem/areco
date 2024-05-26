part of 'aquatic_bloc.dart';

abstract class AquaticEvent {}

class AquaticGetAllType extends AquaticEvent {}

class AquaticGetSpecificAnimal extends AquaticEvent {
  final int aquaticIndex;
  AquaticGetSpecificAnimal(this.aquaticIndex);
}
