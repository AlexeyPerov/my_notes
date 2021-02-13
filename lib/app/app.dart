import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mynotes/repositories/notes/firebase_notes_repository.dart';
import 'package:mynotes/repositories/notes/mock_notes_repository.dart';
import 'package:mynotes/repositories/notes/notes_repository.dart';
import 'package:mynotes/repositories/settings/hive_settings_repository.dart';
import 'package:mynotes/repositories/settings/settings_repository.dart';

GetIt getIt = GetIt.instance;

class App {
  static Future initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    getIt.registerSingleton<SettingsRepository>(HiveSettingsRepository());

    initializeLogging();

    await getIt.get<SettingsRepository>().initialize();

    // TODO Firestore added only for Web now
    getIt.registerSingleton<NotesRepository>(
        kIsWeb ? FirestoreNotesRepository() : MockNotesRepository(),
        signalsReady: true);

    await getIt<NotesRepository>().initialize();
  }

  static void initializeLogging() {}
}
