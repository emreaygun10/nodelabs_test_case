import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pagination.g.dart';

@JsonSerializable()
class Pagination extends INetworkModel<Pagination> with EquatableMixin {
  final int? totalCount;
  final int? perPage;
  final int? maxPage;
  final int? currentPage;

  Pagination({
    this.totalCount,
    this.perPage,
    this.maxPage,
    this.currentPage,
  });

  @override
  Pagination fromJson(Map<String, dynamic> json) => Pagination.fromJson(json);

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$PaginationToJson(this);

  @override
  List<Object?> get props => [totalCount, perPage, maxPage, currentPage];

  Pagination copyWith({
    int? totalCount,
    int? perPage,
    int? maxPage,
    int? currentPage,
  }) {
    return Pagination(
      totalCount: totalCount ?? this.totalCount,
      perPage: perPage ?? this.perPage,
      maxPage: maxPage ?? this.maxPage,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
