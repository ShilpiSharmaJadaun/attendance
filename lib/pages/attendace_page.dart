import 'package:attendance/models/address.dart';
import 'package:attendance/models/attendance.dart';
import 'package:attendance/pages/missedrequest_page.dart';
import 'package:intl/intl.dart';
import '../bloc/attendance_bloc.dart';
import '../constants.dart';
import '../models/login_model.dart';
import '../services/attendance_service.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  String now = DateFormat("yyyy- MM -dd").format(DateTime.now());

  late LoginModel loginModel;
  late AttendanceCubit attendanceCubit;

  void initState() {
    final service = Provider.of<LoginService>(context, listen: false);
    loginModel = service.getCurrentUser!;
    attendanceCubit = BlocProvider.of<AttendanceCubit>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(
        title: "Attendance",
      ),
      bottomNavigationBar: _buildbottomBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDateTime(
                  DateFormat:
                      DateFormat("EEE, MMM- dd - yyyy").format(DateTime.now()),
                ),
                _buildDateTime(
                    DateFormat: DateFormat("hh:mm aaa").format(DateTime.now()))
              ],
            ),
            _buildInfoCard(),
            _buildHeadingText(title: "Every Day is a fresh Start."),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCheckinCard(),
                _buildCheckOutCard(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCheckInButton(title: "Check- In"),
                _buildCheckOutButton(title: "Check- Out")
              ],
            ),
            _buildMissedRequest()
          ],
        ),
      ),
    );
  }

  _buildDateTime({required DateFormat}) {
    return Padding(
      padding: EdgeInsets.all(10.dw),
      child: Text(
        DateFormat,
        style: TextStyle(
            color: AppColors.navyblue,
            fontSize: 18.dw,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  _buildInfoCard() {
    return Card(
      margin: EdgeInsets.all(8.dw),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.dw)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0.dw),
            child: CircleAvatar(
              foregroundImage: const AssetImage("assets/images/profile2.png"),
              radius: 30.dw,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildText(
                  title: loginModel.employeeName.toString() +
                      "   -   " +
                      loginModel.employeeCode.toString()),
              _buildText(title: loginModel.area.toString())
            ],
          )
        ],
      ),
    );
  }

  _buildText({required String title}) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.dh),
    );
  }

  _buildHeadingText({required String title}) {
    return Padding(
      padding: EdgeInsets.all(8.0.dh),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.dh),
      ),
    );
  }

  _buildCheckinCard() {
    return SizedBox(
      width: ScreenSizeConfig.sWidth,
      height: ScreenSizeConfig.sHeight / 5.5.dh,
      child: Card(
        margin: EdgeInsets.only(left: 10.dw, right: 10.dw, bottom: 10.dw),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.dw)),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8.dh),
              decoration: BoxDecoration(
                  color: AppColors.navyblue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.dw),
                      topRight: Radius.circular(20.dw))),
              height: 40.dh,
              width: ScreenSizeConfig.getFullWidth,
              child: const Text(
                "First Check-In",
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: _buildDateTime(
                  DateFormat: DateFormat("hh:mm aaa").format(DateTime.now())),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.dh, top: 0.dh, bottom: 10.dh),
              child: BlocBuilder<AttendanceCubit, List<Attendance>>(
                  builder: (_, state) {
                final hasCheckIn = state.isNotEmpty;
                final address = hasCheckIn ? state.first.address : null;
                return Text(
                  address == null ? " Please check-in" : "Address : $address",
                  style: TextStyle(fontSize: 20.dw),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  _buildCheckOutCard() {
    final attendanceState = BlocProvider.of<AttendanceCubit>(context).state;
    final hasCheckOut = attendanceState.length == 2;
    final address = hasCheckOut ? attendanceState.last.address : null;
    return SizedBox(
      width: ScreenSizeConfig.sWidth,
      height: ScreenSizeConfig.sHeight / 5.5.dh,
      child: Card(
        margin: EdgeInsets.only(left: 10.dw, right: 10.dw, top: 10.dw),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.dw)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8.dh),
              decoration: BoxDecoration(
                  color: AppColors.navyblue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.dw),
                      topRight: Radius.circular(20.dw))),
              height: 40.dh,
              width: ScreenSizeConfig.getFullWidth,
              child: const Text(
                "First Check-Out",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: _buildDateTime(
                  DateFormat: DateFormat("hh:mm aaa").format(DateTime.now())),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.dw, bottom: 10.dh),
              child: Text(
                address == null ? " Please check-out" : "Address : $address",
                style: TextStyle(fontSize: 20.dw),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildCheckInButton({required String title}) {
    return Padding(
      padding: EdgeInsets.only(left: 10.dw, top: 30.dw, right: 10.dw),
      child: SizedBox(
        width: 180.dh,
        child: ElevatedButton(
            onPressed: () {
              showConfirmationDialog();
            },
            style: ElevatedButton.styleFrom(
                elevation: 10.dw,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.dw))),
            child: Text(
              title,
              style: TextStyle(fontSize: 18.dh, fontWeight: FontWeight.w600),
            )),
      ),
    );
  }

  _buildCheckOutButton({required String title}) {
    return Padding(
      padding: EdgeInsets.only(left: 10.dw, top: 30.dw, right: 10.dw),
      child: SizedBox(
        width: 180.dh,
        child: ElevatedButton(
            onPressed: () {
              BlocProvider.of<AttendanceCubit>(context, listen: false).checkOut;
              attendanceCubit.state.first.address;
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Attendance Marked Successfully")));
            },
            style: ElevatedButton.styleFrom(
                elevation: 10.dw,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.dw))),
            child: Text(
              title,
              style: TextStyle(fontSize: 18.dh, fontWeight: FontWeight.w600),
            )),
      ),
    );
  }

  _buildMissedRequest() {
    return Padding(
      padding: EdgeInsets.only(right: 10.dw, top: 20.dw),
      child: SizedBox(
        width: ScreenSizeConfig.sWidth,
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MissedRequest()));
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors.navyblue,
              ),
              child: Text(
                "Missed Request",
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.dw),
              )),
        ),
      ),
    );
  }

  _buildbottomBar() {
    return BottomAppBar(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: AppColors.lightbrown,
          ),
          child: Text(
            "Attendance Details",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.dw),
          ),
        ),
      ),
    );
  }

  Future<bool> showConfirmationDialog() async {
    checkInCallback() async {
      try {
        await attendanceCubit.checkIn();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Attendance Marked Successfully")));
      } catch (error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("$error")));
      }
    }

    return await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: const Text("Are you sure you want to Check In"),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.red,
                            minimumSize: Size(80.dw, 50.dh),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text("No")),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.navyblue,
                            minimumSize: Size(80.dw, 50.dh),
                          ),
                          onPressed: () async {
                            final isGrantedPermission = await attendanceCubit
                                .checkIfPermissionIsGiven();
                            if (isGrantedPermission) {
                              checkInCallback();
                              Navigator.pop(context);
                            } else {
                              Navigator.pop(context);
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return Dialog(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                              'Location permission is needed to use this feature'),
                                          SizedBox(height: 10),
                                          TextButton(
                                              onPressed: () async {
                                                final isGrantedPermission =
                                                    await attendanceCubit
                                                        .requestPermission();
                                                if (isGrantedPermission) {
                                                  checkInCallback();
                                                  Navigator.pop(context);
                                                }
                                              },
                                              child:
                                                  Text('Check Permisssions')),
                                        ],
                                      ),
                                    );
                                  });
                            }
                          },
                          child: const Text("Yes")),
                    ],
                  )
                ],
              );
            }) ??
        false;
  }
}
