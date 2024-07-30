import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _securedType = true;
  final TextEditingController _descriptionTEcontroller =
      TextEditingController();
  bool _themeMode = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          foregroundColor: Colors.white, //foregroundColor: Colors.red,
        ),
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.acme(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          bodyMedium: GoogleFonts.acme(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.4,
          ),
          bodySmall: GoogleFonts.acme(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.green,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.blue.shade900,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red.shade900,
              width: 2,
            ),
          ),
          hintStyle: const TextStyle(
            color: Colors.black26,
            fontSize: 16,
          ),
          labelStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.blueGrey),
            foregroundColor: WidgetStateProperty.all(Colors.white),
            elevation: WidgetStateProperty.all(10),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          //foregroundColor: Colors.red,
        ),
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.acme(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          bodyMedium: GoogleFonts.acme(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.4,
          ),
          bodySmall: GoogleFonts.acme(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.green,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.blue.shade900,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red.shade900,
              width: 2,
            ),
          ),
          hintStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          labelStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.blueGrey),
            foregroundColor: WidgetStateProperty.all(Colors.white),
            //elevation: WidgetStateProperty.all(10),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: GoogleFonts.laila(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          )
        ),
      ),
      themeMode: _themeMode ? ThemeMode.light : ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Text Field',
          ),
          actions: [
            Switch(
              value: _themeMode,
              onChanged: (bool value) {
                setState(() {
                  _themeMode = value;
                });
              },
              activeColor: Colors.white,
              activeTrackColor: Colors.lightBlueAccent.shade100,
              inactiveTrackColor: Colors.black,
              inactiveThumbColor: Colors.white,
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                enabled: true,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                enabled: true,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock_clock_outlined),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _securedType = !_securedType;
                        });
                      },
                      icon: Icon(_securedType
                          ? Icons.visibility_off_outlined
                          : Icons.visibility)),
                ),
                obscureText: _securedType,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                enabled: true,
                controller: _descriptionTEcontroller,
                maxLines: 3,
                maxLength: 200,
                decoration: const InputDecoration(
                  hintText: 'Write Description',
                  labelText: 'Description',
                ),
                onTap: () {
                  print('OnTaped');
                },
                onChanged: (String value) {
                  print(value);
                },
                //textAlign: TextAlign.right,
                textAlignVertical: TextAlignVertical.top,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Submit'),
                ),
                SizedBox(
                  width: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    // _descriptionTEcontroller.text = 'Description';
                    _descriptionTEcontroller.clear();
                  },
                  child: const Text('Clear'),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "I'm a text button in this world...!",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
