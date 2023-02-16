import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileDownload extends StatefulWidget {
  const FileDownload({Key? key}) : super(key: key);

  @override
  State<FileDownload> createState() => _FileDownloadState();
}

class _FileDownloadState extends State<FileDownload> {
  Future downloadFile(String url) async {
    Dio dio = Dio();


    if (await Permission.storage.status.isDenied) {
      await Permission.storage.request();

      await Permission.location.request();
    }
    if(await Permission.location.status.isDenied){
      await Permission.location.request();
    }
    try {

      Directory? directory = Directory('/storage/emulated/0/Download');
      if (!await directory.exists()) directory = await getExternalStorageDirectory();
      // print(dir);
      await dio.download(url, directory!.path + '/person.pdf',).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Download Successfully")));
      });
      print(directory.path + '/culturalvideo.pdf');
    } catch (e) {
      print(e);
    }
    print("Download completed");
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    downloadFile("https://firebasestorage.googleapis.com/v0/b/schoolapp-27136.appspot.com/o/files%2FTrending%20Folk%20Dance%20%E2%9D%A4%20%23dsa%20%23dsadancecompany%20%23coimbatore%20For%20classes%20contact8072481816.mp4?alt=media&token=001cad74-d330-4533-96f1-c6056248ede3");
    downloadFile("https://firebasestorage.googleapis.com/v0/b/schoolapp-27136.appspot.com/o/Syllabus%2FGST-CHALLAN.pdf?alt=media&token=59796274-26a4-4280-b9d7-ed0a45c524b8");
    downloadFile("https://firebasestorage.googleapis.com/v0/b/schoolapp-27136.appspot.com/o/AdminIdImage%2Fimage_picker1170284923.jpg?alt=media&token=3af4a49d-89bc-4ad8-9d0f-7871823e8847");
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        downloadFile("https://firebasestorage.googleapis.com/v0/b/schoolapp-27136.appspot.com/o/Syllabus%2FGST-CHALLAN.pdf?alt=media&token=59796274-26a4-4280-b9d7-ed0a45c524b8");
        downloadFile("https://firebasestorage.googleapis.com/v0/b/schoolapp-27136.appspot.com/o/files%2FTrending%20Folk%20Dance%20%E2%9D%A4%20%23dsa%20%23dsadancecompany%20%23coimbatore%20For%20classes%20contact8072481816.mp4?alt=media&token=001cad74-d330-4533-96f1-c6056248ede3");
        downloadFile("https://firebasestorage.googleapis.com/v0/b/schoolapp-27136.appspot.com/o/AdminIdImage%2Fimage_picker1170284923.jpg?alt=media&token=3af4a49d-89bc-4ad8-9d0f-7871823e8847");
      },),
      body: Image.network("https://firebasestorage.googleapis.com/v0/b/schoolapp-27136.appspot.com/o/AdminIdImage%2Fimage_picker1170284923.jpg?alt=media&token=3af4a49d-89bc-4ad8-9d0f-7871823e8847"),
    );
  }
}
