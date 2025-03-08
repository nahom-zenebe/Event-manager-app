import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/event_bloc.dart';
import '../bloc/event_state.dart';
import '../../../../core/widgets/Events.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    context.read<EventBloc>().add(GetAllEvents());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: BlocConsumer<EventBloc, EventState>(
        listener: (context, state) {
          if (state is EventFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is EventLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is EventLoaded) {
            final events = state.events;
            return ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return EventCard(
                  title: event.title,
                  location: event.location,
                  category: event.category,
                  image: event.image,
                  organizer: event.organizer,
                  startDate: event.startDate,
                  endDate: event.endDate,
                );
              },
            );
          } else if (state is EventFailure) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          } else {
            return const Center(child: Text('No events available.'));
          }
        },
      ),
    );
  }
}
