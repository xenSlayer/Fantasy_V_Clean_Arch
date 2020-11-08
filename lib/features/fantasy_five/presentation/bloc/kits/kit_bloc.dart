import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/fantasy_five_entity.dart';

part 'kit_event.dart';
part 'kit_state.dart';

class KitBloc extends Bloc<KitEvent, KitState> {
  KitBloc() : super(BlankKitState());

  @override
  Stream<KitState> mapEventToState(
    KitEvent event,
  ) async* {
    if (event is AddPlayerEvent) {
      yield ClubKitState();
    } else if (event is TransferOutPlayerEvent) {
      yield TransferOutKitState();
    } else if (event is RemovePlayerEvent) {
      yield BlankKitState();
    }
    yield BlankKitState();
  }
}
