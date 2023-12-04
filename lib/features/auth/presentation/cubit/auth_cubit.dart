import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_state.dart';


class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
}
