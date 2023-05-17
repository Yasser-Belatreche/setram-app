import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_icons/line_icons.dart';
import 'package:setram/src/core/documents/api_contracts/document.dart';
import 'package:setram/src/core/documents/documents_service.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({Key? key}) : super(key: key);

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final document = ModalRoute.of(context)!.settings.arguments as Document;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text("Document"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Dio().download(
            getDocumentFileLink(document.id),
            "/storage/emulated/0/Download/${document.documentOriginName}",
            onReceiveProgress: (received, total) {
              if (total != -1) {
                Fluttertoast.showToast(
                  msg:
                      "Téléchargement: ${(received / total * 100).toStringAsFixed(0)}%",
                );
              }
            },
          );
        },
        backgroundColor: const Color.fromARGB(255, 123, 0, 245),
        child: const Icon(LineIcons.download),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              document.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              document.description,
              style: TextStyle(
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: 500,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 5),
              ),
              child: SfPdfViewer.network(
                getDocumentFileLink(document.id),
                key: _pdfViewerKey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
