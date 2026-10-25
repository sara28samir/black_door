import 'package:flutter/material.dart';
import '../localization/lang.dart';

// ============================================================
// BLACK DOOR â€” Phone Page (2-phone.dart)
// ============================================================

class PhonePage extends StatefulWidget {
  const PhonePage({super.key});

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  // -------- COLORS --------
  final Color _blackBg = const Color(0xFF0A0A0A);
  final Color _cardBg = const Color(0xFF151515);
  final Color _gold = const Color(0xFFD4AF37);
  final Color _textWhite = const Color(0xFFF5F5F5);
  final Color _textGrey = const Color(0xFF8A8A8A);

  String selectedCode = '+973';
  final TextEditingController phoneCtrl = TextEditingController();
  bool showCountries = false;

  final List<Map<String, String>> countries = [
    {'code': '+973', 'en': 'Bahrain', 'flag': '\u{1F1E7}\u{1F1ED}'},
    {'code': '+966', 'en': 'Saudi Arabia', 'flag': '\u{1F1F8}\u{1F1E6}'},
    {'code': '+971', 'en': 'UAE', 'flag': '\u{1F1E6}\u{1F1EA}'},
    {'code': '+965', 'en': 'Kuwait', 'flag': '\u{1F1F0}\u{1F1FC}'},
    {'code': '+974', 'en': 'Qatar', 'flag': '\u{1F1F6}\u{1F1E6}'},
    {'code': '+968', 'en': 'Oman', 'flag': '\u{1F1F4}\u{1F1F2}'},
    {'code': '+20', 'en': 'Egypt', 'flag': '\u{1F1EA}\u{1F1EC}'},
    {'code': '+962', 'en': 'Jordan', 'flag': '\u{1F1EF}\u{1F1F4}'},
    {'code': '+961', 'en': 'Lebanon', 'flag': '\u{1F1F1}\u{1F1E7}'},
    {'code': '+963', 'en': 'Syria', 'flag': '\u{1F1F8}\u{1F1FE}'},
    {'code': '+964', 'en': 'Iraq', 'flag': '\u{1F1EE}\u{1F1F6}'},
    {'code': '+970', 'en': 'Palestine', 'flag': '\u{1F1F5}\u{1F1F8}'},
    {'code': '+967', 'en': 'Yemen', 'flag': '\u{1F1FE}\u{1F1EA}'},
    {'code': '+249', 'en': 'Sudan', 'flag': '\u{1F1F8}\u{1F1E9}'},
    {'code': '+218', 'en': 'Libya', 'flag': '\u{1F1F1}\u{1F1FE}'},
    {'code': '+216', 'en': 'Tunisia', 'flag': '\u{1F1F9}\u{1F1F3}'},
    {'code': '+213', 'en': 'Algeria', 'flag': '\u{1F1E9}\u{1F1FF}'},
    {'code': '+212', 'en': 'Morocco', 'flag': '\u{1F1F2}\u{1F1E6}'},
    {'code': '+222', 'en': 'Mauritania', 'flag': '\u{1F1F2}\u{1F1F7}'},
    {'code': '+252', 'en': 'Somalia', 'flag': '\u{1F1F8}\u{1F1F4}'},
    {'code': '+253', 'en': 'Djibouti', 'flag': '\u{1F1E9}\u{1F1EF}'},
    {'code': '+269', 'en': 'Comoros', 'flag': '\u{1F1F0}\u{1F1F2}'},
    {'code': '+1', 'en': 'USA', 'flag': '\u{1F1FA}\u{1F1F8}'},
    {'code': '+44', 'en': 'UK', 'flag': '\u{1F1EC}\u{1F1E7}'},
    {'code': '+33', 'en': 'France', 'flag': '\u{1F1EB}\u{1F1F7}'},
    {'code': '+49', 'en': 'Germany', 'flag': '\u{1F1E9}\u{1F1EA}'},
    {'code': '+90', 'en': 'Turkey', 'flag': '\u{1F1F9}\u{1F1F7}'},
    {'code': '+86', 'en': 'China', 'flag': '\u{1F1E8}\u{1F1F3}'},
    {'code': '+81', 'en': 'Japan', 'flag': '\u{1F1EF}\u{1F1F5}'},
    {'code': '+82', 'en': 'South Korea', 'flag': '\u{1F1F0}\u{1F1F7}'},
    {'code': '+91', 'en': 'India', 'flag': '\u{1F1EE}\u{1F1F3}'},
    {'code': '+92', 'en': 'Pakistan', 'flag': '\u{1F1F5}\u{1F1F0}'},
    {'code': '+63', 'en': 'Philippines', 'flag': '\u{1F1F5}\u{1F1ED}'},
    {'code': '+62', 'en': 'Indonesia', 'flag': '\u{1F1EE}\u{1F1E9}'},
    {'code': '+60', 'en': 'Malaysia', 'flag': '\u{1F1F2}\u{1F1FE}'},
    {'code': '+66', 'en': 'Thailand', 'flag': '\u{1F1F9}\u{1F1ED}'},
    {'code': '+84', 'en': 'Vietnam', 'flag': '\u{1F1FB}\u{1F1F3}'},
    {'code': '+65', 'en': 'Singapore', 'flag': '\u{1F1F8}\u{1F1EC}'},
    {'code': '+61', 'en': 'Australia', 'flag': '\u{1F1E6}\u{1F1FA}'},
    {'code': '+27', 'en': 'South Africa', 'flag': '\u{1F1FF}\u{1F1E6}'},
    {'code': '+39', 'en': 'Italy', 'flag': '\u{1F1EE}\u{1F1F9}'},
    {'code': '+34', 'en': 'Spain', 'flag': '\u{1F1EA}\u{1F1F8}'},
    {'code': '+7', 'en': 'Russia', 'flag': '\u{1F1F7}\u{1F1FA}'},
  ];

