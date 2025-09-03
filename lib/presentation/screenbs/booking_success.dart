import 'package:flutter/material.dart';

class BookingSuccess extends StatelessWidget {
  const BookingSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 100),
            SizedBox(height: 20),
            Text(
              'Booking Successful',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'For Avengers',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Image.network(
                    'https://example.com/doctor_strange_image.jpg', 
                    height: 150,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Doctor Strange - ge\nin the Multiverse of Madness',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text('Date: April 23', style: TextStyle(color: Colors.white)),
                  Text('Time: 9:10 p.m.', style: TextStyle(color: Colors.white)),
                  Text('Row: 2', style: TextStyle(color: Colors.white)),
                  Text('Seats: 1-10', style: TextStyle(color: Colors.white)),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    child: Image.network(
                      'https://example.com/barcode_image.jpg', // Replace with actual barcode URL
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}