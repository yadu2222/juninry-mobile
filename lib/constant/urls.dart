class Urls {
  // base URL
  static const String protocol = 'http://';

  // IPほちいね〜.local
  // static const String host = 'M2.local';
  static const String host = 'localhost';

  static const String port = '4561';
  static const String baseUrl = '$protocol$host:$port';
  static const String version = '/v1'; // version

  // ここにURLを追加していく
  // user
  static const String registerUser = '$version/users/register'; // POSTユーザー登録
  static const String login = '$version/users/login'; // POSTログイン
  static const String getUser = '$version/auth/users/user'; // GETuser情報取得

  // notice
  static const String getNotices = '$version/auth/users/notices/notices'; // GETお知らせ取得
  static const String noticeRead = '$version/auth/users/notices/read/'; // POST既読
  static const String noticeDetail = '$version/auth/users/notices/'; // GETお知らせ詳細
  static const String noticeRegister = '$version/auth/users/notices/register'; // POSTお知らせ登録

  // homework
  static const String getHomeworks = '$version/auth/users/homeworks/upcoming'; // GET宿題取得
  static const String getNextdayHomeworks = '$version/auth/users/homeworks/nextday'; // GETつぎのひの宿題取得
  static const String submittionHomework = '$version/auth/users/homeworks/submit'; // POST宿題提出
  static const String submissionLog = '$version/auth/users/homeworks/record?targetMonth='; // POST宿題提出履歴取得

  // class
  static const String getClassmates = '$version/auth/users/classes/users'; // GETクラスメイト取得
  static const String joinClass = '$version/auth/users/classes/join'; // POSTクラス参加
  static const String createClass = '$version/auth/users/classes/register'; // POSTクラス作成  static const String createClass = '$version/auth/users/classes/register'; // POSTクラス作成
  static const String inviteClass = '$version/auth/users/classes/refresh'; // POST招待コード再発行
  static const String getClasses = '$version/auth/users/classes/affiliations'; // GETクラス一覧取得

  // OUCHI
  static const String joinOUCHI = '$version/auth/users/ouchies/join'; // POST招待コードでOUCHIに参加
  static const String createOUCHI = '$version/auth/users/ouchies/register'; // POSTクラス作成  static const String createClass = '$version/auth/users/classes/register'; // POSTクラス作成
  static const String friendLineAccount = '$version/auth/users/ouchies/line'; // GETLINEアカウントと連携
}
