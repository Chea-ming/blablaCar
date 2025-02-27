import 'package:flutter/material.dart';

class SeatCounterScreen extends StatefulWidget {
  const SeatCounterScreen({Key? key}) : super(key: key);

  @override
  _SeatCounterScreenState createState() => _SeatCounterScreenState();
}

class _SeatCounterScreenState extends State<SeatCounterScreen> {
  int _seatCount = 1;
  final int _minSeats = 1;
  final int _maxSeats = 8;

  void _incrementSeatCount() {
    if (_seatCount < _maxSeats) {
      setState(() {
        _seatCount++;
      });
    }
  }

  void _decrementSeatCount() {
    if (_seatCount > _minSeats) {
      setState(() {
        _seatCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.blue, size: 30),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(''),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Number of seats to book',
                  style: TextStyle(
                    color: Color(0xFF0A535F),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Minus button
                  GestureDetector(
                    onTap: _decrementSeatCount,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _seatCount == _minSeats
                            ? Colors.grey.shade700
                            : Color(0xFF01B2D9),
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: _seatCount == _minSeats
                            ? Colors.grey.shade700
                            : Color(0xFF01B2D9),
                        size: 30,
                      ),
                    ),
                  ),

                  // Seat count display
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Text(
                      _seatCount.toString(),
                      style: const TextStyle(
                        color: Color(0xFF0A535F),
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Plus button
                  GestureDetector(
                    onTap: _incrementSeatCount,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _seatCount == _maxSeats
                              ? Colors.grey.shade700
                              : Color(0xFF01B2D9),
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        color: _seatCount == _maxSeats
                            ? Colors.grey.shade700
                            : Color(0xFF01B2D9),
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Confirm button at bottom
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _seatCount = _seatCount;
                });
                Navigator.of(context).pop(_seatCount);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF01B2D9),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Confirm',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          // Bottom indicator/home bar
          Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            width: 150,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),
        ],
      ),
    );
  }
}
