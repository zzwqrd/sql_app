// import 'dart:ui' as ui;

// import 'package:easy_localization/easy_localization.dart';
// import 'package:flash/flash.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shop_store/commonWidget/text_app_n.dart';
// import 'package:shop_store/core/routes/app_routes_fun.dart';
// import 'package:shop_store/core/utils/extensions.dart';
// import 'package:toastification/toastification.dart';

// import '../../commonWidget/custom_image.dart';
// import '../../gen/assets/generated_assets.dart';

// enum MessageTypeTost { success, fail, warning }

// class FlashHelper {
//   static Future<void> showToast(String msg,
//       {int duration = 2, MessageTypeTost type = MessageTypeTost.fail}) async {
//     if (msg.isEmpty) return;
//     return showFlash(
//       context: navigatorKey.currentContext!,
//       builder: (context, controller) {
//         return FlashBar(
//           controller: controller,
//           position: FlashPosition.top,
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           content: Container(
//             padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 10.h),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(9.r),
//                 color: _getBgColor(type)),
//             child: Row(
//               children: [
//                 Container(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 8.w, vertical: 11.h),
//                   decoration: const BoxDecoration(
//                       color: Colors.white, shape: BoxShape.circle),
//                   child: Center(
//                     child: CustomImage(
//                       Assets.icons.logo,
//                       fit: BoxFit.scaleDown,
//                       height: 19.h,
//                       width: 24.h,
//                       color: _getBgColor(type),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10.w),
//                 Expanded(
//                   child: Text(
//                     msg,
//                     maxLines: 5,
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.start,
//                     softWrap: true,
//                     style: context.regularText.copyWith(
//                         fontSize: 16, color: context.primaryColorLight),
//                   ),
//                 ),
//                 Container(
//                   height: 24.h,
//                   width: 24.h,
//                   padding: EdgeInsets.all(5.r),
//                   decoration: const BoxDecoration(
//                       color: Colors.white, shape: BoxShape.circle),
//                   child: CustomImage(
//                     _getToastIcon(type),
//                     height: 19.h,
//                     width: 24.h,
//                     color: _getBgColor(type),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//       duration: const Duration(milliseconds: 3000),
//     );
//   }

//   static Color _getBgColor(MessageTypeTost msgType) {
//     switch (msgType) {
//       case MessageTypeTost.success:
//         return "#53A653".color;
//       case MessageTypeTost.warning:
//         return "#FFCC00".color;
//       default:
//         return "#EF233C".color;
//     }
//   }

//   static String _getToastIcon(MessageTypeTost msgType) {
//     return Assets.icons.logo;
//     // switch (msgType) {
//     //   case MessageType.success:
//     //     return Assets.svg.success;

//     //   case MessageType.warning:
//     //     return Assets.svg.warning;

//     //   default:
//     //     return Assets.svg.error;
//     // }
//   }
// }

// class ToastificationHelper {
//   static final ToastificationHelper _instance =
//       ToastificationHelper._internal();

//   factory ToastificationHelper() => _instance;

//   ToastificationHelper._internal();
//   void success({
//     required String msg,
//   }) {
//     FlashHelper.showToast(
//       msg,
//       type: MessageTypeTost.success,
//     );
//   }

//   void error({
//     required String msg,
//   }) {
//     FlashHelper.showToast(
//       msg,
//       type: MessageTypeTost.fail,
//     );
//   }

//   void warning({
//     required String msg,
//   }) {
//     FlashHelper.showToast(
//       msg,
//       type: MessageTypeTost.warning,
//     );
//   }
// }

// class ToastHelper {
//   static final ToastHelper _instance = ToastHelper._internal();

//   factory ToastHelper() => _instance;

//   ToastHelper._internal();

//   void success({
//     required String msg,
//     required String description,
//   }) {
//     toastification.show(
//       context: navigatorKey.currentContext!,
//       type: ToastificationType.success,
//       style: ToastificationStyle.flat,
//       icon: Container(
//         padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 11.h),
//         decoration:
//             const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
//         child: Center(
//           child: CustomImage(
//             Assets.icons.logo,
//             fit: BoxFit.scaleDown,
//             height: 19.h,
//             width: 24.h,
//           ),
//         ),
//       ),
//       showIcon: true,
//       title: AppText.bodySmall(
//         text: msg,
//       ).copyWith(
//           style: Theme.of(navigatorKey.currentContext!).textTheme.bodySmall),
//       description: AppText.bodySmall(
//         text: description,
//       ).copyWith(
//           style: Theme.of(navigatorKey.currentContext!).textTheme.labelSmall),
//       alignment: Alignment.topCenter,
//       borderRadius: BorderRadius.circular(20.r),
//       boxShadow: highModeShadow,
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//       showProgressBar: false,
//       direction: navigatorKey.currentContext!.locale.languageCode == 'en'
//           ? ui.TextDirection.ltr
//           : ui.TextDirection.rtl,
//       autoCloseDuration: Duration(seconds: 2),
//     );
//   }

//   void error({
//     required String msg,
//     String? description,
//   }) {
//     toastification.show(
//       context: navigatorKey.currentContext!,
//       type: ToastificationType.error,
//       style: ToastificationStyle.flat,
//       icon: Container(
//         padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 11.h),
//         decoration:
//             const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
//         child: Center(
//           child: CustomImage(
//             Assets.icons.logo,
//             fit: BoxFit.scaleDown,
//             height: 19.h,
//             width: 24.h,
//           ),
//         ),
//       ),
//       showIcon: true,
//       title: AppText.bodySmall(
//         text: msg,
//       )
//           .copyWith(
//               style: Theme.of(navigatorKey.currentContext!).textTheme.bodySmall)
//           .center,
//       description: AppText.bodySmall(
//         text: description!,
//       ).copyWith(
//           style: Theme.of(navigatorKey.currentContext!).textTheme.labelSmall),
//       alignment: Alignment.topRight,
//       borderRadius: BorderRadius.circular(20.r),
//       boxShadow: highModeShadow,
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//       showProgressBar: false,
//       direction: navigatorKey.currentContext!.locale.languageCode == 'en'
//           ? ui.TextDirection.ltr
//           : ui.TextDirection.rtl,
//       autoCloseDuration: Duration(seconds: 2),
//     );
//   }

//   void warning({
//     required String msg,
//     required String description,
//   }) {
//     toastification.show(
//       context: navigatorKey.currentContext!,
//       type: ToastificationType.warning,
//       style: ToastificationStyle.flat,
//       title: AppText.bodySmall(
//         text: msg,
//       ).copyWith(
//           style: Theme.of(navigatorKey.currentContext!).textTheme.bodySmall),
//       description: AppText.bodySmall(
//         text: description,
//       ).copyWith(
//           style: Theme.of(navigatorKey.currentContext!).textTheme.labelSmall),
//       alignment: Alignment.topCenter,
//       borderRadius: BorderRadius.circular(20.r),
//       boxShadow: highModeShadow,
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//       showProgressBar: false,
//       direction: navigatorKey.currentContext!.locale.languageCode == 'en'
//           ? ui.TextDirection.ltr
//           : ui.TextDirection.rtl,
//       autoCloseDuration: Duration(seconds: 2),
//     );
//   }
// }
