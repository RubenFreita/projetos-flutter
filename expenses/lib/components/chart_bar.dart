import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    required this.weekDay,
    required this.value,
    required this.percent,
    Key? key,
  }) : super(key: key);

  final String weekDay;
  final double value;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          Container(
            height: 0.15 * constraints.maxHeight,
            child: FittedBox(
              child: Text(
                "R\$ " + value.toStringAsFixed(2),
              ),
            ),
          ),
          Container(
            height: constraints.maxHeight * 0.70,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: 10,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: percent.isNaN
                      ? 0
                      : (constraints.maxHeight * 0.70) * percent,
                  width: 10,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary),
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 0.15 * constraints.maxHeight,
            child: FittedBox(
              child: Text(weekDay),
            ),
          ),
        ],
      );
    });
  }
}
