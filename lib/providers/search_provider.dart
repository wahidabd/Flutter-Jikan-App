import 'package:aniflix/config/enum.dart';
import 'package:aniflix/models/anime.dart';
import 'package:aniflix/models/genre.dart';
import 'package:aniflix/services/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  final _apiService = ApiService();
  int _currentPage = 0;
  int _lastPage = -1;
  final List<Anime> _searchResults = [];
  final List<Anime> _genreResult = [];
  final List<Genre> _genres = [];

  final List<String> _format = [
    "TV",
    "TV short",
    "Movie",
    "Special",
    "Ova",
  ];

  final List<String> _period = [
    "Winter",
    "Spring",
    "Summer",
    "Fall",
  ];

  final List<int> _selectedFormat = [];
  final List<int> _selectedPeriod = [];

  SearchProvider() {
    fetchGneres();
  }

  late DataStatus _dataStatus;

  DataStatus get dataStatus => _dataStatus;

  List<Anime> get gneraAnime => [
        ..._genreResult,
      ];

  List<Anime> get searchResult => [
        ..._searchResults,
      ];

  List<Genre> get gneres => [
        ..._genres,
      ];

  List<String> get format => [
        ..._format,
      ];

  List<int> get selectedFormat => [
        ..._selectedFormat,
      ];

  List<String> get period => [
        ..._period,
      ];

  List<int> get selectedPeriod => [
        ..._selectedPeriod,
      ];

  void resetValues() {
    _currentPage = 0;
    _lastPage = 1;
    _searchResults.clear();
    _genreResult.clear();
  }

  setPeriodFilter(int index) {
    (!_selectedPeriod.contains(index))
        ? _selectedPeriod.add(index)
        : _selectedPeriod.remove(index);
    if (kDebugMode) {
      print(_selectedPeriod);
    }
    notifyListeners();
  }

  setFormatFilter(int index) {
    (!_selectedFormat.contains(index))
        ? _selectedFormat.add(index)
        : _selectedFormat.remove(index);
    notifyListeners();
  }

  Future<void> fetchGneres() async {
    _genres.clear();
    Map<String, dynamic> data = await _apiService.get(
      endpoint: '/genres/anime',
    );

    for (var ele in data['data']) {
      _genres.add(
        Genre.fromJson(ele),
      );
    }
    notifyListeners();
  }

  Future<void> fetchByTitle(String title) async {}

  Future<void> fetchByGners(int id) async {
    _currentPage++;

    Map<String, dynamic> data = await _apiService.get(
      endpoint: '/anime?genres=$id&page=$_currentPage',
    );
    if (data['current_page'] != null) {
      _currentPage = data['current_page'];
    }
    if (data['last_page'] != null) {
      _lastPage = data['last_page'];
    }
    for (var ele in data['data']) {
      _genreResult.add(
        Anime.fromJson(ele),
      );
    }
    notifyListeners();
  }

  Anime getGneraById(int id) {
    return _genreResult.firstWhere((element) => element.malId == id);
  }

  Anime getSearchById(int id) {
    return _searchResults.firstWhere((element) => element.malId == id);
  }
}
