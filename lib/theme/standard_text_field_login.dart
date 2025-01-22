// ignore_for_file: prefer_const_constructors_in_immutables, use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import 'app_colors.dart';

class StandardTextFieldLogin extends StatefulWidget {
  final TextEditingController editingController;
  final String titleHint;
  final String? msgError;
  final int? maxLength;
  final bool? readOnly;
  final bool? isEnabled;
  final Icon? iconField;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final bool? isPassword;
  final void Function()? onPressed;
  final void Function(String value)? onSubmited;

  StandardTextFieldLogin({
    Key? key,
    required this.editingController,
    required this.titleHint,
    this.msgError,
    this.maxLength,
    this.readOnly,
    this.isEnabled,
    this.iconField,
    this.inputType,
    this.inputAction,
    this.isPassword,
    this.onPressed,
    this.onSubmited,
  }) : super(key: key);

  @override
  State<StandardTextFieldLogin> createState() => StandardTextState();
}

class StandardTextState extends State<StandardTextFieldLogin> {
  var obscurePassword = false;

  @override
  void initState() {
    super.initState();
    if (widget.isPassword == true) {
      obscurePassword = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(widget.titleHint,
            style: TextStyle(
              fontSize: 14,
              color: colorTextPrimary,
              fontWeight: FontWeight.bold,
              height: 1.5)),
          TextFormField(
            controller: widget.editingController,
            keyboardType: widget.inputType ?? TextInputType.name,
            textInputAction: widget.inputAction ?? TextInputAction.next,
            maxLength: widget.maxLength,
            readOnly: widget.readOnly ?? false,
            enabled: widget.isEnabled,
            style: TextStyle(fontSize: 14, color: colorTextPrimary),
            obscureText: widget.isPassword == true ? obscurePassword : false,
            validator: (value) {
              if (widget.msgError != null) {
                if (value == null || value.isEmpty) {
                  return widget.msgError;
                }
              }
              return null;
            },
            onTap: () {
              if (widget.onPressed != null) {
                widget.onPressed!();
              }
            },
            onFieldSubmitted: (value) {
              if (widget.inputAction == TextInputAction.search) {
                widget.onSubmited!(value);
              }
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(baseRadiusForm), borderSide: BorderSide(color: colorDark)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(baseRadiusForm), borderSide: BorderSide(color: colorDark)),
                disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(baseRadiusForm), borderSide: BorderSide(color: colorDark)),
                errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(baseRadiusForm), borderSide: BorderSide(color: Colors.red)),
                focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(baseRadiusForm), borderSide: BorderSide(color: Colors.red)),
                contentPadding: EdgeInsets.only(left: 20, right: 20),
                prefixIcon: widget.iconField,
                prefixIconColor: colorTextPrimary,
                hintText: "Masukkan ${widget.titleHint}",
                hintStyle: TextStyle(color: colorTextSecondary),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: widget.isPassword == true
                    ? IconButton(
                        icon: Icon(
                          obscurePassword ? Iconsax.eye : Iconsax.eye_slash,
                          color: colorTextPrimary,
                        ),
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                      )
                    : null),
          )
        ]));
  }
}
