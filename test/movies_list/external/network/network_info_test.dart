import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_list_app/core/external/network_info_imp.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  late NetworkInfoImp networkInfo;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImp(mockInternetConnectionChecker);
  });

  group('networkInfo:', () {
    test('should call networkInfoImp to check data connection', () async {
      const bool tHasConnection = true;

      when(mockInternetConnectionChecker.hasConnection)
          .thenAnswer((_) async => tHasConnection);

      final result = await networkInfo.isConnected;

      verify(mockInternetConnectionChecker.hasConnection);
      expect(result, tHasConnection);
    });
  });
}
