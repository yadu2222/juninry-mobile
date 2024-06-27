import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// デフォルトで表示しているウィジェット
import '../view/components/organism/basic_view.dart';
// 各ユーザータイプのルーター
import 'junior_branch.dart';
import 'patron_branch.dart';
import 'teacher_branch.dart';
// import 'debug_branch.dart'; // デバッグ用 すきにさわっていいよ gitから外してね

// sample
// import '../constant/sample_data.dart';
import '../models/user_model.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

// enumで宣言
enum BranchType {
  junior,
  patron,
  teacher,
}

// ひもづけ
extension BranchTypeExt on BranchType {
  List<StatefulShellBranch> get branch {
    switch (this) {
      case BranchType.teacher:
        return TeacherBranch.teacherBranchs;

      case BranchType.junior:
        return JuniorBranch.juniorBranchs;

      case BranchType.patron:
        return PatronBranch.patronBranchs;
    }
  }
}

Future<List<StatefulShellBranch>> getBranches() async {
  // final userService = UserService();
  // final userRole = await userService.getUserRole();

  // ユーザータイプに合わせたbranchesを返す
  // dbから取得
  final int userRole = await User.getUser().then((value) => value.userTypeId);
  switch (userRole) {
    case 1:
      debugPrint('teacher');
      return BranchType.teacher.branch;
    case 2:
    debugPrint('junior');
      return BranchType.junior.branch;
    case 3:
    debugPrint('patron');
      return BranchType.patron.branch;
    default:
    debugPrint('error');
      return BranchType.junior.branch;
  }
}

// ルーターの作成
Future<GoRouter> createRouter() async {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/home',
    routes: [
      // ボトムバーが必要な画面のルーティング
      // いらなければ StatefulShellRoute と同じ階層に GoRoute で書く
      StatefulShellRoute.indexedStack(
          // parentNavigatorKey: rootNavigatorKey,    // これがあると初期画面で/homeにたどり着けない 原因究明中
          // ここで常時表示させたいクラスをビルドしている
          builder: (context, state, navigationShell) {
            return BasicScreenView(navigationShell: navigationShell);
          },
          branches: [...await getBranches()])
    ],
  );
}
