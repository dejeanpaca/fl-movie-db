import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviedb/api/config.dart';
import 'package:moviedb/data/movie.dart';
import 'package:moviedb/pages/widgets/favourite_button.dart';
import 'package:moviedb/pages/widgets/genre.dart';
import 'package:moviedb/pages/widgets/rating.dart';
import 'package:moviedb/ui/progress_dialog.dart';
import 'package:moviedb/ui/theme/theme_list.dart';
import 'package:moviedb/services/favourite.dart';
import 'package:provider/provider.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;

  const MovieDetails({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetails> createState() => MovieDetailsState();
}

class MovieDetailsState extends State<MovieDetails> {
  late final Movie movie;

  @override
  void initState() {
    super.initState();
    movie = widget.movie;
  }

  @override
  Widget build(BuildContext context) {
    var imageUrl = ApiConfig.getBackdropUrl(movie.backdrop);
    var theme = Provider.of<ThemeList>(context).current;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
              height: 320.0,
              child: Stack(
                children: [
                  CachedNetworkImage(
                      imageUrl: imageUrl,
                      placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const CircularProgressIndicator(),
                      imageBuilder: (context, imageProvider) => Container(
                          width: double.infinity,
                          height: 320.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            image: imageProvider,
                          )))),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        height: 15.0,
                        decoration: BoxDecoration(
                            border: Border.all(color: theme.theme.scaffoldBackgroundColor, width: 0),
                            color: theme.theme.scaffoldBackgroundColor,
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0))),
                      )),
                  Positioned(
                      top: 0.0,
                      left: 5.0,
                      child: SafeArea(
                          child: IconButton(
                        // design uses arrow_right_alt, but it's rotated 180 so we'll match since there is no
                        // arrow_left_alt
                        icon: const RotatedBox(
                            quarterTurns: 2, child: Icon(Icons.arrow_right_alt, color: Colors.white, size: 30.0)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ))),
                ],
              )),
          Expanded(
              child: ListView(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12.0),
                    Text(
                      movie.title,
                      style: theme.detailsTitleStyle,
                    ),
                    const SizedBox(height: 12.0),
                    RatingWidget(rating: movie.rating),
                  ],
                )),
                FavouriteButton(saved: movie.favourite, onPressed: favouriteToggle),
              ]),
              const SizedBox(height: 12.0),
              if (movie.genres.isNotEmpty) Wrap(runSpacing: 7.5, children: getGenres()),
              const SizedBox(height: 36.0),
              Text('Description', style: theme.headerTextStyle.copyWith(fontSize: 16)),
              const SizedBox(height: 12.0),
              Text(movie.description),
            ],
          )),
        ],
      ),
    );
  }

  List<Widget> getGenres() {
    List<Widget> list = [];

    for (var g in movie.genres) {
      list.add(Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: GenreTag(
          genre: g,
          fontSize: 13.0,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.5),
        ),
      ));
    }

    return list;
  }

  Future<void> favouriteToggle() async {
    await showProgressDialog(context, FavouriteService.toggle(movie));
    if (mounted) setState(() {});
  }
}
