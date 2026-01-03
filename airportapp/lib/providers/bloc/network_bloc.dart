import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'network_event.dart';
import 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  NetworkBloc() : super(NetworkState(true)) {
    _subscription =
        Connectivity().onConnectivityChanged.listen((results) { 
          final isOnline = !results.contains(ConnectivityResult.none); 
          add(isOnline ? NetworkOnline() : NetworkOffline());
      });

    on<NetworkOnline>((event, emit) {
      emit(NetworkState(true));
    });
    on<NetworkOffline>((event, emit) {
      emit(NetworkState(false));
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
