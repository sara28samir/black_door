import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../localization/lang.dart';

// ============================================================
// BLACK DOOR — Chat Page (5-chat.dart)
// ============================================================

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // -------- COLORS --------
  final Color _blackBg = const Color(0xFF0A0A0A);
  final Color _cardBg = const Color(0xFF151515);
  final Color _gold = const Color(0xFFD4AF37);
  final Color _textWhite = const Color(0xFFF5F5F5);
  final Color _textGrey = const Color(0xFF8A8A8A);

  final ImagePicker _picker = ImagePicker();

  // -------- SAMPLE DATA --------
  final List<Map<String, String>> _stories = [
    {'name': 'Alex', 'image': 'https://i.pravatar.cc/150?img=12', 'username': '@alex'},
    {'name': 'Mia', 'image': 'https://i.pravatar.cc/150?img=45', 'username': '@mia'},
    {'name': 'Jordan', 'image': 'https://i.pravatar.cc/150?img=15', 'username': '@jordan'},
    {'name': 'Sam', 'image': 'https://i.pravatar.cc/150?img=32', 'username': '@sam'},
    {'name': 'Luna', 'image': 'https://i.pravatar.cc/150?img=47', 'username': '@luna'},
  ];

  final List<Map<String, String>> _chats = [
    {
      'name': 'Alex Chen',
      'username': '@alexchen',
      'message': 'You: Sounds good, see you tomorrow!',
      'time': '2m',
      'unread': '3',
      'image': 'https://i.pravatar.cc/150?img=12',
    },
    {
      'name': 'Mia Patel',
      'username': '@miapatel',
      'message': 'The file is ready 👍',
      'time': '15m',
      'unread': '7',
      'image': 'https://i.pravatar.cc/150?img=45',
    },
    {
      'name': 'Jordan Lee',
      'username': '@jordanlee',
      'message': "Can't wait for tonight!",
      'time': '1h',
      'unread': '1',
      'image': 'https://i.pravatar.cc/150?img=15',
    },
    {
      'name': 'Sam Wilson',
      'username': '@samwilson',
      'message': 'Read ✅ • 3h',
      'time': '3h',
      'unread': '',
      'image': 'https://i.pravatar.cc/150?img=32',
    },
    {
      'name': 'Luna',
      'username': '@luna',
      'message': 'Okay, sent the details.',
      'time': 'Yesterday',
      'unread': '',
      'image': 'https://i.pravatar.cc/150?img=47',
    },
  ];

  // ============================================================
  // CAMERA
  // ============================================================
  Future<void> _openCamera() async {
    try {
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
      );
      if (photo != null) {
        debugPrint('Photo taken: ${photo.path}');
      }
    } catch (e) {
      debugPrint('Camera error: $e');
    }
  }

  // ============================================================
  // NAVIGATION
  // ============================================================
  void _openChat() {}

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
          child: Directionality(
            textDirection: AppLang.isArabic
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      _buildTopBar(),
                      _buildSearchBar(),
                      const SizedBox(height: 16),
                      _buildStoriesRow(),
                      const SizedBox(height: 8),
                      _buildDivider(),
                      Expanded(child: _buildChatsList()),
                      const SizedBox(height: 100),
                    ],
                  ),
                  Positioned(
                    bottom: 110,
                    right: AppLang.isArabic ? null : 20,
                    left: AppLang.isArabic ? 20 : null,
                    child: _buildPlusButton(),
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
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            const Text(
              'BLACK DOOR',
              style: TextStyle(
                color: Color(0xFFF5F5F5),
                fontSize: 22,
                fontWeight: FontWeight.w600,
                letterSpacing: 4,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: _openCamera,
              icon: Icon(Icons.camera_alt_outlined, color: _gold, size: 24),
            ),
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, color: _gold, size: 24),
              color: _cardBg,
              onSelected: (value) {
                if (value == 'new') _goTo('/new');
                if (value == 'mass') _goTo('/massg');
                if (value == 'prvt') _goTo('/prvt');
                if (value == 'settings') _goTo('/sttng');
              },
              itemBuilder: (context) => [
                _popupItem('new', AppLang.t('New Group')),
                _popupItem('mass', AppLang.t('Mass Messages')),
                _popupItem('prvt', AppLang.t('Favorites')),
                _popupItem('settings', AppLang.t('Settings')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<String> _popupItem(String value, String text) {
    return PopupMenuItem<String>(
      value: value,
      child: Text(
        text,
        style: TextStyle(color: _textWhite, fontSize: 14),
      ),
    );
  }

  // ============================================================
  // SEARCH BAR
  // ============================================================
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: _cardBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _gold.withOpacity(0.35), width: 1),
        ),
        child: Row(
          children: [
            const SizedBox(width: 14),
            Expanded(
              child: TextField(
                style: TextStyle(color: _textWhite, fontSize: 14),
                decoration: InputDecoration(
                  hintText: AppLang.t('Search conversations or handles'),
                  hintStyle: TextStyle(color: _textGrey, fontSize: 14),
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Icon(Icons.search, color: _gold, size: 22),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // STORIES ROW
  // ============================================================
  Widget _buildStoriesRow() {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        itemCount: _stories.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildStoryItem(
              name: AppLang.t('Your Story'),
              image: '',
              username: '',
              isYourStory: true,
            );
          }
          final s = _stories[index - 1];
          return _buildStoryItem(
            name: s['name']!,
            image: s['image']!,
            username: s['username']!,
          );
        },
      ),
    );
  }

  Widget _buildStoryItem({
    required String name,
    required String image,
    required String username,
    bool isYourStory = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: _gold, width: 1.5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: isYourStory
                  ? Container(
                      color: _cardBg,
                      child: Icon(Icons.add, color: _gold, size: 30),
                    )
                  : Image.network(
                      image,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: _cardBg,
                        child:
                            Icon(Icons.person_outline, color: _gold, size: 28),
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: TextStyle(
              color: _textWhite,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (username.isNotEmpty)
            Text(
              username,
              style: TextStyle(
                color: _gold,
                fontSize: 9,
                fontWeight: FontWeight.w400,
              ),
            ),
        ],
      ),
    );
  }

  // ============================================================
  // DIVIDER
  // ============================================================
  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 1,
      color: _gold.withOpacity(0.2),
    );
  }

  // ============================================================
  // CHATS LIST
  // ============================================================
  Widget _buildChatsList() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      itemCount: _chats.length,
      itemBuilder: (context, index) {
        final c = _chats[index];
        return _buildChatItem(
          name: c['name']!,
          username: c['username']!,
          message: c['message']!,
          time: c['time']!,
          unread: c['unread'] ?? '',
          image: c['image']!,
        );
      },
    );
  }

  Widget _buildChatItem({
    required String name,
    required String username,
    required String message,
    required String time,
    required String unread,
    required String image,
  }) {
    return InkWell(
      onTap: _openChat,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // -------- AVATAR --------
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: _gold, width: 1.5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: _cardBg,
                    child: Icon(Icons.person_outline, color: _gold, size: 28),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),

            // -------- NAME / USERNAME / MESSAGE --------
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row: Name (left) + Time (right)
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: TextStyle(
                            color: _textWhite,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        AppLang.n(time),
                        style: TextStyle(color: _textGrey, fontSize: 11),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  // Row: Username (left) + Unread badge (right)
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          username,
                          style: TextStyle(
                            color: _gold,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      if (unread.isNotEmpty && unread != '0')
                        Container(
                          constraints: const BoxConstraints(
                            minWidth: 18,
                            minHeight: 18,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: _gold,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              AppLang.n(unread),
                              style: TextStyle(
                                color: _blackBg,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: _textGrey, fontSize: 12.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // FLOATING + BUTTON (smaller)
  // ============================================================
  Widget _buildPlusButton() {
    return GestureDetector(
      onTap: () => _goTo('/plus'),
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: _gold,
          shape: BoxShape.circle,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Chat bubble icon 💭
            Icon(
              Icons.chat_bubble_rounded,
              color: _textWhite,
              size: 28,
            ),
            // Gold + inside
            Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Icon(
                Icons.add,
                color: _gold,
                size: 15,
              ),
            ),
          ],
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
            active: true,
            onTap: () {},
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