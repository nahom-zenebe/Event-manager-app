import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String location;
  final String category;
  final String image;
  final String organizer;
  final DateTime startDate;
  final DateTime endDate;
  final VoidCallback addtocart;

  const EventCard(
      {required this.title,
      required this.location,
      required this.category,
      required this.image,
      required this.organizer,
      required this.startDate,
      required this.endDate,
      required this.addtocart});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Image
            if (image.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/box.jpg',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16),

            // Event Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Event Location
            Text(
              'Location: $location',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),

            // Event Category
            Text(
              'Category: $category',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),

            // Event Organizer
            Text(
              'Organizer: $organizer',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),

            // Event Dates
            Text(
              'Start Date: $startDate',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            Text(
              'End Date: $endDate',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              height: 2,
              thickness: 3,
              color: Colors.deepPurple,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: addtocart,
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.save_alt_sharp),
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.comment)
              ],
            )
          ],
        ),
      ),
    );
  }
}
