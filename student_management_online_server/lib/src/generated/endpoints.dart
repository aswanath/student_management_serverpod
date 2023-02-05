/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/example_endpoint.dart' as _i2;
import '../endpoints/student_endpoint.dart' as _i3;
import 'package:student_management_online_server/src/generated/student.dart'
    as _i4;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'example': _i2.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'studentEndPoint': _i3.StudentEndPoint()
        ..initialize(
          server,
          'studentEndPoint',
          null,
        ),
    };
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i2.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['studentEndPoint'] = _i1.EndpointConnector(
      name: 'studentEndPoint',
      endpoint: endpoints['studentEndPoint']!,
      methodConnectors: {
        'getStudents': _i1.MethodConnector(
          name: 'getStudents',
          params: {
            'keyWord': _i1.ParameterDescription(
              name: 'keyWord',
              type: _i1.getType<String?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['studentEndPoint'] as _i3.StudentEndPoint).getStudents(
            session,
            keyWord: params['keyWord'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'student': _i1.ParameterDescription(
              name: 'student',
              type: _i1.getType<_i4.Student>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['studentEndPoint'] as _i3.StudentEndPoint).create(
            session,
            params['student'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'student': _i1.ParameterDescription(
              name: 'student',
              type: _i1.getType<_i4.Student>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['studentEndPoint'] as _i3.StudentEndPoint).update(
            session,
            params['student'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['studentEndPoint'] as _i3.StudentEndPoint).delete(
            session,
            params['id'],
          ),
        ),
        'get': _i1.MethodConnector(
          name: 'get',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['studentEndPoint'] as _i3.StudentEndPoint).get(
            session,
            params['id'],
          ),
        ),
      },
    );
  }
}
