import 'package:flutter/material.dart';

// import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import '../../view/components/atoms/toast.dart';
import '../../../constant/messages.dart';
import '../../models/class_model.dart';
import '../../models/notice_model.dart';
import '../service/notice_service.dart';

import '../../models/quoted_notice_model.dart';

class NoticeReq {
  final BuildContext context;

  NoticeReq({required this.context});

  Future<QuotedNotice> fetchQuotedNotice(String noticeUuid) async {
    try {
      return NoticeService.getQuotedNotice(noticeUuid);
    } catch (error) {
      debugPrint(error.toString());
      ToastUtil.show(message: Messages.joinClassError); // 参加失敗メッセージ
      return QuotedNotice.errorQuotedNotice();
    }
  }

  Future<void> postNotice(Notice notice) async {
    try {
      await NoticeService.registerNotice(notice);
      ToastUtil.show(message: Messages.joinClassSuccess); // 参加成功メッセージ
    } catch (error) {
      debugPrint(error.toString());
      ToastUtil.show(message: Messages.joinClassError); // 参加失敗メッセージ
    }
  }
}
