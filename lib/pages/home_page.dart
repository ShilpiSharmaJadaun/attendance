import 'package:attendance/widgets/app_top_bar.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildCard(),
          Expanded(
            child: _buildGrid(),
          ),
        ],
      ),
    );
  }

  _buildGrid() {
    return GridView(
      padding: EdgeInsets.all(10.dw),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 20.dh,
        crossAxisSpacing: 10.dw,
        childAspectRatio: 8.dh / 9.0.dh,
        crossAxisCount: 3,
      ),
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, MyRoutes.AttendancePage);
          },
          child: Card(
            color: AppColors.bottlegreen.withOpacity(0.4.dw),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                    child: Image.asset(
                  "assets/images/attendance.png",
                  scale: 9.dh,
                  alignment: Alignment.center,
                )),
                Text(
                  "Attendance",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontSize: 18.dh,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, MyRoutes.LeavePage);
          },
          child: Card(
            color: AppColors.navyblue.withOpacity(0.4.dw),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/images/leave.png",
                  scale: 8.dw,
                ),
                SizedBox(
                    width: 100.dh,
                    child: Text(
                      "Leave",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.dw,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white),
                    )),
              ],
            ),
          ),
        ),
        Card(
          color: AppColors.green.withOpacity(0.5.dw),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/images/misc.png",
                scale: 8.dw,
              ),
              SizedBox(
                  width: 100.dh,
                  child: Text(
                    "Misc",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.dw,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
            ],
          ),
        ),
        Card(
          color: AppColors.lightbrown.withOpacity(0.2.dw),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/images/payslip2.png",
                scale: 10.dw,
              ),
              SizedBox(
                  width: 100.dh,
                  child: Text(
                    "Payslip",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.dw,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
            ],
          ),
        ),
        Card(
          color: AppColors.pink.withOpacity(0.2.dw),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/images/WORKSPACE1.png",
                scale: 8.dw,
              ),
              SizedBox(
                  width: 100.dw,
                  child: Text(
                    "Workplace",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18.dw,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  _buildCard() {
    return Padding(
      padding:  EdgeInsets.all(8.0.dw),
      child: Container(
        height: 150.dh,
        width: ScreenSizeConfig.sWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.dw),
            color: AppColors.yellow
            // gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: [
            //       AppColors.navyblue,
            //       Colors.yellow
            //     ]
            // )
        ),
        padding: EdgeInsets.all(8.dh),
        child: Card(
          elevation: 10.dh,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.dw)),
          color: AppColors.navyblue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 10.dw),
                child: Image.asset("assets/images/calender.png",scale: 20.dw,),
              ),
              Padding(
                padding:  EdgeInsets.all(8.0.dw),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildText(title: "Check In"),
                    _buildText(title: "9:30 A.M")
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 10.dw),
                child: Image.asset("assets/images/calender.png",scale: 20.dh,),
              ),
              Padding(
                padding:  EdgeInsets.all(8.0.dw),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildText(title: "Check Out"),
                    _buildText(title: "6:30 A.M")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildText({required String title}) {
    return Text(
      title,
      style: TextStyle(
          color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 20.dh),
    );
  }
}
