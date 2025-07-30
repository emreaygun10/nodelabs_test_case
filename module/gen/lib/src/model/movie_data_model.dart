import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'pagination.dart';
part 'movie_data_model.g.dart';

@JsonSerializable()
class MovieDataModel extends INetworkModel<MovieDataModel> with EquatableMixin {
  final List<Movie>? movies;
  final Pagination? pagination;

  MovieDataModel({
    this.movies,
    this.pagination,
  });

  @override
  MovieDataModel fromJson(Map<String, dynamic> json) => MovieDataModel.fromJson(json);

  factory MovieDataModel.fromJson(Map<String, dynamic> json) => _$MovieDataModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$MovieDataModelToJson(this);

  @override
  List<Object?> get props => [movies, pagination];

  MovieDataModel copyWith({
    List<Movie>? movies,
    Pagination? pagination,
  }) {
    return MovieDataModel(
      movies: movies ?? this.movies,
      pagination: pagination ?? this.pagination,
    );
  }
}
