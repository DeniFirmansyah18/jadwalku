import 'package:flutter/material.dart';
import 'schedule_page.dart';
import 'bottom_navbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    SchedulePage(),
    NotificationsPage(),
    SearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 1
          ? PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: SizedBox.shrink(),
      )
          : AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Burger menu clicked!")),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Profile clicked!")),
              );
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavbar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

// Konten untuk Tab Home
class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int _currentPage = 0;
  String _selectedChip = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "Halo, Bryan!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "Semoga harimu menyenangkan!",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildSelectableChip(
                  context: context,
                  label: "Tugasku",
                  isSelected: _selectedChip == "Tugasku",
                  onTap: () {
                    setState(() {
                      _selectedChip = "Tugasku";
                    });
                  },
                ),
                _buildSelectableChip(
                  context: context,
                  label: "Projek",
                  isSelected: _selectedChip == "Projek",
                  onTap: () {
                    setState(() {
                      _selectedChip = "Projek";
                    });
                  },
                ),
                _buildSelectableChip(
                  context: context,
                  label: "Catatan",
                  isSelected: _selectedChip == "Catatan",
                  onTap: () {
                    setState(() {
                      _selectedChip = "Catatan";
                    });
                  },
                ),
              ],
            ),
          ],
        ),
          SizedBox(height: 20),
          Column(
            children: [
              SizedBox(
                height: 350,
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.6),
                  itemCount: 3,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final cardData = [
                      {
                        "title": "Mobile Programming",
                        "subtitle": "UTS",
                        "clock": "10.00",
                        "date": "17 Oktober 2024",
                        "color": Colors.purple,
                        "icon": Icons.code,
                      },
                      {
                        "title": "Pulau Dewata",
                        "subtitle": "Jalan-jalan",
                        "clock": "06.00",
                        "date": "24 Oktober 2024",
                        "color": Colors.blue,
                        "icon": Icons.beach_access,
                      },
                      {
                        "title": "Kerja Kelompok",
                        "subtitle": "Progress",
                        "clock": "08.00",
                        "date": "7 hari yang lalu",
                        "color": Colors.orange,
                        "icon": Icons.group,
                      },
                    ];

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: _buildCard(
                        title: cardData[index]["title"] as String,
                        subtitle: cardData[index]["subtitle"] as String,
                        clock: cardData[index]["clock"] as String,
                        date: cardData[index]["date"] as String,
                        color: cardData[index]["color"] as Color,
                        icon: cardData[index]["icon"] as IconData,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    height: 8.0,
                    width: _currentPage == index ? 20.0 : 8.0,
                    decoration: BoxDecoration(
                      color: _currentPage == index ? Colors.black : Colors.grey,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  );
                }),
              ),
            ],
          ),

          SizedBox(height: 20),
          Text(
            "Progress",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: Icon(Icons.task_rounded, color: Colors.green),
              title: Text("UTS Studi Islam"),
              subtitle: Text("2 hari yang lalu"),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Selected: $value")),
                  );
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(value: "Edit", child: Text("Edit")),
                  PopupMenuItem(value: "Delete", child: Text("Delete")),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.close, color: Colors.red),
              title: Text("Checkout 11.11"),
              subtitle: Text("6 hari yang lalu"),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Selected: $value")),
                  );
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(value: "Edit", child: Text("Edit")),
                  PopupMenuItem(value: "Delete", child: Text("Delete")),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.close, color: Colors.red),
              title: Text("Kerja Kelompok"),
              subtitle: Text("3 hari yang lalu"),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Selected: $value")),
                  );
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(value: "Edit", child: Text("Edit")),
                  PopupMenuItem(value: "Delete", child: Text("Delete")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildCard({
  required String title,
  required String subtitle,
  required String clock,
  required String date,
  required Color color,
  required IconData icon,
}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    elevation: 4, // Tambahkan shadow untuk efek 3D
    color: color,
    margin: EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      width: 50, // Lebar tetap
      height: 100, // Tinggi lebih panjang
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: Colors.white),
          SizedBox(height: 30),
          Text(
            subtitle,
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
          SizedBox(height: 50),
          Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            clock,
            style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            date,
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ],
      ),
    ),
  );
}

Widget _buildSelectableChip({
  required BuildContext context,
  required String label,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isSelected)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.arrow_drop_down_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
        ],
      ),
    ),
  );
}


// Konten untuk Tab Notifikasi
class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Halaman Notifikasi", style: TextStyle(fontSize: 18)),
    );
  }
}

// Konten untuk Tab Pencarian
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Halaman Pencarian", style: TextStyle(fontSize: 18)),
    );
  }
}
