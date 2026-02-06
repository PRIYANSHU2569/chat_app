import 'package:chat_app/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final RxInt _currentIndex = 0.obs;
  final PageController pageController = PageController();
  int get currentIndex => _currentIndex.value;

  @override
  void onInt() {
    super.onInit();

    //Imit all required controllers
    // Get.lazyPut(() =>HomeController());
    // Get.lazyPut(() =>FriendsController());
    Get.lazyPut(() => ProfileController());
    // Get.lazyPut(() =>SearchController());
    // Get.lazyPut(() =>UsersListController());
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void changeTableIndex(int index) {
    _currentIndex.value = index;
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void onPageChanged(int index) {
    _currentIndex.value = index;
  }

  int getUnreadCount(){
    try{
      // final HomeController = Get.find<HomeController>();
      // return homeController.getTotalUnreadCount();
      return 5;
    }catch(e){
      return 0;
    }
  }
  int getNotificationCount(){
    try{
      // final HomeController = Get.find<HomeController>();
      // return homeController.getTotalUnreadCount();
      return 7;
    }catch(e){
      return 0;
    }
  }
}