  Map<String, String> get currentCountry => countries.firstWhere(
        (c) => c['code'] == selectedCode,
        orElse: () => countries[0],
      );

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
                  // --- المحتوى الرئيسي (متوسط في النص) ---
                  Padding(
                    // مسافة فوق عشان زرار الرجوع، ومسافة تحت صغيرة
                    padding: const EdgeInsets.only(top: 60, bottom: 20, left: 20, right: 20),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildDoorIcon(), 
                            const SizedBox(height: 16), 
                            _buildTitle(),
                            const SizedBox(height: 12),
                            _buildPrivacyBadge(),
                            const SizedBox(height: 28), 
                            
                            _buildMainCard(), 
                            
                            const SizedBox(height: 20), 
                            
                            _buildSendButton(), 
                            
                            const SizedBox(height: 32), 
                            _buildFooterNote(),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // --- زرار الرجوع ثابت فوق على الشمال ---
                  Positioned(
                    top: 8,
                    left: AppLang.isArabic ? null : 20,
                    right: AppLang.isArabic ? 20 : null,
                    child: _buildBackButton(),
                  ),

                  // --- قائمة الدول ---
                  if (showCountries) _buildCountriesList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // BACK BUTTON
  // ============================================================
  Widget _buildBackButton() {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: _cardBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _gold.withOpacity(0.5), width: 1.2),
        ),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Icon(
            Icons.arrow_back_ios_new,
            color: _gold,
            size: 16,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // DOOR ICON
  // ============================================================
  Widget _buildDoorIcon() {
    return Center(
      child: Container(
        width: 115, 
        height: 115,
        decoration: BoxDecoration(
          color: _blackBg,
          borderRadius: BorderRadius.circular(24),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
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
          'BLACK DOOR',
          style: TextStyle(
            color: _textWhite,
            fontSize: 34,
            fontWeight: FontWeight.w900,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          AppLang.t('Confidential circles. Beyond the door.'),
          style: TextStyle(color: _gold, fontSize: 12),
        ),
      ],
    );
  }

  // ============================================================
  // PRIVACY BADGE
  // ============================================================
  Widget _buildPrivacyBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: _gold.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _gold, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.shield_rounded, color: _gold, size: 12),
          const SizedBox(width: 5),
          Text(
            AppLang.t('PRIVATE CIPHER PROTOCOL'),
            style: TextStyle(
              color: _gold,
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // MAIN CARD
  // ============================================================
  Widget _buildMainCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: _gold, width: 1.8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLang.t('Step Behind the Door'),
            style: TextStyle(
              color: _textWhite,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppLang.t(
                'Enter your phone number to receive a 6-digit access code. No emails, no public directories.'),
            style: TextStyle(color: _textGrey, fontSize: 12),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildCountryButton(),
              const SizedBox(width: 10),
              Expanded(child: _buildPhoneField()),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SEND BUTTON
  // ============================================================
  Widget _buildSendButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _gold,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () => Navigator.pushNamed(context, '/otp'),
        child: Text(
          AppLang.t('Send Code'),
          style: TextStyle(
            color: _blackBg,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // COUNTRY BUTTON
  // ============================================================
  Widget _buildCountryButton() {
    return GestureDetector(
      onTap: () => setState(() => showCountries = !showCountries),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: _cardBg,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: _gold, width: 1.2),
        ),
        child: Row(
          children: [
            Text(
              currentCountry['flag']!,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 6),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Text(
                selectedCode,
                style: TextStyle(
                  color: _textWhite,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(Icons.arrow_drop_down, color: _textGrey, size: 16),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // PHONE FIELD
  // ============================================================
  Widget _buildPhoneField() {
    return Container(
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: _gold, width: 1.2),
      ),
      child: TextField(
        controller: phoneCtrl,
        keyboardType: TextInputType.phone,
        style: TextStyle(color: _textWhite, fontSize: 13),
        decoration: InputDecoration(
          hintText: AppLang.t('Enter phone...'),
          hintStyle: TextStyle(color: _textGrey, fontSize: 12),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(Icons.phone_android_rounded, color: _gold, size: 16),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // COUNTRIES LIST
  // ============================================================
  Widget _buildCountriesList() {
    return Positioned(
      left: 20,
      right: 20,
      top: 250,
      bottom: 60,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: _gold, width: 1.4),
        ),
        child: ListView.builder(
          itemCount: countries.length,
          itemBuilder: (ctx, i) {
            final c = countries[i];
            return ListTile(
              leading: Text(
                c['flag']!,
                style: const TextStyle(fontSize: 20),
              ),
              title: Text(
                AppLang.t(c['en']!),
                style: TextStyle(color: _textWhite, fontSize: 12),
              ),
              trailing: Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  c['code']!,
                  style: TextStyle(
                    color: _gold,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () => setState(() {
                selectedCode = c['code']!;
                showCountries = false;
              }),
            );
          },
        ),
      ),
    );
  }

  // ============================================================
  // FOOTER
  // ============================================================
  Widget _buildFooterNote() {
    return Text(
      AppLang.t('User data is never leaked'),
      style: TextStyle(color: _gold, fontSize: 10),
    );
  }
}