import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;

void main() {
  final String machinePath = p.current.split("tools")[0];
  final _languageManager = LanguageManager(
    basePath: "$machinePath/lib/features/views",
    commonBasePath: "$machinePath/assets/translations/common",
    outputPath: "$machinePath/assets/translations",
    languages: ['en', 'tr'],
  );
  try {
    _languageManager._createTranslationFiles();
  } catch (e) {
    print(e);
  }
}

class LanguageManager {
  LanguageManager({
    required this.basePath,
    required this.languages,
    required this.commonBasePath,
    required this.outputPath,
  });
  final List<String> languages;
  final String basePath;
  final String commonBasePath;
  final String outputPath;

  final List<String> _inputPathList = [];
  final Map<String, dynamic> _jsonFile = {};
  List _pathList = [];

  Future<void> _createTranslationFiles() async {
    for (String language in languages) {
      _createPaths(language);
      await _mergeTranslations();
      _exportTranslation(language);
    }
    print(
        "Succesfully created translation files for these languages: $languages");
  }

  _createPaths(String language) {
    String _commonPath = "$commonBasePath/$language/common.json";
    _pathList = [
      "auth/login/translation/$language/login.json",
      "auth/register/translation/$language/register.json",
    ];

    _inputPathList.add(_commonPath);
    for (String path in _pathList) {
      _inputPathList.add("$basePath/$path");
    }
  }

  Future _mergeTranslations() async {
    for (String path in _inputPathList) {
      var file = await File(path).readAsString();
      var json = jsonDecode(file);
      _jsonFile.addAll(json);
    }
  }

  _exportTranslation(String language) async {
    final file = File("$outputPath/$language.json");

    await file.writeAsString(jsonEncode(_jsonFile), mode: FileMode.writeOnly);
  }
}
