import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';

class Filepicker extends StatefulWidget {
  const Filepicker({super.key});

  @override
  State<Filepicker> createState() => _FilepickerState();
}

class _FilepickerState extends State<Filepicker> {
  File? selectedfile;

  Future<void> pickfile() async {
    final result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['pdf', 'jpeg', 'doc'],
      type: FileType.custom,
    );
    if (result != null && result.files.single.path != null) {
      final path = result.files.single.path!;
      setState(() {
        selectedfile = File(path);
      });
      OpenFile.open(path);
    } else {
      print("No file selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("File Picker")),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: pickfile, child: Text("Pick File")),
            SizedBox(height: 20),
            selectedfile != null
                ? Text(
                    "Selected File:\n${selectedfile!.path}",
                    textAlign: TextAlign.center,
                  )
                : Text("Please select a file"),
          ],
        ),
      ),
    );
  }
}
