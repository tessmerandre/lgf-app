import 'package:flutter/cupertino.dart';
import 'package:lugargentefeliz/ui/home/HomeScreen.dart';
import 'package:lugargentefeliz/ui/messages/MessagesScreen.dart';

enum Section { home, messages }

extension SectionExtension on Section {
  String get title {
    switch (this) {
      case Section.home:
        return 'Home';
      case Section.messages:
        return 'Messages';
      default:
        return 'Unknown';
    }
  }

  Widget? get widget {
    switch (this) {
      case Section.home:
        return const HomeScreen();
      case Section.messages:
        return const MessagesScreen();
      default:
        return null;
    }
  }
}
