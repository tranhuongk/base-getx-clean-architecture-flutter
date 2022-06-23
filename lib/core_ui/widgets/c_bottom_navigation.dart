import 'package:flutter/material.dart';

import 'c_container.dart';

class CustomBottomNavigator extends StatefulWidget {
  final int? initPage;

  const CustomBottomNavigator({Key? key, this.initPage}) : super(key: key);

  @override
  _CustomBottomNavigatorState createState() => _CustomBottomNavigatorState();
}

class _CustomBottomNavigatorState extends State<CustomBottomNavigator>
    with SingleTickerProviderStateMixin {
  final mapKey = GlobalKey<NavigatorState>();
  TabController? _tabController;

  static const int _mapIndex = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(
        length: 5, vsync: this, initialIndex: widget.initPage ?? 0);
    super.initState();
  }

  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
              ),
              SizedBox(
                width: double.infinity,
                height: double.infinity,
              ),
              SizedBox(
                width: double.infinity,
                height: double.infinity,
              ),
              SizedBox(
                width: double.infinity,
                height: double.infinity,
              ),
              SizedBox(
                width: double.infinity,
                height: double.infinity,
              ),
            ],
          ),
          bottomNavigationBar: CContainer(
            color: Colors.white,
            width: double.infinity,
            //height: 250,
            height: 80,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              SizedBox(
                height: 72,
                child: SizedBox(
                    height: 75,
                    width: double.infinity,
                    child: TabBar(
                      isScrollable: false,
                      onTap: (index) {},
                      indicatorColor: Colors.white,
                      controller: _tabController,
                      tabs: [
                        Tab(child: (() {}())),
                        Tab(
                          child: (() {}()),
                        ),
                        Tab(
                          child: SizedBox(
                              width: 75,
                              child: GestureDetector(
                                // onTap: () => Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (_) =>
                                //             const TabScanScreen())),
                                child: Container(
                                    color: Colors.white.withOpacity(0.0)),
                              )),
                        ),
                        Tab(
                          child: (() {}()),
                        ),
                        Tab(
                          child: (() {}()),
                        )
                      ],
                    )),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
