import 'package:flutter_test/flutter_test.dart';
import 'package:vgc_cabs/screens/home_screen.dart';
import 'package:vgc_cabs/screens/login_screen.dart';
import 'package:vgc_cabs/screens/registration_screen.dart';
import 'package:vgc_cabs/screens/ride_details_screen.dart';
import 'package:vgc_cabs/screens/ride_list_screen.dart';
import 'package:vgc_cabs/screens/profile_screen.dart';
import 'package:vgc_cabs/models/user.dart';
import 'package:vgc_cabs/models/ride.dart';
import 'package:vgc_cabs/services/api_service.dart';
import 'package:vgc_cabs/services/auth_service.dart';
import 'package:vgc_cabs/services/ride_service.dart';
import 'package:vgc_cabs/utils/constants.dart';

void main() {
  testWidgets('Widget Test', (WidgetTester tester) async {
    // Test cases for home_screen.dart
    await tester.pumpWidget(HomeScreen());
    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.byType(RideListScreen), findsOneWidget);
    expect(find.byType(ProfileScreen), findsOneWidget);

    // Test cases for login_screen.dart
    await tester.pumpWidget(LoginScreen());
    expect(find.byType(LoginScreen), findsOneWidget);
    expect(find.byType(RegistrationScreen), findsOneWidget);
    expect(find.byType(ApiService), findsOneWidget);
    expect(find.byType(AuthService), findsOneWidget);

    // Test cases for registration_screen.dart
    await tester.pumpWidget(RegistrationScreen());
    expect(find.byType(RegistrationScreen), findsOneWidget);
    expect(find.byType(LoginScreen), findsOneWidget);
    expect(find.byType(ApiService), findsOneWidget);
    expect(find.byType(AuthService), findsOneWidget);

    // Test cases for ride_details_screen.dart
    await tester.pumpWidget(RideDetailsScreen());
    expect(find.byType(RideDetailsScreen), findsOneWidget);
    expect(find.byType(Ride), findsOneWidget);
    expect(find.byType(ApiService), findsOneWidget);

    // Test cases for ride_list_screen.dart
    await tester.pumpWidget(RideListScreen());
    expect(find.byType(RideListScreen), findsOneWidget);
    expect(find.byType(Ride), findsOneWidget);
    expect(find.byType(ApiService), findsOneWidget);

    // Test cases for profile_screen.dart
    await tester.pumpWidget(ProfileScreen());
    expect(find.byType(ProfileScreen), findsOneWidget);
    expect(find.byType(User), findsOneWidget);
    expect(find.byType(ApiService), findsOneWidget);
  });
}