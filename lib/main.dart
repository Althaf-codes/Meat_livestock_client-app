import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mq/Admin/screens/admin_allorders_screen.dart';
import 'package:mq/Admin/screens/admin_allproducts_screen.dart';
import 'package:mq/Admin/screens/admin_allsellers_screen.dart';
import 'package:mq/Admin/screens/admin_statistics_screen.dart';
import 'package:mq/Admin/screens/admins_add_deals_screen.dart';

import 'package:mq/constants/Global_Variables.dart';
import 'package:mq/providers/sellerprovider.dart';
import 'package:mq/providers/userprovider.dart';
import 'package:mq/screens/Account/accountScreen.dart';
import 'package:mq/screens/Auth/desktop_SignUp_testscreen.dart';
import 'package:mq/screens/Auth/desktop_login_testscreen.dart';

import 'package:mq/screens/Auth/phone_sigin_screen.dart';
import 'package:mq/screens/Auth/sign_out_screen.dart';
import 'package:mq/screens/Cart/cart_screen.dart';
import 'package:mq/screens/Category/category_screen.dart';
import 'package:mq/screens/Drawer/Settings_screen.dart';
import 'package:mq/screens/Drawer/chat_screen.dart';
import 'package:mq/screens/Drawer/my_order_screen.dart';
import 'package:mq/screens/Drawer/my_wishlist_screen.dart';
import 'package:mq/screens/Drawer/notification_screen.dart';
import 'package:mq/screens/Drawer/offer_screen.dart';
import 'package:mq/screens/Drawer/trace_product_screen.dart';

import 'package:mq/screens/MainHomePage.dart';
import 'package:mq/screens/ProductScreens/accessories_screen.dart';
import 'package:mq/screens/ProductScreens/cattle_screen.dart';
import 'package:mq/screens/ProductScreens/feed_screen.dart';
import 'package:mq/screens/ProductScreens/meat_screen.dart';
import 'package:mq/screens/ProductScreens/medicine_screen.dart';
import 'package:mq/screens/ProductScreens/pet_screen.dart';
import 'package:mq/screens/Sell/meat_seller_screen.dart';

import 'package:mq/screens/Sell/premium_seller_screen.dart';
import 'package:mq/screens/Sell/sell_screen.dart';
import 'package:mq/screens/Sell/seller_login_request_screen.dart';
import 'package:mq/screens/Sell/seller_screen.dart';
import 'package:mq/services/auth_service.dart';
import 'package:mq/services/firebase_auth_methods.dart';
import 'package:mq/widgets/sellerAuthToggle.dart';

import 'package:mq/widgets/toggle.dart';

import 'package:provider/provider.dart';

import 'Admin/AdminMainHomePage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    Provider<FirebaseAuthMethods>(
        create: (_) => FirebaseAuthMethods(
              FirebaseAuth.instance,
            )),
    ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
    StreamProvider(
        create: (context) =>
            // Provider.of<FirebaseAuthMethods>(context, listen: true)
            //     .authState,
            context.read<FirebaseAuthMethods>().authState,
        initialData: null),
    ChangeNotifierProvider<SellerProvider>(create: (_) => SellerProvider())
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    initialize(context);
  }

  void initialize(BuildContext context) {
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: _scaffoldKey,
        title: 'MQ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.greyBackgroundCOlor,
          appBarTheme: const AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
        ),
        routes: {
          Toggle.route: (context) => const Toggle(),
          PhoneSignInScreen.route: (context) => const PhoneSignInScreen(),
          TestLogInScreen.route: (context) => const TestLogInScreen(),
          TestSignUpScreen.route: (context) => const TestSignUpScreen(),
          //BottomNav routes

          MainHomePage.route: (context) => const MainHomePage(),
          CategoryScreen.route: (context) => const CategoryScreen(),
          AccountScreen.route: (context) => const AccountScreen(),

          CartScreen.route: (context) => const CartScreen(),

          //Drawer routes
          ChatScreen.route: (context) => const ChatScreen(),
          MyOrderScreen.route: (context) => MyOrderScreen(),
          MyWishListScreen.route: (context) => const MyWishListScreen(),
          NotificationScreen.route: (context) => const NotificationScreen(),
          OfferScreen.route: (context) => const OfferScreen(),
          SettingScreen.route: (context) => const SettingScreen(),
          TraceProductScreen.route: (context) => const TraceProductScreen(),
          SignOutScreen.route: (context) => const SignOutScreen(),
          //ProductScreen route
          PetScreen.route: (context) => const PetScreen(),
          CattleScreen.route: (context) => const CattleScreen(),
          MeatScreen.route: (context) => const MeatScreen(),
          FeedScreen.route: (context) => const FeedScreen(),
          AccessoryScreen.route: (context) => const AccessoryScreen(),
          MedicineScreen.route: (context) => const MedicineScreen(),

          //AdminScreen routes

          AdminMainHomePage.route: (context) => const AdminMainHomePage(),
          AdminAllProductsScreen.route: (context) =>
              const AdminAllProductsScreen(),
          AdminAllOrdersScreen.route: (context) => const AdminAllOrdersScreen(),
          AdminAddDealsScreen.route: (context) => const AdminAddDealsScreen(),
          AdminAllStatisticsScreen.route: (context) =>
              const AdminAllStatisticsScreen(),
          AdminAllSellersScreen.route: (context) =>
              const AdminAllSellersScreen(),

          //Sell Screen routes

          SellerAuthToggle.route: (context) => const SellerAuthToggle(),

          PremiumSellerScreen.route: (context) => const PremiumSellerScreen(),
          MeatSellerScreen.route: (context) => const MeatSellerScreen(),

          // SellerScreen.route: (context) => const SellerScreen(),
          SellerLoginRequestScreen.route: (context) =>
              const SellerLoginRequestScreen()
        },

        //  onGenerateRoute: (route) => getRoutes(route),
        home: const AuthWrapper());
    //const SellScreen());  // const AdminMainHomePage()); // MainHomePage());
  }
}

//kIsWeb ? MainHomePage() : AuthWrapper()

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null &&
        Provider.of<UserProvider>(context).user.token.isNotEmpty) {
      print('THE USER IS ${firebaseUser}');
      print(
          'the user token is present in sharedPreference and firebase user also not null');
      print('THE USER IS NOT NULL');

      return const MainHomePage();
    } else {
      print('THE USER IS ${firebaseUser}');
      print('THE USER IS NULL');
      return const Toggle();
    }
    // return Toggle();
  }
}
