

import 'package:chat_app/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
  final AuthController _authController = Get.find<AuthController>();
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RxBool _isLoading = false.obs;
  final RxString _error = ''.obs;
  final RxBool _obscureCurrentPassword = true.obs;
  final RxBool _obscureNewPassword = true.obs;
  final RxBool _obscureConfirmPassword = true.obs;

  bool get isLoading => _isLoading.value;
  String get error => _error.value;
  bool get obscureCurrentPassword => _obscureCurrentPassword.value;
  bool get obscureNewPassword => _obscureNewPassword.value;
  bool get obscureConfirmPassword => _obscureConfirmPassword.value;

  @override
  void onClose(){
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();

  }



  void toggleCurrentPasswordVisibility() {
    _obscureCurrentPassword.value = !_obscureCurrentPassword.value;
  }
  void toggleNewPasswordVisibility() {
    _obscureNewPassword.value = !_obscureNewPassword.value;
  }
  void toggleConfirmPasswordVisibility() {
    _obscureConfirmPassword.value = !_obscureConfirmPassword.value;
  }

  Future<void> changePassword()async{
    if (formKey.currentState!.validate()) return;
    try {
      _isLoading.value = true;
      _error.value = '';
      final user = FirebaseAuth.instance.currentUser;
      if (user == null){
        throw Exception('No User Logged In');
      }
      // final credential = EmailAuthProvider.credential(
      //   email: user.email!,
      //   password: currentPasswordController.text,
      // );
      // await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPasswordController.text);
      //
      // await _authController.signOut();

      Get.snackbar('Success', 'Password Changed Successfully',
        backgroundColor: Colors.green.withOpacity(0.1),

        colorText: Colors.green,
        duration: Duration(seconds: 3),
      );
      currentPasswordController.clear();
      newPasswordController.clear();
      confirmPasswordController.clear();
      // Get.back();

      await _authController.signOut();

    } on FirebaseAuthException catch (e) {
      String errorMesssage;
      switch (e.code) {
        case 'wrong-password':
          errorMesssage = 'Current Password is Incorrect';
          break;
        case 'weak-password':
          errorMesssage = 'New Password is too weak';
          break;
        case 'requires-recent-login':
          errorMesssage = 'Please sign out and sign in again before changing password';
          break;
        default:
          errorMesssage = 'Failed to Change Password';
      }
      _error.value = errorMesssage;
      Get.snackbar('Error', errorMesssage,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red,
          duration: Duration(seconds:  4),
      );

    }catch (e) {
      _error.value ='Failed to Change Password';
      Get.snackbar(
        'Error',
        _error.value ,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
        duration: Duration(seconds: 4),
      );
    }

    finally {
      _isLoading.value = false;
    }
  }
  String ? validateCurrentPassword(String ? value){
    if (value?.isEmpty ?? true) {
      return 'Please enter your current password';
    }
    return null;
  }
  String ? validateNewPassword(String ? value){
    if (value?.isEmpty ?? true) {
      return 'Please enter your new password';
    }
    if (value!.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;

  }
  String ? validateConfirmPassword(String ? value){
    if (value?.isEmpty ?? true) {
      return 'Please confirm your new password';
    }
    if (value != newPasswordController.text) {
      return 'Password Does Not match';
    }
    return null;
  }
  void clearError(){
    _error.value = '';

  }

}