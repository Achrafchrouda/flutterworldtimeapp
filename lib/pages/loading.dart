import 'package:flutter/material.dart';
import 'package:wordtime/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
      location: 'Kolkata',
      flag: 'Kolkata.png',
      url: 'Asia/kolkata',
    );
    await instance.getTime(instance.url);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDaytime,
    });
  }
  // void getData() async {
  //   var url = Uri.parse("https://jsonplaceholder.typicode.com/todos/1");
  //   var response = await http.get(url);
  //   Map data = jsonDecode(response.body);
  //   print(data);
  //   print(data['title']);
  // }

  //   // simulate network request for a username
  //  String username =await Future.delayed(Duration(seconds: 3) ,(){
  //       return 'yoshi';
  //   });

  //    // simulate network request to get bio of the username
  //   String bio =await Future.delayed(Duration(seconds: 3) ,(){
  //       return 'yoshi';
  //   });

  //   print('$username - $bio ');
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
