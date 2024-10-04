import 'package:image_cropper/image_cropper.dart';
import 'package:memes_life/features/memes/memes.dart';

import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/shared/shared.dart';

class MemeDetailsPage extends StatefulWidget {
  static const String path = '/meme-details';
  static const String name = 'MemeDetailsPage';
  final MemesEntity meme;
  const MemeDetailsPage({super.key, required this.meme});

  @override
  State<MemeDetailsPage> createState() => _MemeDetailsPageState();
}

class _MemeDetailsPageState extends State<MemeDetailsPage> {
  String? croppedImageUrl;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundPrimary,
          appBar: AppBar(
            backgroundColor: theme.backgroundPrimary,
            elevation: 0,
            automaticallyImplyLeading: true,
            iconTheme: IconThemeData(color: theme.textPrimary),
            title: Text(
              widget.meme.name,
              style:
                  TextStyles.title(context: context, color: theme.textPrimary),
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            children: [
              SizedBox(
                height: 400,
                width: context.width,
                child: croppedImageUrl == null
                    ? CachedNetworkImage(
                        imageUrl: widget.meme.url,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : Image.file(File(croppedImageUrl!)),
              ),
              const SizedBox(height: 16),
              Text(
                widget.meme.name,
                style: TextStyles.title(context: context, color: Colors.black),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                iconAlignment: IconAlignment.start,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.warning,
                  iconColor: theme.backgroundPrimary,
                  foregroundColor: theme.textPrimary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () async {
                  _cropImage(widget.meme.url);
                },
                label: Text(
                  "Crop & Rotate",
                  style:
                      TextStyles.title(context: context, color: Colors.white),
                ),
                icon: const Icon(Icons.crop),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  downloadFile(croppedImageUrl!, "fileName");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.positive,
                  foregroundColor: theme.textPrimary,
                  iconColor: theme.backgroundPrimary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                label: Text(
                  "Save",
                  style:
                      TextStyles.title(context: context, color: Colors.white),
                ),
                icon: const Icon(Icons.save_alt_outlined),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _cropImage(String imageUrl) async {
    final file = await _downloadImageFromNetwork(imageUrl);

    final croppedFile = await ImageCropper().cropImage(
      sourcePath: file.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio5x3,
            CropAspectRatioPreset.ratio5x4,
            CropAspectRatioPreset.ratio7x5,
            CropAspectRatioPreset.ratio16x9
          ],
        ),
        IOSUiSettings(
          title: 'Cropper',
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio5x3,
            CropAspectRatioPreset.ratio5x4,
            CropAspectRatioPreset.ratio7x5,
            CropAspectRatioPreset.ratio16x9
          ],
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );

    if (croppedFile != null) {
      //print('Cropped image path: ${croppedFile.path}');
      setState(() {
        croppedImageUrl = croppedFile.path;
      });
    }
  }

  Future<File> _downloadImageFromNetwork(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    final documentDirectory = await getApplicationDocumentsDirectory();
    final filePath = path.join(documentDirectory.path, 'downloaded_image.jpg');
    final file = File(filePath);
    file.writeAsBytesSync(response.bodyBytes);
    return file;
  }

  Future<void> downloadFile(String url, String fileName) async {
    if (await Permission.storage.request().isGranted) {
      Directory? downloadsDirectory;

      if (Platform.isAndroid) {
        downloadsDirectory = await getExternalStorageDirectory();
      } else if (Platform.isIOS) {
        downloadsDirectory = await getApplicationDocumentsDirectory();
      }

      if (downloadsDirectory != null) {
        final filePath = path.join(downloadsDirectory.path, fileName);

        final response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          final file = File(filePath);
          await file.writeAsBytes(response.bodyBytes);

          print('File downloaded and saved at ${file.path}');
        } else {
          print('Failed to download file');
        }
      } else {
        print("Couldn't find the download directory.");
      }
    } else {
      print('Permission denied');
    }
  }
}
