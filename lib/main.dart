import 'package:expencetracker/Screen/expenses.dart';
import 'package:expencetracker/Screen/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 57, 184, 159),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 255, 255, 255),
);
final nameProvider = StateProvider((ref) => '');
final emailProvider = StateProvider((ref) => '');
final expensesProvider = StateProvider((ref) => '');

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
     MaterialApp(debugShowCheckedModeBanner: false,
      darkTheme: ThemeData().copyWith(useMaterial3:true,
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleSmall: TextStyle(fontFamily: 'outfit',
            fontWeight: FontWeight.normal,
            color: kDarkColorScheme.onSecondaryContainer,
            fontSize: 14,
          ),
          titleLarge: TextStyle(fontFamily: 'outfit',
            fontWeight: FontWeight.bold,
            color: kDarkColorScheme.onSecondaryContainer,
            fontSize: 18,
          ),
          bodyMedium: TextStyle(fontFamily: 'outfit',
            fontWeight: FontWeight.w500,
            color: kDarkColorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
        ),
      ),
       theme: ThemeData().copyWith(
         useMaterial3: true,
         colorScheme: kColorScheme,
         cardTheme: const CardTheme().copyWith(
           color: kColorScheme.secondaryContainer,
           margin: const EdgeInsets.symmetric(
             horizontal: 16,
             vertical: 8,
           ),
         ),
         elevatedButtonTheme: ElevatedButtonThemeData(
           style: ElevatedButton.styleFrom(
             backgroundColor: kColorScheme.primaryContainer,
           ),
         ),
         textTheme: ThemeData().textTheme.copyWith(
           titleLarge: TextStyle(fontFamily: 'outfit',
             fontWeight: FontWeight.bold,
             color: kColorScheme.onSecondaryContainer,
             fontSize: 16,
           ),
         ),),
      home:ProviderScope(
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return const Expenses();
            }else{
            return  const AuthScreen();

            }
          },
        ),
      )

      //SplashScreen()
    ),
  );
}