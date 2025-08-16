import 'package:egen/Screens/citizen/appointment_list.dart';
import 'package:egen/Screens/citizen/book_appointment.dart';
import 'package:egen/Screens/citizen/citizen_home.dart';
import 'package:egen/Screens/onboarding/login_screen.dart';
import 'package:egen/Screens/onboarding/register_screen.dart';
import 'package:egen/Screens/staff/staff_dashboard.dart';
import 'package:egen/screens/shared/appointment_details.dart';
import 'package:flutter/material.dart';

final appRouter = RouterConfig(
  routerDelegate: _routerDelegate,
  routeInformationParser: _parser,
  routeInformationProvider: _provider,
);

final _router = _SimpleRouter();
final _routerDelegate = _SimpleRouterDelegate(_router);
final _parser = _SimpleRouteInformationParser();
final _provider = PlatformRouteInformationProvider(
    initialRouteInformation: const RouteInformation(location: '/login'));

class _SimpleRouter {
  String path = '/login';
  Map<String, dynamic>? extras;
}

class _SimpleRouterDelegate extends RouterDelegate<RouteInformation>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final _SimpleRouter state;
  _SimpleRouterDelegate(this.state);

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void go(String path, {Map<String, dynamic>? extras}) {
    state.path = path;
    state.extras = extras;
    notifyListeners();
  }

  @override
  RouteInformation? get currentConfiguration =>
      RouteInformation(location: state.path);

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (state.path) {
      case '/login':
        child = LoginScreen(
            onSignUp: () => go('/register'),
            onLoginSuccess: () => go('/citizen/home'));
        break;
      case '/register':
        child = RegisterScreen(onRegistered: () => go('/citizen/home'));
        break;
      case '/citizen/home':
        child = CitizenHome(
          onBookTap: () => go('/citizen/book'),
          onListTap: () => go('/citizen/appointments'),
          onStaffSwitch: () => go('/staff/dashboard'),
        );
        break;
      case '/citizen/book':
        child = BookAppointmentScreen(
            onSubmitted: (id) => go('/details', extras: {'id': id}));
        break;
      case '/citizen/appointments':
        child = AppointmentsList(
            onOpen: (id) => go('/details', extras: {'id': id}));
        break;
      case '/details':
        child =
            AppointmentDetails(appointmentId: state.extras?['id'] ?? 'A-0001');
        break;
      case '/staff/dashboard':
        child = StaffDashboard(
            onOpen: (id) => go('/details', extras: {'id': id}),
            onBack: () => go('/citizen/home'));
        break;
      default:
        child = const Scaffold(body: Center(child: Text('Not found')));
    }

    return Navigator(
      key: navigatorKey,
      pages: [MaterialPage(child: child)],
      onPopPage: (route, result) => route.didPop(result),
    );
  }

  @override
  Future<void> setNewRoutePath(RouteInformation configuration) async {
    state.path = configuration.location ?? '/login';
  }
}

class _SimpleRouteInformationParser
    extends RouteInformationParser<RouteInformation> {
  @override
  Future<RouteInformation> parseRouteInformation(
          RouteInformation routeInformation) async =>
      routeInformation;
}
