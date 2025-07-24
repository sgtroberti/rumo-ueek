import 'package:flutter/material.dart';
import 'package:rumo/features/home/models/nav_item_data.dart';
import 'package:rumo/features/home/widgets/bottom_nav_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  // Definindo os ícones
  final List<NavItemData> items = [
    NavItemData(Icons.map_outlined, "Mapa"),
    NavItemData(Icons.article_outlined, "Diários"),
    NavItemData(Icons.explore_outlined, "Explorar"),
    NavItemData(Icons.person_outline, "Perfil"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background da tela
      backgroundColor: Colors.white,
      // Barra de navegação customizada
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 72,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Color(0xFFEFEFEF))),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavItem(
                icon: items[0].icon,
                label: items[0].label,
                isSelected: currentIndex == 0,
                onTap: () => setState(() => currentIndex = 0),
              ),

              BottomNavItem(
                icon: items[1].icon,
                label: items[1].label,
                isSelected: currentIndex == 1,
                onTap: () => setState(() => currentIndex = 1),
              ),
              // Botão central (+)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: InkResponse(
                  onTap: () {
                    // Aqui você pode abrir um modal, página, etc.
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text("Novo item!")));
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Color(0xffDDE1FF),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: Color(0xff4E61F6),
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ),
              // Item 2: Explorar
              BottomNavItem(
                icon: items[2].icon,
                label: items[2].label,
                isSelected: currentIndex == 2,
                onTap: () => setState(() => currentIndex = 2),
              ),
              // Item 3: Perfil
              BottomNavItem(
                icon: items[3].icon,
                label: items[3].label,
                isSelected: currentIndex == 3,
                onTap: () => setState(() => currentIndex = 3),
              ),
            ],
          ),
        ),
      ),
      // Body de exemplo
      body: Center(
        child: Text(
          items[currentIndex].label,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
