import 'package:bloc_clean/core/theme/theme.dart';
import 'package:bloc_clean/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:bloc_clean/features/auth/presentation/pages/login_page.dart';
import 'package:bloc_clean/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => serviceLocator<AuthBloc>())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: LoginPage(),
    );
  }
}
