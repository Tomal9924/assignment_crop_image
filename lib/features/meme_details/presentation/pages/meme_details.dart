import 'package:image_cropper/image_cropper.dart';
import 'package:memes_life/features/memes/memes.dart';

import '../../../../core/shared/shared.dart';

class MemeDetailsPage extends StatelessWidget {
  static const String path = '/meme-details';
  static const String name = 'MemeDetailsPage';
  final MemesEntity meme;
  const MemeDetailsPage({super.key, required this.meme});

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
              meme.name,
              style: TextStyles.title(context: context, color: theme.textPrimary),
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            children: [
              SizedBox(
                height: 400,
                width: context.width,
                child: CachedNetworkImage(
                  imageUrl: meme.url,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                    child: CircularProgressIndicator(value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                meme.name,
                style: TextStyles.title(context: context, color: Colors.black),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.warning,
                      foregroundColor: theme.textPrimary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {
                      cropImage(meme.url);
                    },
                    label: const Text("Crop"),
                    icon: const Icon(Icons.crop),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.negative,
                      foregroundColor: theme.textPrimary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    label: const Text("Rotate"),
                    icon: const Icon(Icons.rotate_90_degrees_ccw),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.positive,
                  foregroundColor: theme.textPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                label: const Text("Save"),
                icon: const Icon(Icons.save_alt_outlined),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> cropImage(String path) async {
    
      await ImageCropper().cropImage(
        sourcePath: path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false,
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9,
            ],
          ),
        ],
      );
      // if (croppedFile != null) {
      //   setState(() {
      //     _croppedFile = croppedFile;
      //   });
      // }
    
  }
}
