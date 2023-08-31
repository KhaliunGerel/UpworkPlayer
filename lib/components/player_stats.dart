import 'package:flutter/material.dart';
import '../constants/colors_main.dart';

final colors = ColorsMain();

class PlayerStats extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  const PlayerStats({Key? key,
    required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('PLAYER STATS', style: Theme.of(context).textTheme.displayLarge,),
        const SizedBox(height: 16,),
        ...data.map((e) => (
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              children: [
                Expanded(
                  child: Text(e['name'].toUpperCase(), style: Theme.of(context).textTheme.displayMedium,),
                ),
                Text(e['value'], style: Theme.of(context).textTheme.bodyLarge,),
              ],
            ),
          )
        )),
      ],
    );
  }
}