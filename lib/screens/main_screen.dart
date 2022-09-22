import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/screens/account/account_screen.dart';
import 'package:project_iot/screens/devices/devices_screen.dart';
import 'package:project_iot/screens/home/home_screen.dart';
import 'package:project_iot/screens/auth/login/login_screen.dart';
import 'package:project_iot/screens/auth/register/rigister_screen.dart';
import 'package:project_iot/screens/report/report_screen.dart';
import 'package:project_iot/screens/todos/todos_screen.dart';
import 'package:project_iot/theme/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final pages = const [
    HomeScreen(),
    DevicesScreen(),
    ReportScreen(),
    ProfileWidget(),
    // temporary
    TodoScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: _selectedIndex,
          selectedItemColor: ColorConst.yellow,
          unselectedItemColor: ColorConst.grey,
          // selectedLabelStyle: const TextStyle(color: Color(0xFFFFB703)),
          // unselectedLabelStyle: const TextStyle(color: Color(0xFF848484)),
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.phone_android_outlined),
              label: 'Devices',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_crash_outlined),
              label: 'Report',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Me',
            ),
            // temporary
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_open_sharp),
              label: 'Todo',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return const AccountScreen();
        } else if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        } else {
          return AuthWidget();
        }
      },
    ));
  }
}

class AuthWidget extends StatefulWidget {
  const AuthWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    void toggle() => setState(() => isLogin = !isLogin);
    return isLogin
        ? LogInScreen(onClickRegister: toggle)
        : RegisterScreen(onClickLogin: toggle);
  }
}
