import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:gallery/compose_page.dart';
import 'package:gallery/model/email_store.dart';

void main() {
  runApp(const ReplyApp());
}

class ReplyApp extends StatefulWidget {
  const ReplyApp({super.key});

  static Route createComposeRoute(RouteSettings settings) {
    return PageRouteBuilder<void>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const ComposePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeThroughTransition(
            fillColor: Theme.of(context).cardColor,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        settings: settings);
  }

  @override
  State<StatefulWidget> createState() => _ReplyAppStete();
}

class _ReplyAppStete extends State<ReplyApp> with RestorationMixin {
  final _RestorableEmailState _appState = _RestorableEmailState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  String? get restorationId => 'repluState';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_appState, 'state');
  }
}

class _RestorableEmailState extends RestorableListenable<EmailStore> {
  @override
  EmailStore createDefaultValue() {
    return EmailStore();
  }

  @override
  EmailStore fromPrimitives(Object? data) {
    final appState = EmailStore();

    return appState;
  }

  @override
  Object? toPrimitives() {
    return <String, dynamic>{
      'selectedEmailId': value.selectedEmailId,
      // The index of the MailboxPageType enum is stored, since the value
      // has to be serializable.
      'selectedMailboxPage': value.selectedMailboxPage.index,
      'onSearchPage': value.onSearchPage,
      'starredEmailIds': value.starredEmailIds.toList(),
      'trashEmailIds': value.trashEmailIds.toList(),
    };
  }
}