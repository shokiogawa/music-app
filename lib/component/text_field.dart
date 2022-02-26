import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController _textEditingController;

  const MyTextField(this._textEditingController, Key? key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      cursorColor: Colors.green,
      style: const TextStyle(color: Colors.green, fontSize: 20),
      textInputAction: TextInputAction.search,
      //キーボードのアクションボタンを指定
      decoration: const InputDecoration(
        //TextFiledのスタイル
        enabledBorder: UnderlineInputBorder(
            //デフォルトのTextFieldの枠線
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: UnderlineInputBorder(
            //TextFieldにフォーカス時の枠線
            borderSide: BorderSide(color: Colors.white)),
        hintText: '検索', //何も入力してないときに表示されるテキスト
        hintStyle: TextStyle(
          //hintTextのスタイル
          color: Colors.white60,
          fontSize: 20,
        ),
      ),
    );
  }
}
