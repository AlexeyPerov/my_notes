import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:mynotes/redux/app_state_store.dart';
import 'package:mynotes/redux/models/notes_model.dart';

import 'notes_screen.dart';

class NotesConnector extends StatelessWidget {
  NotesConnector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NotesModel>(
      model: NotesModel(),
      onInitialBuild: (viewModel) => viewModel.onQuery(),
      builder: (BuildContext context, NotesModel viewModel) => NotesScreen(
        noteList: viewModel.noteList,
        onQuery: viewModel.onQuery,
        onCreate: viewModel.onCreate,
        onUpdate: viewModel.onUpdate,
        onRemove: viewModel.onRemove,
        onArchive: viewModel.onArchive,
        onPop: viewModel.onPop,
      ),
    );
  }
}