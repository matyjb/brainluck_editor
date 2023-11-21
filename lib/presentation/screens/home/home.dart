import 'package:brainluck_editor/logic/bf_cubit/bf_cubit.dart';
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
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Brainluck Editor"),
          actions: [
            // IconButton(
            //   onPressed: context.read<BfCubit>().execute,
            //   icon: const Icon(Icons.play_arrow_rounded),
            // ),
            IconButton(
              onPressed: context.read<BfCubit>().executeOne,
              icon: const Icon(Icons.skip_next_rounded),
            ),
            // IconButton(
            //   onPressed: () {}, // TODO: stop execute()
            //   icon: const Icon(Icons.stop_rounded),
            // ),
            IconButton(
              onPressed: context.read<BfCubit>().resetInsPointer,
              icon: const Icon(Icons.restore_rounded),
            ),
            IconButton(
              onPressed: context.read<BfCubit>().resetData,
              icon: const Icon(Icons.skip_previous_rounded),
            ),
          ],
        ),
        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const BfDataExplorer(),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: CCard(
                        child: const BfCodeEditor(),
                      ),
                    ),
                    CCard(
                      child: const BfInputField(),
                    ),
                    CCard(
                      child: const BfOutputField(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
