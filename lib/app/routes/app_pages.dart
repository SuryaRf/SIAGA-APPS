import 'package:get/get.dart';

import '../modules/chat_page/bindings/chat_page_binding.dart';
import '../modules/chat_page/views/chat_page_view.dart';
import '../modules/comunitty/views/comunitty_view.dart';
import '../modules/consultation/bindings/consultation_binding.dart';
import '../modules/consultation/views/consultation_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/navigation_bar/bindings/navigation_bar_binding.dart';
import '../modules/navigation_bar/views/navigation_bar_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NAVIGATION_BAR;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION_BAR,
      page: () => NavigationBarView(),
      binding: NavigationBarBinding(),
    ),
    GetPage(
      name: '/chat-page',
      page: () => ChatPage(),
      binding: ChatPageBinding(),
    ),
    GetPage(
      name: _Paths.CONSULTATION,
      page: () => const ConsultationView(),
      binding: ConsultationBinding(),
    ),
  ];
}
