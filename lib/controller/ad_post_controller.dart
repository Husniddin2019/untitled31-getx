import 'dart:math';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/post.dart';
import '../service/http.dart';

class adpageController extends GetxController{

bool isLoading = false;

Future<bool> apiPostCreate(_titleTextEditingController,_bodyTextEditingController)  async {

  isLoading = true;

  Post post = Post(title: _titleTextEditingController.text,
      body: _bodyTextEditingController.text,
      userId: Random().nextInt(pow(2, 10).toInt()+1));
  var response = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
  isLoading = false;

  return response!=null;
}
}