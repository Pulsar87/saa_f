part of 'join_bloc.dart';

@immutable
abstract class JoinState {}

class JoinInitialState extends JoinState {}

class JoinLoadingState extends JoinState {}

class JoinRequestSuccessState extends JoinState {}

class JoinRequestErrorState extends JoinState {
  final String error;

  JoinRequestErrorState({required this.error});
}
