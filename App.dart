import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flyway Travel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator(int numPages) {
    List<Widget> list = [];
    for (int i = 0; i < numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      OnboardingPageWidget(
        imagePath: 'assets/1.jpg',
        title: 'Welcome to Flyway Travel',
        description:
            'Embark on seamless adventures with our travel app, where exploration meets convenience, making your journey unforgettable from start to finish!',
        buttonText: 'Next >',
        onPressed: () {
          _pageController.nextPage(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        },
      ),
      OnboardingPageWidget(
        imagePath: 'assets/2.jpg',
        title: 'Explore More, Travel Easy: Your Journey Starts Here!',
        description:
            'Transform your travels into unforgettable adventures with our seamless app experience, combining exploration and convenience from start to finish!',
        buttonText: 'Next >',
        onPressed: () {
          _pageController.nextPage(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        },
      ),
      OnboardingPageWidget(
        imagePath: 'assets/3.jpg',
        title: 'Wander Wisely, Explore Boldly: Your Ultimate Travel Companion!',
        description:
            'Unlock the world with our travel app, your digital passport to endless exploration and boundless wanderlust!',
        buttonText: 'Get Started >',
        onPressed: () {
          // Handle 'Get Started' action here
        },
      ),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: _pages,
          ),
          Positioned(
            bottom: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(_pages.length),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPageWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;

  OnboardingPageWidget({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // Background color
              onPrimary: Colors.white, // Text Color (Foreground color)
            ),
            child: Text(buttonText),
          ),
          SizedBox(height: 20),
        ],
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
Widget buildInputField({
  required String hintText,
  required IconData icon,
  bool isPassword = false,
  TextEditingController? controller,
}) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword,
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
Widget buildButton({
  required String text,
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(text),
    style: ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 50), // Set the button's minimum size
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}

//Sign In Screen
class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Sign in your account', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            buildInputField(
              hintText: 'Email',
              icon: Icons.email,
              controller: emailController,
            ),
            SizedBox(height: 16),
            buildInputField(
              hintText: 'Password',
              icon: Icons.lock,
              isPassword: true,
              controller: passwordController,
            ),
            SizedBox(height: 20),
            buildButton(
              text: 'SIGN IN',
              onPressed: () {
                // Implement sign-in logic
              },
            ),
            // Add other widgets like "Forgot Password?" and the social buttons as needed...
          ],
        ),
      ),
    );
  }
}

//Sign Up Screen
class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Create your account', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            buildInputField(
              hintText: 'Name',
              icon: Icons.person,
              controller: nameController,
            ),
            // ... Repeat for Email, Password, Confirm Password
            // Add Gender options and Terms & Policy
            SizedBox(height: 20),
            buildButton(
              text: 'SIGN UP',
              onPressed: () {
                // Implement sign-up logic
              },
            ),
            // Add other widgets like "Have an account? Sign In" and the social buttons as needed...
          ],
        ),
      ),
    );
  }
}

//Forgot Password Screen
class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Please enter your email to reset the password', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            buildInputField(
              hintText: 'Your Email',
              icon: Icons.email,
              controller: emailController,
            ),
            SizedBox(height: 20),
            buildButton(
              text: 'Reset Password',
              onPressed: () {
                // Implement reset password logic
              },
            ),
          ],
        ),
      ),
    );
  }
}

//Forgot Password Screen
class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Please enter your email to reset the password', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            buildInputField(
              hintText: 'Your Email',
              icon: Icons.email,
              controller: emailController,
            ),
            SizedBox(height: 20),
            buildButton(
              text: 'Reset Password',
              onPressed: () {
                // Implement reset password logic
              },
            ),
          ],
        ),
      ),
    );
  }
}

//Verify Code Screen
class VerifyCodeScreen extends StatelessWidget {
  final List<TextEditingController> codeControllers = List.generate(6, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verify Code')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Check your email', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('We sent a reset link to email@example.com'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: TextFormField(
                      controller: codeControllers[index],
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      maxLength: 1,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            buildButton(
              text: 'Verify Code',
              onPressed: () {
                // Implement verify code logic
              },
            ),
            TextButton(
              onPressed: () {
                // Implement resend email logic
              },
              child: Text('Resend email'),
            ),
          ],
        ),
      ),
    );
  }
}

//Password Reset Confirmation Screen
class PasswordResetConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Password Reset')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your password has been successfully reset. Click confirm to set a new password', textAlign: TextAlign.center),
            SizedBox(height: 20),
            buildButton(
              text: 'Confirm',
              onPressed: () {
                // Navigate to Set New Password Screen
              },
            ),
          ],
        ),
      ),
    );
  }
}

//Set New Password Screen
class SetNewPasswordScreen extends StatelessWidget {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Set a New Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Create a new password. Ensure it differs from previous ones for security', textAlign: TextAlign.center),
            SizedBox(height: 20),
            buildInputField(
              hintText: 'Enter your new password',
              icon: Icons.lock,
              isPassword: true,
              controller: newPasswordController,
            ),
            SizedBox(height: 16),
            buildInputField(
              hintText: 'Re-enter password',
              icon: Icons.lock_outline,
              isPassword: true,
              controller: confirmNewPasswordController,
            ),
            SizedBox(height: 20),
            buildButton(
              text: 'Update Password',
              onPressed: () {
                // Implement update password logic
              },
            ),
          ],
        ),
      ),
    );
  }
}

