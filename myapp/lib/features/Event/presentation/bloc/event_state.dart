import '../../domain/entities/event.dart';



abstract class EventState {}

class EventInitial extends EventState  {}

class EventLoading extends EventState  {}

class EventSucess extends EventState  {
  final Event event;
  EventSucess(this.event);
}

class EventFailure extends EventState  {
  final String message;
  EventFailure(this.message);
}
