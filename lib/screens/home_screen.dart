import 'package:flutter/material.dart';
import '../models/user.dart';
import '../profile/akun_saya_page.dart';
import 'qris_payment_screen.dart';
import '../models/ticket.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _navbarIndex = 0;
  int _carouselIndex = 0;
  Map<String, dynamic>? selectedMovie;
  List<Ticket> ticketHistory = [];

  final List<Map<String, dynamic>> movies = [
    {
      'title': 'Reformatika 23',
      'image': 'assets/images/Reformatika.jpg',
      'rating': 10.0,
      'views': '10.9K',
      'synopsis': 'Adaptasi dan Inovasi di Era Reformasi',
    },
    {
      'title': 'Kung Fu Panda 4',
      'image': 'assets/images/kungfu_panda4.jpg',
      'rating': 7.8,
      'views': '5.2K',
      'synopsis':
          'Po faces a new enemy in the Valley of Peace while training a new warrior.',
    },
    {
      'title': 'How To Train Your Dragon',
      'image': 'assets/images/How_To_Train.jpg',
      'rating': 8.5,
      'views': '7.1K',
      'synopsis':
          'Paul Atreides continues his journey against the forces that threaten his world.',
    },
    {
      'title': 'Inside Out 2',
      'image': 'assets/images/inside_out2.jpg',
      'rating': 8.7,
      'views': '8.3K',
      'synopsis':
          'Join Joy, Sadness, Anger and others as they face new emotions in Riley\'s teenage life.',
    },
  ];

  Widget _buildHomeContent() {
    final movie = movies[_carouselIndex];

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white24,
                hintText: 'Search Here',
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 260,
            child: PageView.builder(
              itemCount: movies.length,
              onPageChanged: (index) {
                setState(() {
                  _carouselIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      image: AssetImage(movies[index]['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  movie['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.visibility,
                      color: Colors.white54,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      movie['views'],
                      style: const TextStyle(color: Colors.white54),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.star, color: Colors.yellow, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '${movie['rating']}/10 IMDb',
                      style: const TextStyle(color: Colors.white54),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  movie['synopsis'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _navbarIndex = 1;
                      selectedMovie = movie;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Buy Tiket',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBuyTicketContent() {
    if (selectedMovie != null) {
      return _buildSeatSelectionContent();
    } else {
      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Card(
            color: Colors.white10,
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: Image.asset(movie['image'], width: 50),
              title: Text(
                movie['title'],
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                movie['synopsis'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white60),
              ),
              onTap: () {
                setState(() {
                  selectedMovie = movie;
                });
              },
            ),
          );
        },
      );
    }
  }

  Widget _buildSeatSelectionContent() {
    List<bool> selectedSeats = List.generate(30, (index) => false);
    int seatPrice = 40000;

    return StatefulBuilder(
      builder: (context, setStateSeat) {
        int total = selectedSeats.where((e) => e).length * seatPrice;

        return Column(
          children: [
            Image.asset(selectedMovie!['image'], height: 150),
            Text(
              selectedMovie!['title'],
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text('Pilih Kursi:', style: TextStyle(color: Colors.white)),
            Expanded(
              child: GridView.builder(
                itemCount: selectedSeats.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setStateSeat(() {
                        selectedSeats[index] = !selectedSeats[index];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            selectedSeats[index]
                                ? Colors.yellow
                                : Colors.white24,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Text(
              'Total: Rp $total',
              style: const TextStyle(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedMovie = null;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Kembali'),
                ),
                ElevatedButton(
                  onPressed:
                      total > 0
                          ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => QrisPaymentScreen(
                                      total: total,
                                      movie: selectedMovie!,
                                      selectedSeats:
                                          selectedSeats
                                              .asMap()
                                              .entries
                                              .where((entry) => entry.value)
                                              .map((entry) => entry.key)
                                              .toList(),
                                      onFinish: (historyItem) {
                                        setState(() {
                                          ticketHistory.add(
                                            Ticket(
                                              movie: historyItem['movie'],
                                              total: historyItem['total'],
                                              seatNumbers: historyItem['seats'],
                                            ),
                                          );
                                          _navbarIndex = 2;
                                          selectedMovie = null;
                                        });
                                      },
                                    ),
                              ),
                            );
                          }
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text('Pesan Sekarang'),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }

  Widget _buildHistoryContent() {
    return ticketHistory.isEmpty
        ? const Center(
          child: Text('Belum ada tiket', style: TextStyle(color: Colors.white)),
        )
        : ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: ticketHistory.length,
          itemBuilder: (context, index) {
            final ticket = ticketHistory[index];
            return Card(
              color: Colors.white10,
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                leading: Image.asset(ticket.movie['image'], width: 50),
                title: Text(
                  ticket.movie['title'],
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Kursi: ${ticket.seatNumbers.map((n) => n + 1).join(', ')}\nTotal: Rp ${ticket.total}',
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
            );
          },
        );
  }

  Widget _getBody() {
    if (_navbarIndex == 0) {
      return _buildHomeContent();
    } else if (_navbarIndex == 1) {
      return _buildBuyTicketContent();
    } else if (_navbarIndex == 2) {
      return _buildHistoryContent();
    } else {
      return AkunSayaPage(user: widget.user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Hai, ${widget.user.username}',
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white54,
        currentIndex: _navbarIndex,
        onTap: (index) {
          setState(() {
            _navbarIndex = index;
            selectedMovie = null;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Buy Tiket',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'm.tix Saya',
          ),
        ],
      ),
    );
  }
}
