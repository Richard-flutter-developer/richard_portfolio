class AppConstants {
  static const String name = 'Richard S';
  static const String title = 'Flutter Developer';
  static const String phone = '+91 63853 95991';
  static const String email = 'richard20021999@gmail.com';
  static const String location = 'Tiruchirappalli, Tamil Nadu, India';
  static const String linkedIn = 'https://www.linkedin.com/in/richard-flutter-developer';
  static const String github = 'https://github.com/richard-s';
  static const String whatsApp = 'https://wa.me/916385395991';

  static const String summary =
      'Flutter Developer with 2+ years of professional experience building, '
      'shipping, and maintaining cross-platform mobile applications for Android '
      'and iOS using Flutter and Dart. Skilled in GetX, BLoC, and Provider state '
      'management, RESTful API integration, Firebase services, Razorpay payment '
      'gateway, and Google Maps API. Successfully shipped multiple production apps '
      'on the Apple App Store.';

  static const String aboutMe =
      "I'm a passionate Flutter Developer who loves turning ideas into beautiful, "
      "functional mobile applications. With expertise in Clean Architecture, MVVM "
      "design patterns, and Agile methodologies, I deliver production-grade apps "
      "that users love. I've successfully shipped multiple apps on the Apple App "
      "Store across Finance, Business, and Food & Drink categories.";

  static const List<Map<String, String>> stats = [
    {'count': '2+', 'label': 'Years\nExperience'},
    {'count': '6+', 'label': 'Projects\nDelivered'},
    {'count': '5+', 'label': 'Apps on\nApp Store'},
    {'count': '10+', 'label': 'Custom\nWidgets'},
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
      'name': 'La-Venjal',
      'subtitle': 'Water Delivery Platform',
      'period': 'Mar 2025 - Present',
      'tech': 'Flutter, Dart, GetX, Firebase, RESTful APIs, FCM',
      'status': 'Apple App Store (Live)',
      'points': [
        'Engineered two cross-platform Flutter apps for on-demand booking and delivery of drinking water.',
        'Customer App: GPS-based supplier discovery, order booking, real-time tracking, and push notifications.',
        'Vendor App: Order management dashboard, delivery assignment, inventory control.',
        'Launched both apps on the Apple App Store via App Store Connect.',
      ],
    },
    {
      'name': 'Aram Enterprises',
      'subtitle': 'Digital Chit Fund Management',
      'period': '2024 - Present',
      'tech': 'Flutter, Dart, GetX, Firebase, RESTful APIs',
      'status': 'Apple App Store - Finance (Live)',
      'points': [
        'Built a secure fintech app for chit fund management, digitizing group savings operations.',
        'Chit group tracking, installment management, auction workflows, and member administration.',
        'OTP authentication and role-based access control using Firebase Authentication.',
        'Deployed to the Apple App Store under the Finance category.',
      ],
    },
    {
      'name': 'CNI Business Forum',
      'subtitle': 'Professional Networking App',
      'period': '2024 - Present',
      'tech': 'Flutter, Dart, GetX, Firebase, RESTful APIs',
      'status': 'Apple App Store - Business (Live)',
      'points': [
        'Cross-platform networking app for entrepreneurs and professionals.',
        'Member discovery, referral exchange, community feeds, and real-time messaging.',
        'iPhone and iPad compatibility with iOS 13+ support.',
        'Maintained live production app with regular version releases.',
      ],
    },
    {
      'name': 'DMan',
      'subtitle': 'On-Demand E-Commerce App',
      'period': 'Jan 2024 - Dec 2024',
      'tech': 'Flutter, Dart, GetX, Firebase Realtime Database',
      'status': 'Completed',
      'points': [
        'Developed customer and merchant Flutter apps with real-time order tracking.',
        'Built 10+ reusable custom widgets, reducing UI build time by 30%.',
        'OTP authentication and role-based access control for multi-role users.',
      ],
    },
    {
      'name': 'Nalsuvai',
      'subtitle': 'B2C Grocery Delivery Ecosystem',
      'period': 'Mar 2025 - Jul 2025',
      'tech': 'Flutter, GetX, Google Maps, Razorpay, FCM',
      'status': '4 Mobile Applications',
      'points': [
        'Customer App: Product browsing, Razorpay checkout, real-time order tracking.',
        'Wholesaler App: Inventory management, sales analytics, payment-due reporting.',
        'Lineman App: GPS-based tracking, kilometer logging, sales dashboards.',
        'Deliveryman App: Google Maps route guidance, delivery assignment, proof-of-delivery.',
      ],
    },
    {
      'name': 'Ramesh Traders',
      'subtitle': 'B2B Wholesale Management',
      'period': 'May 2025 - Oct 2025',
      'tech': 'Flutter, Dart, GetX, Dio HTTP Client, RESTful APIs',
      'status': '3 Mobile Applications',
      'points': [
        'Wholesaler App: Paginated order processing, PDF invoice download, sales dashboard.',
        'Lineman App: Customer visit logging with GPS kilometer submission.',
        'Deliveryman App: Real-time delivery assignment, offline error-handling.',
        'Optimized API performance using Dio interceptors, reducing network errors by 35%.',
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
