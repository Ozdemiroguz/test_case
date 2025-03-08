import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_case/custom/custom_image_widget.dart';
import 'package:test_case/features/home/presentation/providers/home_provider.dart';

import '../../../../gen/assets.gen.dart';

final _carouselSlider =
    Provider.autoDispose((ref) => CarouselSliderController());

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  Future<void> _onRefresh() async {
    // Sayfayı yenilemek için init() çağırıyoruz
    await ref.read(homeProvider.notifier).init();
  }

  //en başa alma işlemi

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeProvider);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _CarouselSlider(height: height),
            state.paginatedMoviesResponse.movies.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : _BottomPart(),

            // Like button

            state.paginatedMoviesResponse.movies.isEmpty
                ? const SizedBox.shrink()
                : Positioned(
                    right: 17,
                    bottom: 120,
                    child: _LikeButton(),
                  ),
            //en başa alma işlemi
            if (state.currenIndex > 1)
              Positioned(
                left: 17,
                bottom: 120,
                child: GestureDetector(
                  onTap: () {
                    ref.read(_carouselSlider).jumpToPage(0);
                    ref.read(homeProvider.notifier).setCurrentIndex(0);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 27,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withAlpha(50),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withAlpha(50),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_upward,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _LikeButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);

    return GestureDetector(
      onTap: () {
        ref.read(homeProvider.notifier)
          ..toggleFavorite(
            state.paginatedMoviesResponse.movies[state.currenIndex].id,
          );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 27,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary.withAlpha(50),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Theme.of(context).colorScheme.onPrimary.withAlpha(50),
            width: 1,
          ),
        ),
        child: Center(
          child: Assets.icons.heart.svg(
            colorFilter: ColorFilter.mode(
              state.paginatedMoviesResponse.movies[state.currenIndex].isFavorite
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onPrimary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final state = ref.watch(homeProvider);
    final movie = state.paginatedMoviesResponse.movies[state.currenIndex];

    return Stack(
      children: [
        // Gradient arka plan, içerikle aynı boyutta dinamik şekilde ayarlanır.
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
              ),
            ),
          ),
        ),
        // İçerik: Logo, başlık ve açıklama
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34.5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onPrimary,
                    width: 1.5,
                  ),
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Başlık
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: width - 40 - 16 - 34.5 - 34.5,
                    child: state.longDescription
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                movie.description,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              GestureDetector(
                                onTap: () {
                                  ref
                                      .read(homeProvider.notifier)
                                      .onChangedLongDescription(false);
                                },
                                child: Text(
                                  "Daha Az",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              ),
                            ],
                          )
                        : RichText(
                            maxLines: 2,
                            text: TextSpan(
                              style: Theme.of(context).textTheme.labelMedium,
                              children: [
                                TextSpan(
                                  text: movie.description.length > 55
                                      ? movie.description.substring(0, 55)
                                      : movie.description,
                                ),
                                if (movie.description.length > 55)
                                  const TextSpan(text: '... '),
                                if (movie.description.length > 55)
                                  TextSpan(
                                    text: 'Daha Fazlası',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        ref
                                            .read(homeProvider.notifier)
                                            .onChangedLongDescription(true);
                                      },
                                  ),
                              ],
                            ),
                          ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// CarouselSlider
class _CarouselSlider extends ConsumerWidget {
  final double height;

  const _CarouselSlider({
    required this.height,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);

    return CarouselSlider.builder(
        carouselController: ref.watch(_carouselSlider),
        options: CarouselOptions(
          onPageChanged: (index, reason) {
            ref.read(homeProvider.notifier).setCurrentIndex(index);
          },
          enableInfiniteScroll: false,
          height: height,
          viewportFraction: 1,
          scrollDirection: Axis.vertical,
        ),
        itemCount: homeState.paginatedMoviesResponse.movies.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return CustomImageWidget(
              imageUrl: homeState.paginatedMoviesResponse
                  .movies[homeState.currenIndex].posterUrl,
              height: height);
        });
  }
}
