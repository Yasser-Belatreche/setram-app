import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Jobs extends StatelessWidget {
  const Jobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Post de travail 💼:",
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
              JobItem(),
              SizedBox(width: 10),
              JobItem(),
              SizedBox(width: 10),
              JobItem(),
              SizedBox(width: 10),
              JobItem(),
            ],
          ),
        ),
      ],
    );
  }
}

class JobItem extends StatelessWidget {
  const JobItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
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
                    color: Color.fromARGB(255, 27, 183, 97),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: const Icon(Icons.work_outline, color: Colors.white),
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
            Text(
              "Description l;kasdfulkq lasd fqywer f;lkasdjf yqwe falksdjf qywef lsdkfj qweyf sadlfkj qweurf asldkfj qwoeiuf asdl;kfj ",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.attach_money_outlined,
                  color: Colors.grey.shade700,
                  size: 15,
                ),
                SizedBox(width: 4),
                Text(
                  "Salaire: 100000 DA",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.date_range,
                  color: Colors.grey.shade700,
                  size: 15,
                ),
                SizedBox(width: 4),
                Text(
                  "Date Limite d'application: 18 mai",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  LineIcons.phone,
                  color: Colors.grey.shade700,
                  size: 15,
                ),
                SizedBox(width: 4),
                Text(
                  "Contact: yasser@gmail.com",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Wrap(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade50,
                  ),
                  child: Text(
                    "Php",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
