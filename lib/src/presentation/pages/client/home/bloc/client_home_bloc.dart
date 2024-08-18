import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_clone/src/domain/useCases/auth/auth_use_cases.dart';
import 'package:indrive_clone/src/presentation/pages/client/home/bloc/client_home_event.dart';
import 'package:indrive_clone/src/presentation/pages/client/home/bloc/client_home_state.dart';

class ClientHomeBloc extends Bloc<ClientHomeEvent, ClientHomeState> {

  AuthUseCases authUseCases;
  ClientHomeBloc(this.authUseCases) : super(ClientHomeState()) {
    on<ChangeDrawerPage>((event, emit) { 
      emit(state.copyWith(pageIndex: event.pageIndex));
    });
    on<Logout>((event, emit) async { 
      await authUseCases.logout.run();
    });
  }
}
