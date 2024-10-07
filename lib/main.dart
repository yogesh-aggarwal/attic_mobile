import "package:attic_mobile/providers/cart.dart";
import "package:attic_mobile/providers/products.dart";
import "package:attic_mobile/widgets/pages/cart/cart.dart";
import "package:attic_mobile/widgets/pages/home/home.dart";
import "package:attic_mobile/providers/user.dart";
import "package:attic_mobile/widgets/pages/profile/wishlist.dart";
import "package:attic_mobile/widgets/pages/search/search.dart";
import "package:attic_mobile/widgets/pages/wishlist/wishlist.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:lucide_icons/lucide_icons.dart";
import "package:provider/provider.dart";
import "package:velocity_x/velocity_x.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
      ],
      child: const Application(),
    ),
  );
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Attic",
      debugShowCheckedModeBanner: false,
      // scrollBehavior: const MaterialScrollBehavior().copyWith(
      //   physics: const BouncingScrollPhysics(),
      // ),
      theme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.light,
        textTheme: GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme),
      ),
      home: const Root(),
    );
  }
}

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const WishlistPage(),
    const SearchPage(),
    const HomePage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();

    context.read<ProductsProvider>().fetchProducts();
  }

  Widget _buildBottomBarButton(int index, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: AnimatedOpacity(
        opacity: _selectedIndex == index ? 1.0 : 0.5,
        duration: const Duration(milliseconds: 200),
        child: Icon(icon, size: 23),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(width: 2, color: Colors.grey.shade300)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            offset: const Offset(0, -4),
            blurRadius: 40.0,
          ),
        ],
      ),
      child: [
        _buildBottomBarButton(0, LucideIcons.heart),
        _buildBottomBarButton(1, LucideIcons.search),
        _buildBottomBarButton(2, LucideIcons.home),
        _buildBottomBarButton(3, LucideIcons.shoppingCart),
        _buildBottomBarButton(4, LucideIcons.user),
      ].hStack(
        alignment: MainAxisAlignment.spaceEvenly,
        crossAlignment: CrossAxisAlignment.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomBar(),
      body: SafeArea(child: _pages[_selectedIndex]),
    );
  }
}
