import 'package:http/http.dart' as https;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the UI
  String time = ""; //time in that location
  String flag; //urlf to an asset flag
  String url; //location url for api endpoint
  bool isDaytime = false; // true or fpalse if datetime or not

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
  });

  Future<void> getTime(String location) async {
    try {
      String choose = 'http://worldtimeapi.org/api/timezone/$location';
      var url = Uri.parse(choose);
      var response = await https.get(url);
      Map data = jsonDecode(response.body);
      //print(data);

      //get propretites data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      //print(datetime);
      //print(offset);

      //create DateTime object

      DateTime now = DateTime.parse(datetime);
      now.add(Duration(hours: int.parse(offset)));

      //set time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error : $e');
      time = 'could not get time data';
    }
  }
}
