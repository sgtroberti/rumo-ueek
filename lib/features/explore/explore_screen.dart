import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  Widget _buildTravelCard({
    required String imageUrl,
    required String author,
    required String title,
  }) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage("https://i.pravatar.cc/50"),
            ),
            const SizedBox(height: 4),
            Text(
              author,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTravelerTile({
    required String name,
    required String country,
    required String avatarUrl,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(avatarUrl),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(country),
      trailing: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text("Seguir"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          children: [
            // Título
            Text(
              "Explorar",
              // style: Theme.of(context).textTheme.headline5?.copyWith(
              //       fontWeight: FontWeight.bold,
              //     ),
            ),
            const SizedBox(height: 12),

            // Campo de pesquisa
            TextField(
              decoration: InputDecoration(
                hintText: "Pesquisar...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Lista horizontal com cards de viagens
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildTravelCard(
                    imageUrl: "https://picsum.photos/400/300?1",
                    author: "Sofia Mendes",
                    title: "A melhor trilha do Brasil",
                  ),
                  const SizedBox(width: 12),
                  _buildTravelCard(
                    imageUrl: "https://picsum.photos/400/300?2",
                    author: "Isadora Lima",
                    title: "10 dias na China",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Título da seção de viajantes
            Text(
              "Viajantes",
              // style: Theme.of(context).textTheme.headline6?.copyWith(
              //       fontWeight: FontWeight.bold,
              //     ),
            ),
            const SizedBox(height: 12),

            // Lista de viajantes
            _buildTravelerTile(
              name: "Ana Clara",
              country: "Brasil",
              avatarUrl: "https://i.pravatar.cc/150?img=1",
            ),
            _buildTravelerTile(
              name: "Luca Martinez",
              country: "Argentina",
              avatarUrl: "https://i.pravatar.cc/150?img=2",
            ),
            _buildTravelerTile(
              name: "Jin Lee",
              country: "Corea do Sul",
              avatarUrl: "https://i.pravatar.cc/150?img=3",
            ),
            _buildTravelerTile(
              name: "Jin Lee",
              country: "Corea do Sul",
              avatarUrl: "https://i.pravatar.cc/150?img=3",
            ),
            _buildTravelerTile(
              name: "Jin Lee",
              country: "Corea do Sul",
              avatarUrl: "https://i.pravatar.cc/150?img=3",
            ),
            _buildTravelerTile(
              name: "Jin Lee",
              country: "Corea do Sul",
              avatarUrl: "https://i.pravatar.cc/150?img=3",
            ),
            _buildTravelerTile(
              name: "Jin Lee",
              country: "Corea do Sul",
              avatarUrl: "https://i.pravatar.cc/150?img=3",
            ),
            _buildTravelerTile(
              name: "Jin Lee",
              country: "Corea do Sul",
              avatarUrl: "https://i.pravatar.cc/150?img=3",
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 2, // Explore está selecionado
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Mapa"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Diários"),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explorar"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}
