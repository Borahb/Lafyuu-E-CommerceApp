// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lafyuu/Utils/Services/state_services.dart';
import 'package:lafyuu/bloc/auth_bloc/auth_event.dart';
import 'package:lafyuu/bloc/auth_bloc/auth_state.dart';

class AuthenticationBloc extends Bloc<AuthEvents,AuthState>{
  final StateService stateService;
  
  AuthenticationBloc({required this.stateService}): assert(stateService != null);

  @override
  AuthState get initialState => AuthUninitialized();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvents event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = await stateService.hasToken();
      if (hasToken) {
        yield Authenticated();
      } else {
        yield UnAuthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthLoading();
      await stateService.persistToken(event.token);
      yield Authenticated();
    }

    if (event is LoggedOut) {
      yield AuthLoading();
      await stateService.deleteToken();
      yield UnAuthenticated();
    }
  }



}

