import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../quran/presentation/bloc/quran_bloc.dart';

class SliderSound extends StatelessWidget {
  const SliderSound({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<QuranBloc, QuranState>(
          builder: (context, state) {
            return SliderTheme(
              data: SliderTheme.of(context)
                  .copyWith(
                    trackHeight: 2.0,
                  )
                  .copyWith(
                    thumbShape: HiddenThumbComponentShape(),
                    activeTrackColor: const Color(0xFFDA8856).withOpacity(0.3),
                    inactiveTrackColor: Colors.grey.shade300,
                  ),
              child: ExcludeSemantics(
                child: Slider(
                  min: 0.0,
                  max: state.duration.toDouble(),
                  value: min(state.bufferedPosition.toDouble(),
                      state.duration.toDouble()),
                  onChanged: (value) {
                    context.read<QuranBloc>().add(OnDragValueSlider(value));
                  },
                  onChangeEnd: (value) {
                    context.read<QuranBloc>().add(OnSeekEndChanged(value));
                  },
                ),
              ),
            );
          },
        ),
        BlocBuilder<QuranBloc, QuranState>(
          builder: (context, state) {
            return SliderTheme(
              data: SliderTheme.of(context)
                  .copyWith(
                    trackHeight: 2.0,
                  )
                  .copyWith(
                    inactiveTrackColor: Colors.transparent,
                  ),
              child: Slider(
                activeColor: const Color(0xFFDA8856),
                min: 0.0,
                max: state.duration.toDouble(),
                value: min(
                    (state.dragValue == -1)
                        ? state.position.toDouble()
                        : state.dragValue,
                    state.duration.toDouble()),
                onChanged: (value) {
                  context.read<QuranBloc>().add(OnDragValueSlider(value));
                },
                onChangeEnd: (value) {
                  context.read<QuranBloc>().add(OnSeekEndChanged(value));
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class HiddenThumbComponentShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size.zero;

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {}
}

// class PositionData {
//   final Duration position;
//   final Duration bufferedPosition;
//   final Duration duration;

//   PositionData(this.position, this.bufferedPosition, this.duration);
// }

// void showSliderDialog({
//   required BuildContext context,
//   required String title,
//   required int divisions,
//   required double min,
//   required double max,
//   String valueSuffix = '',
//   // TODO: Replace these two by ValueStream.
//   required double value,
//   required Stream<double> stream,
//   required ValueChanged<double> onChanged,
// }) {
//   showDialog<void>(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: Text(title, textAlign: TextAlign.center),
//       content: StreamBuilder<double>(
//         stream: stream,
//         builder: (context, snapshot) => SizedBox(
//           height: 100.0,
//           child: Column(
//             children: [
//               Text('${snapshot.data?.toStringAsFixed(1)}$valueSuffix',
//                   style: const TextStyle(
//                       fontFamily: 'Fixed',
//                       fontWeight: FontWeight.bold,
//                       fontSize: 24.0)),
//               Slider(
//                 divisions: divisions,
//                 min: min,
//                 max: max,
//                 value: snapshot.data ?? value,
//                 onChanged: onChanged,
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
