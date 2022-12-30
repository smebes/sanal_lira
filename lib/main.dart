import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanal_lira/app_info/app_info.dart';
import 'package:sanal_lira/core/app_router.dart';
import 'package:sanal_lira/core/route_names.dart';

bool beginDrawing = false;
bool givePredictPlaces = false;
final _appRouter = AppRouter.getInstance();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MyApp(
      child: ChangeNotifierProvider(
        create: (context) => AppInfo(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sanal Lira',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: RouteNames.splashScreenRoute,
          onGenerateRoute: _appRouter.onGenerateRoute,
        ),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  final Widget? child;

  const MyApp({super.key, this.child});

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child!,
    );
  }
}
