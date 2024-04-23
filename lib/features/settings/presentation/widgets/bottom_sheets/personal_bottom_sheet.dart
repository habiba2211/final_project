import 'package:final_project/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:final_project/features/settings/presentation/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalBottomSheet extends StatefulWidget {
  @override
  State<PersonalBottomSheet> createState() => _PersonalBottomSheetState();
}

class _PersonalBottomSheetState extends State<PersonalBottomSheet> {
  TextStyle style = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  late TextEditingController roletxt = TextEditingController();
  late TextEditingController worktxt = TextEditingController();
  late TextEditingController usagetxt = TextEditingController();
  bool readOnly = false;
  late SettingsCubit bloc;

  // void initState() {
  //   bloc = BlocProvider.of<SettingsCubit>(context);
  //   roletxt.text = bloc.roleTextGet.text;
  //   worktxt.text = bloc.workTextGet.text;
  //   usagetxt.text = bloc.usageTextGet.text;
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        bloc = BlocProvider.of<SettingsCubit>(context);
        roletxt.text = bloc.roleTextGet.text;
        worktxt.text = bloc.workTextGet.text;
        usagetxt.text = bloc.usageTextGet.text;
        return Container(
          height: MediaQuery.of(context).size.height * .45,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Update Personal Information..",
                    style: style.copyWith(fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Role", style: style),
                  MyTextField(
                    txt: roletxt,
                    r: readOnly,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Work Field", style: style),
                  MyTextField(
                    txt: worktxt,
                    r: readOnly,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Usage Target", style: style),
                  MyTextField(
                    txt: usagetxt,
                    r: readOnly,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            readOnly = true;
                            bloc.roleText(roletxt);
                            bloc.workText(worktxt);
                            bloc.usageText(usagetxt);
                            Navigator.of(context).pop();
                          },
                          child: Text("Update", style: style)),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Discard", style: style)),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
