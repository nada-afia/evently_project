import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:evently_app/evently/tabs/Map/map_screen.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utilts/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../provider/app_them_provider.dart';
import '../../../../utilts/app_color.dart';
import '../../favourite/favourite_screen.dart';
import '../../profile/profile_screen.dart';
import '../home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final List<Widget> screens = [
    HomeScreen(),
    MapScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];
    @override
    Widget build(BuildContext context) {
      var themeProvider=Provider.of<AppThemProvider>(context);
      final iconList = <IconData>[
        Icons.home_outlined,
        Icons.map_sharp,
        Icons.favorite,
        Icons.person,
      ];
      return Scaffold(
        body:screens[currentIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape:StadiumBorder(
              side: BorderSide(
                  color: themeProvider.isDark()?AppColors.beige:AppColors.white,
                  width: 5
              )
          ),
          backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,

          child: const Icon(CupertinoIcons.add,color: AppColors.white,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex=index;
            setState(() {

            });
          },
          backgroundColor: Theme.of(context).primaryColor,
            type: BottomNavigationBarType.fixed,
            items: [
              buildBottomNavBarItem(unselectedIconName: AppImages.home, labelName: AppLocalizations.of(context)!.home, index: 0, selectedIconName:AppImages.selectedHome),
              buildBottomNavBarItem(unselectedIconName: AppImages.map, labelName: AppLocalizations.of(context)!.map, index: 1, selectedIconName: AppImages.selectedMap),
              buildBottomNavBarItem(unselectedIconName: AppImages.favourite, labelName: AppLocalizations.of(context)!.favourite, index: 2, selectedIconName: AppImages.selectedFavourite),
              buildBottomNavBarItem(unselectedIconName: AppImages.profile, labelName: AppLocalizations.of(context)!.profile, index: 3, selectedIconName: AppImages.selectedProfile)
            ])
      );
  }
  BottomNavigationBarItem buildBottomNavBarItem({required String selectedIconName,
    required String labelName,required int index,required String unselectedIconName}){
      return BottomNavigationBarItem(icon: Image.asset(currentIndex==index?selectedIconName:unselectedIconName),
          label:labelName );
  }
}
