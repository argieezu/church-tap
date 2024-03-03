import 'dart:ui';
import 'package:bethel_app_final/FRONT_END/MemberScreens/map_components/map_page.dart';
import 'package:bethel_app_final/FRONT_END/MemberScreens/screen_pages/home_screen_pages/mapstoragescreen.dart';
import 'package:bethel_app_final/FRONT_END/constant/color.dart';
import 'package:bethel_app_final/FRONT_END/MemberScreens/screen_pages/home_screen_pages/search_button_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MemberHomePage extends StatefulWidget {
  const MemberHomePage({Key? key}) : super(key: key);

  @override
  State<MemberHomePage> createState() => _MemberHomePageState();
}

void signUserOut() {
  FirebaseAuth.instance.signOut();
}

class _MemberHomePageState extends State<MemberHomePage> {
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        flexibleSpace: Stack(
          children: [
            Positioned(
              left: 20.0,
              right: 20.0,
              top: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      shape: const CircleBorder(
                        side: BorderSide(
                            color: appGrey,
                            width: 1.0),
                      ),
                    ),
                    icon: const Icon(Icons.sort),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MapStorageScreen(),
                        ),
                      );
                    },
                    child: Hero(
                      tag: 'planning',
                      child: SearchButton(
                        isSearching: _isSearching,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              left: 20.0,
              right: 20.0,
              top: 110.0, // Adjust this value according to your design
              child: Divider(
                color: appGreen, // Change color according to your design
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Stack(
          children: [
            if (_isSearching)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                child: const Center(
                  child: MapPage(),
                ), // Display MapPage with blurred background when searching
              ),
            if (!_isSearching)
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No Events Posted Yet',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'Check back later for updates!',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),

                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
