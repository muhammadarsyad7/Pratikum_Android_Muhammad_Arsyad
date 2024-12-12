import 'package:aplikasi/login.dart';
import 'package:aplikasi/pages/calender.dart';
import 'package:aplikasi/pages/home.dart';
import 'package:aplikasi/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Home(),
    Profile(),
    Calender(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.red, Colors.yellow])),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                title: 'Apakah Anda Ingin keluar dari Aplikasi',
                content: Container(),
                textConfirm: 'Ya',
                textCancel: 'Tidak',
                onConfirm: () {
                  Get.offAll(login());
                },
                onCancel: () {
                  Get.back();
                },
              );
              //Get.offAll(login());
            },
            icon: Icon(Icons.logout),
            color: Colors.white,
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Kalender',
            )
          ]),
    );
  }
}
