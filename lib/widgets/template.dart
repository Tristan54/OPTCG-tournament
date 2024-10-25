import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Template{

  late var sx;
  late var sy;
  late var context;

  Template({
    required this.sx,
    required this.sy,
    required this.context,
  });

  bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 650;

  Widget build({required Widget child}) => Platform.isIOS ? child : SafeArea(child: child);

  // Constantes
  int _animation_duration = 2;

  // Couleurs
  Color? grey = Colors.grey[800];
  Color black = Colors.black;
  Color white = Colors.white;
  Color yellow = Colors.yellow;
  Color red = Colors.red;
  Color blue = Colors.blue;
  Color green = Colors.green;
  Color orange = Colors.orangeAccent;
  Color done = Color.fromRGBO(255,222,173, 1);

  double get small => isMobile(context) ? sx(10.toDouble()) : sx(4.toDouble());
  double get small_padding => isMobile(context) ? sx(18.toDouble()) : sx(9.toDouble());
  double get padding => isMobile(context) ? sx(30.toDouble()) : sx(15.toDouble());
  double get large_padding => isMobile(context) ? sx(40.toDouble()) : sx(20.toDouble());
  double get body_width => isMobile(context) ? sx(400.toDouble()) : sx(200.toDouble());
  double get body_height => isMobile(context) ? sy(50.toDouble()) : sy(25.toDouble());
  double get small_text_size => isMobile(context) ? sx(20.toDouble()) : sx(10.toDouble());
  double get text_size => isMobile(context) ? sx(24.toDouble()) : sx(11.toDouble());
  double get title_size => isMobile(context) ? sx(34.toDouble()) : sx(18.toDouble());
  double get body_text_width => isMobile(context) ? sx(260.toDouble()) : sx(150.toDouble());

  double get large_button_width => isMobile(context) ? sx(220.toDouble()) : sx(110.toDouble());
  double get button_width => isMobile(context) ? sx(200.toDouble()) : sx(100.toDouble());
  double get button_height => isMobile(context) ? sy(25.toDouble()) : sy(18.toDouble());
  double get small_button_height => isMobile(context) ? sy(10.toDouble()) : sy(5.toDouble());

  double get small_image_width => isMobile(context) ? sx(300.toDouble()) : sx(150.toDouble());
  double get image_width => isMobile(context) ? sx(400.toDouble()) : sx(200.toDouble());
  double get photo_width => isMobile(context) ? sx(325.toDouble()) : sx(175.toDouble());
  double get image_height_ratio => 0.35;
  double get photo_height_ratio => 1.33;
  double get bandeau_height_ratio => isMobile(context) ? 0 : 0.33;
  double get scan_height => isMobile(context) ? sy(150.toDouble()) : sy(200.toDouble());

  double get app_bar_width => AppBar().preferredSize.height / 0.4;
  double get app_bar_height => AppBar().preferredSize.height - 12;

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat dateTimeFormat = DateFormat("HH:mm");

  // codes de retour
  Map<int, String> return_code = {
    200: 'code_200',
    522: 'code_522',
    401: 'code_401',
    403: 'code_403',
    500: 'code_500',
    409: 'code_409',
  };

  // Snackbar
  Widget snackSample({required String text}) => SnackBar(
    content: Text(
      text,
      style: TextStyle(
        color: white,
        fontSize: text_size,
      ),
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: _animation_duration),
    backgroundColor: red,
  );

  Widget title({required String text, Color? color}) {
    return Text(
      text,
      maxLines: 2,
      style:  TextStyle(
        color: color ?? black,
        fontSize: title_size,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget text({required String text, Color? color}) {
    return Text(
      text,
      maxLines: 3,
      style: TextStyle(
        color: color ?? black,
        fontSize: text_size,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget small_text({required String text, Color? color}) {
    return Text(
      text,
      maxLines: 2,
      style: TextStyle(
        color: color ?? black,
        fontSize: small_text_size,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget no_data(String message){
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
          children: [
        Container(
          width: button_width,
          height: button_width,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/icons/no-data.png'),
                fit: BoxFit.fill
            ),
          ),
        ),
        text(text: message),
        ],
      ),
    );
  }
}