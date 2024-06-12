import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 遷移先
// teacher
import '../view/pages/teacher/page_notice_detail.dart';
// 暫定的ホームたちにjuniorを使用
import '../view/pages/junior/page_home.dart';
import '../view/pages/junior/page_homework.dart';
import '../view/pages/junior/page_notice.dart';
import '../view/pages/junior/page_user.dart';

class TeacherBranch {
  static List<StatefulShellBranch> teacherBranch = [
    StatefulShellBranch(
      navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'home'),
      routes: [
        GoRoute(
          name: 'home',
          path: '/home',
          // routes: [
          //   GoRoute(
          //     name: 'students',
          //     path: 'students',
          //     pageBuilder: (context, state) => NoTransitionPage(
          //       key: state.pageKey,
          //       child: const PageStudentsJunior(),
          //     ),
          //   ),
          // ],
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const PageHomeJunior(),
            // child: PageHomePatron(),
          ),
        ),
      ],
    ),

    // notice
    StatefulShellBranch(
      navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'notice'),
      routes: [
        GoRoute(
          name: 'notice',
          path: '/notice', // notice
          routes: [
            // TODO:引数
            GoRoute(
              path: 'detail',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const PageNoticeDetailTeacher(
                  // noticeUUID: '123456',
                ),
              ),
            )
          ],

          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const PageNoticeJunior(),
          ),
        ),
      ],
    ),

    // homework
    StatefulShellBranch(
      navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'homework'),
      routes: [
        GoRoute(
          name: 'homework',
          path: '/homework',
          pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const PageHomeworkJunior()),
        ),
      ],
    ),

    // userData
    StatefulShellBranch(
      navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'userData'),
      routes: [
        GoRoute(
          name: 'userData',
          path: '/userData',
          pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const PageUserDataJunior()),
        )
      ],
    ),
  ];
}
