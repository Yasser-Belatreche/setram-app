import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:setram/src/core/announcements/api_contracts/announcement.dart';
import 'package:setram/src/utils/format_time_difference.dart';

class AnnouncementItem extends StatelessWidget {
  final Announcement announcement;

  const AnnouncementItem({Key? key, required this.announcement})
      : super(key: key);

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
                  color: Color.fromARGB(255, 123, 0, 245),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: const Icon(LineIcons.newspaper, color: Colors.white),
              ),
              Text(
                formatTimeDifference(announcement.startDate),
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
            announcement.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            announcement.description,
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
