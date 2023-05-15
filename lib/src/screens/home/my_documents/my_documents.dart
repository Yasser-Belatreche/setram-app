import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:setram/src/screens/routes.dart';

class MyDocuments extends StatelessWidget {
  const MyDocuments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 40),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Row(
            children: const [
              Text(
                "Votre Documents :",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: const [
                Document(name: "test"),
                SizedBox(height: 10),
                Document(name: "test"),
                SizedBox(height: 10),
                Document(name: "test"),
                SizedBox(height: 10),
                Document(name: "test"),
                SizedBox(height: 10),
                Document(name: "test"),
                SizedBox(height: 10),
                Document(name: "test"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Document extends StatelessWidget {
  final String name;

  const Document({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: Ink(
          child: InkWell(
            borderRadius: BorderRadius.circular(10.0),
            highlightColor: Colors.grey.shade100,
            onTap: () {
              Navigator.of(context).pushNamed(Routes.document);
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 123, 0, 245),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Icon(LineIcons.pdfFile, color: Colors.white),
                  ),
                  // const SvgIcon(
                  //   path: ICONS.pdf,
                  //   width: 40,
                  // ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        "Informatique",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
