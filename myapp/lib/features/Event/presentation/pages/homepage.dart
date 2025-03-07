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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event manager"),
        centerTitle: true,
      ),
      body: BlocConsumer<EventBloc, EventState>(

      listener: (context, state) {
          if (state is EventFailure ) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },

        builder:(context,state){



        }),

    );
  }
}