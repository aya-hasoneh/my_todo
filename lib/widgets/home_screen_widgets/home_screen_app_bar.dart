import 'package:flutter/material.dart';

import '/utils/colors.dart';
import '../shared_widgets/search_text_field.dart';
import '/view/tasks_screens/new_task/new_task_screen.dart';

SliverAppBar homeScreenAppBar(
        BuildContext context, setState, innerBoxIsScrolled, tabController) =>
    SliverAppBar(
      pinned: true,
      floating: true,
      forceElevated: innerBoxIsScrolled,
      automaticallyImplyLeading: false,
      toolbarHeight: 60,
      leading: Builder(
        builder: ((context) => InkWell(
              onTap: () {
                setState(() {
                  Scaffold.of(context).openDrawer();
                });
              },
              child: Image.asset(
                "assets/icons/menubar.png",
                scale: 3.0,
              ),
            )),
      ),
      bottom: buildTabBar(context, tabController, innerBoxIsScrolled),
      title: Image.asset(
        "assets/logo/logo.png",
        width: 110,
        height: 26,
        fit: BoxFit.fill,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_active,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, NewTaskScreen.screenRoute);
          },
          icon: const Icon(
            Icons.add,
          ),
        ),
      ],
    );

PreferredSize buildTabBar(
    BuildContext context, TabController? tabController, innerBoxIsScrolled) {
  TabController? tabController;

  return !innerBoxIsScrolled
      ? PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 121),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: CustomSearchWidget(),
              ),
              TabBar(
                isScrollable: false,
                controller: tabController,
                indicatorColor: ThemeColors.whiteColor,
                unselectedLabelColor: ThemeColors.lightGreyColor,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(child: Text("DAILY")),
                  Tab(child: Text("WEEKLY")),
                  Tab(child: Text("MONTHLY")),
                ],
              ),
            ],
          ),
        )
      : PreferredSize(child: Container(), preferredSize: const Size(0.0, 0.0));
}
