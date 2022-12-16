// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:clean_arch_template/core/utils/exceptions.dart';
import 'package:clean_arch_template/core/utils/navigation_service.dart';
import 'package:clean_arch_template/domain/usecase/base_usecase.dart';
import 'package:clean_arch_template/domain/usecase/shared_preferences/if_token_exists_usecase.dart';
import 'package:clean_arch_template/domain/usecase/shared_preferences/remove_token_usecase.dart';
import 'package:clean_arch_template/domain/usecase/shared_preferences/save_token_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:clean_arch_template/feature/utils/bloc_extension.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IfTokenExistsUseCase ifTokenExistsUseCase;
  final SaveTokenUseCase saveTokenUseCase;
  final RemoveTokenUseCase removeTokenUseCase;
  final NavigationService navigationService;

  AuthBloc({
    required this.ifTokenExistsUseCase,
    required this.saveTokenUseCase,
    required this.removeTokenUseCase,
    required this.navigationService,
  }) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      try {
        if (event is AppStarted) {
          if (await ifTokenExistsUseCase(NoParams())) {
            emit(Authorized());
          } else {
            emit(Unauthorized());
          }
        } else if (event is LoggedIn) {
          await saveTokenUseCase(SaveTokenUseCaseParams(token: event.token));
          navigationService.goBack(popNTimes: 2);
          emit(Authorized());
        } else if (event is LoggedOut) {
          await removeTokenUseCase(NoParams());

          emit(Unauthorized());
          navigationService.goBack();
        }
      } on BaseException catch (err) {
        emitOneShot(AuthFailure(message: err.getMessage()));
      } catch (err) {
        emitOneShot(AuthFailure(message: err.toString()));
      }
    });
  }
}
