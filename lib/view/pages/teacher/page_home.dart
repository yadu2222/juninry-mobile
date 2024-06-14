import 'package:flutter/material.dart';
// import 'package:juninry/view/components/template/basic_template.dart';
import '../../components/template/scroll_template.dart';
import '../../components/organism/latest_notice_tab.dart';
import '../../components/organism/teacher_shortcuts.dart';
import '../../components/organism/homework_tab.dart';

import '../../../constant/sample_data.dart'; // sampleData

class PageHomeTeacher extends StatelessWidget {
  const PageHomeTeacher({super.key});

  final String title = 'ホーム';

  @override
  Widget build(BuildContext context) {
    return ScrollTemplate (title: title, children: [
      // TODO:どこの教室か記載
      LatestNoticeTab(noticeData: SampleData.noticesData), // 最新のお知らせタブ
      HomeworkTab(homeworkData: SampleData.homeworkData), // 明日提出の課題タブ
      TeacherShortcuts(), // ショートカットセット
    ]);
  }
}
