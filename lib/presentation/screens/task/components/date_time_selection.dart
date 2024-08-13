
import 'package:flutter/material.dart';


class DateTimeSelection extends StatelessWidget {
  const DateTimeSelection(
      {super.key, required this.title, required this.data, required this.onTap, required this.margin});

  final String title;
  final String data;
  final VoidCallback onTap;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: margin,
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              title,
              style: textTheme.headlineSmall?.copyWith(fontSize: 12),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            // width: 80,
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade100),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: onTap,
                  child: Center(
                    child: Text(
                      data,
                      style: textTheme.headlineSmall?.copyWith(fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
