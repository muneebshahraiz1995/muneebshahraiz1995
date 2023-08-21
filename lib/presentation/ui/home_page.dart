import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/bloc/homepage_bloc.dart';
import 'package:flutter_cubit/data/model/response/post_response.dart';
import 'package:flutter_cubit/presentation/components/error_screen.dart';
import 'package:flutter_cubit/presentation/declarations/constants.dart';

import '../components/spacer.dart';
import '../widgets/listtile.dart';
import '../widgets/search_btn.dart';
import '../widgets/textformfields.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("POST request"),
      ),
      body: BlocConsumer<HomepageBloc, HomepageState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomepageLoaded) {
              return buildLoadedlayout(state.data);
            } else if (state is HomepageLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomepageError) {
              return const ErrorScreenBuilder();
            } else {
              return buildInitialLayout();
            }
          }),
    );
  }

  Widget buildLoadedlayout(PostResponse data) => Center(
          child: Padding(
        padding: kHPadding * 2,
        child: ListTileBuilder(data),
      ));


  Widget buildInitialLayout() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputField(
              focusNode: nameFocus,
              textController: nameController,
              label: "Name",
              icons: const Icon(
                Icons.person,
                color: Colors.blue,
              ),
            ),
            HeightSpacer(myHeight: kSpacing),
            InputField(
              focusNode: jobFocus,
              textController: jobController,
              label: "Designation",
              icons: const Icon(Icons.work, color: Colors.blue),
            ),
            HeightSpacer(myHeight: kSpacing),
            SearchButtonBuilder(
              focusNode: searchBtnFocus,
              name: nameController,
              job: jobController,
            ),
          ],
        ),
      );

      }

