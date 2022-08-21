part of 'quran_bloc.dart';

enum LoadStatus { empty, loading, loaded, error }

class QuranState extends Equatable {
  QuranState({
    List<QuranData>? listVerse,
    this.loadStatus = LoadStatus.empty,
    this.errorMessage = "",
  }) : listVerse = listVerse ?? [];

  final List<QuranData> listVerse;
  final LoadStatus loadStatus;
  final String errorMessage;

  QuranState copyWith({
    final List<QuranData>? listVerse,
    final LoadStatus? loadStatus,
    final String? errorMessage,
  }) {
    return QuranState(
      listVerse: listVerse ?? this.listVerse,
      loadStatus: loadStatus ?? this.loadStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [listVerse, loadStatus, errorMessage];
}
