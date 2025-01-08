import 'dart:convert';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../theme/standard_snackbar.dart';
import '../utils/strings.dart';


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

List<Map<String, dynamic>> listVotes = [
  {"label": "Minggu 1", "percent": 50},
  {"label": "Minggu 2", "percent": 20},
  {"label": "Minggu 3", "percent": 10},
  {"label": "Minggu 4", "percent": 20},
];

List<Map<String, dynamic>> listVotingDetail = [
  {"name": "Akbar", "user_id": 1, "label": "Minggu 1"},
  {"name": "Bakrie", "user_id": 2, "label": "Minggu 2"},
  {"name": "Cintya", "user_id": 3, "label": "Minggu 3"},
  {"name": "Daniel", "user_id": 4, "label": "Minggu 1"},
  {"name": "Effendy", "user_id": 5, "label": "Minggu 4"},
  {"name": "Franky", "user_id": 1, "label": "Minggu 4"},
  {"name": "Georgio", "user_id": 2, "label": "Minggu 4"},
  {"name": "Hulk", "user_id": 3, "label": "Minggu 2"},
  {"name": "Indah", "user_id": 4, "label": "Minggu 2"},
  {"name": "Jessica", "user_id": 5, "label": "Minggu 3"},
];

List<Map<String, dynamic>> listVotingDetail2 = [
  {"name": "Akbar", "user_id": 1, "label": "Minggu 4"},
  {"name": "Bakrie", "user_id": 2, "label": "Minggu 4"},
  {"name": "Cintya", "user_id": 3, "label": "Minggu 1"},
  {"name": "Daniel", "user_id": 4, "label": "Minggu 2"},
  {"name": "Effendy", "user_id": 5, "label": "Minggu 2"},
  {"name": "Franky", "user_id": 1, "label": "Minggu 2"},
  {"name": "Georgio", "user_id": 2, "label": "Minggu 2"},
  {"name": "Hulk", "user_id": 3, "label": "Minggu 2"},
  {"name": "Indah", "user_id": 4, "label": "Minggu 1"},
  {"name": "Jessica", "user_id": 5, "label": "Minggu 3"},
];

