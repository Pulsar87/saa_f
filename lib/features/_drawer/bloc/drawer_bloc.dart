import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'drawer_event.dart';
import 'drawer_state.dart';

class DrawerBloc extends Bloc <DrawerEvent,DrawerState> {

  static int drawerId = 0;



  DrawerBloc() : super(DrawerInitialState()) {
    on<DrawerChangeDrawerBodyEvent>(_changeDrawerBody);
    on<DrawerUpdateEvent>(_drawerUpdateEvent);
  }


  FutureOr<void> _changeDrawerBody(DrawerChangeDrawerBodyEvent event, Emitter<DrawerState> emit) {
    drawerId = event.drawerId;
    emit (DrawerChangeDrawerBodyState());
  }

  FutureOr<void> _drawerUpdateEvent(DrawerUpdateEvent event, Emitter<DrawerState> emit) {
    print("DrawerUpdateEvent");
    emit(DrawerUpdateState());
  }

}