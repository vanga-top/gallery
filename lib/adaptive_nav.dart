import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const _assetsPackage = 'flutter_gallery_assets';
const _iconAssetLocation = 'reply/icons';
const _folderIconAssetLocation = '$_iconAssetLocation/twotone_folder.png';
final desktopMailNavKey = GlobalKey<NavigatorState>();
final mobileMailNavKey = GlobalKey<NavigatorState>();
const double _kFlingVelocity = 2.0;
const _kAnimationDuration = Duration(milliseconds: 300);

class AdaptiveNav extends StatefulWidget {
  const AdaptiveNav({super.key});
  @override
  State<StatefulWidget> createState() => _AdaptiveNavState();
}

class _AdaptiveNavState extends State<AdaptiveNav> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(),
    );
  }
}
