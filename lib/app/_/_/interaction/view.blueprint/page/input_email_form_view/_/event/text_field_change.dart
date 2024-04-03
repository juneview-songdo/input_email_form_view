import 'package:flutter/material.dart';

import '../../../../../../../../../main.dart';
import '../action/check_input_buttom_enable.dart';

@JuneViewEvent()
textFieldChangeEvent(BuildContext context, String value) {
  checkInputButtonEnableAction(value);
}
