import '../../domain/entities/event.dart';

abstract class EventState {}

class EventInitial extends EventState {}

class EventLoading extends EventState {}

class EventSuccess extends EventState {
  // Fixed spelling from EventSucess
  final Event event;
  EventSuccess(this.event);
}

class EventFailure extends EventState {
  // Changed name for consistency
  final String message;
  EventFailure(this.message);
}

// Additional states to match the Bloc logic
class EventCreated extends EventState {
  final Event event;
  EventCreated(this.event);
}

class EventDeleted extends EventState {
  final String id;
  EventDeleted(this.id);
}

class EventUpdated extends EventState {
  final Event event;
  EventUpdated(this.event);
}

class EventLoaded extends EventState {
  final List<Event> events;
  EventLoaded({required this.events});
}

class CartUpdated extends EventState {
  final List<Event> cart;
  CartUpdated(this.cart);

  @override
  List<Object> get props => [cart];
}