import 'package:flutter/material.dart';
import 'package:upwork/components/match_card.dart';
import 'package:upwork/components/player_ranking.dart';
import 'package:upwork/components/profile_header.dart';
import 'package:upwork/constants/data.dart';
import 'package:upwork/constants/values.dart';

import '../components/player_stats.dart';
import '../constants/colors_main.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);
  @override
  createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final colors = ColorsMain();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ProfileHeader(),
            const SizedBox(height: 6,),
            const PlayerRanking(),
            const SizedBox(height: 12,),
            const PlayerStats(data: playerStats,),
            const SizedBox(height: 32,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('PAST MATCHES', style: Theme.of(context).textTheme.displayLarge),
                Text('winning strike 60%'.toUpperCase(), style: Theme.of(context).textTheme.titleSmall)
              ],
            ),
            ...pastMatches.map((e) => (
              MatchCard(data: e)
            ))
          ],
        ),
      ),
    );
  }
}