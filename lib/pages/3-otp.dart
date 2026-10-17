import 'package:flutter/material.dart';
import 'dart:async';
import '../localization/lang.dart';

// ============================================================
// BLACK DOOR — OTP Page (3-otp.dart)
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
                  children: [
                    const SizedBox(height: 10),
                    _buildBackButton(),
                    const SizedBox(height: 20),
                    _buildDoorIcon(),
                    const SizedBox(height: 20),
                    _buildTitle(),
                    const SizedBox(height: 20),
                    _buildCodeBoxes(),
                    const SizedBox(height: 20),
                    _buildVerifyButton(),
                    const SizedBox(height: 20),
                    // ✅ خلي لوحة الأرقام تاخد باقي المساحة تحت
                    Expanded(child: _buildKeypad()),
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

  Widget _buildDoorIcon() {
    return Center(
      child: Container(
        width: 90, // رجعنا الحجم الكبير
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: _gold, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: _gold.withOpacity(0.2),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      children: [
        Text(
          'BLACK DOOR',
          style: TextStyle(
            color: _textWhite,
            fontSize: 22, // رجعنا الخط
            fontWeight: FontWeight.w900,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          AppLang.t('Enter Security Code'),
          style: TextStyle(
            color: _textWhite,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          '${AppLang.t('Code sent to')} ${AppLang.n('+973')}',
          style: TextStyle(color: _textGrey, fontSize: 10),
        ),
        const SizedBox(height: 6),
        Text(
          AppLang.n('00:${seconds.toString().padLeft(2, '0')}'),
          style: TextStyle(
            color: _gold,
            fontSize: 14,
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

  Widget _buildCodeBoxes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (i) {
        return Container(
          width: 42, // رجعنا المربعات
          height: 46,
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

  Widget _buildVerifyButton() {
    return SizedBox(
      width: double.infinity,
      height: 50, // كبرنا الزرار شوية
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _gold,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: _goToDis,
        child: Text(
          AppLang.t('Verify & Continue'),
          style: TextStyle(
            color: _blackBg,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildKeypad() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _gold.withOpacity(0.35), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // توزيع متساوي
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
    return Expanded( // تاخد مساحة متساوية
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
                  child: Icon(Icons.backspace_outlined, color: _textWhite, size: 20),
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

  Widget _buildWarning() {
    return Text(
      AppLang.t('Never share your code with anyone'),
      style: TextStyle(color: _gold, fontSize: 9),
    );
  }
}