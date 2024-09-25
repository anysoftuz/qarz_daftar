import 'package:json_annotation/json_annotation.dart';

part 'generic_pagination.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class GenericPagination<T> {
  @JsonKey(name: 'startCursor')
  final int startCursor;
  @JsonKey(name: 'endCursor')
  final int? endCursor;
  @JsonKey(name: 'totalCount')
  final int? totalCount;
  @JsonKey(name: 'data')
  final List<T> data;

  GenericPagination({
    this.startCursor = 0,
    this.endCursor = 0,
    this.totalCount = 0,
    this.data = const [],
  });
  factory GenericPagination.fromJson(
          Map<String, dynamic> json, T Function(Object?) fetch) =>
      _$GenericPaginationFromJson(json, fetch);
}
