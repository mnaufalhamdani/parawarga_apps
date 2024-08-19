// ignore_for_file: prefer_const_constructors_in_immutables, use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import 'app_colors.dart';

class StandardTextField extends StatefulWidget {
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

  StandardTextField({
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
  State<StandardTextField> createState() => StandardTextState();
}

class StandardTextState extends State<StandardTextField> {
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
        child: TextFormField(
          controller: widget.editingController,
          keyboardType: widget.inputType ?? TextInputType.name,
          textInputAction: widget.inputAction ?? TextInputAction.next,
          maxLength: widget.maxLength,
          readOnly: widget.readOnly ?? false,
          enabled: widget.isEnabled,
          style: TextStyle(fontSize: 14, color: colorTextPrimary),
          obscureText: widget.isPassword == true ? obscurePassword : false,
          validator: (value) {
            if (!widget.msgError.isNull) {
              if (value == null || value.isEmpty) {
                return widget.msgError;
              }
            }
            return null;
          },
          onTap: () {
            if (!widget.onPressed.isNull) {
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
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(baseRadiusForm), borderSide: BorderSide(color: colorLight)),
              disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(baseRadiusForm), borderSide: BorderSide(color: colorLight)),
              errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(baseRadiusForm), borderSide: BorderSide(color: Colors.red)),
              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(baseRadiusForm), borderSide: BorderSide(color: Colors.red)),
              contentPadding: EdgeInsets.only(left: 20, right: 20),
              prefixIcon: widget.iconField,
              prefixIconColor: colorDark,
              labelText: widget.titleHint,
              hintText: "Masukkan ${widget.titleHint}",
              filled: true,
              fillColor: colorLight,
              suffixIcon: widget.isPassword == true
                  ? IconButton(
                icon: Icon(
                  obscurePassword ? Iconsax.eye : Iconsax.eye_slash,
                  color: colorDark,
                ),
                onPressed: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              )
                  : null),
        ));
  }
}
