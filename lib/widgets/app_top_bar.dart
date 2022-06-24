import '../constants.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({required this.title, key,}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bloodred,
      automaticallyImplyLeading: true,
      elevation: 10.dw,
      centerTitle: true,
      title: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20.dw),
          ),
        ],
      ),
      leading:  Padding(
        padding:  EdgeInsets.only(left: 15.dw),
        child: Image.asset("assets/images/profile2.png", scale: 10.dw,),
      ),
      actions: [
        Image.asset("assets/images/bellicon.png", scale: 18.dw,)
      ],
    );
  }

  _buildImageButton(String imagePath, VoidCallback onTap) {
    return InkWell(onTap: onTap, child: Image.asset(imagePath, scale: 15));
  }


  static final _appBar = AppBar();

  @override
  Size get preferredSize => _appBar.preferredSize;
}
