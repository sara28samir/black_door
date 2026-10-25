import 'package:flutter/material.dart';

// ============================================================
// BLACK DOOR â€” Select User Page (Contacts)
// ============================================================

class SelectUserPage extends StatefulWidget {
  const SelectUserPage({super.key});

  @override
  State<SelectUserPage> createState() => _SelectUserPageState();
}

class _SelectUserPageState extends State<SelectUserPage> {
  // -------- COLORS --------
  final Color _blackBg = const Color(0xFF0A0A0A);
  final Color _cardBg = const Color(0xFF151515);
  final Color _gold = const Color(0xFFD4AF37);
  final Color _textWhite = const Color(0xFFF5F5F5);
  final Color _textGrey = const Color(0xFF8A8A8A);

  // -------- DUMMY DATA --------
  final List<Map<String, String>> dummyUsers = [
    {'name': 'Sarah Ahmed', 'status': 'Online', 'image': 'https://i.pravatar.cc/150?img=5'},
    {'name': 'Mohamed Ali', 'status': 'Last seen recently', 'image': 'https://i.pravatar.cc/150?img=11'},
    {'name': 'Layla Khaled', 'status': 'Busy', 'image': 'https://i.pravatar.cc/150?img=9'},
    {'name': 'Omar Hassan', 'status': 'Online', 'image': 'https://i.pravatar.cc/150?img=12'},
    {'name': 'Noura Youssef', 'status': 'Last seen recently', 'image': 'https://i.pravatar.cc/150?img=20'},
    {'name': 'Youssef Ibrahim', 'status': 'In a meeting', 'image': 'https://i.pravatar.cc/150?img=33'},
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
                  // 1. الشريط العلوي
                  _buildHeader(),

                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),

                          // 2. أزرار الإجراءات
                          _buildActionItem(
                            icon: Icons.group_add,
                            title: 'New Group',
                          ),
                          _buildActionItem(
                            icon: Icons.person_add_alt_1,
                            title: 'New Contact',
                            trailing: const Icon(Icons.qr_code, color: Color(0xFFD4AF37), size: 26),
                          ),
                          _buildActionItem(
                            icon: Icons.campaign,
                            title: 'Create Channel',
                          ),

                          const SizedBox(height: 25),

                          // 3. عنوان قسم المستخدمين
                          Text(
                            'BLACK DOOR USERS',
                            style: TextStyle(
                              color: _gold,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),

                          const SizedBox(height: 15),

                          // 4. قائمة المستخدمين
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: dummyUsers.length,
                            itemBuilder: (context, index) {
                              final user = dummyUsers[index];
                              return _buildUserItem(
                                name: user['name']!,
                                status: user['status']!,
                                imageUrl: user['image']!,
                              );
                            },
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
  // HEADER
  // ============================================================
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ----- المجموعة اليسرى (السهم + Select User) -----
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 1. السهم
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
              
              const SizedBox(width: 12),

              // 2. إطار Select User
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 3),
                decoration: BoxDecoration(
                  color: _cardBg,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: _gold, width: 1),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select User',
                      style: TextStyle(
                        color: _textWhite,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      'Users 45',
                      style: TextStyle(
                        color: _textWhite,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // ----- المجموعة اليمنى (3 نقط + البحث) -----
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 1. البحث (على الشمال)
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _cardBg,
                  border: Border.all(color: _gold, width: 1.2),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.search, color: Color(0xFFD4AF37), size: 18),
                  onPressed: () {},
                ),
              ),

              const SizedBox(width: 8), // مسافة بين البحث والـ 3 نقط

              // 2. الـ 3 نقط (على أقصى اليمين في دايرة)
              _buildMoreMenu(),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // MORE MENU (الـ 3 نقط في دايرة)
  // ============================================================
  Widget _buildMoreMenu() {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _cardBg,
        border: Border.all(color: _gold, width: 1.2),
      ),
      child: PopupMenuButton<String>(
        padding: EdgeInsets.zero,
        icon: const Icon(Icons.more_vert, color: Color(0xFFD4AF37), size: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: _gold.withOpacity(0.4)),
        ),
        color: _cardBg,
        onSelected: (value) {
          // أكشن لما يتم اختيار حاجة من القائمة
        },
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(
            value: 'blocked',
            child: Text('Blocked Users', style: TextStyle(color: _textWhite, fontSize: 14)),
          ),
          PopupMenuItem(
            value: 'invite',
            child: Text('Invite User', style: TextStyle(color: _textWhite, fontSize: 14)),
          ),
          PopupMenuItem(
            value: 'refresh',
            child: Text('Refresh', style: TextStyle(color: _textWhite, fontSize: 14)),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ACTION ITEM
  // ============================================================
  Widget _buildActionItem({
    required IconData icon,
    required String title,
    Widget? trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(15),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: _cardBg,
                shape: BoxShape.circle,
                border: Border.all(color: _gold.withOpacity(0.3), width: 1),
              ),
              child: Icon(icon, color: _gold, size: 22),
            ),
            const SizedBox(width: 15),
            Text(
              title,
              style: TextStyle(
                color: _textWhite,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );
  }

  // ============================================================
  // USER ITEM
  // ============================================================
  Widget _buildUserItem({
    required String name,
    required String status,
    required String imageUrl,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: _gold.withOpacity(0.6), width: 1.5),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15),
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: _textWhite,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    status,
                    style: TextStyle(
                      color: status == 'Online' ? _gold : _textGrey,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}