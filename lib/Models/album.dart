// /// response : 1
// /// code : 200
// /// data : "Some New text "
//
// class Album {
//   Album({
//       int response,
//       int code,
//       String data,}){
//     _response = response;
//     _code = code;
//     _data = data;
// }
//
//   Album.fromJson(dynamic json) {
//     _response = json['response'];
//     _code = json['code'];
//     _data = json['data'];
//   }
//   int _response;
//   int _code;
//   String _data;
//
//   int get response => _response;
//   int get code => _code;
//   String get data => _data;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['response'] = _response;
//     map['code'] = _code;
//     map['data'] = _data;
//     return map;
//   }
//
// }