
import 'package:get/get.dart';
import '../model/post.dart';
import '../pages/update.dart';
import '../service/http.dart';
class HomeController extends GetxController{
 // List items =[].obs ;
  RxList<Post> items = <Post>[].obs;

  bool isLoading= false.obs() ;
  Future apiPost() async {
    isLoading=true ;
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items.value = Network.parsePostList(response);
    } else {
      items = <Post>[].obs;
    }
    isLoading = false;


  }

  Future<bool> apiPostDelete(Post post) async {
    isLoading = true;

    var response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    isLoading = false;

    return response!=null;
  }



  Future<void> apiUpdatePost(Post posts) async{
    String result = await Get.to(() => UpdatePage(post: posts,));
    if(result != null) {
      Post newPost = Network.parsePost(result);
      items[items.indexWhere((element) => element.id == newPost.id.obs)] = newPost;
      print(result);
    }
  }


}