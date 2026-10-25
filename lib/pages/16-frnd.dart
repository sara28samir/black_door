import 'package:flutter/material.dart';

// ============================================================
// BLACK DOOR - Invite & Earn Page (16-frnd.dart)
// ============================================================

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  // -------- COLORS --------
  final Color _blackBg = const Color(0xFF0A0A0A);
  final Color _cardBg = const Color(0xFF151515);
  final Color _gold = const Color(0xFFD4AF37);
  final Color _textWhite = const Color(0xFFF5F5F5);
  final Color _textGrey = const Color(0xFF8A8A8A);

  // -------- STATE (Dummy Data) --------
  int _currentInvites = 4; 
  final int _maxInvites = 18;

  // -------- DATA (Rewards System) --------
  final List<Map<String, dynamic>> _milestones = [
    {'invites': 3, 'days': 3, 'title': 'Starter Key'},
    {'invites': 6, 'days': 5, 'title': 'Silver Access'},
    {'invites': 9, 'days': 7, 'title': 'Gold Access'},
    {'invites': 12, 'days': 10, 'title': 'Platinum Access'},
    {'invites': 15, 'days': 12, 'title': 'Diamond Access'},
    {'invites': 18, 'days': 15, 'title': 'VIP Legend'},
  ];

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
              textDirection: TextDirection.ltr,
              child: Column(
                children: [
                  // 1. Top Bar
                  _buildTopBar(),

                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),

                          // 2. Hero Card
                          _buildHeroCard(),

                          const SizedBox(height: 20),

                          // 3. Invite Button
                          _buildInviteButton(),

                          const SizedBox(height: 30),

                          // 4. Rewards Title
                          Text(
                            'MONTHLY REWARDS',
                            style: TextStyle(
                              color: _gold,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 15),

                          // 5. Rewards List
                          ..._milestones.map((m) => _buildMilestoneItem(m)).toList(),

                          const SizedBox(height: 20),

                          // 6. Renewal Note
                          Center(
                            child: Text(
                              'Rewards reset on the 1st of every month.',
                              style: TextStyle(
                                color: _textGrey,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
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
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: _cardBg,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: _gold.withOpacity(0.5), width: 1.2),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xFFD4AF37),
                size: 16,
              ),
            ),
          ),
          const SizedBox(width: 15),
          
          // Text inside golden border
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: _cardBg,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _gold, width: 1.2),
            ),
            child: const Text(
              'Invite & Earn',
              style: TextStyle(
                color: Colors.white, // White color text
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // HERO CARD
  // ============================================================
  Widget _buildHeroCard() {
    double progress = _currentInvites / _maxInvites;
    
    int nextTarget = 3;
    int nextDays = 3;
    for (var m in _milestones) {
      if (_currentInvites < m['invites']) {
        nextTarget = m['invites'];
        nextDays = m['days'];
        break;
      }
    }
    int remaining = nextTarget - _currentInvites;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: _gold.withOpacity(0.5), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: _gold.withOpacity(0.05),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Progress Ring
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 10,
                  backgroundColor: _blackBg,
                  valueColor: AlwaysStoppedAnimation<Color>(_gold),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$_currentInvites',
                    style: TextStyle(
                      color: _gold,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '/ $_maxInvites',
                    style: TextStyle(
                      color: _textGrey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // Texts
          Text(
            'Invite Friends',
            style: TextStyle(
              color: _textWhite,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            remaining > 0
                ? 'Invite $remaining more to unlock $nextDays Days VIP.'
                : 'You unlocked all rewards this month!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: _textGrey,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // INVITE BUTTON
  // ============================================================
  Widget _buildInviteButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _gold,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5,
          shadowColor: _gold.withOpacity(0.4),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.share, color: Color(0xFF0A0A0A), size: 20),
            const SizedBox(width: 10),
            Text(
              'Send Invite Link',
              style: TextStyle(
                color: _blackBg,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // MILESTONE ITEM
  // ============================================================
  Widget _buildMilestoneItem(Map<String, dynamic> milestone) {
    int requiredInvites = milestone['invites'];
    int days = milestone['days'];
    String title = milestone['title'];

    bool isCompleted = _currentInvites >= requiredInvites;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
          color: isCompleted ? _gold.withOpacity(0.1) : _cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isCompleted ? _gold : _gold.withOpacity(0.2),
            width: isCompleted ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted ? _gold : _blackBg,
                border: Border.all(color: _gold, width: 1.5),
              ),
              child: Icon(
                isCompleted ? Icons.check : Icons.card_giftcard,
                color: isCompleted ? _blackBg : _gold,
                size: 22,
              ),
            ),
            
            const SizedBox(width: 15),
            
            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isCompleted ? _gold : _textWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Invite $requiredInvites friends',
                    style: TextStyle(
                      color: _textGrey,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            
            // Reward
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$days Days',
                  style: TextStyle(
                    color: _gold,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'VIP',
                  style: TextStyle(
                    color: _textGrey,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}