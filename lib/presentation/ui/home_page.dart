import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    late FocusNode nameFocus;
  late FocusNode jobFocus;
  late FocusNode searchBtnFocus;
  late TextEditingController nameController;
  late TextEditingController jobController;
  @override
  void initState() {
    super.initState();
       nameFocus = FocusNode();
    jobFocus = FocusNode();
    searchBtnFocus = FocusNode();
    nameController = TextEditingController();
    jobController = TextEditingController();
  }
  @override
  void dispose() {
   nameFocus.dispose();
    jobFocus.dispose();
    searchBtnFocus.dispose();
    nameController.dispose();
    jobController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}