import 'package:flutter/material.dart';
import '../localization/lang.dart';

// ============================================================
// BLACK DOOR — Story Page (8-story.dart)
// ============================================================

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  // -------- COLORS --------
  final Color _blackBg = const Color(0xFF0A0A0A);
  final Color _cardBg = const Color(0xFF151515);
  final Color _gold = const Color(0xFFD4AF37);
  final Color _textWhite = const Color(0xFFF5F5F5);
  final Color _textGrey = const Color(0xFF8A8A8A);

  // -------- COUNTRY DATA --------
  String selectedCountry = 'All Countries';
  final List<String> _countries = [
    'All Countries', 'Bahrain', 'Saudi Arabia', 'UAE', 'Kuwait', 'Qatar', 'Oman', 'Egypt', 'Jordan', 'Lebanon', 'Syria', 'Iraq', 'Palestine', 'Yemen', 'Sudan', 'Libya', 'Tunisia', 'Algeria', 'Morocco', 'Mauritania', 'Somalia', 'Djibouti', 'Comoros', 'USA', 'UK', 'France', 'Germany', 'Turkey', 'China', 'Japan', 'South Korea', 'India', 'Pakistan', 'Philippines', 'Indonesia', 'Malaysia', 'Thailand', 'Vietnam', 'Singapore', 'Australia', 'South Africa', 'Italy', 'Spain', 'Russia',
  ];

  // -------- SAMPLE DATA --------
  final List<Map<String, String>> _stories = [
    {'name': 'Lama', 'image': 'https://i.pravatar.cc/150?img=5', 'storyImage': 'https://images.unsplash.com/photo-1549488344-1f9b8d2bd1f3?auto=format&fit=crop&q=80&w=300'},
    {'name': 'Wasla Qabl', 'image': 'https://i.pravatar.cc/150?img=11', 'storyImage': 'https://images.unsplash.com/photo-1519681393784-d120267933ba?auto=format&fit=crop&q=80&w=300'},
    {'name': 'OsOs', 'image': 'https://i.pravatar.cc/150?img=33', 'storyImage': 'https://images.unsplash.com/photo-1478760329108-5c3ed9d495a0?auto=format&fit=crop&q=80&w=300'},
  ];

  final List<Map<String, String>> _channels = [
    {'name': 'Disney Channel', 'image': 'https://i.pravatar.cc/150?img=60', 'subtitle': 'Channel Created'},
    {'name': 'Bahrain Job group', 'image': 'https://i.pravatar.cc/150?img=68', 'subtitle': '5K Followers'},
    {'name': 'Best Club - Girls', 'image': 'https://i.pravatar.cc/150?img=49', 'subtitle': '306 Followers'},
    {'name': 'BAHRAIN OFFERS', 'image': 'https://i.pravatar.cc/150?img=50', 'subtitle': '10K Followers'},
  ];

  // ============================================================
  // NAVIGATION
  // ============================================================
  void _goTo(String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: Center(
        child: Container(
          width: 390,
          height: double.infinity,
          constraints: const BoxConstraints(maxHeight: 844),
          decoration: BoxDecoration(
            color: _blackBg,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                blurRadius: 24,
                spreadRadius: 4,
              ),
            ],
          ),
          child: SafeArea(
            child: Directionality(
              textDirection: AppLang.isArabic
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTopBar(),
                      const SizedBox(height: 20),
                      _buildStoriesSection(),
                      const SizedBox(height: 20),
                      _buildChannelsHeader(),
                      Expanded(child: _buildChannelsList()),
                      const SizedBox(height: 100),
                    ],
                  ),
                  Positioned(
                    bottom: 110,
                    left: AppLang.isArabic ? 20 : null,
                    right: AppLang.isArabic ? null : 20,
                    child: _buildCameraFAB(),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: _buildBottomNav(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // TOP BAR (3 Dots on outer edge, Text on inner edge)
  // ============================================================
  Widget _buildTopBar() {
    // 1. Text Widget
    Widget textWidget = Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: _gold, width: 1.2),
      ),
      child: Text(
        AppLang.t('Stories & Channels'),
        style: TextStyle(
          color: _textWhite,
          fontSize: 15,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.5,
        ),
      ),
    );

    // 2. Search Widget
    Widget searchWidget = Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        color: _cardBg,
        shape: BoxShape.circle,
        border: Border.all(color: _gold, width: 1.2),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: Icon(Icons.search, color: _gold, size: 20),
      ),
    );

    // 3. Dots Widget
    Widget dotsWidget = Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        color: _cardBg,
        shape: BoxShape.circle,
        border: Border.all(color: _gold, width: 1.2),
      ),
      child: PopupMenuButton<String>(
        padding: EdgeInsets.zero,
        icon: Icon(Icons.more_vert, color: _gold, size: 20),
        color: _cardBg,
        onSelected: (value) {
          if (value == 'new_channel') _goTo('/newq');
          if (value == 'privacy') _goTo('/prvstory');
          if (value == 'notifications') _goTo('/ash3ar');
        },
        itemBuilder: (context) => [
          _popupItem('new_channel', AppLang.t('Create Channel')),
          _popupItem('privacy', AppLang.t('Story Privacy')),
          _popupItem('notifications', AppLang.t('Story Notifications')),
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Directionality(
        textDirection: TextDirection.ltr, // Locked LTR to prevent auto-flipping
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: AppLang.isArabic
              ? [
                  // Arabic: Dots (Outer Left), Search (Inner Left), Text (Right)
                  dotsWidget,
                  const SizedBox(width: 6),
                  searchWidget,
                  const Spacer(), // Space between icons and text
                  textWidget,
                ]
              : [
                  // English: Text (Left), Search (Inner Right), Dots (Outer Right)
                  textWidget,
                  const Spacer(), // Space between text and icons
                  searchWidget,
                  const SizedBox(width: 6),
                  dotsWidget,
                ],
        ),
      ),
    );
  }

  PopupMenuItem<String> _popupItem(String value, String text) {
    return PopupMenuItem<String>(
      value: value,
      child: Text(text, style: TextStyle(color: _textWhite, fontSize: 14)),
    );
  }

  // ============================================================
  // STORIES SECTION
  // ============================================================
  Widget _buildStoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            AppLang.t('Status'),
            style: TextStyle(
              color: _textWhite,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            itemCount: _stories.length,
            itemBuilder: (context, index) {
              final s = _stories[index];
              return _buildStoryCard(
                name: s['name']!,
                image: s['image']!,
                storyImage: s['storyImage']!,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStoryCard({
    required String name,
    required String image,
    required String storyImage,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Stack(
        children: [
          Container(
            width: 95,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: _cardBg,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                storyImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.image_not_supported_outlined, color: _gold, size: 30);
                },
              ),
            ),
          ),
          Container(
            width: 95,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 8,
            right: 8,
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: _textWhite,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 8,
            left: AppLang.isArabic ? null : 8,
            right: AppLang.isArabic ? 8 : null,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: _gold, width: 1.5),
                color: _cardBg,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.person, color: _gold, size: 20);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CHANNELS HEADER
  // ============================================================
  Widget _buildChannelsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLang.t('Channels'),
            style: TextStyle(
              color: _textWhite,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                selectedCountry = value;
              });
            },
            color: _cardBg,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: _gold.withOpacity(0.4)),
            ),
            itemBuilder: (context) => _countries.map((c) {
              return PopupMenuItem<String>(
                value: c,
                child: Text(
                  AppLang.t(c),
                  style: TextStyle(color: _textWhite, fontSize: 14),
                ),
              );
            }).toList(),
            child: Row(
              children: [
                Icon(Icons.public, color: _gold, size: 22),
                const SizedBox(width: 4),
                Icon(Icons.arrow_drop_down, color: _gold, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CHANNELS LIST
  // ============================================================
  Widget _buildChannelsList() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: _channels.length,
      itemBuilder: (context, index) {
        final c = _channels[index];
        return ListTile(
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _gold, width: 1.5),
              color: _cardBg,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                c['image']!, 
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.campaign, color: _gold, size: 24);
                },
              ),
            ),
          ),
          title: Text(
            c['name']!,
            style: TextStyle(
              color: _textWhite,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          subtitle: Text(
            c['subtitle']!,
            style: TextStyle(color: _textGrey, fontSize: 12),
          ),
        );
      },
    );
  }

  // ============================================================
  // CAMERA FAB
  // ============================================================
  Widget _buildCameraFAB() {
    return GestureDetector(
      onTap: () => _goTo('/story1'),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: _gold,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: _gold.withOpacity(0.4),
              blurRadius: 15,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Icon(
          Icons.camera_alt_rounded,
          color: _blackBg,
          size: 26,
        ),
      ),
    );
  }

  // ============================================================
  // BOTTOM NAV
  // ============================================================
  Widget _buildBottomNav() {
    return Container(
      height: 76,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: _gold, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(
            icon: Icons.auto_stories_outlined,
            label: AppLang.t('Chats'),
            active: false,
            onTap: () => _goTo('/chat'),
          ),
          _navItem(
            icon: Icons.photo_library_outlined,
            label: AppLang.t('Story'),
            active: true,
            onTap: () {},
          ),
          _navItem(
            icon: Icons.call_outlined,
            label: AppLang.t('Calls'),
            active: false,
            onTap: () => _goTo('/call'),
          ),
          _profileNavItem(
            label: AppLang.t('Profile'),
            active: false,
            onTap: () => _goTo('/prof'),
          ),
        ],
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required String label,
    required bool active,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: active ? _gold : _textGrey,
              size: 24,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                color: active ? _gold : _textGrey,
                fontSize: 10,
                fontWeight: active ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileNavItem({
    required String label,
    required bool active,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: active ? _gold : _textGrey,
                  width: 1.5,
                ),
              ),
              child: Icon(
                Icons.person_outline,
                color: active ? _gold : _textGrey,
                size: 16,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                color: active ? _gold : _textGrey,
                fontSize: 10,
                fontWeight: active ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}