List<Map<String, dynamic>> listArisan = [
  {
    "area":"RT.001 RW.003",
    "nameOfArisan": "Arisan Pkk Tahun 1",
    "date": "30-10-2024",
    "subscription": "100.000",
    "totalSubscription": "1.000.000",
    "totalMember": [
      {"name": "Akbar", "user_id": 1, "payed": "100.000"},
      {"name": "Bakrie", "user_id": 2, "payed": "100.000"},
      {"name": "Cintya", "user_id": 3, "payed": "100.000"},
      {"name": "Daniel", "user_id": 4, "payed": "100.000"},
      {"name": "Effendy", "user_id": 5, "payed": "100.000"},
      {"name": "Franky", "user_id": 1, "payed": "100.000"},
      {"name": "Georgio", "user_id": 2, "payed": "100.000"},
      {"name": "Hulk", "user_id": 3, "payed": "100.000"},
      {"name": "Indah", "user_id": 4, "payed": "100.000"},
      {"name": "Jessica", "user_id": 5, "payed": "100.000"},
    ],
    "availableMember": [
      {"name": "Akbar", "user_id": 1, "unit_name": "Unit 1"},
      {"name": "Bakrie", "user_id": 2, "unit_name": "Unit 2"},
      {"name": "Cintya", "user_id": 3, "unit_name": "Unit 3"},
      {"name": "Daniel", "user_id": 4, "unit_name": "Unit 4"},
      {"name": "Effendy", "user_id": 5, "unit_name": "Unit 5"},
    ],
    "winOfHistories": [
      {"name": "Franky", "user_id": 1, "unit_name": "Unit 11", "date": "30-09-2024"},
      {"name": "Georgio", "user_id": 2, "unit_name": "Unit 22", "date": "30-07-2024"},
      {"name": "Hulk", "user_id": 3, "unit_name": "Unit 33", "date": "30-08-2024"},
      {"name": "Indah", "user_id": 4, "unit_name": "Unit 44", "date": "30-05-2024"},
      {"name": "Jessica", "user_id": 5, "unit_name": "Unit 55", "date": "30-06-2024"},
    ],
  },
  {
    "area":"Cluster Merdeka",
    "nameOfArisan": "Arisan Anak Muda",
    "date": "30-10-2024",
    "subscription": "1.000.000",
    "totalSubscription": "10.000.000",
    "totalMember": [
      {"name": "Akbar", "user_id": 1, "payed": "1.000.000"},
      {"name": "Bakrie", "user_id": 2, "payed": "1.000.000"},
      {"name": "Cintya", "user_id": 3, "payed": "1.000.000"},
      {"name": "Daniel", "user_id": 4, "payed": "1.000.000"},
      {"name": "Effendy", "user_id": 5, "payed": "1.000.000"},
      {"name": "Franky", "user_id": 1, "payed": "1.000.000"},
      {"name": "Georgio", "user_id": 2, "payed": "1.000.000"},
      {"name": "Hulk", "user_id": 3, "payed": "1.000.000"},
      {"name": "Indah", "user_id": 4, "payed": "1.000.000"},
      {"name": "Jessica", "user_id": 5, "payed": "1.000.000"},
    ],
    "availableMember": [
      {"name": "Akbar", "user_id": 1, "unit_name": "Unit 1"},
      {"name": "Bakrie", "user_id": 2, "unit_name": "Unit 2"},
      {"name": "Cintya", "user_id": 3, "unit_name": "Unit 3"},
      {"name": "Daniel", "user_id": 4, "unit_name": "Unit 4"},
      {"name": "Effendy", "user_id": 5, "unit_name": "Unit 5"},
    ],
    "winOfHistories": [
      {"name": "Franky", "user_id": 1, "unit_name": "Unit 11", "date": "30-09-2024"},
      {"name": "Georgio", "user_id": 2, "unit_name": "Unit 22", "date": "30-07-2024"},
      {"name": "Hulk", "user_id": 3, "unit_name": "Unit 33", "date": "30-08-2024"},
      {"name": "Indah", "user_id": 4, "unit_name": "Unit 44", "date": "30-05-2024"},
      {"name": "Jessica", "user_id": 5, "unit_name": "Unit 55", "date": "30-06-2024"},
    ],
  },
  {
    "area":"RT.001 RW.003",
    "nameOfArisan": "Arisan Karang Taruna",
    "date": "30-10-2024",
    "subscription": "500.000",
    "totalSubscription": "5.000.000",
    "totalMember": [
      {"name": "Akbar", "user_id": 1, "payed": "500.000"},
      {"name": "Bakrie", "user_id": 2, "payed": "500.000"},
      {"name": "Cintya", "user_id": 3, "payed": "500.000"},
      {"name": "Daniel", "user_id": 4, "payed": "500.000"},
      {"name": "Effendy", "user_id": 5, "payed": "500.000"},
      {"name": "Franky", "user_id": 1, "payed": "500.000"},
      {"name": "Georgio", "user_id": 2, "payed": "500.000"},
      {"name": "Hulk", "user_id": 3, "payed": "10.000"},
      {"name": "Indah", "user_id": 4, "payed": "10.000"},
      {"name": "Jessica", "user_id": 5, "payed": "10.000"},
    ],
    "availableMember": [
      {"name": "Akbar", "user_id": 1, "unit_name": "Unit 1"},
      {"name": "Bakrie", "user_id": 2, "unit_name": "Unit 2"},
      {"name": "Cintya", "user_id": 3, "unit_name": "Unit 3"},
      {"name": "Daniel", "user_id": 4, "unit_name": "Unit 4"},
      {"name": "Effendy", "user_id": 5, "unit_name": "Unit 5"},
    ],
    "winOfHistories": [
      {"name": "Franky", "user_id": 1, "unit_name": "Unit 11", "date": "30-09-2024"},
      {"name": "Georgio", "user_id": 2, "unit_name": "Unit 22", "date": "30-07-2024"},
      {"name": "Hulk", "user_id": 3, "unit_name": "Unit 33", "date": "30-08-2024"},
      {"name": "Indah", "user_id": 4, "unit_name": "Unit 44", "date": "30-05-2024"},
      {"name": "Jessica", "user_id": 5, "unit_name": "Unit 55", "date": "30-06-2024"},
    ],
  },
  {
    "area":"Kost Merah Putih",
    "nameOfArisan": "Gang Gong",
    "date": "30-10-2024",
    "subscription": "10.000",
    "totalSubscription": "100.000",
    "totalMember": [
      {"name": "Akbar", "user_id": 1, "payed": "10.000"},
      {"name": "Bakrie", "user_id": 2, "payed": "10.000"},
      {"name": "Cintya", "user_id": 3, "payed": "10.000"},
      {"name": "Daniel", "user_id": 4, "payed": "10.000"},
      {"name": "Effendy", "user_id": 5, "payed": "10.000"},
      {"name": "Franky", "user_id": 1, "payed": "10.000"},
      {"name": "Georgio", "user_id": 2, "payed": "10.000"},
      {"name": "Hulk", "user_id": 3, "payed": "10.000"},
      {"name": "Indah", "user_id": 4, "payed": "10.000"},
      {"name": "Jessica", "user_id": 5, "payed": "10.000"},
    ],
    "availableMember": [
      {"name": "Akbar", "user_id": 1, "unit_name": "Unit 1"},
      {"name": "Bakrie", "user_id": 2, "unit_name": "Unit 2"},
      {"name": "Cintya", "user_id": 3, "unit_name": "Unit 3"},
      {"name": "Daniel", "user_id": 4, "unit_name": "Unit 4"},
      {"name": "Effendy", "user_id": 5, "unit_name": "Unit 5"},
    ],
    "winOfHistories": [
      {"name": "Franky", "user_id": 1, "unit_name": "Unit 11", "date": "30-09-2024"},
      {"name": "Georgio", "user_id": 2, "unit_name": "Unit 22", "date": "30-07-2024"},
      {"name": "Hulk", "user_id": 3, "unit_name": "Unit 33", "date": "30-08-2024"},
      {"name": "Indah", "user_id": 4, "unit_name": "Unit 44", "date": "30-05-2024"},
      {"name": "Jessica", "user_id": 5, "unit_name": "Unit 55", "date": "30-06-2024"},
    ],
  },
];

