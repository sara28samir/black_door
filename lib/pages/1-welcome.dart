import 'package:flutter/material.dart';
import '2-phone.dart';
import '../localization/lang.dart';

// ============================================================
// BLACK DOOR â€” Welcome Page (1-welcome.dart)
// ============================================================

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // -------- COLORS --------
  final Color _blackBg = const Color(0xFF0A0A0A);
  final Color _cardBg = const Color(0xFF151515);
  final Color _gold = const Color(0xFFD4AF37);
  final Color _textWhite = const Color(0xFFF5F5F5);
  final Color _textGrey = const Color(0xFF8A8A8A);

  // -------- LANGUAGE --------
  String _currentLang = AppLang.currentLang;

  // -------- GENDER SWITCH --------
  bool _isFemale = true; 

  void _changeLang(String value) {
    setState(() {
      _currentLang = value;
      AppLang.setLang(value);
    });
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
              textDirection: _currentLang == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _buildTopRow(),
                    const SizedBox(height: 20), // تم تقليل المسافة عشان اللوجو يطلع فوق
                    _buildDoorCircle(),
                    const SizedBox(height: 15), // تم تقليل المسافة عشان الكلام يطلع فوق
                    _buildTitle(), 
                    const SizedBox(height: 25),
                    _buildFeatureBox(),
                    const SizedBox(height: 20),
                    _buildEnterButton(),
                    const SizedBox(height: 25),
                    _buildFooterNote(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // TOP ROW
  // ============================================================
  Widget _buildTopRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildGenderSwitch(),
        _buildLanguageDropdown(),
      ],
    );
  }

  // ============================================================
  // GENDER SWITCH
  // ============================================================
  Widget _buildGenderSwitch() {
    return Directionality(
      textDirection: TextDirection.ltr, 
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isFemale = !_isFemale;
          });
        },
        child: Container(
          width: 90,
          height: 32,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: _blackBg,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: _gold.withOpacity(0.6), width: 1.5),
          ),
          child: Stack(
            alignment: Alignment.center, 
            children: [
              // الأيقونات في الخلفية
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center, 
                children: [
                  // Male Icon
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.male,
                      color: !_isFemale ? _gold : _gold.withOpacity(0.3),
                      size: 18,
                    ),
                  ),
                  // Female Icon
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.female,
                      color: _isFemale ? _gold : _gold.withOpacity(0.3),
                      size: 18,
                    ),
                  ),
                ],
              ),
              // الزرار اللي بيتحرك
              AnimatedAlign(
                alignment: _isFemale ? Alignment.centerRight : Alignment.centerLeft,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                child: Container(
                  width: 42,
                  height: 26,
                  decoration: BoxDecoration(
                    color: _gold,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: _gold.withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      _isFemale ? Icons.female : Icons.male,
                      color: _blackBg,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // LANGUAGE DROPDOWN
  // ============================================================
  Widget _buildLanguageDropdown() {
    return PopupMenuButton<String>(
      onSelected: _changeLang,
      color: _cardBg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: _gold.withOpacity(0.4)),
      ),
      offset: const Offset(0, 40),
      itemBuilder: (context) => [
        _langMenuItem('en', 'English'),
        _langMenuItem('ar', '\u0627\u0644\u0639\u0631\u0628\u064a\u0629'),
      ],
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: _gold, width: 1),
          color: _gold.withOpacity(0.1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.language, color: _gold, size: 14),
            const SizedBox(width: 6),
            Text(
              AppLang.t('Language'),
              style: TextStyle(
                color: _gold,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 4),
            Icon(Icons.arrow_drop_down, color: _gold, size: 16),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<String> _langMenuItem(String code, String label) {
    final bool isActive = _currentLang == code;
    return PopupMenuItem<String>(
      value: code,
      child: Row(
        children: [
          if (isActive)
            Icon(Icons.check, color: _gold, size: 16)
          else
            const SizedBox(width: 16),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: isActive ? _gold : _textWhite,
              fontSize: 13,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // DOOR LOGO 
  // ============================================================
  Widget _buildDoorCircle() {
    return Center(
      child: Container(
        width: 130,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // TITLE 
  // ============================================================
  Widget _buildTitle() {
    return Column(
      children: [
        Text(
          AppLang.t('WELCOME TO'),
          style: TextStyle(
            color: _textWhite,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          AppLang.t('BLACK DOOR'),
          style: TextStyle(
            color: _textWhite,
            fontSize: 28,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          AppLang.t('PRIVATE - SECURE - ELEGANT'),
          style: TextStyle(
            color: _gold,
            fontSize: 11,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // FEATURE BOX
  // ============================================================
  Widget _buildFeatureBox() {
    return Column(
      children: [
        _buildFeatureCard(
          icon: Icons.chat_bubble_outline,
          title: AppLang.t('Confidential Messaging'),
          subtitle: AppLang.t(
              'Self-destructing whispers & zero-knowledge channels'),
        ),
        const SizedBox(height: 12),
        _buildFeatureCard(
          icon: Icons.call,
          title: AppLang.t('Ultra-Secure HD Calling'),
          subtitle: AppLang.t(
              'Encrypted voice & video without call log traces'),
        ),
      ],
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: _gold, width: 1.5),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: _gold.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: _gold, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: _textWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.5,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: _textGrey,
                    fontSize: 10.5,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ENTER BUTTON
  // ============================================================
  Widget _buildEnterButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _gold,
          foregroundColor: _blackBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const PhonePage()),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.vpn_key, size: 18, color: _blackBg),
            const SizedBox(width: 8),
            Text(
              AppLang.t('Enter Black Door'),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: _blackBg,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // FOOTER NOTE
  // ============================================================
  Widget _buildFooterNote() {
    return Text(
      AppLang.t('Invitational & verified cipher access only'),
      style: TextStyle(color: _gold, fontSize: 10),
    );
  }
}