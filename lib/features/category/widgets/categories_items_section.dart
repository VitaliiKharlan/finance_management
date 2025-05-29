import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesItemsSection extends StatefulWidget {
  const CategoriesItemsSection({super.key, required this.categories});

  final List<Map<String, String>> categories;

  @override
  State<CategoriesItemsSection> createState() => _CategoriesItemsSectionState();
}

class _CategoriesItemsSectionState extends State<CategoriesItemsSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF1FFF3),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: GridView.builder(
          itemCount: widget.categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 30,
            crossAxisSpacing: 20,
            childAspectRatio: 0.75,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = widget.categories[index];
            final iconPath = item['icon']!;
            final label = item['label']!;
            final isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 105,
                    height: 98,
                    decoration: BoxDecoration(
                      color: isSelected ? Color(0xFF0068FF) : Color(0xFF6DB6FE),
                      borderRadius: BorderRadius.circular(25.75),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: SvgPicture.asset(iconPath, fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    label,
                    style: TextStyle(
                      color: const Color(0xFF093030),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
