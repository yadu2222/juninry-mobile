import 'package:juninry/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:juninry/constant/fonts.dart';

class QuoteFromNotice extends StatelessWidget {
  final String? quoteNoticeTitle;
  final Function() onQuoteClicked;
  final Function() onDeleteClicked;
  final bool isDivider;
  const QuoteFromNotice(
      {super.key,
      required this.quoteNoticeTitle,
      required this.onQuoteClicked,
      required this.onDeleteClicked,
      this.isDivider = true});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColors.iconLight,
      padding: const EdgeInsets.symmetric(horizontal: 3),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      elevation: 0, //ボタンの影を消す
      highlightElevation: 0, //ボタンの影を消す
      splashColor: Colors.transparent,
      onPressed: onQuoteClicked,
      onLongPress: onDeleteClicked,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.zero,
            child: Row(children: [
              Icon(
                Icons.attach_file,
                color: quoteNoticeTitle == null
                    ? AppColors.iconGray
                    : AppColors.main,
                weight: 5,
              ),
              Text(quoteNoticeTitle ?? "投稿の引用", style: Fonts.p),
            ]),
          ),
          isDivider ?
          const Divider(
            height: 5,
            thickness: 3.5,
            color: AppColors.main,
            indent: 0,
            endIndent: 0,
          )
          : Container(),
        ],
      ),
    );
  }
}
