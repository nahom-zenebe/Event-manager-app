
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecase/ createEventusecase.dart';
import '../../domain/usecase/deleteEventusecase.dart';
import '../../domain/usecase/getallEventsusecase.dart';
import '../../domain/usecase/updateEventusecase.dart';
import '../../domain/usecase/searchEventusecase.dart';
import '../../domain/entities/event.dart';
import './event_state.dart';
part 'event_event.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final List<Event> cart = [];
  final Createeventusecase createEvent;
  final Deleteeventusecase deleteEvent;
  final Updateeventusecase updateEvent;
  final Searcheventusecase searchEvent;
  final Getalleventsusecase getAllEvents;

  EventBloc({
    required this.createEvent,
    required this.deleteEvent,
    required this.updateEvent,
    required this.searchEvent,
    required this.getAllEvents,
  }) : super(EventInitial()) {
    on<CreateEvent>(_onCreateEvent);
    on<Addtocart>(_onAddToCart);
    on<Removefromcart>(_onRemoveFromCart);
    on<DeleteEvent>(_onDeleteEvent);
    on<UpdateEvent>(_onUpdateEvent);
    on<GetAllEvents>(_onGetAllEvents);
    on<SearchEvent>(_onSearchEvent);
  }

 Future<void> _onCreateEvent(CreateEvent event, Emitter<EventState> emit) async {
    emit(EventLoading());
    try {
      final newEvent = await createEvent.createEvent(Event(
        title: event.title,
        location: event.location,
        category: event.category,
        image: event.image,
        organizer: event.organizer,
        startDate: event.startDate,
        endDate: event.endDate,
      ));
      emit(EventCreated(newEvent));
    } catch (error) {
      emit(EventFailure(error.toString()));
    }
  }

  Future<void> _onDeleteEvent(
      DeleteEvent event, Emitter<EventState> emit) async {
    emit(EventLoading());
    try {
      await deleteEvent.deleteEvent(event.id);
      emit(EventDeleted(event.id));
    } catch (error) {
      emit(EventFailure(error.toString()));
    }
  }

  Future<void> _onUpdateEvent(
      UpdateEvent event, Emitter<EventState> emit) async {
    emit(EventLoading());
    try {
      final updatedEvent = await updateEvent.updateEvent(
        event.id,
        Event(
          id:event.id,
          title: event.title,
          location: event.location,
          category: event.category,
          image: event.image,
          organizer: event.organizer,
          startDate: event.startDate,
          endDate: event.endDate,
        ),
      );
      emit(EventUpdated(updatedEvent));
    } catch (error) {
      emit(EventFailure(error.toString()));
    }
  }

  Future<void> _onGetAllEvents(
      GetAllEvents event, Emitter<EventState> emit) async {
    emit(EventLoading());
    try {
      final events = await getAllEvents.getallEvent("someArgument");

      emit(EventLoaded(events: events));
    } catch (error) {
      emit(EventFailure(error.toString()));
    }
  }

  Future<void> _onSearchEvent(
      SearchEvent event, Emitter<EventState> emit) async {
    emit(EventLoading());
    try {
      final events = await searchEvent.searchEvent(
        title: event.title,
        location: event.location,
        category: event.category,
        organizer: event.organizer,
      );
      emit(EventLoaded(events: events));
    } catch (error) {
      emit(EventFailure(error.toString()));
    }
  }

  Future<void> _onAddToCart(
      Addtocart event, Emitter<EventState> emit) async {
    final updatedCart = List<Event>.from(cart)..add(event.event);
    cart.clear();
    cart.addAll(updatedCart);
    emit(CartUpdated(updatedCart));
  }

  Future<void> _onRemoveFromCart(
      Removefromcart event, Emitter<EventState> emit) async {
    final updatedCart = List<Event>.from(cart)..removeWhere((e) => e.id == event.Eventid);
    cart.clear();
    cart.addAll(updatedCart);
    emit(CartUpdated(updatedCart));
  }

}
