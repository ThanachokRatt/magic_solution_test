part of 'display_password_cubit.dart';

sealed class DisplayPasswordState extends Equatable {
  const DisplayPasswordState();
  @override
  List<Object> get props => [];
}

final class DisplayPasswordInitial extends DisplayPasswordState {}

final class IsDisplayPasswordState extends DisplayPasswordState {
  final bool isDisplayPassword;
  IsDisplayPasswordState({this.isDisplayPassword = false});
  @override
  List<Object> get props => [isDisplayPassword];
}
