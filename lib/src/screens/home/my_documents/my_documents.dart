import 'package:flutter/material.dart';
import 'package:setram/src/screens/routes.dart';
import 'package:setram/src/ui/svg_icon.dart';
import 'package:setram/src/utils/icons.dart';

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
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Column(
              children: const [
                Document(name: "test"),
                SizedBox(height: 5),
                Document(name: "test"),
                SizedBox(height: 5),
                Document(name: "test"),
                SizedBox(height: 5),
                Document(name: "test"),
                SizedBox(height: 5),
                Document(name: "test"),
                SizedBox(height: 5),
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
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
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
              child: Row(
                children: [
                  const SvgIcon(
                    path: ICONS.pdf,
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Informatique",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade300,
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
