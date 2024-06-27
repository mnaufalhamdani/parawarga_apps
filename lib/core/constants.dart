import 'dart:math';

import 'package:image_picker/image_picker.dart';


const String NIK_EXAMPLE = '20101720';

// List<PengaturanAutocodeEntity> prePengaturanAutocode = [
//   PengaturanAutocodeEntity(code: "last-sync-switch_user", value: "false"),
// ];

String generateRandomId() {
  final random = Random();
  const length = 11;
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final id = StringBuffer();

  for (var i = 0; i < length; i++) {
    id.write(chars[random.nextInt(chars.length)]);
  }

  return id.toString();
}

String generateCode(int lastCode) {
  final random = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final id = StringBuffer();

  for (var i = 0; i < lastCode; i++) {
    id.write(chars[random.nextInt(chars.length)]);
  }

  return id.toString();
}

Future<void> pickerPhoto(ImageSource source, final void Function(String path) onPicked) async {
  final picked = await ImagePicker().pickImage(source: source, imageQuality: 70);
  if(picked == null) return;

  onPicked(picked.path);
}

String getFileSizeString({required int bytes, int decimals = 0}) {
  const suffixes = ["b", "kb", "mb", "gb", "tb"];
  if (bytes == 0) return '0${suffixes[0]}';
  var i = (log(bytes) / log(1024)).floor();
  return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
}