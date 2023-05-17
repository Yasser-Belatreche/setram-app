import 'package:flutter/material.dart';
import 'package:setram/src/core/documents/api_contracts/document.dart';
import 'package:setram/src/core/documents/documents_service.dart';
import 'package:setram/src/screens/home/my_documents/document_item.dart';
import 'package:setram/src/ui/loader.dart';

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
        const DocumentsListController(),
      ],
    );
  }
}

class DocumentsListController extends StatefulWidget {
  const DocumentsListController({Key? key}) : super(key: key);

  @override
  State<DocumentsListController> createState() =>
      _DocumentsListControllerState();
}

class _DocumentsListControllerState extends State<DocumentsListController> {
  bool _loading = true;
  List<Document> documents = List.empty();

  @override
  void initState() {
    super.initState();

    _fetchDocuments();
  }

  Future<void> _fetchDocuments() async {
    final response = await getDocuments();

    setState(() {
      _loading = false;
      documents = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const Center(child: Loader())
        : DocumentsList(list: documents);
  }
}

class DocumentsList extends StatelessWidget {
  final List<Document> list;

  const DocumentsList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: list.map((document) {
            if (list.last == document) {
              return DocumentItem(document: document);
            }

            return Column(
              children: [
                DocumentItem(document: document),
                const SizedBox(height: 10),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
