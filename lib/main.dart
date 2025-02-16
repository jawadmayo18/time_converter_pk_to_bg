import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(TimeConverterApp());
}

class TimeConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Converter',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: TimeConverterScreen(),
    );
  }
}

class TimeConverterScreen extends StatefulWidget {
  @override
  _TimeConverterScreenState createState() => _TimeConverterScreenState();
}

class _TimeConverterScreenState extends State<TimeConverterScreen> {
  final TextEditingController _timeController = TextEditingController();
  String _convertedTime = "";

  void _convertTime() {
    try {
      DateFormat format = DateFormat("HH:mm");
      DateTime belgiumTime = format.parse(_timeController.text);

      // Add 4 hours (Belgium to Pakistan conversion)
      DateTime pakistanTime = belgiumTime.add(Duration(hours: 4));

      setState(() {
        _convertedTime = format.format(pakistanTime) + " PKT";
      });
    } catch (e) {
      setState(() {
        _convertedTime = "Invalid Time Format!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: Text("Belgium to Pakistan Time Converter"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Input Card
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: _timeController,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: "Enter Belgium Time (HH:mm)",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Convert Button
            ElevatedButton(
              onPressed: _convertTime,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Convert",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),

            SizedBox(height: 20),

            // Converted Time Card
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Colors.deepPurple,
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Pakistan Time: $_convertedTime",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
