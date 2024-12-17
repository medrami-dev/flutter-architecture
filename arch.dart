import 'dart:io';

void main() {
  print('Generating Flutter architecture...');

  // Root directory for Flutter project
  const String rootDir = 'lib';

  // Define the architecture structure
  final Map<String, List<String>> directories = {
    rootDir: ['core', 'features'],
    '$rootDir/core': ['widgets', 'helper', 'common'],
  };

  // Create directories
  directories.forEach((path, subDirs) {
    createDirectory(path);
    for (var subDir in subDirs) {
      createDirectory('$path/$subDir');
    }
  });

  print('Flutter architecture generated successfully!');
}

void createDirectory(String path) {
  final directory = Directory(path);
  if (!directory.existsSync()) {
    directory.createSync(recursive: true);
    print('Created directory: $path');
  } else {
    print('Directory already exists: $path');
  }
}

void createFile(String path, String content) {
  final file = File(path);
  if (!file.existsSync()) {
    file.writeAsStringSync(content);
    print('Created file: $path');
  } else {
    print('File already exists: $path');
  }
}
