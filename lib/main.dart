import 'package:flutter/material.dart';
import 'package:flutter_cubit/presentation/rountes/generated_routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
     initialRoute: "/",
      onGenerateRoute:RouteGenerator().generateRoute,

    );
  }
}
