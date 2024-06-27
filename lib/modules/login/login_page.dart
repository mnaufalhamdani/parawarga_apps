import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/modules/login/login_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('login Page')),
      body: Container(
        child: Obx(()=>Container(child: Text(controller.obj),)),
      ),
    );
  }
}
