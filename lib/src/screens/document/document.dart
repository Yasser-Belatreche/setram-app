import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({Key? key}) : super(key: key);

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text("Document"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 123, 0, 245),
        child: const Icon(LineIcons.download),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Title",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
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
                'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
                key: _pdfViewerKey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
