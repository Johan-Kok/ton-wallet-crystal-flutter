import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_contract_asset.freezed.dart';

@freezed
class TokenContractAsset with _$TokenContractAsset {
  const factory TokenContractAsset({
    required String name,
    int? chainId,
    required String symbol,
    required int decimals,
    required String address,
    String? logoURI,
    required int version,
  }) = _TokenContractAsset;
}
