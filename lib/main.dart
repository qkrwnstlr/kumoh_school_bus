import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kumoh_school_bus/model/service/member_service.dart';
import 'package:kumoh_school_bus/theme/themes.dart';
import 'package:kumoh_school_bus/view/common/drawer_app_bar_scaffold.dart';
import 'view/views.dart';
import 'dart:html' as html;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DrawerAppBarScaffoldController().changeDrawerItems({
      "Home": (context) => Navigator.popAndPushNamed(context, '/'),
      "UserInfo": (context) => Navigator.popAndPushNamed(context, '/user/info'),
      "Reservation": (context) => Navigator.popAndPushNamed(context, '/reservation/check'),
      "Logout": (_) => MemberService().logout(),
    });
    return FutureBuilder(
        future: dotenv.load(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final jsCode = '''
              let script = document.createElement('script');
              script.src = `https://maps.googleapis.com/maps/api/js?key=${dotenv.env['GOOGLE_MAP_KEY']}&callback=console.log`;
              document.head.appendChild(script);
            ''';
            final script = html.ScriptElement()
              ..type = 'text/javascript'
              ..innerHtml = jsCode;
            html.querySelector('#dotenv')?.append(script);
            return MaterialApp(
              title: 'Flutter Demo',
              initialRoute: '/login',
              routes: {
                '/login': (context) => const LoginView(),
                '/user/signup': (context) => const MemberSignupView(),
                '/': (context) => const MainView(),
                '/reservation': (context) => const ReservationView(),
                '/reservation/check': (context) => const CheckReservationView(),
                '/user/info': (context) => const MemberInfoView(),
              },
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('ko', 'KR'),
              ],
              locale: const Locale('ko'),
            );
          }
          return const Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: ColorTheme.itemSubColor,
              ),
            ),
          );
        });
  }
}
