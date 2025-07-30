


import 'package:flutter/material.dart';
import 'event_model_page.dart';
import 'add_event_page.dart';

// ✅ Color constants
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class EventUpdatesPage extends StatefulWidget {
  const EventUpdatesPage({super.key});

  @override
  State<EventUpdatesPage> createState() => _EventUpdatesPageState();
}

class _EventUpdatesPageState extends State<EventUpdatesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBackgroundBottom,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: const Text('Event Updates'),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.search, color: kTextColor),
            label: const Text(
              'Search',
              style: TextStyle(color: kTextColor),
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download, color: kTextColor),
            label: const Text(
              'Download',
              style: TextStyle(color: kTextColor),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EventUploadPage()),
              );
              setState(() {}); // Refresh on return
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kButtonColor,
              foregroundColor: kTextColor,
            ),
            child: const Text('Add'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 900,
              child: Column(
                children: [
                  // ✅ HEADER ROW
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    color: kPrimaryBackgroundBottom.withOpacity(0.5),
                    child: Row(
                      children: const [
                        _HeaderCell('Event Name', width: 120),
                        _HeaderCell('From Date', width: 120),
                        _HeaderCell('To Date', width: 120),
                        _HeaderCell('Location', width: 120),
                        _HeaderCell('Image Upload', width: 120),
                        _HeaderCell('Description', width: 120),
                        _HeaderCell('Delete', width: 50), // ✅ Added here
                      ],
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),

                  // ✅ BODY ROWS
                  Expanded(
                    child: eventsList.isEmpty
                        ? const Center(child: Text('No data found'))
                        : ListView.builder(
                            itemCount: eventsList.length,
                            itemBuilder: (context, index) {
                              final event = eventsList[index];
                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.grey.shade300),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    _BodyCell(event.name, width: 120),
                                    _BodyCell(event.fromDate.toString().split(' ')[0], width: 120),
                                    _BodyCell(event.toDate.toString().split(' ')[0], width: 120),
                                    _BodyCell(event.location, width: 120),
                                    _BodyCell(event.imagePath.isNotEmpty ? '✔' : '', width: 120),
                                    _BodyCell(event.description, width: 120),
                                    SizedBox(
                                      width: 50,
                                      child: IconButton(
                                        icon: const Icon(Icons.delete, color: Colors.red),
                                        onPressed: () => _confirmDelete(index),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Are you sure you want to delete this event?'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
            onPressed: () {
              setState(() {
                eventsList.removeAt(index);
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String label;
  final double width;
  const _HeaderCell(this.label, {required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, wordSpacing: 2.0),
      ),
    );
  }
}

class _BodyCell extends StatelessWidget {
  final String text;
  final double width;
  const _BodyCell(this.text, {required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(wordSpacing: 2.0),
      ),
    );
  }
}



