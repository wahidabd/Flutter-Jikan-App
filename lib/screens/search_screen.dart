import 'dart:convert';

import 'package:aniflix/config/styles.dart';
import 'package:aniflix/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final searchProvider = Provider.of<SearchProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          _buildTextField(),
          _buildTitleBar(),
          _expandedContent(searchProvider)
        ],
      ),
    );
  }

  Widget _expandedContent(SearchProvider searchProvider) {
    return Expanded(
      child: SingleChildScrollView(
        child: Wrap(
          children: searchProvider.genres
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/allAnimeScreen',
                      arguments:
                          json.encode({'query': null, 'genre': e.toJson()}),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      e.name!,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildTextField() {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
        top: mediaQuery.padding.top + kToolbarHeight,
        left: 8,
        right: 8,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(4),
        ),
        child: TextFormField(
          controller: _searchController,
          obscureText: false,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: const TextStyle(color: Colors.white),
            border: InputBorder.none,
            suffixIcon: IconButton(
              onPressed: () {
                _searchController.clear();
              },
              icon: const Icon(Icons.search),
            ),
          ),
          onFieldSubmitted: (_) => Navigator.pushNamed(
            context,
            '/allAnimeScreen',
            arguments: json.encode(
              {'query': _searchController.text, 'genre': ""},
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleBar() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      child: Row(children: [
        const Text("Genres", style: TextStyles.primaryTitle),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_list_rounded, size: 28),
        ),
      ]),
    );
  }
}
