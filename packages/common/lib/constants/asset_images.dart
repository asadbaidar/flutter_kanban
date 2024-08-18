// ignore_for_file: constant_identifier_names, unused_element
part of 'asset_icons.dart';

final class AssetImages {
  const AssetImages(
    this.name, {
    this.format = AssetImageFormat.png,
  });

  final String name;
  final AssetImageFormat format;

  String call() =>
      name.contains('.') ? name : '$_imageDir/$name.${format.name}';

  // Images
  static const blank = AssetImages('blank');
  static const logo = AssetImages('assets/logo12.png');
  static const logo_header = AssetImages('assets/logo_header.png');
}

enum AssetImageFormat {
  png,
  jpg,
}

Future<void> preloadImage(String asset) async {
  late ImageStreamListener listener;

  final completer = Completer<void>();
  final ImageStream imageStream =
      AssetImage(asset).resolve(ImageConfiguration.empty);

  listener = ImageStreamListener(
    (imageInfo, synchronousCall) {
      imageStream.removeListener(listener);
      completer.complete();
    },
    onError: (exception, stackTrace) {
      imageStream.removeListener(listener);
      completer.completeError(exception);
    },
  );

  imageStream.addListener(listener);

  try {
    await completer.future;
  } catch (e) {
    $debugLog(e, tag: 'preloadImage');
  }
}
