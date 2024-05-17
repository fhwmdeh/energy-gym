import 'package:energygym/consts/AppInfo.dart';
import 'package:energygym/firebase_options.dart';
import 'package:energygym/model/exercise_page_model.dart';
import 'package:energygym/model/exercises_list_model.dart';
import 'package:energygym/view/screens/mysplashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // in this sample app , we use a simple provider without change notifylistener  because the list will never change , thats mean its static argument
        //we dont need to listen to it
        Provider(create: (context) => ExercisesListModel()),
        ChangeNotifierProvider(create: (context) => AppInfo()),
        // exercises page model implemented as changenotify so which calls for the use  changenotifierlistener , and its depends on exerciseslist model
        // so proxy provider is needed
        ChangeNotifierProxyProvider<ExercisesListModel, ExercisesPageModel>(
          create: (context) => ExercisesPageModel(),
          update: (context, exercisesList, exercisesPage) {
            if (exercisesPage == null)
              throw ArgumentError.notNull('Exercises Page');
            exercisesPage.exercisesList = exercisesList;
            return exercisesPage;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Energy App',
        theme: ThemeData(
          primaryColor: Colors.white,
          textTheme: TextTheme(
            headlineMedium: GoogleFonts.tajawal(),
            bodyMedium: GoogleFonts.tajawal(fontSize: 30),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const MySplashScreen(),
      ),
    );
  }
}
