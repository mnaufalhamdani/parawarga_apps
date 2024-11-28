// ignore_for_file: prefer_const_constructors_in_immutables, use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import 'app_colors.dart';

class StandardButtonPrimary extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  final String titleHint;
  final bool? isLoading;
  final Color? buttonColor;
  final Color? color;
  final bool? isEnabled;
  final EdgeInsets? padding;
  final void Function()? onPressed;

  StandardButtonPrimary({
    Key? key,
    this.formKey,
    required this.titleHint,
    this.isLoading,
    this.buttonColor,
    this.color,
    this.isEnabled,
    this.padding,
    this.onPressed,
  }) : super(key: key);

  @override
  State<StandardButtonPrimary> createState() => StandardButtonPrimaryState();

}

class StandardButtonPrimaryState extends State<StandardButtonPrimary> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: () {
          if(widget.isEnabled.isNull || widget.isEnabled == true) {
            if (!widget.formKey.isNull){
              if (widget.formKey!.currentState!.validate()) {
                if (widget.isLoading == false){
                  if(!widget.onPressed.isNull){
                    widget.onPressed!();
                  }
                }
              }
            }else {
              widget.onPressed!();
            }
          }
        },
        style: ButtonStyle(
            backgroundColor: widget.isEnabled.isNull || widget.isEnabled == true
                ? widget.isLoading == true
                ? WidgetStateProperty.all(Colors.grey)
                : WidgetStateProperty.all(widget.buttonColor ?? colorButtonThird)
                : WidgetStateProperty.all(Colors.grey),
            shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(baseRadiusCard)))),
        child: widget.isLoading == true
            ? Padding(
            padding: EdgeInsets.all(5),
            child: SizedBox(
                width: baseRadiusCard,
                height: baseRadiusCard,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                )))
            : Text(widget.titleHint,
            style: TextStyle(
                color: (widget.color.isNull) ? colorTextSecondary : widget.color,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}