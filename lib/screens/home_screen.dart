import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  late final List<Widget> _page;

  bool _isFirstBuild = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isFirstBuild) {
      _page = [
        Center(
          child: Text(
            'Cửa hàng',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Center(
          child: Text('Đặt hàng', style: Theme.of(context).textTheme.bodyLarge),
        ),
        Center(
          child: Text(
            'Hoạt động',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Center(
          child: Text('Của hàng', style: Theme.of(context).textTheme.bodyLarge),
        ),
        Center(
          child: Text('Khác', style: Theme.of(context).textTheme.bodyLarge),
        ),
      ];
      _isFirstBuild = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap:
            (index) => setState(() {
              _currentIndex = index;
            }),
        type: BottomNavigationBarType.fixed,
        selectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_cafe),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Đặt hàng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Hoạt động',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Cửa hàng',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Khác'),
        ],
      ),
      floatingActionButton:
          _currentIndex == 0
              ? FloatingActionButton(
                onPressed: () {
                  //Xử lý logic khi nhấn nút
                },
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(Icons.shopping_bag, color: Colors.white),
              )
              : null,
    );
  }
}
