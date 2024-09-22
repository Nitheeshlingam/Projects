import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map? ?? {};

    // Ensure 'isDayTime' is not null
    bool isDayTime = data['isDayTime'] ?? true; // Default to true if null
    String bgimage = isDayTime ? 'day.png' : 'night.png';
    Color? bgColor = isDayTime ? Colors.blue : Colors.indigo[700];

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgimage'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(children: <Widget>[
              TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'location': result['location'],
                        'flag': result['flag'],
                        'time': result['time'],
                        'isDayTime': result['isDayTime']
                      };
                    });
                  },
                  icon: const Icon(Icons.edit_location, color: Colors.white),
                  label: const Text('Edit Location',
                      style: TextStyle(color: Colors.white))),
              const SizedBox(height: 20.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data['location'] ?? 'Location not found',
                        style: const TextStyle(
                            fontSize: 28.0,
                            letterSpacing: 2.0,
                            color: Colors.white))
                  ]),
              const SizedBox(height: 20.0),
              Text(data['time'] ?? 'Time not found',
                  style: const TextStyle(fontSize: 66.0, color: Colors.white))
            ]),
          ),
        )));
  }
}
