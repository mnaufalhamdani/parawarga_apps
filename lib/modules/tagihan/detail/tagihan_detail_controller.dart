// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:parawarga_apps/models/response/tagihan_detail_model.dart';
import 'package:parawarga_apps/modules/tagihan/detail/tagihan_detail_page.dart';

import '../../../core/data_state.dart';
import '../../../core/failure_response.dart';
import '../../../data/repository/tagihan_repository.dart';

class TagihanDetailController extends GetxController{
  TagihanDetailController({
    required this.repository,
  });

  @override
  void onInit() {
    super.onInit();
    getTagihanDetail();
  }
  final id = Get.arguments[TagihanDetailPage.argId] as String;
  final TagihanRepository repository;

  final tagihanState = Rx(ResponseState<TagihanDetailModel>());
  final tagihanHistory = Rx<int>(0);//index history -> user
  final userId = Rx<int>(0);//user_id

  Future<void> getTagihanDetail() async {
    try {
      tagihanState.value = ResponseState.loading();

      final userActive = await repository.getUserActive();
      userId.value = userActive.userEntity.id;

      final response = await repository.getTagihanDetail(id);

      tagihanHistory.value = 0;
      tagihanState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      tagihanState.value = ResponseState.failed(e);
    }
  }
}
