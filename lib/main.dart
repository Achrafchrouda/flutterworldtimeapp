import 'package:flutter/material.dart';
import 'package:wordtime/pages/choose_location.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/choose_location.dart';

void main() => runApp(MaterialApp(initialRoute: '/',
        //home: Home(),
        routes: {
          '/': (context) => Loading(),
          '/home': (context) => Home(),
          '/location': (context) => ChooseLocation(),
        }));
