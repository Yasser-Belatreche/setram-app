import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:setram/src/core/workshops/api_contracts/workshop.dart';
import 'package:setram/src/utils/format_time_difference.dart';

class WorkshopItem extends StatelessWidget {
  final Workshop workshop;

  const WorkshopItem({Key? key, required this.workshop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 128, 131, 235),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: const Icon(Icons.school_outlined, color: Colors.white),
              ),
              Text(
                formatTimeDifference(workshop.startDate),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            workshop.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.calendar_today, color: Colors.grey.shade700, size: 20),
              const SizedBox(width: 5),
              Text(
                "Date: ${DateFormat.yMd().format(workshop.workshopDate)}",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            workshop.description,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
