// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';

import '../../../data/repository/information_repository.dart';

class AboutAppController extends GetxController{
  AboutAppController({
    required this.repository,
  });

  final InformationRepository repository;

  final textAbout = Rx<String>("");
  final textSuperiority = RxList<String>.empty(growable: true);
  final textAddress = Rx<String>("");
  final textPhone = Rx<String>("");
  final textOfficeHour = RxList<String>.empty(growable: true);

  @override
  void onInit() {
    super.onInit();
    textAbout.value = "Parawarga adalah sebuah platform inovatif yang dirancang "
        "untuk mempermudah pengelolaan area tempat tinggal Anda, "
        "baik di area perumahan, apartemen, kos, maupun area tertutup lainnya. "
        "Dengan fitur-fitur canggih berbasis teknologi terbaru, "
        "aplikasi ini bertujuan menciptakan lingkungan yang lebih nyaman, aman, pintar dan efisien bagi penghuni maupun pengelola.";
    textSuperiority.value = [
      "Kemudahan : Aplikasi tersedia di Android, iOS, dan web untuk memastikan semua penghuni dapat menggunakannya di berbagai platform",
      "Keamanan Data : Informasi pribadi pengguna dan area dilindungi dengan enkripsi",
      "Notifikasi : Pemberitahuan secara real-time untuk mendukung setiap aktivitas penting di area",
      "Smart Home (Coming Soon) : Integrasi dengan perangkat pintar di rumah Anda seperti TV, lampu, pintu, atau AC",
      "Korespondensi (Coming Soon) : Pengajuan surat penting kepada pengelola dengan cepat melalui aplikasi",
    ];
    textAddress.value = "Pondok Benowo Indah Blok CK No. 3, Surabaya, Jawa Timur, Indonesia";
    textPhone.value = "+6285155470876";
    textOfficeHour.value = [
      "Senin : 08.00 - 17.00",
      "Selasa : 08.00 - 17.00",
      "Rabu : 08.00 - 17.00",
      "Kamis : 08.00 - 17.00",
      "Jumat : 08.00 - 17.00",
      "Sabtu : 08.00 - 17.00",
      "Minggu : Libur",
    ];
  }
}
