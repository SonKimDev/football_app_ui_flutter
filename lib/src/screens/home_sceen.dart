import 'package:flutter/material.dart';
import 'package:football_app_ui_flutter/src/constants/colors.dart';
import 'package:football_app_ui_flutter/src/models/live_match_model.dart';
import 'package:football_app_ui_flutter/src/models/up_coming_model.dart';
import 'package:football_app_ui_flutter/src/screens/match_detail_screen.dart';
import 'package:football_app_ui_flutter/src/widgets/live_match_data.dart';
import 'package:football_app_ui_flutter/src/widgets/up_coming_match.dart';

class HomeSceen extends StatefulWidget {
  const HomeSceen({super.key});

  @override
  State<HomeSceen> createState() => _HomeSceenState();
}

class _HomeSceenState extends State<HomeSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: headerParts(),
      body: Column(
        children: [
          liveMatchText(),
          SizedBox(
            height: 230,
            child: ListView.builder(
              itemCount: liveMatches.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final live = liveMatches[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MatchDetailScreen(liveMatch: live),
                      ),
                    );
                  },
                  child: LiveMatchData(live: live),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const Text(
                  "Up-Coming Matches",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    letterSpacing: -1.5,
                    color: Colors.black54,
                  ),
                ),
                const Spacer(),
                TextButton(
                  style: TextButton.styleFrom(foregroundColor: kprimaryColor),
                  onPressed: () {},
                  child: const Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: upcomingMatches.length,
                itemBuilder: (context, index) {
                  final upMatch = upcomingMatches[index];
                  return UpComingMatch(upMatch: upMatch);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding liveMatchText() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          const Text(
            "Live Match",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: Colors.black54,
              letterSpacing: -1.5,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.08),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/pl.png',
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 3),
                const Text(
                  "Premier League",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -1,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.keyboard_arrow_down_outlined),
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar headerParts() {
    return AppBar(
      backgroundColor: Colors.white,
      actions: [
        const SizedBox(width: 20),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(Icons.category),
            ),
          ),
        ),
        const Spacer(),
        const Row(
          children: [
            Text(
              'S',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                letterSpacing: -2,
              ),
            ),
            Icon(
              Icons.sports_soccer,
              color: kprimaryColor,
              size: 25,
            ),
            Text(
              'ccer',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                letterSpacing: -2,
              ),
            ),
            Text(
              ' Nerds',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: kprimaryColor,
                letterSpacing: -2,
              ),
            ),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8),
              child: const Stack(
                children: [
                  Icon(Icons.notifications),
                  Positioned(
                    right: 4,
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: kprimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}