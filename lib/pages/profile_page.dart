import 'package:attendance/models/login_model.dart';

import '../constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late LoginModel loginModel;
  late LoginService loginService;

  void initState(){
    loginService = Provider.of<LoginService>(context, listen: false);
    loginModel = loginService.getCurrentUser!;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(flex: 5,),
              Container(
                height: 300.dh,
                width: 300.dw,
                color: Colors.grey,
              ),
              _buildText(title: loginModel.employeeName.toString()),
              _buildText(title: loginModel.employeeCode.toString()),
              _buildText(title: loginModel.area.toString()),
              _buildText(title: loginModel.email_id.toString()),
              _buildChangepass(),
              Spacer(flex: 10,)
              
            ],
          ),
        ),
      ),
    );
  }
  _buildText({required String title}){
    return Padding(
      padding:  EdgeInsets.only(top: 8.dh),
      child: Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.dw),),
    );
  }

  _buildChangepass(){
    return Padding(
      padding:  EdgeInsets.all(20.0.dh),
      child: ElevatedButton(onPressed: (){}, child: Text("Change Password")),
    );
  }
}
