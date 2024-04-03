import '../../../../../../../../../main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view.dart';
import '../action/check_input_buttom_enable.dart';

@JuneViewMother()
mixin StateMother<T extends StatefulWidget> on State<T> {
  bool ignoreReadyView() => false;

  Future<void> readyState(BuildContext context) async {}

  Widget loadingWidget() {
    return CupertinoActivityIndicator().center();
  }

  /// automatically generated action code - don't change this code

checkInputButtonEnableAction(String value) {
  var state = NewViewState(); // do not change this line
  if (value.length > 5) {
    state.inputButtonEnabled = true;
  } else {
    state.inputButtonEnabled = false;
  }

  updateState(() {});
}
  /// end of automatically action generated code
  /// automatically generated event code - don't change this code

textFieldChangeEvent(BuildContext context, String value) {
  checkInputButtonEnableAction(value);
}
  /// end of automatically event generated code
}
