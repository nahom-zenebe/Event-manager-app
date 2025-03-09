import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/features/Event/presentation/pages/details_page.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String location;
  final String category;
  final String image;
  final String organizer;
  final DateTime startDate;
  final DateTime endDate;
  final VoidCallback addtocart;

  EventCard({
    required this.title,
    required this.location,
    required this.category,
    required this.image,
    required this.organizer,
    required this.startDate,
    required this.endDate,
    required this.addtocart,
  });

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
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset('assets/box.jpg',
                  height: 150, width: double.infinity, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),

            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            _buildDetailRow('📍 Location:', location),
            _buildDetailRow('🗂 Category:', category),
            _buildDetailRow('👤 Organizer:', organizer),
            _buildDetailRow('📅 Start Date:', _formatDate(startDate)),
            _buildDetailRow('🏁 End Date:', _formatDate(endDate)),

            const SizedBox(height: 8),
            const Divider(thickness: 2, color: Colors.deepPurple),
            const SizedBox(height: 8),

            // ✅ Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: addtocart,
                  icon: const Icon(Icons.favorite, color: Colors.red),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailsPage(event: {
      "title": title,
      "location": location,
      "category": category,
      "image": image,
      "organizer": organizer,
      "startDate": startDate.toIso8601String(),
      "endDate": endDate.toIso8601String(),
    }),
  ),
);

                  },
                  icon: const Icon(Icons.save_alt_sharp),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.comment),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Helper Function to Format Dates
  String _formatDate(DateTime date) {
    return DateFormat('MMMM d, yyyy').format(date);
  }
}
