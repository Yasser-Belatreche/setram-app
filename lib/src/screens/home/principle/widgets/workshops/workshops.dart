import 'package:flutter/material.dart';

class Workshops extends StatelessWidget {
  const Workshops({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Ateliers 🧠:",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              WorkshopItem(),
              SizedBox(width: 10),
              WorkshopItem(),
              SizedBox(width: 10),
              WorkshopItem(),
              SizedBox(width: 10),
              WorkshopItem(),
            ],
          ),
        ),
      ],
    );
  }
}

class WorkshopItem extends StatelessWidget {
  const WorkshopItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(20),
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
                "2h ago",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Title",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.calendar_today, color: Colors.grey.shade700, size: 20),
              SizedBox(width: 5),
              Text(
                "Date: 18 mai",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Description l;kasdfulkq lasd fqywer f;lkasdjf yqwe falksdjf qywef lsdkfj qweyf sadlfkj qweurf asldkfj qwoeiuf asdl;kfj ",
            style: TextStyle(
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
