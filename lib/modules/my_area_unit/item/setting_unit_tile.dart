// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';

class SettingUnitTile extends StatefulWidget {
  final int index;
  final bool isLast;
  final void Function(int index) onPressed;

  const SettingUnitTile({
    super.key,
    required this.index,
    required this.isLast,
    required this.onPressed,
  });

  @override
  State<SettingUnitTile> createState() => SettingUnitTileState();
}

class SettingUnitTileState extends State<SettingUnitTile> {
  @override
  Widget build(BuildContext context) {
    var message = "Ubah Data";
    if(widget.index == 1){
      message = "Atur Unit Kosong";
    }else if(widget.index == 2){
      message = "Lihat Lokasi";
    }else if(widget.index == 3){
      message = "Hapus Data";
    }

    return SizedBox(
      width: Get.width,
      child: TextButton(
          onPressed: () {
            if (!widget.onPressed.isNull) {
              widget.onPressed(widget.index);
            }
          },
          child: Text(message,
              style: TextStyle(color: (widget.isLast) ? Colors.red.shade700 : colorTextMessage, fontSize: 16))
      ),
    );
  }
}
