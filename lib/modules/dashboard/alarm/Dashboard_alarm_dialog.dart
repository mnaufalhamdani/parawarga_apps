// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/data/entities/area/area.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/theme/app_theme.dart';
import 'package:parawarga_apps/theme/standard_button_primary.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../theme/single_select/single_select_dialog.dart';
import '../../../theme/single_select/single_select_domain.dart';
import '../../../theme/standard_text_field.dart';

class DashboardAlarmDialog {
  static void show(
    BuildContext context,
    List<AreaEntity> listArea,
    final void Function(int areaId, String message) onPressed
  ) {
    final formKey = GlobalKey<FormState>();
    //area_id, message
    final editingControllers = List.generate(2, (index) => TextEditingController());
    var areaSelected = listArea.first.area_id;

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(baseRadius)),
        child: Padding(
          padding: const EdgeInsets.all(basePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(labelPanic,
                style: TextStyle(
                  color: colorTextTitle,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
              Text("Jika Anda membutuhkan pertolongan secepatnya, silahkan tekan tombol panik di bawah ini!",
                style: TextStyle(
                  color: colorTextMessage,
                  fontSize: 12)),
              (listArea.length > 1)
                  ? Form(
                    key: formKey,
                    child: StandardTextField(
                      editingController: editingControllers[0],
                      titleHint: labelArea,
                      msgError: msgFieldEmpty,
                      readOnly: true,
                      inputAction: TextInputAction.next,
                      onPressed: () {
                        final listItem = List<SingleSelectDomain>.empty(growable: true);
                        for (var i = 0; i < listArea.length; i++) {
                          listItem.add(SingleSelectDomain(
                              codeOrId: listArea[i].area_id.toString(),
                              message: listArea[i].area_name
                          ));
                        }

                        SingleSelectDialog.show(context, "Pilih Salah Satu Area", listItem, (idIndex, model) {
                          areaSelected = int.parse(model.codeOrId.toString());
                          editingControllers[0].text = model.message.toString();
                        });
                      },
                    ),
                  )
                  : Container(),
              StandardTextField(
                  editingController: editingControllers[1],
                  titleHint: labelMessage,
                  inputAction: TextInputAction.done),
              Container(
                width: Get.width,
                margin: EdgeInsets.only(left: basePadding, right: basePadding, top: basePadding),
                child: StandardButtonPrimary(
                    titleHint: labelPanic,
                    color: Colors.white,
                    buttonColor: Colors.red.shade700,
                    onPressed: (() {
                      var valid = true;
                      if (listArea.length > 1){
                        if (!formKey.currentState!.validate()) {
                          valid = false;
                        }
                      }

                      if (valid) {
                        Get.back();
                        onPressed(areaSelected, editingControllers[1].text.toString());
                      }
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
