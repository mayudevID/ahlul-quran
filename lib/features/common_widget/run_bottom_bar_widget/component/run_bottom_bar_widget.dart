import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/function.dart';
import '../../../quran/presentation/bloc/quran_bloc.dart';
import '../widgets/control_sound.dart';
import '../widgets/slider_sound.dart';

class RunBottomBarWidget extends StatelessWidget {
  const RunBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranBloc, QuranState>(
      buildWhen: (previous, current) {
        return previous.isPlaying != current.isPlaying || current.position == 0;
      },
      builder: (context, state) {
        if (state.isPlaying || state.position != 0) {
          return Container(
            height: Func.getHeight(context, 100),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFDF5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: 5,
                )
              ],
            ),
            child: const Column(
              children: [
                SliderSound(),
                ControlSound(),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
