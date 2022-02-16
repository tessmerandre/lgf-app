import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lugargentefeliz/ui/content/posts_screen.dart';
import 'package:lugargentefeliz/ui/events/events_screen.dart';
import 'package:lugargentefeliz/ui/home/home_screen.dart';

enum Section { home, posts, kids, events, links  }

extension SectionExtension on Section {
  String get title {
    switch (this) {
      case Section.home:
        return 'Home';
      case Section.posts:
        return 'Palavras';
      case Section.kids:
        return 'Espaço kids';
      case Section.events:
        return 'Eventos';
      case Section.links:
        return 'Links';
      default:
        return 'Unknown';
    }
  }

  Widget? get widget {
    switch (this) {
      case Section.home:
        return const HomeScreen();
      case Section.posts:
        return const PostsScreen();
      case Section.events:
        return const EventsScreen();
      default:
        return null;
    }
  }

  IconData get icon {
    return Icons.business;
  }
}
