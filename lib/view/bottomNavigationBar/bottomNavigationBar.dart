import 'package:driver_app/view/account/accountScreen.dart';
import 'package:driver_app/view/basket/basketScreen.dart';
import 'package:driver_app/view/browse/browseScreen.dart';
import 'package:driver_app/view/grocery/groceryScreen.dart';
import 'package:driver_app/view/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../utils/colors.dart';

class BottomNavigationBarUberEats extends StatefulWidget {
  const BottomNavigationBarUberEats({super.key});

  @override
  State<BottomNavigationBarUberEats> createState() =>
      _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBarUberEats> {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const BrowseScreen(),
      const GroceryScreen(),
      const BasketScreen(),
      const AccountScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.house),
        title: ("Home"),
        activeColorPrimary: black,
        inactiveColorPrimary: grey,
      ),

      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
        title: ("Browse"),
        activeColorPrimary: black,
        inactiveColorPrimary: grey,
      ),

      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.basketShopping),
        title: ("Grocery"),
        activeColorPrimary: black,
        inactiveColorPrimary: grey,
      ),

      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.cartShopping),
        title: ("Basket"),
        activeColorPrimary: black,
        inactiveColorPrimary: grey,
      ),

      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.person),
        title: ("Account"),
        activeColorPrimary: black,
        inactiveColorPrimary: grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,
      //popBehaviorOnSelectedNavBarItemPress: PopActionScreensType.all,
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: white,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property
    );
  }
}
