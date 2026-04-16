import 'package:flutter_riverpod/legacy.dart';

final searchprovider = StateNotifierProvider<SearchNotifier, SearchState>((
  ref,
) {
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState(search: '', ischange: false));

  void search(String query) {
    state = state.copyWith(search: query);
  }

  void onchange(bool ischange) {
    state = state.copyWith(ischange: ischange);
  }
}

class SearchState {
  final String search;
  final bool ischange;

  SearchState({required this.search, required this.ischange});

  SearchState copyWith({String? search, bool? ischange}) {
    return SearchState(
      search: search ?? this.search,
      ischange: ischange ?? this.ischange,
    );
  }
}
