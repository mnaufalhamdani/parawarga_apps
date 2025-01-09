// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import '../standard_single_select_dialog.dart';
import 'single_select_domain.dart';

dialogSingleSelect(BuildContext context, String? title, List<SingleSelectDomain> listItem,
    final void Function(int idIndex, SingleSelectDomain model) onPressed) {

  return showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(baseRadius))),
      builder: (context) => FractionallySizedBox(
          heightFactor: 0.6,
          child: StandardSingleSelectDialog(
              listItem: listItem,
              onPressed: (idIndex, message) {
                onPressed(idIndex, message);
              })
      )
  );
}
