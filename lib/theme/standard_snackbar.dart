// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/strings.dart';

enum TypeMessage {
  success, error, warning, info
}

enum DurationMessage {
  lengthShort, lengthLong, lengthInfinite
}

showStandardSnackbar(BuildContext context, TypeMessage typeMessage, {String? message, DurationMessage? duration, double? paddingBottom}) {
  var durationMessage = 5;
  if(duration == DurationMessage.lengthLong){
    durationMessage = 8;
  }else if(duration == DurationMessage.lengthInfinite){
    durationMessage = 3600;
  }

  final snackBar = SnackBar(
    backgroundColor: Colors.transparent,
    behavior: SnackBarBehavior.fixed,
    elevation: 0,
    duration: Duration(seconds: durationMessage),
    content: StandardSnackbar(typeMessage: typeMessage, message: message, paddingBottom: paddingBottom ?? 0),
  );

  ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);
}

class StandardSnackbar extends StatelessWidget {
  final TypeMessage typeMessage;
  final String? message;
  final double paddingBottom;

  const StandardSnackbar({
    super.key,
    required this.typeMessage,
    this.message,
    required this.paddingBottom
  });

  @override
  Widget build(BuildContext context) {
    var colorTypeMessage = Colors.green;
    var iconTypeMessage = Iconsax.verify;
    if(typeMessage == TypeMessage.error) {
      colorTypeMessage = Colors.red;
      iconTypeMessage = Iconsax.warning_2;
    }else if(typeMessage == TypeMessage.warning) {
      colorTypeMessage = Colors.amber;
      iconTypeMessage = Iconsax.danger;
    }else if(typeMessage == TypeMessage.info) {
      colorTypeMessage = Colors.blue;
      iconTypeMessage = Iconsax.information;
    }

    return Padding(padding: EdgeInsets.only(bottom: paddingBottom), child: Stack(alignment: Alignment.centerLeft, children: [
      Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.white,
          elevation: 1,
          child: Padding(padding: EdgeInsets.only(left: 50, top: 10, right: 10, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Expanded(child: Text(pemberitahuan,
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 13))),
                    GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: FittedBox(
                            child: Icon(Icons.close_rounded, color: Colors.black87),
                          ),
                        )
                    )
                  ]),
                  Text(message ?? "-",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 11))
                ],
              )
          )
      ),
      Positioned(left: 15,
          child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 30,
                height: 40,
                child: FittedBox(
                  child: Icon(iconTypeMessage, color: colorTypeMessage),
                ),
              )
          )
      )
    ]));
  }
}
