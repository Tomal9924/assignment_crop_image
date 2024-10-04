import 'package:croppy/croppy.dart';
import 'package:memes_life/features/memes/memes.dart';

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
  late CropImageResult? imageCropResult;
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
              style: TextStyles.title(context: context, color: theme.textPrimary),
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            children: [
              SizedBox(
                height: 400,
                width: context.width,
                child: imageCropResult == null ? CachedNetworkImage(
                  imageUrl: widget.meme.url,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                    child: CircularProgressIndicator(value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ): Container(),
              ),
              const SizedBox(height: 16),
              Text(
                widget.meme.name,
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
                    onPressed: () async {
                      final result = await showCupertinoImageCropper(
                        context,
                        imageProvider: NetworkImage(widget.meme.url),
                      );
                      setState(() {
                        imageCropResult = result;
                      });
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
}
