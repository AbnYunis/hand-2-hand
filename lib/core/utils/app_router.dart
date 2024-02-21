import 'package:go_router/go_router.dart';
import 'package:hand2hand/features/Auth/presentation/views/create_as_view.dart';
import 'package:hand2hand/features/Auth/presentation/views/forget_pass_view.dart';
import 'package:hand2hand/features/Auth/presentation/views/register_view.dart';
import 'package:hand2hand/features/Auth/presentation/views/verify_view.dart';
import 'package:hand2hand/features/home/views/campaign_details_view.dart';
import 'package:hand2hand/features/home/views/home_view.dart';
import 'package:hand2hand/features/on_boarding/views/on_boarding.dart';
import '../../features/Auth/presentation/views/login_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const firstPage = '/';
  static const onBoarding = '/onBoarding';
  static const login = '/login';
  static const forgetPass = '/forgetPass';
  static const verify = '/verify';
  static const createAs='/createAs';
  static const register='/register';
  static const home='/home';
  static const campaign='/campaign';


  static final router = GoRouter(
    routes: [
      GoRoute(
        path: firstPage,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: onBoarding,
        builder: (context, state) => const OnBoarding(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: forgetPass,
        builder: (context, state) => const ForgetPassView(),
      ),
      GoRoute(
        path: verify,
        builder: (context, state) => const VerifyView(),
      ),
      GoRoute(
        path: createAs,
        builder: (context, state) => const CreateAsView(),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomeView(),
      ),GoRoute(
        path: campaign,
        builder: (context, state) => const CampaignDetailsView(),
      ),
    ],
  );
}
