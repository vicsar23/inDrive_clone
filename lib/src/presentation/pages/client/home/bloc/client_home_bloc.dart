import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_clone/src/presentation/pages/client/home/bloc/client_home_event.dart';
import 'package:indrive_clone/src/presentation/pages/client/home/bloc/client_home_state.dart';

class ClientHomeBloc extends Bloc<ClientHomeEvent, ClientHomeState> {
  ClientHomeBloc() : super(ClientHomeState()) {
    on<ChangeDrawerPage>((event, emit) { 
      emit(state.copyWith(pageIndex: event.pageIndex));
    });
  }
}
