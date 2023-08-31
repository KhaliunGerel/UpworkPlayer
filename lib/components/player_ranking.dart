import 'package:flutter/material.dart';
import 'package:upwork/constants/values.dart';
import '../constants/colors_main.dart';

final colors = ColorsMain();

class PlayerRanking extends StatelessWidget {
  const PlayerRanking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.PRIMARY,
        borderRadius: BorderRadius.circular(formFieldBorderRadius)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('PLAYER RANKING', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: colors.SECONDARY),),
              Text('Info', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: colors.SECONDARY),)
            ],
          ),
          const SizedBox(height: 12,),
          Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 4,),
                        Text('5.5', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: colors.SECONDARY),),
                        Container(
                          width: 2,
                          height: 7,
                          color: colors.SECONDARY,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                          decoration: BoxDecoration(
                            color: colors.SECONDARY,
                            borderRadius: BorderRadius.circular(formFieldBorderRadius)
                          ),
                          child: Center(
                            child: Text('6.25', style: Theme.of(context).textTheme.displayLarge,),
                          )
                        ),
                      ]
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 4,),
                        Text('7.5', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: colors.SECONDARY),),
                        Container(
                          width: 2,
                          height: 7,
                          color: Colors.white.withOpacity(0.5),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    tween: Tween<double>(
                      begin: 0,
                      end: 0.5,
                    ),
                    builder: (context, value, _) => LinearProgressIndicator(
                      minHeight: 10,
                      value: value,
                      color: colors.SECONDARY,
                      backgroundColor: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  Container(
                    width: 2,
                    height: 10,
                    color: colors.PRIMARY,
                    margin: const EdgeInsets.only(top: 30),
                  ),
                  const Expanded(child: SizedBox()),
                  Container(
                    width: 2,
                    height: 10,
                    color: colors.PRIMARY,
                    margin: const EdgeInsets.only(top: 30),
                  ),
                  const Expanded(child: SizedBox())
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}