import 'package:flutter/material.dart';
import 'package:my_part/models/event.dart';

class EventItem extends StatelessWidget {
  const EventItem(this.event, {super.key});

  final Event event;

  String getCategoryName(Category category) {
    switch (category) {
      case Category.wedding:
        return 'Wedding';
      case Category.graduation:
        return 'Graduation';
      case Category.family_reunion:
        return 'Family Reunion';
      case Category.baby_shower:
        return 'Baby Shower';
      case Category.custom:
        return 'Custom';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Card(
        elevation: 5,
        color: const Color.fromARGB(255, 39, 118, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    categoryItems[event.category],
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    event.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    getCategoryName(event.category),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    event.formmatedDate,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
