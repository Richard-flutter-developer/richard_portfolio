class AppConstants {
  static const String name = 'Richard S';
  static const String title = 'Flutter Developer';
  static const String phone = '+91 63853 95991';
  static const String email = 'richard20021999@gmail.com';
  static const String location = 'Tiruchirappalli, Tamil Nadu, India';
  static const String linkedIn =
      'https://www.linkedin.com/in/richard-flutter-developer';
  static const String github = 'https://github.com/Richard-flutter-developer';
  static const String whatsApp = 'https://wa.me/916385395991';

  static const String summary =
      'Flutter Developer with 2+ years of experience building 15+ production apps, '
      'including 6 on the Apple App Store and 9 on the Google Play Store. '
      'Expertise in GetX, BLoC, RESTful APIs, and Firebase integration across '
      'Finance, Business, and E-commerce ecosystems.';

  static const String aboutMe =
      "I'm a passionate Flutter Developer who loves turning ideas into beautiful, "
      "functional mobile applications. With expertise in Clean Architecture, MVVM "
      "design patterns, and 2+ years of experience, I've successfully shipped "
      "6 apps on the Apple App Store and 9 on the Google Play Store across "
      "Finance, Business, and Food & Drink categories.";

  static const List<Map<String, String>> stats = [
    {'count': '2+', 'label': 'Years\nExperience'},
    {'count': '15+', 'label': 'Apps\nDelivered'},
    {'count': '6', 'label': 'Apps on\nApp Store'},
    {'count': '9', 'label': 'Apps on\nPlay Store'},
  ];

  static const Map<String, List<String>> skills = {
    'Mobile Development': [
      'Flutter',
      'Dart',
      'Android SDK',
      'iOS SDK',
      'Xcode',
      'Android Studio',
      'Cross-Platform',
    ],
    'State Management': [
      'GetX',
      'BLoC',
      'Provider',
      'Riverpod',
      'MVVM',
      'MVC',
      'Clean Architecture',
    ],
    'Backend & APIs': [
      'RESTful APIs',
      'JSON',
      'HTTP',
      'Dio',
      'Firebase',
      'Cloud Firestore',
      'Firebase Auth',
      'Firebase Cloud Messaging',
    ],
    'Payments & Maps': [
      'Razorpay',
      'Google Maps API',
      'GPS Integration',
      'Location Services',
    ],
    'Local Storage': ['SQLite', 'Hive', 'SharedPreferences', 'Secure Storage'],
    'Tools & DevOps': [
      'Git',
      'GitHub',
      'VS Code',
      'Postman',
      'Firebase Console',
      'App Store Connect',
      'Google Play Console',
      'CI/CD',
    ],
    'UI & Design': [
      'Material Design',
      'Cupertino Widgets',
      'Custom Widgets',
      'Responsive UI',
      'Pixel-Perfect Layouts',
      'Figma',
    ],
    'Testing & Quality': [
      'Unit Testing',
      'Widget Testing',
      'Integration Testing',
      'Debugging',
      'Performance Optimization',
    ],
  };

  static const List<Map<String, dynamic>> experiences = [
    {
      'role': 'Flutter Developer',
      'company': 'Ocean Software Technologies Pvt Ltd',
      'location': 'Chennai, India',
      'period': 'Jan 2025 - Present',
      'points': [
        'Architect and deploy cross-platform Flutter applications for Android and iOS, delivering scalable solutions that boosted client app load times by up to 30%.',
        'Translate Figma wireframes into pixel-perfect responsive Flutter widgets using Material Design and Cupertino components.',
        'Integrate Razorpay payment gateway and OTP authentication into production Flutter apps, enabling secure transactions for 1,000+ end-users.',
        'Manage full SDLC independently including requirement gathering, development, QA, and App Store Connect deployment.',
        'Apply GetX state management and Clean Architecture principles, reducing bug resolution time by 20%.',
      ],
    },
    {
      'role': 'Junior Flutter Developer',
      'company': 'Quadkast Technologies Pvt Ltd',
      'location': 'Chennai, India',
      'period': 'Jul 2023 - Nov 2024',
      'points': [
        'Built and maintained cross-platform Flutter applications, developing 10+ reusable custom widgets that enhanced rendering performance.',
        'Integrated Firebase Cloud Messaging, social media SDKs, and third-party pub.dev packages for push notifications.',
        'Collaborated with backend developers to consume and optimize RESTful API endpoints using Dio, reducing response-handling errors by 40%.',
        'Performed code reviews, resolved 50+ defects, and strengthened app stability to achieve crash-free session rate above 95%.',
        'Participated in Agile/Scrum ceremonies including sprint planning, daily stand-ups, and retrospectives.',
      ],
    },
  ];

  static const List<Map<String, dynamic>> projects = [
    {
      'name': 'Star Business Forum',
      'subtitle': 'Professional Networking Ecosystem',
      'period': 'Mar 2026 - Present',
      'tech': 'Flutter, Dart, RESTful APIs, Business Networking',
      'status': 'App Store & Play Store (Live)',
      'image': 'assets/projects/star_business.png',
      'playStoreUrl':
          'https://play.google.com/store/apps/details?id=com.starbusiness.starapp',
      'appStoreUrl':
          'https://apps.apple.com/in/app/star-business-forum/id6761415913',
      'images': [
        'assets/projects/star_forum/splash.png',
        'assets/projects/star_forum/login.png',
        'assets/projects/star_forum/dashboard.png',
        'assets/projects/star_forum/notifications.png',
        'assets/projects/star_forum/search.png',
      ],
      'points': [
        'Premium networking ecosystem with tiered membership (Platinum, Gold) and business performance tracking.',
        'Member Dashboard: Comprehensive view of 121s, referrals, visitors, and business transaction values.',
        'Real-time Notifications: Instant alerts for community badges, meeting requests, and referral activity.',
        'Smart Networking: Map-based member discovery and automated notification system for community updates.',
      ],
    },
    {
      'name': 'La-Venjal',
      'subtitle': 'Water Delivery Platform',
      'period': 'Mar 2025 - Present',
      'tech': 'Flutter, Dart, GetX, Firebase, RESTful APIs, FCM',
      'status': 'App Store & Play Store (Live)',
      'image': 'assets/projects/lavenjal.png',
      'playStoreUrl':
          'https://play.google.com/store/apps/details?id=com.lavenjal.user.la_venjal',
      'appStoreUrl':
          'https://apps.apple.com/in/app/la-venjal/id6761256772',
      'subApps': [
        {
          'name': 'La-Venjal Customer',
          'playStoreUrl':
              'https://play.google.com/store/apps/details?id=com.lavenjal.user.la_venjal',
          'appStoreUrl':
              'https://apps.apple.com/in/app/la-venjal/id6761256772',
        },
        {
          'name': 'Lavenjal Vendor',
          'playStoreUrl':
              'https://play.google.com/store/apps/details?id=com.lavenjal.lavenjal_vendor',
          'appStoreUrl':
              'https://apps.apple.com/in/app/lavenjal-vendor/id6761259545',
        },
      ],
      'images': [
        'assets/projects/lavenjal_screens/splash.png',
        'assets/projects/lavenjal_screens/product.png',
        'assets/projects/lavenjal_screens/shop.png',
        'assets/projects/lavenjal_screens/wishlist.png',
        'assets/projects/lavenjal_screens/orders.png',
        'assets/projects/lavenjal_vendor/dashboard.png',
        'assets/projects/lavenjal_vendor/insights.png',
        'assets/projects/lavenjal_vendor/history.png',
      ],
      'points': [
        'End-to-end water delivery ecosystem featuring high-performance Customer and Vendor applications.',
        'Customer App: Features seamless product discovery, real-time tracking, and automated order updates.',
        'Vendor App: Comprehensive order management with a dashboard for active tasks and a detailed delivery history.',
        'Performance Insights: Advanced analytics for vendors to track delivery stats and business growth metrics.',
      ],
    },
    {
      'name': 'Aram Enterprises',
      'subtitle': 'Digital Chit Fund Management',
      'period': '2024 - Present',
      'tech': 'Flutter, Dart, GetX, Firebase, RESTful APIs',
      'status': 'App Store & Play Store - Finance (Live)',
      'image': 'assets/projects/aram.png',
      'playStoreUrl':
          'https://play.google.com/store/apps/details?id=com.aram_enterprises.chits_app',
      'appStoreUrl':
          'https://apps.apple.com/in/app/aram-enterprises/id6760998577',
      'images': [
        'assets/projects/aram_screens/splash.png',
        'assets/projects/aram_screens/login.png',
        'assets/projects/aram_screens/dashboard.png',
        'assets/projects/aram_screens/plans.png',
        'assets/projects/aram_screens/kyc.png',
      ],
      'points': [
        'Secure fintech platform for digitized chit fund management and group savings.',
        'Features real-time payment tracking, upcoming installment alerts, and auction management.',
        'Implemented a robust KYC verification system with PAN and Aadhaar document upload capabilities.',
        'Transparent ledger system with 100% record tracking for member contributions and distributions.',
      ],
    },
    {
      'name': 'CNI Business Forum',
      'subtitle': 'Professional Networking App',
      'period': '2024 - Present',
      'tech': 'Flutter, Dart, GetX, Firebase, RESTful APIs',
      'status': 'App Store & Play Store - Business (Live)',
      'image': 'assets/projects/cni.png',
      'playStoreUrl':
          'https://play.google.com/store/apps/details?id=com.cni.business',
      'appStoreUrl':
          'https://apps.apple.com/in/app/cni-business-forum/id6760016066',
      'images': [
        'assets/projects/cni_forum/splash.png',
        'assets/projects/cni_forum/dashboard.png',
        'assets/projects/cni_forum/performance.png',
        'assets/projects/cni_forum/updates.png',
        'assets/projects/cni_forum/search.png',
        'assets/projects/cni_forum/profile.png',
      ],
      'points': [
        'A comprehensive networking platform for construction professionals to connect, refer, and grow.',
        'Member Dashboard: Smart overview of contribution points, upcoming meetings, and business transactions.',
        'Admin Hub: Integrated tools for attendance marking, meeting creation, and chief guest list management.',
        'Smart Member Search: Location-based discovery and category filters for finding nearby business partners.',
      ],
    },
    {
      'name': 'D-Man Store Partner',
      'subtitle': 'On-Demand Multi-Vendor Merchant App',
      'period': 'Jan 2024 - Present',
      'tech': 'Flutter, Dart, GetX, Firebase Realtime Database, FCM',
      'status': 'Google Play Store (Live)',
      'image': 'assets/projects/dman.png',
      'playStoreUrl':
          'https://play.google.com/store/apps/details?id=com.dman.merchant',
      'appStoreUrl': null,
      'images': [
        'assets/projects/dman_merchant/splash.png',
        'assets/projects/dman_merchant/insights.png',
        'assets/projects/dman_merchant/menus.png',
        'assets/projects/dman_merchant/stores.png',
        'assets/projects/dman_merchant/plans.png',
        'assets/projects/dman_merchant/settings.png',
      ],
      'points': [
        'Comprehensive Merchant application for store partners to manage digital presence and daily sales.',
        'Merchant Dashboard: Real-time insights into today\'s sales, weekly growth, and monthly performance metrics.',
        'Subscription Management: Integrated tiered plans (Basic, Advance, Boost) for partner flexibility.',
        'Sales Analytics: Advanced tracking of total orders, on-time deliveries, and fast-selling items with detailed summaries.',
      ],
    },
    {
      'name': 'Ramesh Traders',
      'subtitle': 'B2B Wholesale Management',
      'period': 'May 2025 - Oct 2025',
      'tech': 'Flutter, Dart, GetX, Dio HTTP Client, RESTful APIs',
      'status': 'Google Play Store (Live - 3 Apps)',
      'image': 'assets/projects/ramesh_traders.png',
      'playStoreUrl':
          'https://play.google.com/store/apps/details?id=com.ocean.ramesh_traders_wholesaler',
      'appStoreUrl': null,
      'subApps': [
        {
          'name': 'Wholesaler',
          'playStoreUrl':
              'https://play.google.com/store/apps/details?id=com.ocean.ramesh_traders_wholesaler',
          'appStoreUrl': null,
        },
        {
          'name': 'Lineman',
          'playStoreUrl':
              'https://play.google.com/store/apps/details?id=com.ocean.ramesh_trader_lineman_app',
          'appStoreUrl': null,
        },
        {
          'name': 'Delivery Man',
          'playStoreUrl':
              'https://play.google.com/store/apps/details?id=com.ocean.ramesh_trader_deliveryman',
          'appStoreUrl': null,
        },
      ],
      'images': [
        'assets/projects/ramesh_wholesaler/home.png',
        'assets/projects/ramesh_wholesaler/category.png',
        'assets/projects/ramesh_wholesaler/order_again.png',
        'assets/projects/ramesh_wholesaler/search.png',
        'assets/projects/ramesh_lineman/dashboard.png',
        'assets/projects/ramesh_lineman/kilometer.png',
        'assets/projects/ramesh_deliveryman/dashboard.png',
        'assets/projects/ramesh_deliveryman/list.png',
      ],
      'points': [
        'A triple-app ecosystem (Wholesaler, Lineman, Deliveryman) for a comprehensive grocery supply chain.',
        'Wholesaler App: Features organized category views, advanced search, and favorites reordering.',
        'Lineman App: Integrated travel tracking and smart dashboard for field sales operations.',
        'Deliveryman App: Advanced task dashboard for managing deliveries, payment collections, returns, and vehicle compliance.',
      ],
    },
    {
      'name': 'Nalsuvai',
      'subtitle': 'B2C Grocery Delivery Ecosystem',
      'period': 'Mar 2025 - Jul 2025',
      'tech': 'Flutter, GetX, Google Maps, Razorpay, FCM',
      'status': '4 Mobile Applications',
      'image': null,
      'images': [],
      'points': [
        'Customer App: Product browsing, Razorpay checkout, and real-time order tracking.',
        'Wholesaler App: Inventory management, sales analytics, and payment-due reporting.',
        'Lineman App: GPS-based tracking, kilometer logging, and field sales dashboards.',
        'Deliveryman App: Google Maps route guidance, delivery assignment, and proof-of-delivery.',
      ],
    },
  ];

  static const Map<String, String> education = {
    'degree': 'Bachelor of Commerce in Bank Management',
    'institution': 'Urumu Dhanalakshmi College',
    'location': 'Tiruchirappalli, Tamil Nadu',
    'period': 'Jun 2020 - May 2023',
  };
}
