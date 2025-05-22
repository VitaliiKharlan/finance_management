import 'package:flutter/material.dart';

class SavingsSection extends StatelessWidget {
  const SavingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF00D09E),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Column(
            children: [
              Icon(Icons.directions_car, size: 40),
              SizedBox(height: 10),
              Text('Savings\nOn Goals', textAlign: TextAlign.center),
            ],
          ),
          Column(
            children: [
              Text("Revenue Last Week", style: TextStyle(color: Colors.grey)),
              Text('\$4,000.00', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('Food Last Week', style: TextStyle(color: Colors.grey)),
              Text('-\$100.00', style: TextStyle(color: Colors.blue)),
            ],
          ),
        ],
      ),
    );
  }
}
