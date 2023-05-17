import 'package:flutter/material.dart';
import "package:setram/src/core/planning/api_contracts/employee_planning.dart";

class DayActivityItem extends StatelessWidget {
  final DayTiming activity;

  const DayActivityItem({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 123, 0, 245),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: const Icon(Icons.assignment, color: Colors.white),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      activity.label,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 10, 5),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade50,
                      ),
                      child: Text(
                        "${activity.start.hour.toString().padLeft(2, "0")}:${activity.start.minute.toString().padLeft(2, "0")} - ${activity.end.hour.toString().padLeft(2, "0")}:${activity.end.minute.toString().padLeft(2, "0")}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
