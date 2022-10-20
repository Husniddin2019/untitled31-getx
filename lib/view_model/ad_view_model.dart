//
// import 'dart:math';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../model/post.dart';
//
// import '../service/http.dart';
//
// class adView extends ChangeNotifier{
//
//   bool isLoading = false;
//
//   Future<bool> apiPostCreate(_titleTextEditingController,_bodyTextEditingController)  async {
//
//       isLoading = true;
//       notifyListeners();
//     Post post = Post(title: _titleTextEditingController.text,
//         body: _bodyTextEditingController.text,
//         userId: Random().nextInt(pow(2, 10).toInt()+1));
//         var response = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
//         isLoading = false;
//         notifyListeners();
//     return response!=null;
//   }
// }