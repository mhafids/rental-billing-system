import 'package:basic_utils/basic_utils.dart';


class CertificateGenerator {
  static Map<String, String> generateFull({
    String name = 'androidtv-remote',
  }) {
    final rsaKeyPair = CryptoUtils.generateRSAKeyPair(keySize: 2048);
    final privateKey = rsaKeyPair.privateKey as RSAPrivateKey;
    
    final attributes = {
      'CN': name,
      'C': 'US',
      'ST': 'California',
      'L': 'Mountain View',
      'O': 'Google',
      'OU': 'Android',
    };

    final csr = X509Utils.generateRsaCsrPem(
      attributes, 
      privateKey, 
      rsaKeyPair.publicKey as RSAPublicKey,
    );

    final certPem = X509Utils.generateSelfSignedCertificate(
      privateKey, 
      csr,
      3650,
    );

    final privateKeyPem = CryptoUtils.encodeRSAPrivateKeyToPem(privateKey);

    return {
      'cert': certPem,
      'key': privateKeyPem,
    };
  }
}
