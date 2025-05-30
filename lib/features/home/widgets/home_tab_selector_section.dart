import 'package:flutter/material.dart';

class TabSelector extends StatefulWidget {
  const TabSelector({super.key});

  @override
  State<TabSelector> createState() => _TabSelectorState();
}

class _TabSelectorState extends State<TabSelector> {
  int _selectedIndex = 0;

  final List<String> _tabs = ['Daily', 'Weekly', 'Monthly'];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFDFF7E2),
          borderRadius: BorderRadius.circular(32),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(_tabs.length, (index) {
            final isSelected = index == _selectedIndex;

            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? Color(0xFF00D09E) : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      _tabs[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Colors.black : Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
