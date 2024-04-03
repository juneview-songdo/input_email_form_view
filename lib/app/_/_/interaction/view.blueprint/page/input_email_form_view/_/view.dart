import 'package:flutter/material.dart';

import '../../../../../../../../main.dart';
import '_/state_child.dart';
import '_/state_mother.dart';

class NewView extends StatefulWidget {
  NewView({super.key});

  @override
  State<NewView> createState() => StateChild();
}

class NewViewState extends State<NewView> with StateMother {
  TextEditingController textEditController = TextEditingController();
  FocusNode myFocusNode = FocusNode();
  bool inputButtonEnabled = false;
  final formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(60),
              Text("Input your email.")
                  .textStyle(Theme.of(context).textTheme.titleLarge!)
                  .fontWeight(FontWeight.bold),
              TextFormField(
                controller: textEditController,
                cursorColor: Colors.black,
                focusNode: myFocusNode,
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {
                  if (formKey.currentState!.validate()) {
                    print('onFieldSubmitted: $value');
                  }
                },
                decoration: InputDecoration(
                  // labelText: 'nickname',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 12),
                  hintText: 'example@mail.com',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 12.0,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
        
                  // contentPadding: EdgeInsets.symmetric(
                  //     vertical: 15.0, horizontal: 15.0),
                ),
                style: Theme.of(context).textTheme.bodyLarge!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email cannot be empty';
                  }

                  final RegExp emailRegExp = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );

                  if (!emailRegExp.hasMatch(value)) {
                    return 'Enter a valid email address';
                  }

                  return null;
                },
                onChanged: (String value) {
                  textFieldChangeEvent(context, value);
                },
              ),
              Spacer(),
              OutlinedButton(
                onPressed: !inputButtonEnabled
                    ? null
                    : () {
                  if (formKey.currentState!.validate()) {
                    print('onFieldSubmitted: ${textEditController.text}');
                  }
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: BorderSide(
                      color: Theme.of(context).textTheme.bodyMedium!.color!,
                      width: 2), // 테두리 색상과 두께 설정
                ),
                child: Text("Confirm")
                    .fontWeight(FontWeight.bold)
                    .textColor(Theme.of(context).textTheme.bodyMedium!.color!)
                    .padding(vertical: 20, horizontal: 20),
              )
                  .padding(
                vertical: 7,
              )
                  .width(double.infinity)
                  .opacity(inputButtonEnabled ? 1 : 0.2),
              Gap(10),
            ],
          ).padding(horizontal: 30),
        ),
      ),
      floatingActionButton: FloatingActionButtonKit(),
    );
  }
}

main() async {
  return buildApp(appHome: NewView());
}