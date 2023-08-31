import 'package:flutter/material.dart';
import 'package:upwork/constants/colors_main.dart';
import 'package:upwork/constants/values.dart';
import 'package:upwork/screens/book_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _pageController = PageController(initialPage: 1);
  final colors = ColorsMain();
  var _currentScreen = 1;

  _onScreenTapped(int index) {
    _pageController.jumpToPage(index);
    setState(() { _currentScreen = index; });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 28,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.SURFACE_1
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () { },
                icon: const Icon(Icons.arrow_back, size: 20,),
              ),
            )
          )
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          SizedBox(),
          BookScreen(),
          SizedBox(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 12,
            ),
          ]
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: Theme(
            data: ThemeData(
              fontFamily: 'Glacial Indifference',
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedLabelStyle: TextStyle(fontSize: 0),
                showUnselectedLabels: false,
                showSelectedLabels: false,
                type: BottomNavigationBarType.fixed,
              ),
            ),
            child: BottomNavigationBar(
              onTap: _onScreenTapped,
              currentIndex: _currentScreen,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: tabItem(
                    false,
                    'OPEN MATCHES',
                    const EdgeInsets.only(left: 25, top: 12),
                    label: '3'
                  ),
                  activeIcon: tabItem(
                    true,
                    'OPEN MATCHES',
                    const EdgeInsets.only(left: 25, top: 12),
                    label: '3'
                  ),
                  label: ''
                ),
                BottomNavigationBarItem(
                  icon: tabItem(
                    false,
                    'BOOK COURT',
                    const EdgeInsets.only(left: 14, right: 14, top: 12),
                  ),
                  activeIcon: tabItem(
                    true,
                    'BOOK COURT',
                    const EdgeInsets.only(left: 14, right: 14, top: 12),
                  ),
                  label: ''
                ),
                BottomNavigationBarItem(
                  icon: tabItem(
                    false,
                    'PROFILE',
                    const EdgeInsets.only(right: 25, top: 12),
                    image: 'assets/images/On.png'
                  ),
                  activeIcon: tabItem(
                    true,
                    'PROFILE',
                    const EdgeInsets.only(right: 25, top: 12),
                    image: 'assets/images/On.png'
                  ),
                  label: ''
                ),
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget tabItem(bool active, String title, EdgeInsets margin, {String? image, String? label}) {
    return Container(
      margin: margin,
      width: double.maxFinite,
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(formFieldBorderRadius),
        color: active ? colors.PRIMARY.withOpacity(0.9) : colors.SURFACE_2.withOpacity(0.5),
        border: active ? Border.all(width: 2, color: colors.PRIMARY.withOpacity(0.9)) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            blurRadius: 6,
            offset: const Offset(-4, 4)
          ),
        ]
      ),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (image != null) Image.asset(image, height: 22,),
                  Text(title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: active ?
                      Theme.of(context).textTheme.titleLarge!.copyWith(color: colors.SECONDARY.withOpacity(0.7)) :
                      Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700, color: colors.PRIMARY.withOpacity(label != null ? 0.7 : 1)
                    ),
                  )
                ],
              ),
            )
          ),
          if (label != null) Positioned(
            right: 6,
            top: 4,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: active ? colors.SECONDARY.withOpacity(0.7) : colors.PRIMARY.withOpacity(0.8)
              ),
              child: Center(
                child: Text(label,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: active ? colors.PRIMARY : colors.SECONDARY, fontSize: 11, height: 1
                  ),
                ),
              )
            ),
          )
        ],
      )
    );
  }
}