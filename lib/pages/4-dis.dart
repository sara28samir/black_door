import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb;
import '../localization/lang.dart';

// ============================================================
// BLACK DOOR — Discover Page (4-dis.dart)
// ============================================================

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  // -------- COLORS --------
  final Color _blackBg = const Color(0xFF0A0A0A);
  final Color _cardBg = const Color(0xFF151515);
  final Color _gold = const Color(0xFFD4AF37);
  final Color _textWhite = const Color(0xFFF5F5F5);
  final Color _textGrey = const Color(0xFF8A8A8A);

  int selectedOption = 0;
  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );
      if (picked != null) {
        setState(() {
          _pickedImage = File(picked.path);
        });
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  // -------- NAVIGATION --------
  void _navigate() {
    if (selectedOption == 0) {
      Navigator.pushNamed(context, '/chat');
    } else if (selectedOption == 1) {
      Navigator.pushNamed(context, '/name');
    } else {
      Navigator.pushNamed(context, '/two');
    }
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    _buildHeader(),
                    const SizedBox(height: 20),
                    _buildAvatarPicker(),
                    const SizedBox(height: 20),
                    _buildTitle(),
                    const SizedBox(height: 18),

                    // -------- OPTION 0: Phone --------
                    _buildOption(
                      index: 0,
                      icon: Icons.phone_rounded,
                      title: AppLang.t('Show my phone number'),
                      desc: AppLang.t(
                          'Others find your identity directly via your verified phone.'),
                      isRecommended: false,
                    ),
                    const SizedBox(height: 12),

                    // -------- OPTION 1: Username --------
                    _buildOption(
                      index: 1,
                      icon: Icons.alternate_email_rounded,
                      title: AppLang.t('Show my username instead'),
                      desc: AppLang.t(
                          'Your phone number is strictly shielded; people find you solely by @username.'),
                      isRecommended: true,
                    ),
                    const SizedBox(height: 12),

                    // -------- OPTION 2: Both --------
                    _buildOption(
                      index: 2,
                      icon: Icons.groups_rounded,
                      title: AppLang.t('Show both username & phone'),
                      desc: AppLang.t(
                          'Full flexibility; people can find you both ways.'),
                      isRecommended: false,
                    ),

                    const Spacer(),
                    _buildEnterButton(),
                    const SizedBox(height: 20),
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
  // HEADER
  // ============================================================
  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: _gold.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: _gold, width: 1.2),
          ),
          child: Icon(Icons.shield_rounded, color: _gold, size: 17),
        ),
        const SizedBox(width: 9),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLang.t('IDENTITY PROTOCOL'),
              style: TextStyle(
                color: _gold,
                fontSize: 9.5,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
              ),
            ),
            Text(
              AppLang.t('Privacy Preferences'),
              style: TextStyle(
                color: _textWhite,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ============================================================
  // AVATAR + CAMERA BUTTON
  // ============================================================
  Widget _buildAvatarPicker() {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 95,
            height: 95,
            decoration: BoxDecoration(
              color: _cardBg,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: _gold, width: 1.7),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: _pickedImage != null && !kIsWeb
                  ? Image.file(
                      _pickedImage!,
                      fit: BoxFit.cover,
                      width: 95,
                      height: 95,
                    )
                  : Icon(
                      Icons.person_rounded,
                      color: _textGrey,
                      size: 42,
                    ),
            ),
          ),
          Positioned(
            bottom: -5,
            left: -5,
            child: GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: _gold,
                  shape: BoxShape.circle,
                  border: Border.all(color: _blackBg, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 7,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.camera_alt_rounded,
                  color: _blackBg,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // TITLE
  // ============================================================
  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppLang.t('How would you like people\nto find you?'),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _textWhite,
            fontSize: 21,
            fontWeight: FontWeight.w900,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          AppLang.t('You hold total control over who sees your door.'),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _gold,
            fontSize: 10.5,
            height: 1.35,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // OPTION (Rounded rectangle + gold border)
  // ============================================================
  Widget _buildOption({
    required int index,
    required IconData icon,
    required String title,
    required String desc,
    required bool isRecommended,
  }) {
    bool isSelected = selectedOption == index;

    return GestureDetector(
      onTap: () => setState(() => selectedOption = index),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected ? _gold.withOpacity(0.08) : _cardBg,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? _gold : _gold.withOpacity(0.4),
            width: isSelected ? 1.7 : 1.2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: _blackBg,
                borderRadius: BorderRadius.circular(11),
                border: Border.all(
                  color: isSelected ? _gold : Colors.transparent,
                  width: 1,
                ),
              ),
              child: Icon(
                icon,
                color: isSelected ? _gold : _textGrey,
                size: 20,
              ),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            color: isSelected ? _gold : _textWhite,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (isRecommended)
                        Container(
                          margin: const EdgeInsets.only(left: 7),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 2.5,
                          ),
                          decoration: BoxDecoration(
                            color: _gold.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: _gold, width: 0.75),
                          ),
                          child: Text(
                            AppLang.t('RECOMMENDED'),
                            style: TextStyle(
                              color: _gold,
                              fontSize: 6.5,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    desc,
                    style: TextStyle(
                      color: _textGrey,
                      fontSize: 10,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 9),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? _gold : _textGrey.withOpacity(0.5),
                  width: 1.4,
                ),
                color: isSelected ? _gold : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(Icons.check, color: _blackBg, size: 12)
                  : null,
            ),
          ],
        ),
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: _navigate,
        child: Text(
          AppLang.t('Enter'),
          style: TextStyle(
            color: _blackBg,
            fontWeight: FontWeight.w900,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}