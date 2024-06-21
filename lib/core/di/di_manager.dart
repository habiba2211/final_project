import 'package:dio/dio.dart';
import 'package:final_project/core/api/api_manager.dart';
import 'package:final_project/features/control/presentation/manager/control_cubit.dart';
// import 'package:final_project/features/login/data/web_services/signin_web_service.dart';
// import 'package:final_project/features/login/domain/repo/signin_repo.dart';
import 'package:final_project/features/login/presentation/bloc/login_cubit.dart';
// import 'package:final_project/features/registeration/presentation/bloc/registration_cubit.dart';
import 'package:final_project/features/registeration/presentation/bloc/sign_up_bloc.dart';
import 'package:final_project/layout/presentation/logic/home_layout_cubit.dart';
import 'package:get_it/get_it.dart';

// import '../../features/registeration/data/web_services/resgistration_web_service.dart';
// import '../../features/registeration/domain/repo/registration_repo.dart';
import '../network/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> dependencyInjectionInit() async {

  Dio dio = DioFactory.getDio();
  // LocalStorage storage = LocalStorage();
  //


  // Shared
//   final mySharedPrefs = MySharedPrefs();
//   await mySharedPrefs.sharedPrefsInit();
//   getIt.registerSingleton(mySharedPrefs);
//   getIt.registerLazySingleton(() => HttpApi(getIt()));
//   final localPrefs = LocalPrefs();
//   await localPrefs.sharedPrefsInit();
//   getIt.registerSingleton(localPrefs);
//
// =================================================================
// registration cubit
//   getIt.registerLazySingleton<RegistrationWebService>(() => RegistrationWebService(dio: dio));
//
//   getIt.registerLazySingleton<RegistrationRepo>(() => RegistrationRepo(regWebSer: getIt()));
//   getIt.registerFactory(() => RegistrationCubit(regRepo: getIt()));
  getIt.registerFactory(() => SignUpBloc(ApiManager()));
// =================================================================
// login cubit
//   getIt.registerLazySingleton<SigninWebService>(() => SigninWebService(dio: dio));
//
//   getIt.registerLazySingleton<SigninRepo>(() => SigninRepo(signWebSer: getIt()));
  getIt.registerFactory(() => LoginCubit());
// =================================================================
// control cubit
  getIt.registerFactory(() => ControlCubit());
  // =================================================================
// home layouy cubit
  getIt.registerSingleton<HomeLayoutCubit>(HomeLayoutCubit());
// =================================================================
// experts cubit

// =================================================================
// experts cubit

