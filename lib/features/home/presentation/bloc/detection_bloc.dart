// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http_parser/http_parser.dart';
// part 'detection_event.dart';
// part 'detection_state.dart';
//
// class DetectionBloc extends Bloc<DetectionEvent, DetectionState> {
//
//
//   List<XFile> imagesSelected = [];
//   List<MultipartFile> multipartFile = [];
//   DetectionBloc() : super(DetectionInitial()) {
//     on<DetectionEvent>((event, emit) async {
//
//
//       List<XFile> pickedImages = [];
//       pickedImages = await ImagePicker().pickMultipleMedia(
//         imageQuality: 50,
//       );
//       if (pickedImages.isNotEmpty) {
//         // removeAllFiles();
//         imagesSelected = pickedImages;
//         for (int i = 0; i < imagesSelected.length; i++) {
//           // log(
//           //   imagesSelected[i].name,
//           // );
//           String fileName = imagesSelected[i].path.split('/').last;
//           String fileExt = fileName.split('.').last;
//
//           multipartFile.add(
//             await MultipartFile.fromFile(
//             imagesSelected[i].path,
//             filename: fileName,
//             contentType: MediaType("image", fileExt),
//           ),
//       );
//     }
//
//     });
//   }
// }
