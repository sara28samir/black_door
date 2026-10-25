import 'package:flutter/material.dart';
import '../localization/lang.dart';

// ============================================================
// BLACK DOOR â€” Profile Page (10-prof.dart)
// ============================================================

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // -------- COLORS --------
  final Color _blackBg = const Color(0xFF0A0A0A);
  final Color _cardBg = const Color(0xFF151515);
  final Color _gold = const Color(0xFFD4AF37);
  final Color _textWhite = const Color(0xFFF5F5F5);
  final Color _textGrey = const Color(0xFF8A8A8A);

  // -------- DATA --------
  String userName = "Julian Vance";
  String userHandle = "@julian.n0ir";
  String userBio = "Curator of private moments. Inside the circle.";
  String userDob = "Born: Jan 12, 1995"; 
  String userInterests = "Interests: Art, Nightlife, Privacy"; 

  // -------- AUDIO STATE --------
  bool _isPlaying = false;

  // -------- LIKE STATE --------
  bool _isLiked = false;
  int _likesCount = 28;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _likesCount += _isLiked ? 1 : -1;
    });
  }

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
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 130),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTopBar(),
                        const SizedBox(height: 16),
                        _buildUnifiedCard(), 
                        const SizedBox(height: 16),
                        _buildBondSection(), 
                        const SizedBox(height: 20),
                        _buildDiscoverySection(),
                        const SizedBox(height: 20),
                        _buildCorridorsSection(),
                      ],
                    ),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: _gold, width: 1.5),
              ),
              child: Text(
                'BLACK DOOR',
                style: TextStyle(
                  color: _textWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildCircleIcon(Icons.qr_code, () {}),
                const SizedBox(width: 8),
                _buildCircleIcon(Icons.notifications_outlined, () {}),
                const SizedBox(width: 8),
                _buildCircleIcon(Icons.more_vert, () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleIcon(IconData icon, VoidCallback onTap) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: _gold, width: 1.5),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        icon: Icon(icon, color: _gold, size: 22),
      ),
    );
  }

  // ============================================================
  // UNIFIED PROFILE CARD
  // ============================================================
  Widget _buildUnifiedCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image: const DecorationImage(
            image: AssetImage('assets/images/card_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24), 
          child: Column(
            children: [
              // -------- الجزء العلوي --------
              SizedBox(
                height: 160, 
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Background Cover (خلفية المستخدم) - ظاهرة بوضوح فوق التصميم
                    Container(
                      height: 110, 
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF1A1A1A), Color(0xFF2C1E04)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),

                    // زرار اللايك (تم تصغيره وزحزحته لليسار وفوق)
                    Positioned(
                      top: 8, // فوق شوية
                      left: AppLang.isArabic ? null : 15, // شمال شوية
                      right: AppLang.isArabic ? 15 : null,
                      child: GestureDetector(
                        onTap: _toggleLike,
                        behavior: HitTestBehavior.opaque,
                        child: Column(
                          children: [
                            Icon(
                              _isLiked ? Icons.favorite : Icons.favorite_border,
                              color: _isLiked ? _gold : Colors.white,
                              size: 26, // صغرنا الحجم
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '$_likesCount',
                              style: TextStyle(
                                color: _isLiked ? _gold : Colors.white,
                                fontSize: 12, // صغرنا الخط
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // الصورة الشخصية
                    Positioned(
                      top: 70,
                      left: AppLang.isArabic ? null : 20,
                      right: AppLang.isArabic ? 20 : null,
                      child: Container(
                        width: 75, 
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: _gold, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 10,
                            ),
                          ],
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://i.pravatar.cc/150?img=11'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    // زرار الصوت
                    Positioned(
                      top: 115,
                      left: AppLang.isArabic ? 12 : null,
                      right: AppLang.isArabic ? null : 12,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            _isPlaying = !_isPlaying;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: _cardBg.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: _gold, width: 1.2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                _isPlaying ? Icons.pause : Icons.play_arrow,
                                color: _gold,
                                size: 16,
                              ),
                              const SizedBox(width: 6),
                              SizedBox(
                                width: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Voice Bio',
                                      style: TextStyle(
                                        color: _textWhite,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      _isPlaying
                                          ? 'Playing audio...'
                                          : 'Tap to listen to my intro',
                                      style: TextStyle(
                                        color: _textGrey,
                                        fontSize: 8,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // الاسم واليوزر
              Text(
                userName,
                style: TextStyle(
                  color: _textWhite,
                  fontSize: 20, 
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black, blurRadius: 4)], 
                ),
              ),
              const SizedBox(height: 2), 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userHandle,
                    style: TextStyle(
                      color: _gold,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: _gold.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: _gold, width: 1),
                    ),
                    child: Text(
                      'VIP KEYHOLDER',
                      style: TextStyle(
                        color: _gold,
                        fontSize: 8, 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 6), 

              // -------- الجزء السفلي (البانر والبيانات) --------
              Container(
                width: double.infinity,
                // رجعنا الكلام شمال خالص (شلنا الـ left: 40)
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userBio,
                      style: TextStyle(
                        color: _textWhite,
                        fontSize: 12, 
                        height: 1.2, 
                        shadows: [
                          Shadow(color: Colors.black, blurRadius: 4), 
                        ],
                      ),
                    ),
                    const SizedBox(height: 6), 
                    Row(
                      children: [
                        Icon(Icons.cake_outlined, color: _gold, size: 14),
                        const SizedBox(width: 6),
                        Text(
                          userDob,
                          style: TextStyle(
                            color: _textWhite, 
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            shadows: [
                              Shadow(color: Colors.black, blurRadius: 4),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4), 
                    Row(
                      children: [
                        Icon(Icons.star_outline, color: _gold, size: 14),
                        const SizedBox(width: 6),
                        Text(
                          userInterests,
                          style: TextStyle(
                            color: _textWhite,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            shadows: [
                              Shadow(color: Colors.black, blurRadius: 4),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // MY BOND SECTION
  // ============================================================
  Widget _buildBondSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: _cardBg,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: _gold.withOpacity(0.6), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: _gold.withOpacity(0.05),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: AspectRatio(
            aspectRatio: 1.88, 
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/bond_frame.png',
                  fit: BoxFit.cover,
                ),

                Align(
                  alignment: const Alignment(-0.45, 0.05), 
                  child: FractionallySizedBox(
                    widthFactor: 0.35,
                    heightFactor: 0.65, 
                    child: _buildEmptyAvatar(
                      imageUrl: 'https://i.pravatar.cc/150?img=11',
                    ),
                  ),
                ),

                Align(
                  alignment: const Alignment(0.45, 0.05), 
                  child: FractionallySizedBox(
                    widthFactor: 0.35,
                    heightFactor: 0.65, 
                    child: _buildEmptyAvatar(), 
                  ),
                ),

                Align(
                  alignment: const Alignment(-0.45, 0.65),
                  child: const Text(
                    '@julian.n0ir',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),

                Align(
                  alignment: const Alignment(0.45, 0.65),
                  child: const Text(
                    'Invite',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyAvatar(
      {IconData? icon, String? imageUrl, bool isAdd = false}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: imageUrl != null
            ? DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: isAdd ? Icon(icon, color: _gold, size: 35) : null,
    );
  }

  // ============================================================
  // DISCOVERY & PRIVACY SECTION
  // ============================================================
  Widget _buildDiscoverySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DISCOVERY & PRIVACY',
                style: TextStyle(
                  color: _gold,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              Text(
                'Change Mode',
                style: TextStyle(
                  color: _gold,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _cardBg,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: _gold.withOpacity(0.3), width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.visibility, color: _gold, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Active Phone Visibility Setting',
                            style: TextStyle(
                              color: _textGrey,
                              fontSize: 11,
                            ),
                          ),
                          Text(
                            'Username Only (Discreet)',
                            style: TextStyle(
                              color: _textWhite,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: _gold),
                      ),
                      child: Text(
                        'ACTIVE',
                        style: TextStyle(
                          color: _gold,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Your phone number is strictly shielded; people find you solely by your handle.',
                  style: TextStyle(color: _textGrey, fontSize: 11, height: 1.3),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.phone_iphone, color: _textGrey, size: 14),
                    const SizedBox(width: 6),
                    Text(
                      'Registered Phone: +1 (555) 839-2041',
                      style: TextStyle(color: _textGrey, fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CORRIDORS & FEATURES SECTION
  // ============================================================
  Widget _buildCorridorsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CORRIDORS & FEATURES',
            style: TextStyle(
              color: _gold,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _cardBg,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: _gold.withOpacity(0.3), width: 1),
            ),
            child: Column(
              children: [
                _buildFeatureItem(
                  icon: Icons.chat_bubble_outline,
                  title: 'Private Lounges & Whispers',
                  subtitle: 'Direct encrypted chats and exclusive circles',
                  badge: '3 UNREAD',
                ),
                const Divider(color: Colors.white12, height: 24),
                _buildFeatureItem(
                  icon: Icons.timer_outlined,
                  title: 'Vanishing Stories & Moments',
                  subtitle: 'Timed media visible only to invited keys',
                  badge: 'NEW',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String badge,
  }) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: _gold.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _gold.withOpacity(0.5)),
          ),
          child: Icon(icon, color: _gold, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: _textWhite,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: _gold,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      badge,
                      style: TextStyle(
                        color: _blackBg,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(color: _textGrey, fontSize: 11),
              ),
            ],
          ),
        ),
        Icon(Icons.arrow_forward_ios, color: _textGrey, size: 14),
      ],
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
            active: false,
            onTap: () => _goTo('/call'),
          ),
          _profileNavItem(
            label: AppLang.t('Profile'),
            active: true,
            onTap: () {},
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