import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:submission_flutter_dasar/presentation/screen/profile.dart';
import 'package:submission_flutter_dasar/presentation/widget/curved_nav/curved_navigation_bar.dart';
import 'package:submission_flutter_dasar/presentation/widget/glassmorphism/glass_box_theme.dart';
import 'package:submission_flutter_dasar/res/app_colors.dart';
import 'package:submission_flutter_dasar/res/app_string.dart';
import 'package:submission_flutter_dasar/res/app_text_style.dart';

import 'chat_list.dart';


class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _indexPage = 0;

  List<Widget> components = [
    const ChatListScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    await Future.delayed(const Duration(seconds: 1));
    await Future.delayed(const Duration(seconds: 1));
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Padding(
          padding: const EdgeInsets.only(top: 16,left: 16),
          child: Text(
              AppStrings.appTitle,
              style: AppTextStyle.bold.copyWith(
                fontSize: 24
              ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30)
          )
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Container(
            padding: const EdgeInsets.only(left: 30,bottom: 30),
          ),
        )
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: CurvedNavigationBar(
        items: const [Icons.message, Icons.people],
        onTap: (index) {
          setState(() {
            _indexPage = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/blob-scene-haikei.png"),
                fit: BoxFit.cover
            )
        ),
        child: GlassBoxTheme(child: components[_indexPage]),
      ));
  }
}
