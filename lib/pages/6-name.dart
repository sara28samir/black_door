import 'package:flutter/material.dart';
import '../localization/lang.dart';

// ============================================================
// BLACK DOOR — Name Page (6-name.dart)
// ============================================================

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  // -------- COLORS --------
  final Color _blackBg = const Color(0xFF0A0A0A);
  final Color _cardBg = const Color(0xFF151515);
  final Color _gold = const Color(0xFFD4AF37);
  final Color _textWhite = const Color(0xFFF5F5F5);
  final Color _textGrey = const Color(0xFF8A8A8A);
  final Color _red = const Color(0xFFFF5252);

  // -------- CONTROLLER --------
  final TextEditingController handleController =
      TextEditingController(text: 'julian.noir');

  bool isTaken = true;

  @override
  void initState() {
    super.initState();
    handleController.addListener(() {
      final v = handleController.text.toLowerCase();
      setState(
          () => isTaken = v.contains('julian.noir') || v.contains('julian'));
    });
  }

  @override
  void dispose() {
    handleController.dispose();
    super.dispose();
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),

                    // -------- BACK BUTTON (Always Left) --------
                    _buildBackButton(),

                    const SizedBox(height: 16),

                    // -------- TITLE + SUBTITLE (moves with language) --------
                    Directionality(
                      textDirection: AppLang.isArabic
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLang.t('CREATE YOUR IDENTITY'),
                            style: TextStyle(
                              color: _textWhite,
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.1,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            AppLang.t(
                                'Choose your handle and set up your bio with live validation.'),
                            style: TextStyle(
                              color: _textGrey,
                              fontSize: 12,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // -------- AVATAR (SQUARE) --------
                    Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: _cardBg,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: _gold, width: 2),
                        ),
                        child: Icon(
                          Icons.person_rounded,
                          color: _textGrey,
                          size: 42,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // -------- HINT (GOLD) --------
                    Center(
                      child: Text(
                        AppLang.t(
                            'You must use your own unique username.'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _gold,
                          fontSize: 10.5,
                          height: 1.3,
                        ),
                      ),
                    ),

                    const SizedBox(height: 26),

                    // -------- USERNAME HEADER --------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLang.t('Enter Username'),
                          style: TextStyle(
                            color: _textWhite,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (isTaken)
                          Row(
                            children: [
                              Icon(Icons.error_rounded,
                                  color: _red, size: 14),
                              const SizedBox(width: 4),
                              Text(
                                AppLang.t('Already Taken'),
                                style: TextStyle(
                                  color: _red,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // -------- USERNAME INPUT --------
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: _cardBg,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: isTaken ? _red : _gold,
                          width: 1.2,
                        ),
                      ),
                      child: TextField(
                        controller: handleController,
                        style: TextStyle(color: _textWhite, fontSize: 14),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 14, right: 6),
                            child: Center(
                              widthFactor: 1,
                              child: Text(
                                '@',
                                style: TextStyle(
                                  color: _gold,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          // -------- STATUS ICON --------
                          suffixIcon: handleController.text.isEmpty
                              ? null
                              : Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Center(
                                    widthFactor: 1,
                                    child: Container(
                                      width: 22,
                                      height: 22,
                                      decoration: BoxDecoration(
                                        color: _gold,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        isTaken
                                            ? Icons.close_rounded
                                            : Icons.check_rounded,
                                        color: _textWhite,
                                        size: 14,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // -------- SUGGESTIONS (if taken) --------
                    if (isTaken)
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: _cardBg,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: _red.withOpacity(0.3)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '@${handleController.text} ${AppLang.t('is already claimed. Pick an alternative:')}',
                              style: TextStyle(
                                color: _textGrey,
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                _suggestionChip('@julian.noir_noir', true),
                                _suggestionChip('@the_julian.noir', false),
                                _suggestionChip('@julian.noir_x', false),
                              ],
                            ),
                          ],
                        ),
                      ),

                    const Spacer(),

                    // -------- ENTER BUTTON --------
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _gold,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/chat');
                        },
                        child: Text(
                          AppLang.t('ENTER'),
                          style: TextStyle(
                            color: _blackBg,
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),

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
  // BACK BUTTON (Always Left)
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
  // SUGGESTION CHIP
  // ============================================================
  Widget _suggestionChip(String text, bool selected) {
    return GestureDetector(
      onTap: () => setState(() {
        handleController.text = text.replaceAll('@', '');
        isTaken = false;
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: selected ? _gold.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? _gold : _gold.withOpacity(0.3),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected ? _gold : _textGrey,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}