// ignore_for_file: prefer_const_constructors_in_immutables, use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import 'app_colors.dart';

class StandardButtonLogin extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  final String titleHint;
  final bool? isLoading;
  final Color? buttonColor;
  final Color? color;
  final bool? isEnabled;
  final EdgeInsets? padding;
  final void Function()? onPressed;

  StandardButtonLogin({
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
  State<StandardButtonLogin> createState() => StandardButtonLoginState();

}

class StandardButtonLoginState extends State<StandardButtonLogin> {


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: widget.padding ?? EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: SizedBox(
          width: double.infinity,
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
                    : WidgetStateProperty.all(widget.buttonColor ?? colorButtonPrimary)
                  : WidgetStateProperty.all(Colors.grey),
                shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(baseRadius)))),
            child: widget.isLoading == true
                ? Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                    width: baseRadius,
                    height: baseRadius,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    )))
                : Text(widget.titleHint,
                style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2.5,
                    color: (widget.color.isNull) ? Colors.white : widget.color,
                    fontWeight: FontWeight.bold)),
          ),
        ));
  }
}