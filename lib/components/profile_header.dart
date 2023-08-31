import 'package:flutter/material.dart';
import '../constants/colors_main.dart';

final colors = ColorsMain();

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/On.png', height: 100,),
        Text('mike lewis', style: Theme.of(context).textTheme.headlineLarge,),
      ],
    );
  }
}