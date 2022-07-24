import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplecode_test1/bloc/persons/bloc_persons.dart';
import 'package:simplecode_test1/repo/api.dart';
import 'package:simplecode_test1/repo/repo_products.dart';
import '../repo/repo_settings.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => Api(),
        ),
        RepositoryProvider(
          create: (context) => RepoSettings(),
        ),
        RepositoryProvider(
          create: (context) => RepoProducts(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
      ],
      child: MultiBlocProvider(
        child: child,
        providers: [
          BlocProvider(
            create: (context) => BlocProducts(
              repo: RepositoryProvider.of<RepoProducts>(context),
            )..add(
                EventFectchProducts(''),
              ),
          ),
        ],
      ),
    );
  }
}
