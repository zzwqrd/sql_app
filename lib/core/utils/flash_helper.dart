import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

import '../../app.dart';

class ToastHelper {
  static final ToastHelper _instance = ToastHelper._internal();

  factory ToastHelper() => _instance;

  ToastHelper._internal();

  void success({
    required String msg,
    required String description,
  }) {
    toastification.show(
      context: navigatorKey.currentContext!,
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      icon: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 11.h),
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Center(
          child: Image.asset(
            "assets/icons/profile_picture1.png",
            fit: BoxFit.scaleDown,
            height: 19.h,
            width: 24.h,
          ),
        ),
      ),
      showIcon: true,
      title: Text(
        msg,
        style: Theme.of(navigatorKey.currentContext!).textTheme.bodySmall,
      ),
      description: Text(
        description,
        style: Theme.of(navigatorKey.currentContext!).textTheme.labelSmall,
      ),
      alignment: Alignment.topCenter,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: highModeShadow,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      showProgressBar: false,
      direction: navigatorKey.currentContext!.locale.languageCode == 'en'
          ? ui.TextDirection.ltr
          : ui.TextDirection.rtl,
      autoCloseDuration: Duration(seconds: 2),
    );
  }

  void error({
    required String msg,
    String? description,
  }) {
    toastification.show(
      context: navigatorKey.currentContext!,
      type: ToastificationType.error,
      style: ToastificationStyle.flat,
      icon: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 11.h),
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Center(
          child: Image.asset(
            "assets/icons/profile_picture1.png",
            fit: BoxFit.scaleDown,
            height: 19.h,
            width: 24.h,
          ),
        ),
      ),
      showIcon: true,
      title: Text(
        msg,
        style: Theme.of(navigatorKey.currentContext!).textTheme.bodySmall,
      ),
      description: Text(
        description!,
        style: Theme.of(navigatorKey.currentContext!).textTheme.labelSmall,
      ),
      alignment: Alignment.topRight,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: highModeShadow,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      showProgressBar: false,
      direction: navigatorKey.currentContext!.locale.languageCode == 'en'
          ? ui.TextDirection.ltr
          : ui.TextDirection.rtl,
      autoCloseDuration: Duration(seconds: 2),
    );
  }

  void warning({
    required String msg,
    required String description,
  }) {
    toastification.show(
      context: navigatorKey.currentContext!,
      type: ToastificationType.warning,
      style: ToastificationStyle.flat,
      title: Text(
        msg,
        style: Theme.of(navigatorKey.currentContext!).textTheme.bodySmall,
      ),
      description: Text(
        description,
        style: Theme.of(navigatorKey.currentContext!).textTheme.labelSmall,
      ),
      alignment: Alignment.topCenter,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: highModeShadow,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      showProgressBar: false,
      direction: navigatorKey.currentContext!.locale.languageCode == 'en'
          ? ui.TextDirection.ltr
          : ui.TextDirection.rtl,
      autoCloseDuration: Duration(seconds: 2),
    );
  }
}
