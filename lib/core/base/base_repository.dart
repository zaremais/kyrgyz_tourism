// import 'package:kyrgyz_tourism/core/error/error_handler.dart';
// import 'package:kyrgyz_tourism/core/error/failure.dart';
// import 'package:kyrgyz_tourism/core/network/connectivity_service.dart';
// import 'package:kyrgyz_tourism/core/utils/logger.dart';

// abstract class BaseRepository {
//   final ConnectivityService _connectivityService;

//   BaseRepository(this._connectivityService);

//   /// Execute a network request with proper error handling
//   Future<T> executeRequest<T>(
//     Future<T> Function() request, {
//     String? context,
//   }) async {
//     try {
//       // Check connectivity
//       final hasConnection = await _connectivityService.hasConnection();
//       if (!hasConnection) {
//         throw NetworkFailure.noInternet();
//       }

//       AppLogger.debug('Executing request', tag: context);
//       final result = await request();
//       AppLogger.debug('Request completed successfully', tag: context);
//       return result;
//     } catch (e) {
//       final failure = ErrorHandler.handleError(e);
//       ErrorHandler.logError(failure, context: context);
//       throw failure;
//     }
//   }

//   /// Execute a request with offline fallback
//   Future<T> executeRequestWithFallback<T>(
//     Future<T> Function() networkRequest,
//     Future<T> Function() offlineRequest, {
//     String? context,
//   }) async {
//     try {
//       final hasConnection = await _connectivityService.hasConnection();
//       if (hasConnection) {
//         return await executeRequest(networkRequest, context: context);
//       } else {
//         AppLogger.warning('No connection, using offline data', tag: context);
//         return await offlineRequest();
//       }
//     } catch (e) {
//       final failure = ErrorHandler.handleError(e);
//       ErrorHandler.logError(failure, context: context);
//       throw failure;
//     }
//   }
// }
