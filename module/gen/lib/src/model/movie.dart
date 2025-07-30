import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie extends INetworkModel<Movie> with EquatableMixin {
  final String? id;
  final String? title;
  final String? year;
  final String? rated;
  final String? released;
  final String? runtime;
  final String? genre;
  final String? director;
  final String? writer;
  final String? actors;
  final String? plot;
  final String? language;
  final String? country;
  final String? awards;
  final String? poster;
  final String? metascore;
  final String? imdbRating;
  final String? imdbVotes;
  final String? imdbID;
  final String? type;
  final String? response;
  final List<String>? images;
  final bool? comingSoon;
  final bool? isFavorite;

  Movie({
    this.id,
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.poster,
    this.metascore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbID,
    this.type,
    this.response,
    this.images,
    this.comingSoon,
    this.isFavorite,
  });

  @override
  Movie fromJson(Map<String, dynamic> json) => Movie.fromJson(json);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$MovieToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        year,
        rated,
        released,
        runtime,
        genre,
        director,
        writer,
        actors,
        plot,
        language,
        country,
        awards,
        poster,
        metascore,
        imdbRating,
        imdbVotes,
        imdbID,
        type,
        response,
        images,
        comingSoon,
        isFavorite
      ];

  Movie copyWith({
    String? id,
    String? title,
    String? year,
    String? rated,
    String? released,
    String? runtime,
    String? genre,
    String? director,
    String? writer,
    String? actors,
    String? plot,
    String? language,
    String? country,
    String? awards,
    String? poster,
    String? metascore,
    String? imdbRating,
    String? imdbVotes,
    String? imdbID,
    String? type,
    String? response,
    List<String>? images,
    bool? comingSoon,
    bool? isFavorite,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      year: year ?? this.year,
      rated: rated ?? this.rated,
      released: released ?? this.released,
      runtime: runtime ?? this.runtime,
      genre: genre ?? this.genre,
      director: director ?? this.director,
      writer: writer ?? this.writer,
      actors: actors ?? this.actors,
      plot: plot ?? this.plot,
      language: language ?? this.language,
      country: country ?? this.country,
      awards: awards ?? this.awards,
      poster: poster ?? this.poster,
      metascore: metascore ?? this.metascore,
      imdbRating: imdbRating ?? this.imdbRating,
      imdbVotes: imdbVotes ?? this.imdbVotes,
      imdbID: imdbID ?? this.imdbID,
      type: type ?? this.type,
      response: response ?? this.response,
      images: images ?? this.images,
      comingSoon: comingSoon ?? this.comingSoon,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
