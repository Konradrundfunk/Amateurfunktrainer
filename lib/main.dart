import 'package:amateurfunktrainer/coustom_libs/database.dart';
import 'package:amateurfunktrainer/screens/learning/learningmodule.dart';
import 'package:amateurfunktrainer/screens/learnprog/learnprog.dart';
import 'package:amateurfunktrainer/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    FutureBuilder(
        future: Database().load(),
        builder: (context, snapshot){
          if(snapshot.hasData)
            return DatabaseWidget(
              prog_database: (snapshot.data as List )[0],
              settings_database: (snapshot.data as List )[1],
              child: MaterialApp(
                theme: lightmode(),
                darkTheme: darkmode(),
                themeMode: ThemeMode.system,
                title: 'Darttrainer',
                initialRoute: "/",
                locale: Locale.fromSubtags(countryCode: "DE"),
                routes: {
                  "/" : (context) => Learningmodule(),
                  "/examsim" : (context) => Learnprog(),
                  "/profile" : (context) => Learnprog(),
                },
              ),
            );
          if(snapshot.hasError) return Text("Error");
          return Center(child: CircularProgressIndicator());
        }
    )
  );
}

