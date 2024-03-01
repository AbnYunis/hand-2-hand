import 'package:go_router/go_router.dart';
import 'package:hand2hand/features/Auth/presentation/views/create_as_view.dart';
import 'package:hand2hand/features/Auth/presentation/views/forget_pass_view.dart';
import 'package:hand2hand/features/Auth/presentation/views/register_view.dart';
import 'package:hand2hand/features/Auth/presentation/views/verify_view.dart';
import 'package:hand2hand/features/donate/presentation/views/congratulation_view.dart';
import 'package:hand2hand/features/donate/presentation/views/donate_view.dart';
import 'package:hand2hand/features/explore_charities/presentation/views/explore_charities_view.dart';
import 'package:hand2hand/features/history/presentation/views/history_view.dart';
import 'package:hand2hand/features/history/presentation/views/track_donation_view.dart';
import 'package:hand2hand/features/home/presentation/views/campaign_details_view.dart';
import 'package:hand2hand/features/home/presentation/views/home_view.dart';

import 'package:hand2hand/features/on_boarding/views/on_boarding.dart';
import 'package:hand2hand/features/profile/presentation/views/edit_profile_view.dart';
import 'package:hand2hand/features/profile/presentation/views/profile_view.dart';
import 'package:hand2hand/features/volunteer/views/volunteer_view.dart';
import '../../features/Auth/presentation/views/login_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const firstPage = '/';
  static const onBoarding = '/onBoarding';
  static const login = '/login';
  static const forgetPass = '/forgetPass';
  static const verify = '/verify';
  static const createAs = '/createAs';
  static const register = '/register';
  static const home = '/home';
  static const campaign = '/campaign';
  static const exploreCharities = '/exploreCharities';
  static const donate = '/donate';
  static const congratulation = '/congratulation';
  static const volunteer = '/volunteer';
  static const profile = '/profile';
  static const editProfile = '/editProfile';
  static const history = '/history';
  static const trackDonation = '/trackDonation';

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
      ),
      GoRoute(
        path: campaign,
        builder: (context, state) => const CampaignDetailsView(),
      ),
      GoRoute(
        path: exploreCharities,
        builder: (context, state) => const ExploreCharitiesView(),
      ),
      GoRoute(
        path: donate,
        builder: (context, state) => const DonateView(),
      ),
      GoRoute(
        path: congratulation,
        builder: (context, state) => const CongratulationView(),
      ),
      GoRoute(
        path: volunteer,
        builder: (context, state) => const VolunteerView(),
      ),
      GoRoute(
        path: profile,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: editProfile,
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        path: history,
        builder: (context, state) => const HistoryView(),
      ),
      GoRoute(
        path: trackDonation,
        builder: (context, state) => const TrackDonationView(),
      ),
    ],
  );
}
