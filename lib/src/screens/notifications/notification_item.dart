import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:setram/src/core/notifications/api_contracts/notification.dart'
    as n;
import 'package:setram/src/utils/format_time_difference.dart';

class NotificationItem extends StatelessWidget {
  final n.Notification notification;

  const NotificationItem({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: notification.read
                  ? const Color.fromARGB(25, 123, 0, 245)
                  : const Color.fromARGB(255, 123, 0, 245),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  notification.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  notification.body,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(LineIcons.clock,
                        size: 12, color: Colors.grey.shade400),
                    const SizedBox(width: 2),
                    Text(
                      formatTimeDifference(notification.createdAt),
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
