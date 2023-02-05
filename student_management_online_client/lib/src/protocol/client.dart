/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:student_management_online_client/src/protocol/student.dart'
    as _i3;
import 'dart:io' as _i4;
import 'protocol.dart' as _i5;

class _EndpointExample extends _i1.EndpointRef {
  _EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

class _EndpointStudentEndPoint extends _i1.EndpointRef {
  _EndpointStudentEndPoint(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'studentEndPoint';

  _i2.Future<List<_i3.Student>> getStudents({String? keyWord}) =>
      caller.callServerEndpoint<List<_i3.Student>>(
        'studentEndPoint',
        'getStudents',
        {'keyWord': keyWord},
      );

  _i2.Future<_i3.Student> create(_i3.Student student) =>
      caller.callServerEndpoint<_i3.Student>(
        'studentEndPoint',
        'create',
        {'student': student},
      );

  _i2.Future<bool> update(_i3.Student student) =>
      caller.callServerEndpoint<bool>(
        'studentEndPoint',
        'update',
        {'student': student},
      );

  _i2.Future<void> delete(int id) => caller.callServerEndpoint<void>(
        'studentEndPoint',
        'delete',
        {'id': id},
      );

  _i2.Future<_i3.Student?> get(int id) =>
      caller.callServerEndpoint<_i3.Student?>(
        'studentEndPoint',
        'get',
        {'id': id},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i4.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i5.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    example = _EndpointExample(this);
    studentEndPoint = _EndpointStudentEndPoint(this);
  }

  late final _EndpointExample example;

  late final _EndpointStudentEndPoint studentEndPoint;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'example': example,
        'studentEndPoint': studentEndPoint,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
