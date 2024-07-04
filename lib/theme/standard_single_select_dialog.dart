// ignore_for_file: prefer_const_constructors_in_immutables, use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/strings.dart';
import 'app_colors.dart';
import 'single_select/item_single_select.dart';
import 'single_select/single_select_domain.dart';
import 'standard_text_field.dart';

class StandardSingleSelectDialog extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  final List<SingleSelectDomain> listItem;
  final void Function(int idIndex, SingleSelectDomain model) onPressed;

  StandardSingleSelectDialog({
    Key? key,
    this.formKey,
    required this.listItem,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<StandardSingleSelectDialog> createState() => StandardSingleSelectDialogState();
}

class StandardSingleSelectDialogState extends State<StandardSingleSelectDialog> {
  final editingControllers = List.generate(1, (index) => TextEditingController());
  final list = List<SingleSelectDomain>.empty(growable: true);

  void searchList() {
    setState(() {
      list.clear();

      final textSearch = editingControllers[0].text.toString().toLowerCase();
      if(textSearch.isNotEmpty) {
        list.addAll(widget.listItem.where((element) =>
            element.message.toString().toLowerCase().contains(textSearch)
        ));
      }else {
        list.addAll(widget.listItem);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    searchList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.all(20),
          child: Text(greetingDialog,
              style: TextStyle(
                  color: colorTextPrimary,
                  fontWeight: FontWeight.w800,
                  fontSize: 16))),
      Padding(padding: EdgeInsets.only(bottom: 20),
          child: StandardTextField(
            editingController: editingControllers[0],
            titleHint: hintSearch,
            msgError: msgFieldEmpty,
            iconField: Icon(Icons.search_rounded),
            inputAction: TextInputAction.search,
            onSubmited: (value) {
              searchList();
            },
          )
      ),
      (list.isNotEmpty) ? Expanded(child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ItemSingleSelect(
            position: index,
            model: list[index],
            onPressed: (position, model) {
              widget.onPressed(position, model);
              Get.back();
            },
          );
        },
        itemCount: list.length,
      ))
          : Center(
          child: GestureDetector(
              onTap: () {
                searchList();
              },
              child: SingleChildScrollView(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      height: 200,
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/gif_no_data.gif")),
                  Text(
                    msgNotFound,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black87),
                  )
                ],
              ))
          )
      )
    ]);
  }
}