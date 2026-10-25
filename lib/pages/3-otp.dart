import 'package:flutter/material.dart';
import 'dart:async';
import '../localization/lang.dart';

// ============================================================
// BLACK DOOR â€” OTP Page (3-otp.dart)
// ============================================================

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  // -------- COLORS --------
  final Color _blackBg = const Color(0xFF0A0A0A);
  final Color _cardBg = const Color(0xFF151515);
  final Color _gold = const Color(0xFFD4AF37);
  final Color _textWhite = const Color(0xFFF5F5F5);
  final Color _textGrey = const Color(0xFF8A8A8A);

  List<String> codes = ["", "", "", "", "", ""];
  int seconds = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        t.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  bool get isCodeComplete => !codes.contains("");

  void _goToDis() {
    if (isCodeComplete) Navigator.pushNamed(context, '/dis');
  }

  // -------- KEYPAD ACTIONS --------
  void _addDigit(String digit) {
    setState(() {
      for (int k = 0; k < 6; k++) {
        if (codes[k].isEmpty) {
          codes[k] = digit;
          break;
        }
      }
      if (isCodeComplete) {
        Future.delayed(const Duration(milliseconds: 200), () => _goToDis());
      }
    });
  }

  void _deleteOne() {
    setState(() {
      for (int k = 5; k >= 0; k--) {
        if (codes[k].isNotEmpty) {
          codes[k] = "";
          break;
        }
      }
    });
  }

  void _clearAll() {
    setState(() {
      codes = ["", "", "", "", "", ""];
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
              textDirection: AppLang.isArabic
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 6),
                    _buildBackButton(),
                    const SizedBox(height: 8),
                    _buildDoorIcon(), // اللوجو بدون إطار
                    const SizedBox(height: 12),
                    _buildTitle(),
                    const SizedBox(height: 12),
                    _buildCodeBoxes(),
                    const SizedBox(height: 12),
                    
                    // لوحة الأرقام (الكيبورد) بتاخد المساحة اللي في النص
                    Expanded(child: _buildKeypad()), 
                    
                    const SizedBox(height: 12),
                    
                    // الزرار الدهبي اتنقل هنا تحت الكيبورد
                    _buildVerifyButton(), 
                    
                    const SizedBox(height: 10),
                    _buildWarning(),
                    const SizedBox(height: 10),
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
  // DOOR ICON (Logo Image - بدون إطار)
  // ============================================================
  Widget _buildDoorIcon() {
    return Center(
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: _blackBg,
          borderRadius: BorderRadius.circular(18),
          // تم مسح الإطار والظل
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // TITLE + TIMER
  // ============================================================
  Widget _buildTitle() {
    return Column(
      children: [
        Text(
          'BLACK DOOR',
          style: TextStyle(
            color: _textWhite,
            fontSize: 20,
            fontWeight: FontWeight.w900,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          AppLang.t('Enter Security Code'),
          style: TextStyle(
            color: _textWhite,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          '${AppLang.t('Code sent to')} ${AppLang.n('+973')}',
          style: TextStyle(color: _textGrey, fontSize: 10),
        ),
        const SizedBox(height: 4),
        Text(
          AppLang.n('00:${seconds.toString().padLeft(2, '0')}'),
          style: TextStyle(
            color: _gold,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          AppLang.t('Resend Code'),
          style: TextStyle(
            color: _gold,
            fontSize: 9,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // CODE BOXES
  // ============================================================
  Widget _buildCodeBoxes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (i) {
        return Container(
          width: 40,
          height: 44,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: _cardBg,
            borderRadius: BorderRadius.circular(9),
            border: Border.all(color: _gold, width: 1.2),
          ),
          child: Center(
            child: Text(
              AppLang.n(codes[i]),
              style: TextStyle(
                color: _textWhite,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }),
    );
  }

  // ============================================================
  // VERIFY BUTTON (تحت الكيبورد)
  // ============================================================
  Widget _buildVerifyButton() {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _gold,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: _goToDis,
        child: Text(
          AppLang.t('Verify & Continue'),
          style: TextStyle(
            color: _blackBg,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // KEYPAD 
  // ============================================================
  Widget _buildKeypad() {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _gold.withOpacity(0.35), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _row(["1", "2", "3"]),
          _row(["4", "5", "6"]),
          _row(["7", "8", "9"]),
          _row(["clear", "0", "del"]),
        ],
      ),
    );
  }

  Widget _row(List<String> list) {
    return Expanded(
      child: Row(
        children: list.map((e) {
          if (e == "clear") {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _gold.withOpacity(0.15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: _gold.withOpacity(0.6), width: 1),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: _clearAll,
                  child: Text(
                    AppLang.t('CLEAR'),
                    style: TextStyle(
                      color: _gold,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }

          if (e == "del") {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _cardBg,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: _deleteOne,
                  child: Icon(Icons.backspace_outlined,
                      color: _textWhite, size: 20),
                ),
              ),
            );
          }

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _cardBg,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.zero,
                ),
                onPressed: () => _addDigit(e),
                child: Text(
                  AppLang.n(e),
                  style: TextStyle(
                    color: _textWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // ============================================================
  // WARNING NOTE
  // ============================================================
  Widget _buildWarning() {
    return Text(
      AppLang.t('Never share your code with anyone'),
      style: TextStyle(color: _gold, fontSize: 9),
    );
  }
}