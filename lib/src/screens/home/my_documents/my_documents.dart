import 'package:flutter/material.dart';
import 'package:setram/src/screens/routes.dart';
import 'package:setram/src/ui/svg_icon.dart';
import 'package:setram/src/utils/icons.dart';

class MyDocuments extends StatelessWidget {
  const MyDocuments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Votre Documents :",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          SizedBox(height: 20),
          Document(name: "test"),
        ],
      ),
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
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
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
