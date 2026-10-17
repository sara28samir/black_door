import 'package:flutter/material.dart';
import '../localization/lang.dart';

// ============================================================
// BLACK DOOR — Two Page (7-two.dart)
// ============================================================

class TwoPage extends StatefulWidget {
  const TwoPage({super.key});

  @override
  State<TwoPage> createState() => _TwoPageState();
}

class _TwoPageState extends State<TwoPage> {
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

                    // -------- BACK BUTTON --------
                    _buildBackButton(),

                    const SizedBox(height: 12),

                    // -------- TITLE --------
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLang.t('CREATE YOUR IDENTITY'),
                          style: TextStyle(
                            color: _textWhite,
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          AppLang.t(
                              'Choose your handle and set up your bio with live validation.'),
                          style: TextStyle(
                            color: _textGrey,
                            fontSize: 11,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // -------- AVATAR + HINT --------
                    Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: _cardBg,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: _gold, width: 1.5),
                        ),
                        child: Icon(
                          Icons.person_rounded,
                          color: _textGrey,
                          size: 36,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        AppLang.t('You must use your own unique username.'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _gold,
                          fontSize: 10,
                          height: 1.3,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // -------- PHONE VERIFIED SECTION --------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLang.t('Phone Number'),
                          style: TextStyle(
                            color: _textWhite,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.check_circle_rounded,
                                color: _gold, size: 12),
                            const SizedBox(width: 4),
                            Text(
                              AppLang.t('Already Verified'),
                              style: TextStyle(
                                color: _gold,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),

                    // -------- PHONE NUMBER BOX (Manual Control) --------
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: _cardBg.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: _gold.withOpacity(0.5), width: 1.2),
                      ),
                      child: Row(
                        children: [
                          // 1. Phone Icon
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Icon(
                              Icons.phone_iphone_rounded,
                              color: _gold,
                              size: 18,
                            ),
                          ),
                          
                          // 2. Phone Number (Right next to the icon)
                          Text(
                            AppLang.n('+973 1234 5678'),
                            style: TextStyle(
                              color: _textWhite,
                              fontSize: 13,
                              letterSpacing: 1.2,
                            ),
                          ),

                          // 3. Spacer to push the check icon to the other side
                          const Spacer(),

                          // 4. Check Icon
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: _gold,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check_rounded,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),
                    Divider(color: _gold.withOpacity(0.2)),
                    const SizedBox(height: 8),

                    // -------- USERNAME HEADER --------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLang.t('Enter Username'),
                          style: TextStyle(
                            color: _textWhite,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (isTaken)
                          Row(
                            children: [
                              Icon(Icons.error_rounded,
                                  color: _red, size: 12),
                              const SizedBox(width: 4),
                              Text(
                                AppLang.t('Already Taken'),
                                style: TextStyle(
                                  color: _red,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    // -------- USERNAME INPUT --------
                    Container(
                      height: 45,
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
                        style: TextStyle(color: _textWhite, fontSize: 13),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
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
                          suffixIcon: handleController.text.isEmpty
                              ? null
                              : Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Center(
                                    widthFactor: 1,
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: _gold,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        isTaken
                                            ? Icons.close_rounded
                                            : Icons.check_rounded,
                                        color: _textWhite,
                                        size: 13,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // -------- SUGGESTIONS (if taken) --------
                    if (isTaken)
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: _cardBg,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: _red.withOpacity(0.3)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '@${handleController.text} ${AppLang.t('is already claimed. Pick an alternative:')}',
                              style: TextStyle(
                                color: _textGrey,
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Wrap(
                              spacing: 6,
                              runSpacing: 6,
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

                    // -------- QUOTE --------
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: 50,
                            height: 1,
                            color: _gold.withOpacity(0.5),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              AppLang.t(
                                  'Privacy is not a luxury, it is a right.'),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: _textWhite.withOpacity(0.8),
                                fontSize: 11,
                                fontStyle: FontStyle.italic,
                                letterSpacing: 0.5,
                                height: 1.4,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 50,
                            height: 1,
                            color: _gold.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // -------- ENTER BUTTON --------
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _gold,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/chat');
                        },
                        child: Text(
                          AppLang.t('ENTER'),
                          style: TextStyle(
                            color: _blackBg,
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
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
  // BACK BUTTON
  // ============================================================
  Widget _buildBackButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: _cardBg,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _gold.withOpacity(0.5), width: 1.2),
          ),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Icon(
              Icons.arrow_back_ios_new,
              color: _gold,
              size: 14,
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}