import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../core/unit/list.dart';
import '../../domain/bloc/join_bloc.dart';

class Selection extends StatefulWidget {
  final int numberOfSelection;

  const Selection({super.key, required this.numberOfSelection});

  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  @override
  Widget build(BuildContext context) {
    JoinBloc bloc = context.read<JoinBloc>();

    return widget.numberOfSelection == 1
        ? Form(
            key: bloc.languageKey,
            child: SizedBox(
              height: SizeConfig.height3,
              child: SingleChildScrollView(
                child: Column(
                  children: availableLanguages.map((language) {
                    return CheckboxListTile(
                      title: Text(language),
                      value: bloc.selectedLanguages.contains(language),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value != null && value) {
                            bloc.selectedLanguages.add(language);
                          } else {
                            bloc.selectedLanguages.remove(language);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          )
        : Form(
            key: bloc.favoriteKey,
            child: SizedBox(
              height: SizeConfig.height3,
              child: SingleChildScrollView(
                child: Column(
                  children: availableFavorite.map((favorite) {
                    return CheckboxListTile(
                      title: Text(favorite),
                      value: bloc.selectedFavorite.contains(favorite),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value != null && value) {
                            bloc.selectedFavorite.add(favorite);
                          } else {
                            bloc.selectedFavorite.remove(favorite);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          );
  }
}
