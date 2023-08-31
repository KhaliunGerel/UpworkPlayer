import 'package:flutter/material.dart';
import 'package:upwork/constants/values.dart';
import '../constants/colors_main.dart';

final colors = ColorsMain();

class MatchCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const MatchCard({Key? key,
    required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6, bottom: 6),
      padding: const EdgeInsets.fromLTRB(contentPadding, contentPadding, contentPadding, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(formFieldBorderRadius),
        color: colors.SURFACE_1,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 4)
          ),
        ]
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(data['date'], style: Theme.of(context).textTheme.displayMedium,),
                Text(data['result'], style: Theme.of(context).textTheme.bodyMedium,),
              ],
            ),
          ),
          ...data['players'].map((p) {
            bool winner = p['winner'];
            return Container(
              padding: const EdgeInsets.only(bottom: 12, top: 12),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: colors.PRIMARY.withOpacity(0.2))
                )
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(p['name'], style: Theme
                          .of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: colors.PRIMARY.withOpacity(winner ? 1 : 0.7)),),
                        const SizedBox(height: 6,),
                        Text(p['desc'], style: Theme
                          .of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: colors.PRIMARY.withOpacity(winner ? 1 : 0.7)),),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: p['score'].map<Widget>((s) {
                        return Text(s.toString(), style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: colors.PRIMARY.withOpacity(winner ? 1 : 0.7),
                          fontSize: 34),
                        );
                      }).toList()
                    ),
                  ),
                  Expanded(
                    child: winner ? Container(
                      margin: const EdgeInsets.only(left: 12),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(formFieldBorderRadius),
                        color: colors.PRIMARY
                      ),
                      child: Center(
                        child: Text('WINNERS', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: colors.SECONDARY),),
                      )
                    ) : const SizedBox(),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}