List<Map<String, dynamic>> listTagihan = [
  {"name": "Iuran Kas 2024", "note": "Mohon dibayar diawal bulan", "nominal": "100.000", "isRequired": true, "expired": null, "isPeriode": true, "periodeStatus":"month", "periodeRemaining":"5"},
  {"name": "Sumbangan Masjid", "note": "Mohon dibayar seiklasnya", "nominal": "5.000", "isRequired": false, "expired": "2-12-2024", "isPeriode": true, "periodeStatus":"week", "periodeRemaining":"5"},
  {"name": "Sumbangan Jembatan", "note": "", "nominal": "30.000", "isRequired": false, "isPeriode": false, "expired": "12-12-2024"},
];

List<Map<String, dynamic>> listHistory = [
  {"category": "arisan", "name": "Arisan Pkk Tahun 1", "area": "RT.001 RW.003", "created": "30-10-2024", "id": 1},
  {"category": "tagihan", "name": "Iuran Kas 2024", "area": "RT.001 RW.003", "created": "2-12-2024", "id": 2},
  {"category": "tagihan", "name": "Sumbangan Masjid", "area": "RT.002 RW.003", "created": "2-2-2024", "id": 3},
  {"category": "laporan", "name": "Jembatan tidak roboh", "area": "RT.001 RW.004", "created": "10-10-2024", "id": 4},//iconsax.message_text
  {"category": "alarm", "name": "Tombol Panik", "area": "RT.001 RW.004", "created": "11-11-2024", "id": 5},
];

List<Map<String, dynamic>> listUnitEmpty = [
  {"area": "RT.001 RW.003", "unit": "Jl. Bantaran IV-C No.5", "startDate": "11-11-2024", "endDate": "30-11-2024", "note": "Pergi ke desa untuk acara", "user": "Dani"},
  {"area": "Kost Sarimbi", "unit": "Kamar No.5", "startDate": "19-11-2024", "endDate": "22-12-2024", "note": "", "user": "Naufal"},
  {"area": "Dusun Sratu", "unit": "Gang masjid", "startDate": "29-11-2024", "endDate": "", "note": "", "user": "Hamdan"},
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

String strToBinary(String text) {
  List<int> encodedBytes = utf8.encode(text);
  return encodedBytes.map((e) =>
      e.toRadixString(2).padLeft(8, '0')
  ).join();
}

String binaryToStr(String encode) {
  List<int> decodedBytes = [];
  for (int i = 0; i < encode.length; i += 8) {
    String byteString = encode.substring(i, i + 8);
    int byte = int.parse(byteString, radix: 2);
    decodedBytes.add(byte);
  }
  return utf8.decode(decodedBytes);
}

int? stringToInt(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  try {
    return int.tryParse(value);
  } catch (e) {
    debugPrint('stringToInt: ${e.toString()}');
    return null;
  }
}

int dateBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

void monitorConnection(BuildContext context) {
  Connectivity().onConnectivityChanged.listen((result) {
    if (result.where((element) => element == ConnectivityResult.none).isNotEmpty) {
      showStandardSnackbar(context, TypeMessage.error, message: msgKoneksiError, duration: DurationMessage.lengthInfinite);
    } else {
      showStandardSnackbar(context, TypeMessage.success, message: msgKoneksiSukses, duration: DurationMessage.lengthShort);
    }
  });
}

bool checkConnection(BuildContext context) {
  var connected = false;
  Connectivity().onConnectivityChanged.listen((result) {
    if (result.where((element) => element == ConnectivityResult.none).isNotEmpty) {
      connected = false;
    } else {
      connected = true;
    }
  });
  return connected;
}

String getInitials(String text) {
  if (text.isEmpty) return "";

  List<String> nameParts = text.split(" ");
  String initials = nameParts.map((e) => e.isNotEmpty ? e[0].toUpperCase() : "").join();

  return initials.length > 2 ? initials.substring(0, 2) : initials; // Limit to 2 initials
}

String currencyFormat(String number) {
  List<String> parts = number.split('.');
  String integerPart = parts[0].replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
        (match) => '.',
  );
  if(parts.length == 1){
    return integerPart;
  }else{
    return '$integerPart,${parts[1]}';
  }

}