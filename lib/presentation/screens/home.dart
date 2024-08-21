import 'package:crypto_app/core/ui.dart';
import 'package:crypto_app/presentation/screens/crypto_screens.dart';
import 'package:crypto_app/presentation/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
static const routeName ='home';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentIndex = 0;
   static const List<Widget> screens = [
     HomeScreen(),
     CryptocurrencyScreen(),
     Placeholder(),
     Placeholder(),
     Placeholder(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override 
  Widget build(BuildContext context) {
 
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar:BottomAppBar(color: AppColors.charcole,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavBarItem(CupertinoIcons.home, 'Home', 0),
            buildNavBarItem(Icons.currency_bitcoin_outlined, 'Coins', 1), 
            const SizedBox(width: 20), 
            buildNavBarItem(CupertinoIcons.conversation_bubble, 'Message', 3),
            buildNavBarItem(CupertinoIcons.profile_circled, 'Profile', 4),
          ],
        ),
      ),
      floatingActionButton:  ClipOval(
        child: Material(
          color:AppColors.accent, 
          elevation: 10, 
          child: InkWell(
            child: SizedBox(
              width: 56,
              height: 56,
              child: Icon(
                Icons.transform_outlined,
                size: 28,
                color: AppColors.text,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  
  Widget buildNavBarItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () => _onItemTapped(index),
        
          
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: currentIndex == index
                ?AppColors.accent
                :AppColors.textLight,
          ),
          Text(
            label,
            style: TextStyle(
              color: currentIndex == index
                  ? AppColors.accent:
                  AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }
}
  