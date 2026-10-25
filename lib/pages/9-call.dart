import 'package:flutter/material.dart';
import '../localization/lang.dart';

// ============================================================
// BLACK DOOR — Call Page (9-call.dart)
// ============================================================

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  // -------- COLORS --------
  final Color _blackBg = const Color(0xFF0A0A0A);
  final Color _cardBg = const Color(0xFF151515);
  final Color _gold = const Color(0xFFD4AF37);
  final Color _textWhite = const Color(0xFFF5F5F5);
  final Color _textGrey = const Color(0xFF8A8A8A);
  final Color _red = const Color(0xFFFF5252);
  final Color _green = const Color(0xFF4CAF50);

  // -------- SAMPLE DATA --------
  final List<Map<String, dynamic>> _calls = [
    {
      'name': 'Alex',
      'image': 'https://i.pravatar.cc/150?img=12',
      'time': 'Today, 5:53 PM',
      'isVideo': false,
      'isIncoming': true,
      'isMissed': true,
    },
    {
      'name': 'Emma',
      'image': 'https://i.pravatar.cc/150?img=45',
      'time': 'Yesterday, 6:37 PM',
      'isVideo': false,
      'isIncoming': false,
      'isMissed': false,
    },
    {
      'name': 'Liam',
      'image': 'https://i.pravatar.cc/150?img=15',
      'time': 'Oct 16, 10:07 PM',
      'isVideo': false,
      'isIncoming': false,
      'isMissed': false,
    },
    {
      'name': 'Mia',
      'image': 'https://i.pravatar.cc/150?img=32',
      'time': 'Oct 16, 9:43 PM',
      'isVideo': true,
      'isIncoming': false,
      'isMissed': false,
    },
    {
      'name': 'Noah',
      'image': 'https://i.pravatar.cc/150?img=47',
      'time': 'Oct 16, 9:17 PM',
      'isVideo': false,
      'isIncoming': true,
      'isMissed': false,
    },
    {
      'name': 'Olivia',
      'image': 'https://i.pravatar.cc/150?img=47',
      'time': 'Oct 16, 9:11 PM',
      'isVideo': false,
      'isIncoming': true,
      'isMissed': true,
    },
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
                      const SizedBox(height: 16),
                      _buildQuickActions(),
                      const SizedBox(height: 20),
                      _buildSectionTitle(AppLang.t('Recent')),
                      Expanded(child: _buildCallsList()),
                      const SizedBox(height: 100),
                    ],
                  ),
                  Positioned(
                    bottom: 110,
                    left: AppLang.isArabic ? 20 : null,
                    right: AppLang.isArabic ? null : 20,
                    child: _buildCallFAB(),
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
  // TOP BAR
  // ============================================================
  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            decoration: BoxDecoration(
              color: _blackBg,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: _gold, width: 1.5),
            ),
            child: Text(
              AppLang.t('Calls'),
              style: TextStyle(
                color: _textWhite,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: _blackBg,
                  shape: BoxShape.circle,
                  border: Border.all(color: _gold, width: 1.5),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Icon(Icons.search, color: _gold, size: 22),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: _blackBg,
                  shape: BoxShape.circle,
                  border: Border.all(color: _gold, width: 1.5),
                ),
                child: PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.more_vert, color: _gold, size: 22),
                  color: _cardBg,
                  onSelected: (value) {},
                  itemBuilder: (context) => [
                    _popupItem('clear', AppLang.t('Clear call log')),
                    _popupItem('scheduled', AppLang.t('Scheduled calls')),
                    _popupItem('settings', AppLang.t('Call settings')),
                  ],
                ),
              ),
            ],
          ),
        ],
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
  // QUICK ACTIONS
  // ============================================================
  Widget _buildQuickActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _quickActionItem(icon: Icons.call, label: AppLang.t('Call')),
          _quickActionItem(icon: Icons.calendar_today, label: AppLang.t('Schedule')),
          _quickActionItem(icon: Icons.dialpad, label: AppLang.t('Keypad')),
          _quickActionItem(icon: Icons.favorite_border, label: AppLang.t('Favorites')),
        ],
      ),
    );
  }

  Widget _quickActionItem({required IconData icon, required String label}) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: _cardBg,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: _gold, width: 1.5),
          ),
          child: Icon(icon, color: _textWhite, size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: _textWhite, fontSize: 12),
        ),
      ],
    );
  }

  // ============================================================
  // SECTION TITLE
  // ============================================================
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: TextStyle(
          color: _textWhite,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // ============================================================
  // CALLS LIST
  // ============================================================
  Widget _buildCallsList() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: _calls.length,
      itemBuilder: (context, index) {
        final c = _calls[index];
        return _buildCallItem(
          name: c['name'],
          image: c['image'],
          time: c['time'],
          isVideo: c['isVideo'],
          isIncoming: c['isIncoming'],
          isMissed: c['isMissed'],
        );
      },
    );
  }

  Widget _buildCallItem({
    required String name,
    required String image,
    required String time,
    required bool isVideo,
    required bool isIncoming,
    required bool isMissed,
  }) {
    IconData arrowIcon = isIncoming ? Icons.call_received : Icons.call_made;
    Color arrowColor = isMissed ? _red : (isIncoming ? _green : _gold);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: _gold, width: 1.5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.person, color: _gold, size: 26);
                },
              ),
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: _textWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(arrowIcon, color: arrowColor, size: 16),
                    const SizedBox(width: 6),
                    Text(
                      AppLang.n(AppLang.t(time)), // تمرير الوقت من ملف الترجمة
                      style: TextStyle(color: _textGrey, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // أيقونة المكالمة بتلف عشان تبص لجوه (للاسم) في اللغتين
          IconButton(
            icon: Transform.flip(
              flipX: !AppLang.isArabic,
              child: Icon(
                isVideo ? Icons.videocam : Icons.call,
                color: _textWhite,
                size: 28,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CALL FAB
  // ============================================================
  Widget _buildCallFAB() {
    return GestureDetector(
      onTap: () {},
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
        child: Transform.flip(
          flipX: !AppLang.isArabic, // السماعة تبص لجوه
          child: Icon(
            Icons.add_call,
            color: _blackBg,
            size: 24,
          ),
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
            active: false,
            onTap: () => _goTo('/story'),
          ),
          _navItem(
            icon: Icons.call_outlined,
            label: AppLang.t('Calls'),
            active: true,
            onTap: () {},
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