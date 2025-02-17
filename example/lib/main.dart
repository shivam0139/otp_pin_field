import 'package:example_otp_pin_field/next_page.dart';
import 'package:flutter/material.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowMaterialGrid: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OtpPinField(
              onSubmit: (text) {
                print('Entered pin is $text'); // return the entered pin
              },
              onChange: (text) {
                print('Enter on change pin is $text'); // return the entered pin
              },
              // to decorate your Otp_Pin_Field
              otpPinFieldStyle: OtpPinFieldStyle(
                  // border color for inactive/unfocused Otp_Pin_Field
                  defaultFieldBorderColor: Colors.red,
                  // border color for active/focused Otp_Pin_Field
                  activeFieldBorderColor: Colors.indigo,
                  // Background Color for inactive/unfocused Otp_Pin_Field
                  defaultFieldBackgroundColor: Colors.yellow,
                  activeFieldBackgroundColor: Colors
                      .cyanAccent // Background Color for active/focused Otp_Pin_Field
                  ),
              maxLength: 4,
              // no of pin field
              showCursor: true,
              //bool to show cursor in pin field or not
              cursorColor: Colors.indigo,
              // to choose cursor color
              upperChild: Column(
                children: [
                  SizedBox(height: 30),
                  Icon(Icons.flutter_dash_outlined, size: 150),
                  SizedBox(height: 20),
                ],
              ),
              middleChild: Column(
                children: [
                  SizedBox(height: 30),
                  SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NextPage())),
                      child: Text("Next Class")),
                  SizedBox(height: 30),
                ],
              ),
              showCustomKeyboard:
                  true, //bool which manage to show custom keyboard
              // customKeyboard: Container(),  // Widget which help you to show your own custom keyboard in place if default custom keyboard
              // showDefaultKeyboard: true,  //bool which manage to show default OS keyboard
              cursorWidth: 3, // to select cursor width
              mainAxisAlignment: MainAxisAlignment
                  .center, // place otp pin field according to yourselft

              // predefine decorate of pinField use  OtpPinFieldDecoration.defaultPinBoxDecoration||OtpPinFieldDecoration.underlinedPinBoxDecoration||OtpPinFieldDecoration.roundedPinBoxDecoration
              //use OtpPinFieldDecoration.custom  (by using this you can make Otp_Pin_Field according to yourself like you can give fieldBorderRadius,fieldBorderWidth and etc things)
              otpPinFieldDecoration:
                  OtpPinFieldDecoration.defaultPinBoxDecoration),
        ],
      ),
    );
  }
}
