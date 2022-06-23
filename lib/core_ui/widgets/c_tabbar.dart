import 'package:flutter/material.dart';

class CTabbar extends StatefulWidget {
  const CTabbar({Key? key}) : super(key: key);

  @override
  State<CTabbar> createState() => _CTabbarState();
}

class _CTabbarState extends State<CTabbar> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: true,
        top: true,
        child: DefaultTabController(
            length: 3,
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 32, right: 32, top: 8),
                      color: Colors.white,
                      height: 45,
                      child: createTabBar(),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          SizedBox(),
                          SizedBox(),
                          SizedBox(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }

  TabBar createTabBar() {
    return TabBar(
      tabs: [
        Text(
          'Tab 1',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        Text(
          'Tab 2',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        Text(
          'Tab 3',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
      indicatorPadding: const EdgeInsets.only(left: 5, right: 5),
      isScrollable: false,
      labelPadding: const EdgeInsets.only(bottom: 5),
      labelStyle: const TextStyle(color: Colors.white),
      indicatorWeight: 2,
      indicatorColor: Colors.amberAccent,
      labelColor: Colors.amberAccent,
      unselectedLabelColor: Colors.cyan,
    );
  }
}
