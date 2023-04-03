import 'package:flutter/material.dart';
import 'package:gaviota_app/src/models/login_model.dart';
import 'package:gaviota_app/src/pages/daily_gaviota.dart';
import 'package:gaviota_app/src/pages/daily_other.dart';
import 'package:gaviota_app/src/pages/login_page.dart';
import 'package:gaviota_app/src/pages/add_reserves_page.dart';
import 'package:gaviota_app/src/providers/daily_provider.dart';
import 'package:gaviota_app/src/requests/authentication.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'src/shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

late String initRoute;
late String token;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();
  if (LocalStorage.prefs.getString("token") == null ||
      LocalStorage.prefs.getString("token") == "") {
    initRoute = "login";
  } else {
    LoginModel model = await Authentication().ValidateToken(
        LocalStorage.prefs.getString("token")!);
    if (model.error != "") {
      initRoute = "login";
      LocalStorage.prefs.remove("user");
      LocalStorage.prefs.remove("rol");
      token = "";
    } else {
      initRoute = "dailyGaviota";
      token = model.token;
      LocalStorage.prefs.setString("user", model.user);
      LocalStorage.prefs.setString("rol", model.rol);
    }
  }
  WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setPreferredOrientations([
  //  DeviceOrientation.landscapeLeft,
  //  DeviceOrientation.landscapeRight,
  //])
  initializeDateFormatting("es_EC", null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DailyProvider())
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Gaviota',
          theme: ThemeData(
            primarySwatch: MaterialColor(0xFF0099cc, color),
            primaryColor: MaterialColor(0xFF0099cc, color),
          ),
          initialRoute: initRoute,
          //initRoute,
          routes: <String, WidgetBuilder>{
            "login": (_) => LoginPage(),
            "dailyGaviota": (_) => DailyGaviotaPage(),
            "dailyOther": (_) => DailyOtherPage(),
            "addReserves": (_) => AddReservePage(),
          },
        );
      },
    );
  }

  Map<int, Color> color =
  {
    50: Color.fromRGBO(0, 153, 204, .1),
    100: Color.fromRGBO(0, 153, 204, .2),
    200: Color.fromRGBO(0, 153, 204, .3),
    300: Color.fromRGBO(0, 153, 204, .4),
    400: Color.fromRGBO(0, 153, 204, .5),
    500: Color.fromRGBO(0, 153, 204, .6),
    600: Color.fromRGBO(0, 153, 204, .7),
    700: Color.fromRGBO(0, 153, 204, .8),
    800: Color.fromRGBO(0, 153, 204, .9),
    900: Color.fromRGBO(0, 153, 204, 1),
  };
}
