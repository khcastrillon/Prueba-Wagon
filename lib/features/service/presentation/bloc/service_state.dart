part of 'service_bloc.dart';

@immutable
sealed class ServiceState {}

final class ServiceInitial extends ServiceState {}

final class ServiceLoading extends ServiceState {}

final class ServiceFailure extends ServiceState {
  final String message;

  ServiceFailure(this.message);
}

final class ServiceSuccess extends ServiceState {}
