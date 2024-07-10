import 'package:flutter/material.dart';

import '../../../models/homework_model.dart';
import '../molecule/submittion_card.dart';
import '../../../constant/fonts.dart';

// カメラを使用するためのライブラリ
// import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

// 提出リスト
class SubmittionList extends StatefulWidget {
  final Homework homeworkData;
  final void Function() onTakeCamera; // 撮影時の処理
  const SubmittionList({super.key, required this.homeworkData, required this.onTakeCamera});

  @override
  SubmittionListState createState() => SubmittionListState();
}

class SubmittionListState extends State<SubmittionList> {
  late List<File?> _images; // 画像用配列
  final picker = ImagePicker(); // カメラ処理

  // カメラ処理
  Future<void> pickImage(int index) async {
    XFile? pickedFile = await picker.pickImage(source: ImageSource.camera); // カメラ起動
    setState(() {
      // 一時ファイルにデータが有れば
      if (pickedFile != null) {
        if (_images[index] == null) {   // 画像が既にある場合、つまり撮り直しを除外
          widget.onTakeCamera(); // 撮影時の処理 残り枚数のカウントを減らす
        }
        _images[index] = (File(pickedFile.path)); // 画像用配列に保存
      }
    });
  }

  // sumpleDataをinitState内で初期化
  late int count;
  @override
  void initState() {
    super.initState();
    count = widget.homeworkData.pageCount - widget.homeworkData.startPage + 1; // ページ数を取得
    _images = List.filled(count, null); // ページ数で初期化
  }


  // TODO:SingleChildScrollView対応
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.92,
        child: ListView.builder(
          // カメラの処理と条件分岐が複雑なためここで定義
          itemCount: count,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  // カメラ起動
                  pickImage(index);
                },
                child: _images[index] != null
                    ? Container(margin: const EdgeInsets.all(5), child: Column(children: [Image.file(_images[index]!), Text('${(count - (count - index - 1)).toString()}p', style: Fonts.h4)]))
                    : SubmittionCard(count: count - (count - index - 1)));
          },
        ));
  }
}
