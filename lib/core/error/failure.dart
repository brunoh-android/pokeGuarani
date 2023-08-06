import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflineException extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerException extends Failure {
  @override
  List<Object?> get props => [];
}