// //==================================================================================
// // profile feature
//
//   getIt.registerLazySingleton<ProfileRemoteDataSource>(
//           () => ProfileRemoteSourceImpl(getIt(), getIt()));
//   getIt.registerLazySingleton<ProfileLocalDataSource>(
//           () => ProfileLocalDataSourceImpl(getIt()));
//
//   getIt.registerFactory(() => ProfileCubit(getIt()));
//   getIt.registerLazySingleton<ProfileRepository>(
//           () => ProfileRepoImpl(getIt(), getIt()));
//
//   getIt.registerLazySingleton<ProfileMapper>(() => ProfileMapperImpl());
//   // getIt.registerLazySingleton<BonusDataMapper>(() => BonusDataMapperImpl());
//
// //==================================================================================
//   //auth
//
//   getIt.registerLazySingleton<RemoteDataSource>(
//           () => AuthRemoteDataSourceImpl(httpApi: getIt()));
//
//   getIt.registerLazySingleton<LocalDataSource>(
//           () => LocalDataSourceImp(getIt()));
//
//   getIt.registerLazySingleton(() => AuthCubit(getIt()));
//   getIt.registerLazySingleton<AuthRepository>(
//           () => AuthRepoImpl(dataSource: getIt(), localDataSource: getIt()));
//
// //========================================================================
//
// //==================================================================================
//   //vacation
//
//   getIt.registerLazySingleton<VacationRemoteDataSrc>(
//           () => VacationRemoteDataSrcImpl(
//         dio: getIt(),
//       ));
//   getIt.registerLazySingleton<VacationLocalDataSrc>(
//           () => VacationLocalDataSrcImpl());
//
//   getIt.registerLazySingleton<VacationRepo>(() => VacationRepoImpl(getIt()));
//   getIt.registerFactory(() => VacationsCubit(getIt()));
//   getIt.registerSingleton(NotificationObserver());
//
//   //Credences
//
//   getIt.registerLazySingleton<CredencesRemoteDataSrc>(
//           () => CredencesRemoteDataImpl(dio: getIt(), sharedPrefs: getIt()));
//
//   getIt.registerLazySingleton<CredencesRepo>(() => CredencesRepoImpl(getIt()));
//   getIt.registerFactory(() => CredencesCubit(getIt()));
//
//   // getIt.registerLazySingleton<ProfileMapper>(() => ProfileMapperImpl());
//   // getIt.registerLazySingleton<BonusDataMapper>(() => BonusDataMapperImpl());
//
//   //attendance
//   getIt.registerLazySingleton<AttendanceRemoteDataSource>(
//           () => AttendanceRemoteDataSourceImpl(
//         dio: getIt(),
//       ));
//
//   getIt.registerLazySingleton<AttendanceRepository>(
//           () => AttendanceRepoImpl(getIt()));
//   getIt.registerFactory(() => AttendanceCubit(getIt()));
//
//   //===============================================
//   //SideMenu
//   getIt.registerFactory(() => SideMenuCubit());
// //========================================================================
// // Search
//   getIt.registerFactory(() => SearchCubit());
//
//   ///******************END*********************//////////////
//
// //Excuses
//
//   getIt.registerLazySingleton<ExcusesRemoteDataSrc>(
//           () => ExcusesRemoteDataImpl(dio: getIt(), sharedPrefs: getIt()));
//
//   getIt.registerLazySingleton<ExcusesRepo>(
//           () => ExcusesRepoImpl(excusesRemoteDataSrc: getIt()));
//   getIt.registerFactory(() => ExcusesCubit(getIt()));
//
//   ///******************END*********************//////////////
//
// //Certificate
//
//   getIt.registerLazySingleton<CertificateDataSource>(
//           () => CertificateDataSourceImpl(dio: getIt(), sharedPrefs: getIt()));
//
//   getIt.registerLazySingleton<CertificateRepository>(
//           () => CertificateRepoImpl(getIt()));
//   getIt.registerFactory(() => CertificateCubit(getIt()));
//
//   ///****************************************************End */
// //Attatchment
//
//   getIt.registerLazySingleton<AttachmentDataSource>(
//           () => AttachmentDataImpl(dio: getIt(), sharedPrefs: getIt()));
//
//   getIt.registerLazySingleton<AttachmentRepo>(
//           () => AttachmentRepoImpl(attachmentDataSource: getIt()));
//   getIt.registerFactory(() => AttachementCubit(getIt()));
//
//   //Notification
//
//   getIt.registerLazySingleton<NotificationRemoteDataSrc>(
//           () => NotificationRemoteDataImpl(dio: getIt()));
//
//   getIt.registerLazySingleton<NotificationRepoSrc>(
//           () => NotificationRepoImpl(notificationRemoteDataSrc: getIt()));
//   getIt.registerFactory(() => NotificationCubit(notificationRepoSrc: getIt()));
//
//   //=========================================================
//
//   //Biometric
//   final biometricService = BiometricAuthService();
//   getIt.registerSingleton(biometricService);
//
//   getIt.registerFactory(() => BiomerticCubit(getIt()));
//
//   getIt.registerLazySingleton<BioLocalDataSource>(
//           () => BioLocalDataSourceImpl(getIt()));
//
//   //===============================
//
//   final fcmRemoteConfig = FirebaseRemoteConfigService();
//   await fcmRemoteConfig.int();
//   final updateService = UpdateAppService();
//   getIt.registerSingleton(updateService);
//   getIt.registerLazySingleton(() => fcmRemoteConfig);
//   getIt.registerFactory(() => UpdateAppCubit(getIt()));
//
//   //=============mentainence =====================//
//
//   getIt.registerLazySingleton<AppStatusSource>(
//           () => AppStatusSourceImpl(getIt()));
//
//   getIt.registerLazySingleton<AppStatusRepository>(
//           () => AppStatusRepoImplement(getIt()));
//   getIt.registerFactory(() => MaintenanceCubit(getIt()));
//
//   //=============contact us =====================//
//   getIt.registerFactory(() => ContactUsCubit());
//   //=============adv =====================//
//   getIt.registerFactory(() => AdvCubit());
//   //=============news =====================//
//   getIt.registerFactory(() => NewsCubit());
//   //=============suggestions and complaints =====================//
//   getIt.registerLazySingleton<SuggestionsAndComplaintsRemoteDataSrc>(
//           () => SuggestionsAndComplaintsRemoteDataImpl(dio: getIt()));
//   getIt.registerLazySingleton<SuggestionsAndComplaintsRepoSrc>(() =>
//       SuggestionsAndComplaintsRepoImpl(
//           suggestionsAndComplaintsRemoteDataSrc: getIt()));
//   getIt.registerFactory(() =>
//       SuggestionsAndComplaintsCubit(suggestionsAndComplaintsRepoSrc: getIt()));
//
//   //Timer Cubit
//
//   getIt.registerFactory(() => TimerCubit());
//
//   //========================== Replacements =============================================//
//
//   getIt.registerLazySingleton<ReplacementsRemoteDataSrc>(
//           () => ReplacementsRemoteDataImpl(
//         dio: getIt(),
//         sharedPrefs: getIt(),
//       ));
//
//   getIt.registerLazySingleton<ReplacementsRepo>(
//           () => ReplacementsRepoImpl(replacementsRemoteDataSrc: getIt()));
//   getIt.registerFactory(() => ReplacementsCubit(getIt(), getIt()));
}
