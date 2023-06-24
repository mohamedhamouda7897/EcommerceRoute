import 'package:equatable/equatable.dart';

class Failures extends Equatable {
  String message;

  Failures(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];

  @override
  String toString() {
    // TODO: implement toString
    return message;
  }
}

class ServerFailures extends Failures {
  ServerFailures(super.message);
}

class CachedFailures extends Failures {
  CachedFailures(super.message);
}
