import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:juninry/models/treasure_model.dart';
import 'package:juninry/view/pages/junior/page_ouchi_top.dart';
import 'package:juninry/view/pages/share/page_ouchi_info.dart';
import 'package:juninry/view/pages/junior/page_treasure.dart';
import '../models/homework_model.dart';

// junior遷移先
// home
import '../view/pages/share/page_home.dart';
import '../view/pages/share/page_students.dart';
import '../view/pages/share/page_class.dart';
// homework
import '../view/pages/share/page_homework.dart';
import '../view/pages/junior/page_submission.dart';
// notice
import '../view/pages/share/page_notice.dart';
import '../view/pages/share/page_notice_detail.dart';
// ouchi
import '../view/pages/share/page_reward.dart';
import '../view/pages/share/page_ouchi.dart';
import '../view/pages/share/page_onedari.dart';
// user
import '../view/pages/share/page_user.dart';
import '../view/pages/share/page_questions.dart';
import '../view/pages/share/page_my_page.dart';

// こどもブランチ
class JuniorBranch {
  static List<StatefulShellBranch> juniorBranchs = [
    // home
    StatefulShellBranch(
      navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'home'),
      routes: [
        GoRoute(path: '/', redirect: (context, state) => '/home'),
        GoRoute(
          name: 'home',
          path: '/home',
          routes: [
            // 生徒一覧
            GoRoute(
              name: 'students',
              path: 'students',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const PageStudents(),
              ),
            ),
            // クラスに参加
            GoRoute(
              name: 'class',
              path: 'class',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: PageClass(),
              ),
            ),
          ],
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const PageHome.junior(),
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
            GoRoute(
              path: 'detail',
              pageBuilder: (context, state) {
                if (state.extra != null) {
                  // 遷移時に定義されたデータをrouterで再定義
                  final Map<String, dynamic> extraData = state.extra as Map<String, dynamic>;
                  String noticeUUID = extraData['noticeUUID'];
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: PageNoticeDetail(
                      noticeUuid: noticeUUID,
                    ),
                  );
                } else {
                  // noticeUUIDが送られてきていない場合、一覧にリダイレクト
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: PageNotice(),
                  );
                }
              },
            ),
          ],
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: PageNotice(),
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
          routes: [
            // 次の日の課題
            GoRoute(
              name: 'nextdayTask',
              path: 'nextday',
              pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const PageHomework.near()),
            ),
            // 提出
            GoRoute(
              name: 'submittion',
              path: 'submittion',
              pageBuilder: (context, state) {
                // 遷移時のデータの受け渡し
                // extraがnullである場合trycatchでエラーを回避
                if (state.extra != null) {
                  // 遷移時に定義されたデータをrouterで再定義
                  final Map<String, dynamic> extraData = state.extra as Map<String, dynamic>;
                  // final String homeworkId = extraData['homeworkId'];
                  final Homework homework = extraData['homework'];
                  final String homeworkUUID = extraData['homeworkId'];
                  return NoTransitionPage(
                    key: state.pageKey,
                    // 先ほど再定義したデータをここで渡す
                    child: PageSubmissionJunior(
                      homeworkUUID: homeworkUUID,
                      homework: homework,
                    ),
                  );

                  // TODO:errorpage よういしたい
                } else {
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: const PageHomework(),
                  );
                }
              },
            )
          ],
          pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const PageHomework()),
        ),
      ],
    ),

    // ouchi
    StatefulShellBranch(
      navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'ouchi'),
      routes: [
        GoRoute(
          name: 'ouchi',
          path: '/ouchi',
          routes: [
            GoRoute(
              name: 'top',
              path: 'top', // notice
              routes: [
                GoRoute(
                    name: 'GOHOUBI',
                    path: 'reward', // notice
                    pageBuilder: (context, state) => NoTransitionPage(
                          key: state.pageKey,
                          child: const PageReward(),
                        ),
                    routes: [
                      GoRoute(
                          name: 'takarabako',
                          path: 'treasure',
                          pageBuilder: (context, state) {
                            if (state.extra != null) {
                              // 遷移時に定義されたデータをrouterで再定義
                              final Map<String, dynamic> extraData = state.extra as Map<String, dynamic>;
                              final Treasure treasure = extraData['treasure'];
                              return NoTransitionPage(
                                key: state.pageKey,
                                // 先ほど再定義したデータをここで渡す
                                child: PageTreasure(treasure: treasure),
                              );

                              // TODO:errorpage よういしたい
                            } else {
                              return NoTransitionPage(
                                key: state.pageKey,
                                child: const PageHomework.near(),
                              );
                            }
                          })
                    ]),
                GoRoute(
                  name: 'onedari',
                  path: 'onedari',
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: const PageOnedari(),
                  ),
                ),
                GoRoute(
                  name: 'info',
                  path: 'info',
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: const PageOuchiInfo(),
                  ),
                ),
              ],
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: PageOuchiTopJunior(),
              ),
            ),
          ],
          pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const PageOuchi()),
        )
      ],
    ),

    // setting?
    StatefulShellBranch(
      navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'setting'),
      routes: [
        GoRoute(
          name: 'settings',
          path: '/settings',
          routes: [
            GoRoute(
              name: 'questions',
              path: 'questions', // notice
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const PageQuestions(),
              ),
            ),
            GoRoute(
              name: 'myPage',
              path: 'myPage',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const PageMyPage(),
              ),
            ),
          ],
          pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const PageUserData()),
        )
      ],
    ),
  ];
}
