import '../constants.dart';

class MissedRequest extends StatefulWidget {
  const MissedRequest({Key? key}) : super(key: key);

  @override
  State<MissedRequest> createState() => _MissedRequestState();
}

class _MissedRequestState extends State<MissedRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(title: "Missed Request"),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Card(
                      margin: EdgeInsets.all(10.dw),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.dw)),
                      color: AppColors.pruple.withOpacity(0.4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildName(title: "Shilpi Sharma"),
                          _buildRequest(title: "Request for Punchout"),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [_buildHeading(), _buildHeading2()],
                          ),
                          _buildApprovePendingText(title: "Pending")
                        ],
                      ));
                }),
          ),
        ]),
      ),
    );
  }

  _buildBoldText({required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18.dw, fontWeight: FontWeight.w600),
        ),
        const Text(" : ")
      ],
    );
  }

  _buildHeading() {
    return Container(
      padding: EdgeInsets.all(10.dw),
      width: 150.dw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildBoldText(title: "Date"),
          _buildBoldText(title: "Punch In"),
          _buildBoldText(title: "Punch Out"),
          _buildBoldText(title: "Reason"),
        ],
      ),
    );
  }

  _buildBoldText2({required String title}) {
    return Text(
      title,
      style: TextStyle(fontSize: 18.dw, fontWeight: FontWeight.w600),
    );
  }

  _buildHeading2() {
    return Container(
      padding: EdgeInsets.all(10.dw),
      width: 150.dw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildBoldText2(title: "14 jun 2022"),
          _buildBoldText2(title: "09:32:14"),
          _buildBoldText2(title: "18:00"),
          _buildBoldText2(title: "forgot"),
        ],
      ),
    );
  }

  _buildName({required String title}) {
    return Padding(
      padding: EdgeInsets.all(8.0.dw),
      child: Text(
        title,
        style: TextStyle(fontSize: 18.dw, fontWeight: FontWeight.w600),
      ),
    );
  }

  _buildRequest({required String title}) {
    return Padding(
      padding: EdgeInsets.only(left: 8.dw),
      child: Text(
        "(" + title + ")",
        style: TextStyle(fontSize: 16.dw, fontWeight: FontWeight.w500),
      ),
    );
  }

  _buildApprovePendingText({required String title}) {
    return Padding(
      padding: EdgeInsets.all(10.0.dw),
      child: SizedBox(
        width: 200.dw,
        height: 50.dh,
        child: TextButton(
          onPressed: () {},
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.dw),
          ),
          style: TextButton.styleFrom(
              primary: AppColors.navyblue,
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.dw))),
        ),
      ),
    );
  }
}
