import 'package:brainluck_editor/logic/bf_cubit/bf_cubit.dart';
import 'package:brainluck_editor/presentation/screens/home/widgets/action_buttons.dart';
import 'package:brainluck_editor/presentation/screens/home/widgets/bf_code_editor.dart';
import 'package:brainluck_editor/presentation/screens/home/widgets/bf_data_explorer.dart';
import 'package:brainluck_editor/presentation/screens/home/widgets/bf_input_field.dart';
import 'package:brainluck_editor/presentation/screens/home/widgets/bf_output_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/c_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BfCubit(),
      child: BlocBuilder<BfCubit, BfState>(
        builder: (context, state) {
          final actions = state.map<List<Widget>?>(
            running: (state) => [
              const BfContinueOrPauseActionButton(),
              const BfRestartActionButton(),
              const BfStopActionButton(),
            ],
            paused: (state) => [
              const BfContinueOrPauseActionButton(),
              const BfStepOneActionButton(),
              const BfRestartActionButton(),
              const BfStopActionButton(),
            ],
            stopped: (state) => [
              const BfStartActionButton(),
              const BfStepOneActionButton(),
            ],
          );
          return Scaffold(
            appBar: AppBar(
              title: const Text("Brainluck Editor"),
              actions: actions,
            ),
            body: Center(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const BfDataExplorer(),
                  Expanded(
                    child: Column(
                      children: [
                        CCard(
                          child: const BfInputField(),
                        ),
                        CCard(
                          child: const BfOutputField(),
                        ),
                        Expanded(
                          child: CCard(
                            child: const BfCodeEditor(),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
