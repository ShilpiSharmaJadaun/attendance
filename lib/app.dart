import 'package:attendance/pages/attendace_page.dart';
import 'package:attendance/pages/leave_page.dart';

import 'constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenSizeInit(
        designSize: const Size(414, 866),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme,
            initialRoute: MyRoutes.HomePage,
            routes: {
              '/LoginPage': (context) => const LoginPage(),
              '/HomePage': (context) => const HomePage(),
              '/NavigationPage': (context) => const NavigationPage(),
              '/ProfilePage': (context) => const ProfilePage(),
              '/TimelinePage': (context) => const TimelinePage(),
              '/AttendancePage': (context) => const AttendancePage(),
              '/LeavePage': (context) => const LeavePage()
            }));
  }
}
