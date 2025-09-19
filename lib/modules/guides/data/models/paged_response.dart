// class PagedResponse<T> {
//   final List<T> content;
//   final int totalElements;
//   final int totalPages;
//   final int number;
//   final int size;
//   final bool first;
//   final bool last;
//   final bool empty;

//   PagedResponse({
//     required this.content,
//     required this.totalElements,
//     required this.totalPages,
//     required this.number,
//     required this.size,
//     required this.first,
//     required this.last,
//     required this.empty,
//   });

//   factory PagedResponse.fromJson(
//     Map<String, dynamic> json,
//     T Function(Map<String, dynamic>) fromJsonT,
//   ) {
//     return PagedResponse<T>(
//       content:
//           (json['content'] as List)
//               .map((e) => fromJsonT(e as Map<String, dynamic>))
//               .toList(),
//       totalElements: json['totalElements'] as int,
//       totalPages: json['totalPages'] as int,
//       number: json['number'] as int,
//       size: json['size'] as int,
//       first: json['first'] as bool,
//       last: json['last'] as bool,
//       empty: json['empty'] as bool,
//     );
//   }
// }
