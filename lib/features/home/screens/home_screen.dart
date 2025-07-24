import 'package:flutter/material.dart';
import 'package:rumo/features/auth/repositories/auth_repository.dart';
import 'package:rumo/features/onboarding/routes/onboarding_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       currentIndex = index;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.map_outlined, size: 20),
      //       label: "Mapa",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.archive, size: 20),
      //       label: "Diários",
      //     ),
      //   ],
      // ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavItem(
              icon: Icons.map_outlined,
              label: "Mapa",
              isSelected: currentIndex == 0,
            ),
            BottomNavItem(
              icon: Icons.archive,
              label: "Diários",
              isSelected: currentIndex == 1,
            ),
            IconButton.filled(
              style: IconButton.styleFrom(
                backgroundColor: Color(0xffDDE1FF),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(12),
              ),
              onPressed: () {},
              icon: Icon(Icons.add, color: Color(0xff4E61F6), size: 20),
            ),
            BottomNavItem(
              icon: Icons.archive,
              label: "Explorar",
              isSelected: currentIndex == 1,
            ),
            BottomNavItem(
              icon: Icons.archive,
              label: "Perfil",
              isSelected: currentIndex == 1,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) {
          return switch (currentIndex) {
            1 => const Center(child: Text("Diários")),
            _ => const Center(child: Text("Mapa")),
          };
        },
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 20, color: isSelected ? Colors.blue : Colors.grey),
        Text(
          label,
          style: TextStyle(color: isSelected ? Colors.blue : Colors.grey),
        ),
      ],
    );
  }
}
