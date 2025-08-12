import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'display_password_state.dart';

class DisplayPasswordCubit extends Cubit<DisplayPasswordState> {
  DisplayPasswordCubit()
    : super(IsDisplayPasswordState(isDisplayPassword: false));

  void togglePasswordVisibility() {
    final current = (state as IsDisplayPasswordState).isDisplayPassword;
    emit(IsDisplayPasswordState(isDisplayPassword: !current));
  }
}
