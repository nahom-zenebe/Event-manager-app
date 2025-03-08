import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/Event/presentation/bloc/event_bloc.dart';
import 'package:myapp/features/Event/presentation/bloc/event_state.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  @override
  void initState() {
    super.initState();
    // Fetch cart items when the page loads
    context.read<EventBloc>().add(GetAllEvents());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Events"),
        centerTitle: true,
      ),
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
          } else if (state is CartUpdated) {
            final cartItems = state.cart;
            if (cartItems.isEmpty) {
              return const Center(
                child: Text(
                  'Your cart is empty.',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                // Refresh cart items
                context.read<EventBloc>().add(GetAllEvents());
              },
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final event = cartItems[index];
                  return ListTile(
                    leading: Image.asset(
                      "assets/box.jpg", // Ensure the image path is correct
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(event.title),
                    subtitle: Text('${event.location} • ${event.category}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle, color: Colors.red),
                      onPressed: () {
                        if (event.id != null) {
                          // Remove the event from the cart
                          context.read<EventBloc>().add(Removefromcart(
                            Eventid: event.id!,
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Event ID is missing')),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            );
          } else if (state is EventFailure) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: const TextStyle(fontSize: 18, color: Colors.red),
              ),
            );
          } else {
            return const Center(
              child: Text(
                'No saved events available.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }
        },
      ),
    );
  }
}