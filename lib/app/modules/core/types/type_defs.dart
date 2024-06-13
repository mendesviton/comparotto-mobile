import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef PermissionMap = Map<String, bool>;
typedef DataMap = Map<String, dynamic>;
