import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final Map<String, dynamic> event;
  const DetailsPage({super.key, required this.event});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          child: Center(
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Image.asset("assets/box.jpg",height: 200, width: 300,),
                SizedBox(height: 30,),
                Text(
                  widget.event["title"] ?? "No Title",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  widget.event["location"] ?? "No location",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  "Date: ${widget.event["startDate"] ?? "Unknown"}",
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
                 SizedBox(height: 10),
                Text(
                  "Date: ${widget.event["endDate"] ?? "Unknown"}",
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
