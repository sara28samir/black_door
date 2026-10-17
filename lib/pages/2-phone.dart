import 'package:flutter/material.dart';
import '../localization/lang.dart';

// ============================================================
// BLACK DOOR — Phone Page (2-phone.dart)
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
    {'code': '+973', 'en': 'Bahrain', 'flag': '🇧🇭'},
    {'code': '+966', 'en': 'Saudi Arabia', 'flag': '🇸🇦'},
    {'code': '+971', 'en': 'UAE', 'flag': '🇦🇪'},
    {'code': '+965', 'en': 'Kuwait', 'flag': '🇰🇼'},
    {'code': '+974', 'en': 'Qatar', 'flag': '🇶🇦'},
    {'code': '+968', 'en': 'Oman', 'flag': '🇴🇲'},
    {'code': '+20', 'en': 'Egypt', 'flag': '🇪🇬'},
    {'code': '+962', 'en': 'Jordan', 'flag': '🇯🇴'},
    {'code': '+961', 'en': 'Lebanon', 'flag': '🇱🇧'},
    {'code': '+963', 'en': 'Syria', 'flag': '🇸🇾'},
    {'code': '+964', 'en': 'Iraq', 'flag': '🇮🇶'},
    {'code': '+970', 'en': 'Palestine', 'flag': '🇵🇸'},
    {'code': '+967', 'en': 'Yemen', 'flag': '🇾🇪'},
    {'code': '+249', 'en': 'Sudan', 'flag': '🇸🇩'},
    {'code': '+218', 'en': 'Libya', 'flag': '🇱🇾'},
    {'code': '+216', 'en': 'Tunisia', 'flag': '🇹🇳'},
    {'code': '+213', 'en': 'Algeria', 'flag': '🇩🇿'},
    {'code': '+212', 'en': 'Morocco', 'flag': '🇲🇦'},
    {'code': '+222', 'en': 'Mauritania', 'flag': '🇲🇷'},
    {'code': '+252', 'en': 'Somalia', 'flag': '🇸🇴'},
    {'code': '+253', 'en': 'Djibouti', 'flag': '🇩🇯'},
    {'code': '+269', 'en': 'Comoros', 'flag': '🇰🇲'},
    {'code': '+1', 'en': 'USA', 'flag': '🇺🇸'},
    {'code': '+44', 'en': 'UK', 'flag': '🇬🇧'},
    {'code': '+33', 'en': 'France', 'flag': '🇫🇷'},
    {'code': '+49', 'en': 'Germany', 'flag': '🇩🇪'},
    {'code': '+90', 'en': 'Turkey', 'flag': '🇹🇷'},
    {'code': '+86', 'en': 'China', 'flag': '🇨🇳'},
    {'code': '+81', 'en': 'Japan', 'flag': '🇯🇵'},
    {'code': '+82', 'en': 'South Korea', 'flag': '🇰🇷'},
    {'code': '+91', 'en': 'India', 'flag': '🇮🇳'},
    {'code': '+92', 'en': 'Pakistan', 'flag': '🇵🇰'},
    {'code': '+63', 'en': 'Philippines', 'flag': '🇵🇭'},
    {'code': '+62', 'en': 'Indonesia', 'flag': '🇮🇩'},
    {'code': '+60', 'en': 'Malaysia', 'flag': '🇲🇾'},
    {'code': '+66', 'en': 'Thailand', 'flag': '🇹🇭'},
    {'code': '+84', 'en': 'Vietnam', 'flag': '🇻🇳'},
    {'code': '+65', 'en': 'Singapore', 'flag': '🇸🇬'},
    {'code': '+61', 'en': 'Australia', 'flag': '🇦🇺'},
    {'code': '+27', 'en': 'South Africa', 'flag': '🇿🇦'},
    {'code': '+39', 'en': 'Italy', 'flag': '🇮🇹'},
    {'code': '+34', 'en': 'Spain', 'flag': '🇪🇸'},
    {'code': '+7', 'en': 'Russia', 'flag': '🇷🇺'},
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
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        _buildBackButton(),
                        const SizedBox(height: 16),
                        _buildDoorIcon(),
                        const SizedBox(height: 20),
                        _buildTitle(),
                        const SizedBox(height: 10),
                        _buildPrivacyBadge(),
                        const SizedBox(height: 35),
                        _buildMainCard(),
                        const SizedBox(height: 60),
                        _buildFooterNote(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
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
  // BACK BUTTON (Always points left)
  // ============================================================
  Widget _buildBackButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
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
      ),
    );
  }

  // ============================================================
  // DOOR ICON (Now uses Logo Image)
  // ============================================================
  Widget _buildDoorIcon() {
    return Center(
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: _gold, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: _gold.withOpacity(0.2),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
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
        const SizedBox(height: 6),
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
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: _gold, width: 1.8),
      ),
      child: Column(
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
          const SizedBox(height: 14),
          SizedBox(
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
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // COUNTRY BUTTON (Circular / Pill Shape)
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
  // PHONE FIELD (Circular / Pill Shape)
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
      top: 400,
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