import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/model/post.dart';
import '../controller/UpdateController.dart';
import '../controller/home_controller.dart';
import '../view_model/ad_view_model.dart';
import '../view_model/home_view_model.dart';
import 'home.dart';
class UpdatePage extends StatefulWidget {
  Post post;
  UpdatePage({required this.post,Key? key}) : super(key: key);


  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  final new_view = Get.put(HomeController());
  final UpdateController controller = Get.put(UpdateController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getOldPost(widget.post);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
            ()=>
                Stack(children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: TextField(
                                controller: controller.titleController(),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      borderSide: BorderSide(color: Colors.grey),

                                    ),
                                    hintText: ("Insert title"),

                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      borderSide: BorderSide(color: Colors.blue),
                                    )
                                )
                            )
                        ),
                        SizedBox(height: 20,),
                        Container(
                          //height: 80,
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: TextField(
                                maxLines: 5,
                                controller: controller.bodyController(),
                                decoration: InputDecoration(border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                    hintText: ("Insert body"),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      borderSide: BorderSide(color: Colors.blue),
                                    )
                                )
                            )
                        ),
                      ],
                    ),
                  ),
                  controller.isLoading() ? Center(child: CircularProgressIndicator()) : SizedBox.shrink(),

                ]),
        ),




      floatingActionButton: FloatingActionButton(
        onPressed:controller.apiCreatePost,
        child: Icon(Icons.add),
      ),
    );
  }
}
