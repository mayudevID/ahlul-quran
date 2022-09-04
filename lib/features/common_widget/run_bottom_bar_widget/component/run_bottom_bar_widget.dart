import 'dart:math';

import 'package:alquran_mobile_apps/features/common_widget/run_bottom_bar_widget/wdgets/control_sound.dart';
import 'package:alquran_mobile_apps/features/common_widget/run_bottom_bar_widget/wdgets/slider_sound.dart';
import 'package:alquran_mobile_apps/features/quran/presentation/bloc/quran_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/utils/function.dart';

class RunBottomBarWidget extends StatelessWidget {
  const RunBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranBloc, QuranState>(
      buildWhen: (previous, current) {
        return previous.processingState != current.processingState;
      },
      builder: (context, state) {
        if (state.processingState != ProcessingState.idle) {
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
            child: Column(
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
