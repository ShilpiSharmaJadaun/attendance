import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';

import '../constants.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({Key? key}) : super(key: key);

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  late PageController pageController;
  int currentPage = 0;


  void initState() {
    tabController = TabController(length: 2, vsync: this);
    pageController =
        PageController(initialPage: currentPage, viewportFraction: 0.8);
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    pageController.dispose();
  }

  int _index = 0;

  PageController controller = PageController(viewportFraction: 0.9);
  var currentPageValue = 0.0;

  List dataList = [
    Text("Casual Leave"),
    Text("Compassionate Leave"),
    Text("Earned Leave/Privilege Leave"),
    Text("Emergency Leave"),
    Text("Leave Without Pay"),
    Text("Marriage Leave Own"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppTopBar(title: "Leaves"),
        body: Column(
          children: [
            SizedBox(
              height: 120.dh,
              child: TabBar(
                controller: tabController,
                indicatorColor: AppColors.navyblue,
                indicatorWeight: 6.dw,
                labelColor: AppColors.bloodred,
                unselectedLabelColor: AppColors.navyblue,
                unselectedLabelStyle: TextStyle(fontSize: 16.dh),
                indicatorPadding: EdgeInsets.all(8.dh),
                labelPadding: EdgeInsets.all(8),
                labelStyle:
                    TextStyle(fontSize: 18.dh, fontWeight: FontWeight.w600),
                tabs: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/leave.png",
                        scale: 15.dh,
                      ),
                      const Text("My Leaves"),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/attendance.png",
                        scale: 15.dh,
                      ),
                      const Text("Approved Leaves"),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(
                    controller: tabController,
                    children: [_buildMyLeave(), _buildApprovedLeave()]))
          ],
        ));
  }

  _buildMyLeave() {
    return Column(
      children: [_buildSlider(), Expanded(child: _buildRequestLeaveCard()), _buildRequestLeaveButton()],
    );
  }

  _buildApprovedLeave() {
    return Container();
  }

  _buildSlider() {
    return CarouselSlider(
      options: CarouselOptions(
          height: 200.0.dh,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.8,
          aspectRatio: 4.0,
          pageSnapping: true),
      items: [
        "Casual Leave",
        "Compassionate Leave",
        "Earned Leave/Privilege Leave",
        "Emergency Leave",
        "Leave Without Pay",
        "Marriage Leave Own"
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: ScreenSizeConfig.getFullWidth,
                height: 80.dh,
                alignment: Alignment.topCenter,
                margin: EdgeInsets.all(8.dh),
                decoration: BoxDecoration(
                    color: AppColors.navyblue,
                    borderRadius: BorderRadius.circular(20.dw)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '$i',
                      style: TextStyle(
                          fontSize: 20.0.dw,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildText(
                          title: "Total",
                          title1: "6",
                          Color: AppColors.white,
                        ),
                        _buildText(
                          title: "Used",
                          title1: "0",
                          Color: AppColors.white,
                        ),
                        _buildText(
                          title: "Available",
                          title1: "6",
                          Color: AppColors.white,
                        ),
                      ],
                    ),
                  ],
                ));
          },
        );
      }).toList(),
    );
  }

  _buildRequestLeaveCard() {
    return ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Card(
            elevation: 10.dw,
            color: AppColors.lightbrown.withOpacity(0.5),
            margin: EdgeInsets.all(10.dh),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0.dw),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "30 Apr 2022",
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 20.dw,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Emergency Leave 1 day",
                        style: TextStyle(
                            color: AppColors.navyblue,
                            fontSize: 18.dw,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  _buildRequestLeaveButton(){
    return ElevatedButton(onPressed: (){}, child: Text("RequestLeave",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.dw),));
  }

  _buildText({required String title, required String title1, required Color}) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color, fontSize: 20.dh, fontWeight: FontWeight.w600),
        ),
        Text(
          title1,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color, fontSize: 20.dh, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }


}
