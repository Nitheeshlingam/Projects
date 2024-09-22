import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; //location name for the UI
  late String time; // the time in the location
  late String flag; // url to an asset flag icon
  late String url;
  late bool dayTime = false; // location url for api end point

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];
      String offsetHours = data['utc_offset'].substring(1, 3); // Corrected variable name
      String offsetMinutes = data['utc_offset'].substring(4, 6); // Add this line

      //create a DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(
          hours: int.parse(offsetHours),
          minutes: int.parse(offsetMinutes))); // Modify to include minutes

      dayTime = now.hour > 6 && now.hour < 19? true: false; // Simplified condition

      //set the time property
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}
