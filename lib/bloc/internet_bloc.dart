import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectiity/bloc/internet_event.dart';
import 'package:connectiity/bloc/internet_state.dart';
import 'package:connectivity/connectivity.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivicySubscription;
  InternetBloc() : super(InternetinitialState()) {
    on<InternetlostEvent>((event, emit) => emit(InternetlostState()));
    on<InternetgainedEvent>((event, emit) => emit(InternetgainedState()));

    connectivicySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetgainedEvent());
      } else {
        add(InternetlostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    connectivicySubscription?.cancel();
    return super.close();
  }
}
