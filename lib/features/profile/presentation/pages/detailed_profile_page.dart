import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_case/custom/custom_app_bar.dart';
import 'package:test_case/custom/custom_image_widget.dart';
import 'package:test_case/features/home/domain/models/movie.dart';
import 'package:test_case/features/home/presentation/providers/home_provider.dart';
import 'package:test_case/features/profile/presentation/widgets/profile_header.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../router/router.dart';
import '../providers/profile_provider.dart';
import '../widgets/tokken_bottom_sheet.dart';

@RoutePage()
class DetailedProfilePage extends ConsumerWidget {
  const DetailedProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final movie = ref.watch(homeProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'profile_detailed'.tr(),
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (context) {
                  return TokenBottomSheet();
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(53),
              ),
              child: Row(
                children: [
                  Assets.icons.gemIconlyPro.svg(
                    width: 18,
                    height: 18,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'limited_offer'.tr(),
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileHeader(
            name: profile.profile.name,
            id: profile.profile.id,
            imageUrl: profile.profile.photoUrl,
            isProfile: false,
            buttonAction: () {
              AutoRouter.of(context).push(ProfileImageUpdateRoute(
                isSetupAccount: false,
              ));
            },
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              'liked_movie'.tr(),
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),

          // Favorite Movies
          _FavoriteMovies(movies: movie.favoriteMovies),
        ],
      ),
    );
  }
}

class _FavoriteMovies extends StatelessWidget {
  final List<Movie> movies;

  _FavoriteMovies({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.6,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return _MovieCard(movie: movies[index]);
      },
    ));
  }
}

class _MovieCard extends ConsumerWidget {
  final Movie movie;

  _MovieCard({required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CustomImageWidget(imageUrl: movie.posterUrl, height: 200)),
        const SizedBox(height: 16),
        Text(
          overflow: TextOverflow.ellipsis,
          movie.title,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        Text(
          movie.director,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(125),
              ),
        ),
      ],
    );
  }
}
