import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../view/item_of_post.dart';
import '../view_model/home_view_model.dart';
import 'add_new.dart';
import 'package:provider/provider.dart';
class home1 extends StatefulWidget {
  const home1({Key? key}) : super(key: key);
  @override
  State<home1> createState() => _homeState();
}

class _homeState extends State<home1> {
  final new_view = Get.put(HomeController());
  //homeView new_view = homeView ();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new_view.apiPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Getx"),
      ),
      body: Obx(
            ()=>Stack(
        children: [
              ListView.builder(
                itemCount: new_view.items.length,
                itemBuilder: (ctx,index)
                {return itemofPost(new_view, new_view.items[index]);},
                 ),
               new_view.isLoading ? Center(child: CircularProgressIndicator(),):SizedBox.shrink(),
                 ],
                    ),
                ),

      floatingActionButton:  FloatingActionButton
        (onPressed: (){ Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const add()),
      );},child: Icon(Icons.add), ),
    );
  }

}
