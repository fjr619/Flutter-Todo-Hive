import 'package:flutter/material.dart';
import 'package:flutter_todo_hive/di/di.dart';
import 'package:flutter_todo_hive/presentation/screens/home/home_screen.dart';

// final getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // // Inisialisasi Hive
  // await Hive.initFlutter();
  // Hive.registerAdapter(TaskEntityAdapter());
  // Box<TaskEntity> taskBox = await Hive.openBox<TaskEntity>(Util.boxName);

  // // Registrasi dependency
  // getIt.registerSingleton<HiveDataStore>(HiveDataStore(box: taskBox));
  // getIt.registerSingleton<TaskRepository>(
  //     TaskRepositoryImpl(getIt<HiveDataStore>()));

  await configureDepedencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
