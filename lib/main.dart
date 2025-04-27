import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furit_hub_dashbboard/core/di/get_it.dart';
import 'package:furit_hub_dashbboard/core/routing/route_name.dart';
import 'package:furit_hub_dashbboard/core/routing/routing.dart';
import 'package:furit_hub_dashbboard/core/services/simple_bloc_observer.dart';
import 'package:furit_hub_dashbboard/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUpLocator();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      initialRoute: RouteName.dashboard,
    );
  }
}
