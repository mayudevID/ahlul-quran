import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/utils/function.dart';
import '../../../quran/presentation/bloc/quran_bloc.dart';
import '../widgets/control_sound.dart';
import '../widgets/slider_sound.dart';

class RunBottomBarWidget extends StatelessWidget {
  const RunBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranBloc, QuranState>(
      listenWhen: (previous, current) {
        return previous.processingState != current.processingState;
      },
      listener: (context, state) {
        if (state.processingState == ProcessingState.completed) {
          Future.delayed(
            const Duration(milliseconds: 50),
          ).then((value) {
            final nextPlay = state.listSurah
                .where((element) =>
                    int.tryParse(element.nomor) == state.audioTargetNumber + 1)
                .first;
            context.read<QuranBloc>().add(OnStartRecite(nextPlay));
          });
        }
      },
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
              children: const [
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
