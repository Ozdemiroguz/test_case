import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:test_case/features/profile/domain/repositories/profile_repository.dart';

import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/home/domain/repositories/movie_repository.dart';
import '../../router/router.dart';
import '../../services/locale/locale_resources_service.dart';
import 'locator.config.dart';

final getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: true)
Future<void> configureDependencies() => getIt.init();

final appRouterProvider = Provider.autoDispose((ref) => getIt<AppRouter>());

final localeResourcesServiceProvider =
    Provider.autoDispose((ref) => getIt<LocaleResourcesService>());

final authRepositoryProvider =
    Provider.autoDispose((ref) => getIt<AuthRepository>());

final movieRepositoryProvider =
    Provider.autoDispose((ref) => getIt<MoviesRepository>());

final profileRepositoryProvider =
    Provider.autoDispose((ref) => getIt<ProfileRepository>());
