import 'package:beemusic/app/utils/query/query.dart';
import 'package:beemusic/app/views/main_menu/home/tab/Album/widget/Album_screen.dart';
import 'package:beemusic/app/views/main_menu/home/tab/artist/widget/artist_screen.dart';
import 'package:beemusic/app/views/main_menu/home/tab/home/home_tab.dart';
import 'package:beemusic/app/views/main_menu/home/tab/song/song_tab.dart';
import 'package:flutter/material.dart';
import 'package:beemusic/app/utils/constant/export/export_constant.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const id = "/home_screen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // late TabController _tabController;
  // int _selectedTabIndex = 0;
  // final TimelineEventCubit _timelineEventCubit = getIt<TimelineEventCubit>();

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(length: 4, vsync: this);
    // _tabController.addListener(_onSelected);
    // _timelineEventCubit.getEventTimeline(valueMore: 0);
  }

  @override
  void dispose() {
    // _tabController.removeListener(_onSelected);
    // _tabController.dispose();
    super.dispose();
  }

  // void _onSelected() {
  //   setState(() {
  //     _selectedTabIndex = _tabController.index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = ThemeUtils.isDarkTheme(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            spaceHeight02,
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   physics: const BouncingScrollPhysics(),
            //   child: Padding(
            //     padding: sizePadding,
            //     child: Row(
            //       children: List.generate(
            //         4,
            //         (index) => Row(
            //           children: [
            //             _buildTab(
            //               [
            //                 "Home",
            //                 "Song",
            //                 "Artist",
            //                 "Album",
            //               ][index],
            //               index,
            //               isDarkTheme,
            //               () {
            //                 _tabController.animateTo(index);
            //               },
            //             ),
            //             spaceWidth02
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            // Divider(
            //   color: Colors.black.withOpacity(0.2),
            // ),
            Expanded(child: HomeTabScreen()),
          ],
        ),
      ),
    );
  }
}