//Password Reset Successful Screen
class PasswordResetSuccessfulScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.check_circle_outline, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text('Password reset successfully. Click here to login', textAlign: TextAlign.center),
            SizedBox(height: 20),
            buildButton(
              text: 'Login',
              onPressed: () {
                // Navigate to Login Screen
              },
            ),
          ],
        ),
      ),
    );
  }
}

//Language Selection Screen
class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flyway Travel'),
        actions: [
          TextButton(
            onPressed: () {
              // Handle skip
            },
            child: Text('SKIP', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset('path_to_your_image', fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome to Flyway Travel', style: TextStyle(fontSize: 24)),
                Text('Select your Language\nYou can also change language in app setting after signing in'),
                RadioListTile<String>(
                  title: const Text('English'),
                  value: 'English',
                  groupValue: _selectedLanguage,
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Japanese'),
                  value: 'Japanese',
                  groupValue: _selectedLanguage,
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Turkish'),
                  value: 'Turkish',
                  groupValue: _selectedLanguage,
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value!;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Proceed to the next screen or save the selected language
                  },
                  child: Text('Continue'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Home Screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flyway Travel'),
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Icons row
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIconOption(Icons.hotel, 'Hotels'),
                  _buildIconOption(Icons.flight, 'Flights'),
                  _buildIconOption(Icons.card_giftcard, 'Package'),
                  _buildIconOption(Icons.directions_bus, 'Bus/JEEP'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'A warm Good morning,\nWelcome to Flyway Travel Apps. Now you can buy/reserved your airlines ticket from this app\nThank you for choosing us.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            // Categories row
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIconOption(Icons.landscape, 'Mountains'),
                  _buildIconOption(Icons.directions_walk, 'Trekking'),
                  _buildIconOption(Icons.favorite, 'Honeymoon'),
                  _buildIconOption(Icons.local_bar, 'Restro & Bar'),
                ],
              ),
            ),
            // Images grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(4, (index) {
                // Replace with actual image paths
                String imagePath = 'path_to_your_image_$index';
                return Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                );
              }),
            ),
            // Bottom navigation bar
            // This is just a placeholder, it should be placed outside the SingleChildScrollView
            BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                // ... other items
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconOption(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 50),
        Text(label),
      ],
    );
  }
}

// ABC information
import 'package:flutter/material.dart';

class AnnapurnaDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Annapurna Base Camp'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/annapurna_header.jpg', // Replace with your image asset path
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'All about Annapurna Base Camp',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '1. Mountains views that leave you spellbound',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'The Annapurna range offers breathtaking mountain vistas...'
                    // Include the entire text for this section here.
                  ),
                  SizedBox(height: 16),
                  // ... Repeat the pattern for other sections
                  Text(
                    '2. Trekking inside a diverse range of ecosystems',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Three sections of the trail are characterized by dense forests...'
                    // Include the entire text for this section here.
                  ),
                  SizedBox(height: 16),
                  Text(
                    '3. A peek into Nepali culture',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This trek follows a traditional route known for its quaint tea house...'
                    // Include the entire text for this section here.
                  ),
                  SizedBox(height: 16),
                  Text(
                    '4. Melting pot of adventurous souls',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'The Annapurna Base Camp (ABC) trek draws enthusiasts of mountain...'
                    // Include the entire text for this section here.
                  ),
                  SizedBox(height: 24),
                  // Add other widgets or content as necessary
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: AnnapurnaDetailPage(),
    ),
  );
}

// tharpu chuli 

import 'package:flutter/material.dart';

class TharpuChuliDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tharpu Chuli: A Himalayan Marvel'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/tharpu_chuli.jpg', // Replace with your image asset path
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                'Tharpu Chuli: A Himalayan Marvel',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'The Himalayas, often referred to as the "abode of snow," stand as one of the most captivating mountain ranges on Earth, attracting adventurers, spiritual seekers, and nature enthusiasts alike. Within this majestic range lies Tharpu Chuli, a lesser-known but equally breathtaking peak nestled in the heart of the Annapurna Sanctuary region of Nepal. In this comprehensive exploration, we delve into the geographical, historical, cultural, and mountaineering aspects of Tharpu Chuli, uncovering its allure and significance.',
              ),
              SizedBox(height: 16),
              // ... Include all other text sections here, following the same pattern
              Text(
                'Historical Significance',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'The history of Tharpu Chuli is intertwined with the broader narrative of exploration and mountaineering in the Himalayas. While not as prominent as its higher neighbors, Tharpu Chuli has attracted adventurers seeking to conquer its summit since the mid-20th century...',
                // Include the entire text for this section here.
              ),
              // ... Repeat for all other sections
              SizedBox(height: 16),
              // The conclusion part
              Text(
                'Conclusion',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Tharpu Chuli stands as a testament to the allure and majesty of the Himalayas, offering adventurers a unique opportunity to experience the thrill of high-altitude mountaineering amidst breathtaking scenery and rich cultural heritage...',
                // Include the entire text for this section here.
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: TharpuChuliDetailPage(),
    ),
  );
}
