part of 'kit_bloc.dart';

abstract class KitState extends Equatable {
  const KitState();

  @override
  List<Object> get props => [];
}

class BlankKitState extends KitState {}

class TransferOutKitState extends KitState {}

class ClubKitState extends KitState {}
