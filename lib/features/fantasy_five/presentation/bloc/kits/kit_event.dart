part of 'kit_bloc.dart';

abstract class KitEvent extends Equatable {
  const KitEvent();

  @override
  List<Object> get props => [];
}

class AddPlayerEvent extends KitEvent {
  final PlayerEntity player;
  AddPlayerEvent({this.player});

  @override
  List<Object> get props => [player];
}

class RemovePlayerEvent extends KitEvent {
  final PlayerEntity player;
  RemovePlayerEvent({this.player});

  @override
  List<Object> get props => [player];
}

class TransferOutPlayerEvent extends KitEvent {
  final PlayerEntity player;
  TransferOutPlayerEvent({this.player});

  @override
  List<Object> get props => [player];
}
