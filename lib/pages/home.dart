import 'dart:developer';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  late bool dayTime = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data =  ModalRoute.of(context)!.settings.arguments as Map ;
    // log(data.toString());
    log("hello");
    setState(() {
      dayTime = data['isDayTime'];
    });
    log(dayTime.toString());

    //set backgroud
    String bgImage = dayTime ? "assets/day.png" : "assets/night.png";
    Color? bgColor = dayTime ? Colors.blue : Colors.indigo[700];
    log(bgImage);
    log(dayTime.toString());
    return data.isEmpty
        ? Container()
        : Scaffold(
            backgroundColor: bgColor,
            body: SafeArea(
                child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(bgImage),
                fit: BoxFit.cover,
              )),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                child: Column(children: [
                  FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'flag': result['falg'],
                        };
                      });
                    },
                    icon: const Icon(
                      Icons.edit_location,
                    ),
                    label: Text(
                      'Edit location',
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: const TextStyle(
                            fontSize: 28.0,
                            letterSpacing: 2.0,
                            color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    data['time'],
                    style: const TextStyle(
                      fontSize: 66.0,
                      color: Colors.white,
                    ),
                  )
                ]),
              ),
            )),
          );
  }
}
