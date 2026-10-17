// ============================================================
// BLACK DOOR — Language Manager
// ============================================================

class AppLang {
  // -------- CURRENT LANGUAGE --------
  // 'en' = English, 'ar' = Arabic
  static String currentLang = 'en';

  // -------- TRANSLATIONS --------
  static final Map<String, Map<String, String>> _translations = {
    'en': {
      // ============ WELCOME PAGE ============
      'ENCRYPTED NETWORK': 'ENCRYPTED NETWORK',
      'Language': 'Language',
      'WELCOME TO': 'WELCOME TO',
      'BLACK DOOR': 'BLACK DOOR',
      'PRIVATE - SECURE - ELEGANT': 'PRIVATE - SECURE - ELEGANT',
      'Confidential Messaging': 'Confidential Messaging',
      'Self-destructing whispers & zero-knowledge channels':
          'Self-destructing whispers & zero-knowledge channels',
      'Ultra-Secure HD Calling': 'Ultra-Secure HD Calling',
      'Encrypted voice & video without call log traces':
          'Encrypted voice & video without call log traces',
      'Enter Black Door': 'Enter Black Door',
      'Invitational & verified cipher access only':
          'Invitational & verified cipher access only',

      // ============ PHONE PAGE ============
      'Confidential circles. Beyond the door.':
          'Confidential circles. Beyond the door.',
      'PRIVATE CIPHER PROTOCOL': 'PRIVATE CIPHER PROTOCOL',
      'Step Behind the Door': 'Step Behind the Door',
      'Enter your phone number to receive a 6-digit access code. No emails, no public directories.':
          'Enter your phone number to receive a 6-digit access code. No emails, no public directories.',
      'Enter phone...': 'Enter phone...',
      'Send Code': 'Send Code',
      'User data is never leaked': 'User data is never leaked',

      // ============ OTP PAGE ============
      'Enter Security Code': 'Enter Security Code',
      'Code sent to': 'Code sent to',
      'Resend Code': 'Resend Code',
      'Verify & Continue': 'Verify & Continue',
      'CLEAR': 'CLEAR',
      'Never share your code with anyone':
          'Never share your code with anyone',

      // ============ DISCOVER PAGE ============
      'IDENTITY PROTOCOL': 'IDENTITY PROTOCOL',
      'Privacy Preferences': 'Privacy Preferences',
      'How would you like people\nto find you?':
          'How would you like people\nto find you?',
      'You hold total control over who sees your door.':
          'You hold total control over who sees your door.',
      'Show my username instead': 'Show my username instead',
      'Your phone number is strictly shielded; people find you solely by @username.':
          'Your phone number is strictly shielded; people find you solely by @username.',
      'Show my phone number': 'Show my phone number',
      'Others find your identity directly via your verified phone.':
          'Others find your identity directly via your verified phone.',
      'Show both username & phone': 'Show both username & phone',
      'Full flexibility; people can find you both ways.':
          'Full flexibility; people can find you both ways.',
      'RECOMMENDED': 'RECOMMENDED',
      'Enter': 'Enter',

      // ============ NAME PAGE ============
      'CREATE YOUR IDENTITY': 'CREATE YOUR IDENTITY',
      'Choose your handle and set up your bio with live validation.':
          'Choose your handle and set up your bio with live validation.',
      'You must use your own unique username.':
          'You must use your own unique username.',
      'Enter Username': 'Enter Username',
      'Already Taken': 'Already Taken',
      'is already claimed. Pick an alternative:':
          'is already claimed. Pick an alternative:',
      'ENTER': 'ENTER',

      // ============ TWO PAGE ============
      'Phone Number': 'Phone Number',
      'Already Verified': 'Already Verified',
      'Verified': 'Verified',
      'Privacy is not a luxury, it is a right.':
          'Privacy is not a luxury, it is a right.',

      // ============ CHAT PAGE ============
      'Search conversations or handles': 'Search conversations or handles',
      'Your Story': 'Your Story',
      'Chats': 'Chats',
      'Story': 'Story',
      'Calls': 'Calls',
      'Profile': 'Profile',
      'New Group': 'New Group',
      'Mass Messages': 'Mass Messages',
      'Favorites': 'Favorites',
      'Settings': 'Settings',
      'Coming Soon': 'Coming Soon',

      // ============ COUNTRIES ============
      'Bahrain': 'Bahrain',
      'Saudi Arabia': 'Saudi Arabia',
      'UAE': 'UAE',
      'Kuwait': 'Kuwait',
      'Qatar': 'Qatar',
      'Oman': 'Oman',
      'Egypt': 'Egypt',
      'Jordan': 'Jordan',
      'Lebanon': 'Lebanon',
      'Syria': 'Syria',
      'Iraq': 'Iraq',
      'Palestine': 'Palestine',
      'Yemen': 'Yemen',
      'Sudan': 'Sudan',
      'Libya': 'Libya',
      'Tunisia': 'Tunisia',
      'Algeria': 'Algeria',
      'Morocco': 'Morocco',
      'Mauritania': 'Mauritania',
      'Somalia': 'Somalia',
      'Djibouti': 'Djibouti',
      'Comoros': 'Comoros',
      'USA': 'USA',
      'UK': 'UK',
      'France': 'France',
      'Germany': 'Germany',
      'Turkey': 'Turkey',
      'China': 'China',
      'Japan': 'Japan',
      'South Korea': 'South Korea',
      'India': 'India',
      'Pakistan': 'Pakistan',
      'Philippines': 'Philippines',
      'Indonesia': 'Indonesia',
      'Malaysia': 'Malaysia',
      'Thailand': 'Thailand',
      'Vietnam': 'Vietnam',
      'Singapore': 'Singapore',
      'Australia': 'Australia',
      'South Africa': 'South Africa',
      'Italy': 'Italy',
      'Spain': 'Spain',
      'Russia': 'Russia',
    },

    'ar': {
      // ============ WELCOME PAGE ============
      'ENCRYPTED NETWORK': 'شبكة مشفرة',
      'Language': 'اللغة',
      'WELCOME TO': 'مرحباً بك في',
      'BLACK DOOR': 'BLACK DOOR',
      'PRIVATE - SECURE - ELEGANT': 'خاص - آمن - أنيق',
      'Confidential Messaging': 'مراسلة سرية',
      'Self-destructing whispers & zero-knowledge channels':
          'رسائل تدمير ذاتي وقنوات بلا معرفة',
      'Ultra-Secure HD Calling': 'مكالمات عالية الدقة فائقة الأمان',
      'Encrypted voice & video without call log traces':
          'صوت وفيديو مشفر بدون سجلات مكالمات',
      'Enter Black Door': 'دخول بلاك دور',
      'Invitational & verified cipher access only':
          'دخول بدعوة ورمز تحقق فقط',

      // ============ PHONE PAGE ============
      'Confidential circles. Beyond the door.':
          'دوائر سرية. خلف الباب.',
      'PRIVATE CIPHER PROTOCOL': 'بروتوكول التشفير الخاص',
      'Step Behind the Door': 'اخطُ خلف الباب',
      'Enter your phone number to receive a 6-digit access code. No emails, no public directories.':
          'أدخل رقم هاتفك لاستلام رمز مكوّن من 6 أرقام. بدون إيميلات أو أدلة عامة.',
      'Enter phone...': 'أدخل رقم الهاتف...',
      'Send Code': 'إرسال الرمز',
      'User data is never leaked': 'لا يتم تسريب بيانات المستخدم',

      // ============ OTP PAGE ============
      'Enter Security Code': 'أدخل رمز الأمان',
      'Code sent to': 'تم إرسال الرمز إلى',
      'Resend Code': 'إعادة إرسال الرمز',
      'Verify & Continue': 'تحقق واستمر',
      'CLEAR': 'مسح',
      'Never share your code with anyone':
          'لا تشارك رمزك مع أي شخص',

      // ============ DISCOVER PAGE ============
      'IDENTITY PROTOCOL': 'بروتوكول الهوية',
      'Privacy Preferences': 'تفضيلات الخصوصية',
      'How would you like people\nto find you?':
          'كيف تريد أن يجدك\nالأشخاص الآخرون؟',
      'You hold total control over who sees your door.':
          'أنت تتحكم بالكامل في من يرى بابك.',
      'Show my username instead': 'إظهار اسم المستخدم بدلاً من الرقم',
      'Your phone number is strictly shielded; people find you solely by @username.':
          'رقم هاتفك محمي تماماً؛ يجدك الآخرون باسم المستخدم @ فقط.',
      'Show my phone number': 'إظهار رقم هاتفي',
      'Others find your identity directly via your verified phone.':
          'يجد الآخرون هويتك مباشرة عبر هاتفك الموثق.',
      'Show both username & phone': 'إظهار اسم المستخدم والهاتف معاً',
      'Full flexibility; people can find you both ways.':
          'مرونة كاملة؛ يمكن للآخرين إيجادك بالطريقتين.',
      'RECOMMENDED': 'موصى به',
      'Enter': 'دخول',

      // ============ NAME PAGE ============
      'CREATE YOUR IDENTITY': 'أنشئ هويتك',
      'Choose your handle and set up your bio with live validation.':
          'اختر اسمك وأعدّ نبذتك مع التحقق المباشر.',
      'You must use your own unique username.':
          'يجب عليك استخدام يوزر نيم خاص بك غير مكرر.',
      'Enter Username': 'أدخل اسم المستخدم',
      'Already Taken': 'مستخدم بالفعل',
      'is already claimed. Pick an alternative:':
          'مستخدم بالفعل. اختر بديلاً:',
      'ENTER': 'دخول',

      // ============ TWO PAGE ============
      'Phone Number': 'رقم الهاتف',
      'Already Verified': 'تم التحقق بالفعل',
      'Verified': 'تم التحقق',
      'Privacy is not a luxury, it is a right.':
          'الخصوصية ليست رفاهية، بل حق.',

      // ============ CHAT PAGE ============
      'Search conversations or handles': 'ابحث في المحادثات أو المعرفات',
      'Your Story': 'قصتك',
      'Chats': 'الدردشات',
      'Story': 'القصص',
      'Calls': 'المكالمات',
      'Profile': 'الملف الشخصي',
      'New Group': 'مجموعة جديدة',
      'Mass Messages': 'رسائل جماعية',
      'Favorites': 'المميزة',
      'Settings': 'الإعدادات',
      'Coming Soon': 'قريباً',

      // ============ COUNTRIES ============
      'Bahrain': 'البحرين',
      'Saudi Arabia': 'السعودية',
      'UAE': 'الإمارات',
      'Kuwait': 'الكويت',
      'Qatar': 'قطر',
      'Oman': 'عُمان',
      'Egypt': 'مصر',
      'Jordan': 'الأردن',
      'Lebanon': 'لبنان',
      'Syria': 'سوريا',
      'Iraq': 'العراق',
      'Palestine': 'فلسطين',
      'Yemen': 'اليمن',
      'Sudan': 'السودان',
      'Libya': 'ليبيا',
      'Tunisia': 'تونس',
      'Algeria': 'الجزائر',
      'Morocco': 'المغرب',
      'Mauritania': 'موريتانيا',
      'Somalia': 'الصومال',
      'Djibouti': 'جيبوتي',
      'Comoros': 'جزر القمر',
      'USA': 'أمريكا',
      'UK': 'بريطانيا',
      'France': 'فرنسا',
      'Germany': 'ألمانيا',
      'Turkey': 'تركيا',
      'China': 'الصين',
      'Japan': 'اليابان',
      'South Korea': 'كوريا الجنوبية',
      'India': 'الهند',
      'Pakistan': 'باكستان',
      'Philippines': 'الفلبين',
      'Indonesia': 'إندونيسيا',
      'Malaysia': 'ماليزيا',
      'Thailand': 'تايلاند',
      'Vietnam': 'فيتنام',
      'Singapore': 'سنغافورة',
      'Australia': 'أستراليا',
      'South Africa': 'جنوب أفريقيا',
      'Italy': 'إيطاليا',
      'Spain': 'إسبانيا',
      'Russia': 'روسيا',
    },
  };

  // -------- TRANSLATE FUNCTION --------
  static String t(String key) {
    return _translations[currentLang]?[key] ?? key;
  }

  // -------- CHANGE LANGUAGE --------
  static void setLang(String langCode) {
    currentLang = langCode;
  }

  // -------- CHECK IF ARABIC --------
  static bool get isArabic => currentLang == 'ar';

  // -------- CONVERT NUMBERS TO ARABIC --------
  static String n(String input) {
    if (!isArabic) return input;
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    String result = input;
    for (int i = 0; i < english.length; i++) {
      result = result.replaceAll(english[i], arabic[i]);
    }
    return result;
  }
}