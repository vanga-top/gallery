import 'package:flutter/widgets.dart';
import 'package:gallery/layout/adaptive.dart';
import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';

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
   final isDesktop = isDisplayDesktop(context);
    final isTablet = isDisplaySmallDesktop(context);
    final localizations = GalleryLocalizations.of(context)!;
    final navigationDestinations = <_Destination>[
      _Destination(
        type: MailboxPageType.inbox,
        textLabel: localizations.replyInboxLabel,
        icon: '$_iconAssetLocation/twotone_inbox.png',
      ),
      _Destination(
        type: MailboxPageType.starred,
        textLabel: localizations.replyStarredLabel,
        icon: '$_iconAssetLocation/twotone_star.png',
      ),
      _Destination(
        type: MailboxPageType.sent,
        textLabel: localizations.replySentLabel,
        icon: '$_iconAssetLocation/twotone_send.png',
      ),
      _Destination(
        type: MailboxPageType.trash,
        textLabel: localizations.replyTrashLabel,
        icon: '$_iconAssetLocation/twotone_delete.png',
      ),
      _Destination(
        type: MailboxPageType.spam,
        textLabel: localizations.replySpamLabel,
        icon: '$_iconAssetLocation/twotone_error.png',
      ),
      _Destination(
        type: MailboxPageType.drafts,
        textLabel: localizations.replyDraftsLabel,
        icon: '$_iconAssetLocation/twotone_drafts.png',
      ),
    ];

    final folders = <String, String>{
      'Receipts': _folderIconAssetLocation,
      'Pine Elementary': _folderIconAssetLocation,
      'Taxes': _folderIconAssetLocation,
      'Vacation': _folderIconAssetLocation,
      'Mortgage': _folderIconAssetLocation,
      'Freelance': _folderIconAssetLocation,
    };

    if (isDesktop) {
      return _DesktopNav(
        extended: !isTablet,
        destinations: navigationDestinations,
        folders: folders,
        onItemTapped: _onDestinationSelected,
      );
    } else {
      return _MobileNav(
        destinations: navigationDestinations,
        folders: folders,
        onItemTapped: _onDestinationSelected,
      );
    }
  }
}
