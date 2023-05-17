import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:setram/src/core/documents/api_contracts/document.dart';
import 'package:setram/src/screens/routes.dart';

class DocumentItem extends StatelessWidget {
  final Document document;

  const DocumentItem({Key? key, required this.document}) : super(key: key);

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
              Navigator.of(context).pushNamed(
                Routes.document,
                arguments: document,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
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
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        document.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
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
