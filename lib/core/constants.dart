import 'dart:convert';
import 'dart:math';

import 'package:image_picker/image_picker.dart';


// const String NIK_EXAMPLE = '20101720';

// List<PengaturanAutocodeEntity> prePengaturanAutocode = [
//   PengaturanAutocodeEntity(code: "last-sync-switch_user", value: "false"),
// ];
List<String> listExample = [
  "Indonesia", "Malaysia", "Brunei", "Myanmar", "Singapore"
];

List<Map<String, dynamic>> listInfo = [
  {"label": "Terungkap Biang Kerok Sritex Berdarah-darah Berujung Pailit", "date": "30-10-2024"},
  {"label": "Penegasan Kejagung Tak Ada Politisasi Terkait Penetapan Tersangka Tom Lembong", "date": "30-10-2024"},
  {"label": "Menhan Israel Soal Serangan ke Iran: Akan Tunjukkan Kekuatan Kami", "date": "30-10-2024"},
];

List<Map<String, dynamic>> listLaporan = [
  {"area":"RT.001 RW.003", "label": "Terungkap Biang Kerok Sritex Berdarah-darah Berujung Pailit", "date": "30-10-2024", "address_detail": "Di gang IV", "photo":"https://www.visa.co.id/dam/VCOM/regional/ap/indonesia/global-elements/images/wonderful-indonesia-hot-deals-800x450.jpg"},
  {"area":"RT.002 RW.003", "label": "Penegasan Kejagung Tak Ada Politisasi Terkait Penetapan Tersangka Tom Lembong", "date": "30-10-2024", "address_detail": "Di gang VII", "photo":"https://www.indonesia.travel/content/dam/indtravelrevamp/en/destinations/revision-2019/all-revision-destination/baliH.jpg"},
  {"area":"RT.013 RW.003", "label": "Menhan Israel Soal Serangan ke Iran: Akan Tunjukkan Kekuatan Kami", "date": "30-10-2024", "address_detail": "Di gang V", "photo":"https://www.indonesia.travel/content/dam/indtravelrevamp/en/destinations/revisi-all-destination-s-image/destination-revision-part-two/headerbintan.jpg"},
];

List<Map<String, dynamic>> listVoting = [
  {"label": "Rapat Warga enaknya minggu berapa? Mohon segera di vote yaa", "value": 0, "details": [
    {"label": "Minggu 1", "value": 1},
    {"label": "Minggu 2", "value": 2},
    {"label": "Minggu 3", "value": 3},
    {"label": "Minggu 4", "value": 4},
  ], "percentOfDetails": []},
  {"label": "Liburan enaknya minggu berapa?", "value": 0, "details": [
    {"label": "Minggu 1", "value": 1},
    {"label": "Minggu 2", "value": 2},
    {"label": "Minggu 3", "value": 3},
    {"label": "Minggu 4", "value": 4},
  ], "percentOfDetails": [
    {"label": "Minggu 1", "percent": 50},
    {"label": "Minggu 2", "percent": 20},
    {"label": "Minggu 3", "percent": 10},
    {"label": "Minggu 4", "percent": 20},
  ]},
  {"label": "Kerja bakti enaknya minggu berapa?", "value": 0, "details": [
    {"label": "Minggu 1", "value": 1},
    {"label": "Minggu 2", "value": 2},
    {"label": "Minggu 3", "value": 3},
    {"label": "Minggu 4", "value": 4},
  ], "percentOfDetails": []},
  {"label": "Pemilihan ketua minggu ke berapa?", "value": 0, "details": [
    {"label": "Minggu 1", "value": 1},
    {"label": "Minggu 2", "value": 2},
    {"label": "Minggu 3", "value": 3},
    {"label": "Minggu 4", "value": 4},
  ], "percentOfDetails": []}
];

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

String encodeBinary(String text) {
  List<int> encodedBytes = utf8.encode(text);
  return encodedBytes.map((e) =>
      e.toRadixString(2).padLeft(8, '0')
  ).join();
}

String decodeBinary(String encode) {
  List<int> decodedBytes = [];
  for (int i = 0; i < encode.length; i += 8) {
    String byteString = encode.substring(i, i + 8);
    int byte = int.parse(byteString, radix: 2);
    decodedBytes.add(byte);
  }
  return utf8.decode(decodedBytes);
}