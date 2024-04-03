import '../../../../../../../../../main.dart';

import '../view.dart';

@JuneViewAction()
checkInputButtonEnableAction(String value) {
  var state = NewViewState(); // do not change this line
  if (value.length > 5) {
    state.inputButtonEnabled = true;
  } else {
    state.inputButtonEnabled = false;
  }

  updateState(() {});
}
