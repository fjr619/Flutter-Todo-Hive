import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_hive/presentation/utils/colors.dart';
import 'package:gap/gap.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key});

  final List<IconData> icons = [
    CupertinoIcons.home,
    CupertinoIcons.person_fill,
    CupertinoIcons.settings,
    CupertinoIcons.info_circle_fill
  ];

  final List<String> titles = ["Home", "Profile", "Settings", "Info"];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 90),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: AppColors.primaryGradientColor,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                "https://avatars.githubusercontent.com/u/91388754?v=4"),
          ),
          const Gap(8),
          Text(
            "Franky Wijanarko",
            style: textTheme.displayMedium
                ?.copyWith(fontSize: 21, color: Colors.grey[100]),
          ),
          Text(
            "Native Android - Flutter Dev",
            style: textTheme.displaySmall
                ?.copyWith(fontSize: 14, color: Colors.grey[100]),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                IconData icon = icons[index];
                String title = titles[index];
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(
                        icon,
                        color: Colors.grey[100],
                      ),
                      title: Text(
                        title,
                        style: textTheme.displaySmall
                            ?.copyWith(fontSize: 12, color: Colors.grey[100]),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
