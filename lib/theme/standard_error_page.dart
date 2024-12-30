// ignore_for_file: prefer_const_constructors_in_immutables, use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';

class StandardErrorPage extends StatefulWidget {
  final String? message;
  final double? paddingTop;
  final void Function()? onPressed;

  StandardErrorPage({
    Key? key,
    this.message,
    this.paddingTop,
    this.onPressed,
  }) : super(key: key);

  @override
  State<StandardErrorPage> createState() => StandardErrorPageState();
}

class StandardErrorPageState extends State<StandardErrorPage> {
  var obscurePassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: widget.paddingTop ?? 0), child: Center(
        child: GestureDetector(
            onTap: () {
              if(widget.onPressed != null){
                widget.onPressed!();
              }
            },
            child: SingleChildScrollView(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    height: 200,
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/images/background/gif_no_data.gif")),
                Text(
                  widget.message.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black87),
                )
              ],
            ))
        ))
    );
  }
}
