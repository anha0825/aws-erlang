%% WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
%% See https://github.com/aws-beam/aws-codegen for more details.

%% @doc Amazon Web Services Payment Cryptography Control Plane APIs manage
%% encryption keys for use during payment-related cryptographic operations.
%%
%% You can create, import, export, share, manage, and delete keys. You can
%% also manage Identity and Access Management (IAM) policies for keys. For
%% more information, see Identity and access management:
%% https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security-iam.html
%% in the Amazon Web Services Payment Cryptography User Guide.
%%
%% To use encryption keys for payment-related transaction processing and
%% associated cryptographic operations, you use the Amazon Web Services
%% Payment Cryptography Data Plane:
%% https://docs.aws.amazon.com/payment-cryptography/latest/DataAPIReference/Welcome.html.
%% You can perform actions like encrypt, decrypt, generate, and verify
%% payment-related data.
%%
%% All Amazon Web Services Payment Cryptography API calls must be signed and
%% transmitted using Transport Layer Security (TLS). We recommend you always
%% use the latest supported TLS version for logging API requests.
%%
%% Amazon Web Services Payment Cryptography supports CloudTrail for control
%% plane operations, a service that logs Amazon Web Services API calls and
%% related events for your Amazon Web Services account and delivers them to
%% an Amazon S3 bucket you specify. By using the information collected by
%% CloudTrail, you can determine what requests were made to Amazon Web
%% Services Payment Cryptography, who made the request, when it was made, and
%% so on. If you don't conﬁgure a trail, you can still view the most
%% recent events in the CloudTrail console. For more information, see the
%% CloudTrail User Guide:
%% https://docs.aws.amazon.com/awscloudtrail/latest/userguide/.
-module(aws_payment_cryptography).

-export([create_alias/2,
         create_alias/3,
         create_key/2,
         create_key/3,
         delete_alias/2,
         delete_alias/3,
         delete_key/2,
         delete_key/3,
         export_key/2,
         export_key/3,
         get_alias/2,
         get_alias/3,
         get_key/2,
         get_key/3,
         get_parameters_for_export/2,
         get_parameters_for_export/3,
         get_parameters_for_import/2,
         get_parameters_for_import/3,
         get_public_key_certificate/2,
         get_public_key_certificate/3,
         import_key/2,
         import_key/3,
         list_aliases/2,
         list_aliases/3,
         list_keys/2,
         list_keys/3,
         list_tags_for_resource/2,
         list_tags_for_resource/3,
         restore_key/2,
         restore_key/3,
         start_key_usage/2,
         start_key_usage/3,
         stop_key_usage/2,
         stop_key_usage/3,
         tag_resource/2,
         tag_resource/3,
         untag_resource/2,
         untag_resource/3,
         update_alias/2,
         update_alias/3]).

-include_lib("hackney/include/hackney_lib.hrl").

%%====================================================================
%% API
%%====================================================================

%% @doc Creates an alias, or a friendly name, for an Amazon Web Services
%% Payment Cryptography key.
%%
%% You can use an alias to identify a key in the console and when you call
%% cryptographic operations such as EncryptData:
%% https://docs.aws.amazon.com/payment-cryptography/latest/DataAPIReference/API_EncryptData.html
%% or DecryptData:
%% https://docs.aws.amazon.com/payment-cryptography/latest/DataAPIReference/API_DecryptData.html.
%%
%% You can associate the alias with any key in the same Amazon Web Services
%% Region. Each alias is associated with only one key at a time, but a key
%% can have multiple aliases. You can't create an alias without a key.
%% The alias must be unique in the account and Amazon Web Services Region,
%% but you can create another alias with the same name in a different Amazon
%% Web Services Region.
%%
%% To change the key that's associated with the alias, call
%% `UpdateAlias'. To delete the alias, call `DeleteAlias'. These
%% operations don't affect the underlying key. To get the alias that you
%% created, call `ListAliases'.
%%
%% Cross-account use: This operation can't be used across different
%% Amazon Web Services accounts.
%%
%% Related operations:
%%
%% <ul> <li> `DeleteAlias'
%%
%% </li> <li> `GetAlias'
%%
%% </li> <li> `ListAliases'
%%
%% </li> <li> `UpdateAlias'
%%
%% </li> </ul>
create_alias(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_alias(Client, Input, []).
create_alias(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateAlias">>, Input, Options).

%% @doc Creates an Amazon Web Services Payment Cryptography key, a logical
%% representation of a cryptographic key, that is unique in your account and
%% Amazon Web Services Region.
%%
%% You use keys for cryptographic functions such as encryption and
%% decryption.
%%
%% In addition to the key material used in cryptographic operations, an
%% Amazon Web Services Payment Cryptography key includes metadata such as the
%% key ARN, key usage, key origin, creation date, description, and key state.
%%
%% When you create a key, you specify both immutable and mutable data about
%% the key. The immutable data contains key attributes that define the scope
%% and cryptographic operations that you can perform using the key, for
%% example key class (example: `SYMMETRIC_KEY'), key algorithm (example:
%% `TDES_2KEY'), key usage (example: `TR31_P0_PIN_ENCRYPTION_KEY')
%% and key modes of use (example: `Encrypt'). For information about valid
%% combinations of key attributes, see Understanding key attributes:
%% https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-validattributes.html
%% in the Amazon Web Services Payment Cryptography User Guide. The mutable
%% data contained within a key includes usage timestamp and key deletion
%% timestamp and can be modified after creation.
%%
%% Amazon Web Services Payment Cryptography binds key attributes to keys
%% using key blocks when you store or export them. Amazon Web Services
%% Payment Cryptography stores the key contents wrapped and never stores or
%% transmits them in the clear.
%%
%% Cross-account use: This operation can't be used across different
%% Amazon Web Services accounts.
%%
%% Related operations:
%%
%% <ul> <li> `DeleteKey'
%%
%% </li> <li> `GetKey'
%%
%% </li> <li> `ListKeys'
%%
%% </li> </ul>
create_key(Client, Input)
  when is_map(Client), is_map(Input) ->
    create_key(Client, Input, []).
create_key(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"CreateKey">>, Input, Options).

%% @doc Deletes the alias, but doesn't affect the underlying key.
%%
%% Each key can have multiple aliases. To get the aliases of all keys, use
%% the `ListAliases' operation. To change the alias of a key, first use
%% `DeleteAlias' to delete the current alias and then use
%% `CreateAlias' to create a new alias. To associate an existing alias
%% with a different key, call `UpdateAlias'.
%%
%% Cross-account use: This operation can't be used across different
%% Amazon Web Services accounts.
%%
%% Related operations:
%%
%% <ul> <li> `CreateAlias'
%%
%% </li> <li> `GetAlias'
%%
%% </li> <li> `ListAliases'
%%
%% </li> <li> `UpdateAlias'
%%
%% </li> </ul>
delete_alias(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_alias(Client, Input, []).
delete_alias(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteAlias">>, Input, Options).

%% @doc Deletes the key material and metadata associated with Amazon Web
%% Services Payment Cryptography key.
%%
%% Key deletion is irreversible. After a key is deleted, you can't
%% perform cryptographic operations using the key. For example, you can't
%% decrypt data that was encrypted by a deleted Amazon Web Services Payment
%% Cryptography key, and the data may become unrecoverable. Because key
%% deletion is destructive, Amazon Web Services Payment Cryptography has a
%% safety mechanism to prevent accidental deletion of a key. When you call
%% this operation, Amazon Web Services Payment Cryptography disables the
%% specified key but doesn't delete it until after a waiting period set
%% using `DeleteKeyInDays'. The default waiting period is 7 days. During
%% the waiting period, the `KeyState' is `DELETE_PENDING'. After the
%% key is deleted, the `KeyState' is `DELETE_COMPLETE'.
%%
%% You should delete a key only when you are sure that you don't need to
%% use it anymore and no other parties are utilizing this key. If you
%% aren't sure, consider deactivating it instead by calling
%% `StopKeyUsage'.
%%
%% Cross-account use: This operation can't be used across different
%% Amazon Web Services accounts.
%%
%% Related operations:
%%
%% <ul> <li> `RestoreKey'
%%
%% </li> <li> `StartKeyUsage'
%%
%% </li> <li> `StopKeyUsage'
%%
%% </li> </ul>
delete_key(Client, Input)
  when is_map(Client), is_map(Input) ->
    delete_key(Client, Input, []).
delete_key(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"DeleteKey">>, Input, Options).

%% @doc Exports a key from Amazon Web Services Payment Cryptography.
%%
%% Amazon Web Services Payment Cryptography simplifies key exchange by
%% replacing the existing paper-based approach with a modern electronic
%% approach. With `ExportKey' you can export symmetric keys using either
%% symmetric and asymmetric key exchange mechanisms. Using this operation,
%% you can share your Amazon Web Services Payment Cryptography generated keys
%% with other service partners to perform cryptographic operations outside of
%% Amazon Web Services Payment Cryptography
%%
%% For symmetric key exchange, Amazon Web Services Payment Cryptography uses
%% the ANSI X9 TR-31 norm in accordance with PCI PIN guidelines. And for
%% asymmetric key exchange, Amazon Web Services Payment Cryptography supports
%% ANSI X9 TR-34 norm and RSA wrap and unwrap key exchange mechanism.
%% Asymmetric key exchange methods are typically used to establish
%% bi-directional trust between the two parties exhanging keys and are used
%% for initial key exchange such as Key Encryption Key (KEK). After which you
%% can export working keys using symmetric method to perform various
%% cryptographic operations within Amazon Web Services Payment Cryptography.
%%
%% The TR-34 norm is intended for exchanging 3DES keys only and keys are
%% imported in a WrappedKeyBlock format. Key attributes (such as KeyUsage,
%% KeyAlgorithm, KeyModesOfUse, Exportability) are contained within the key
%% block. With RSA wrap and unwrap, you can exchange both 3DES and AES-128
%% keys. The keys are imported in a WrappedKeyCryptogram format and you will
%% need to specify the key attributes during import.
%%
%% You can also use `ExportKey' functionality to generate and export an
%% IPEK (Initial Pin Encryption Key) from Amazon Web Services Payment
%% Cryptography using either TR-31 or TR-34 export key exchange. IPEK is
%% generated from BDK (Base Derivation Key) and `ExportDukptInitialKey'
%% attribute KSN (`KeySerialNumber'). The generated IPEK does not persist
%% within Amazon Web Services Payment Cryptography and has to be re-generated
%% each time during export.
%%
%% To export initial keys (KEK) or IPEK using TR-34
%%
%% Using this operation, you can export initial key using TR-34 asymmetric
%% key exchange. You can only export KEK generated within Amazon Web Services
%% Payment Cryptography. In TR-34 terminology, the sending party of the key
%% is called Key Distribution Host (KDH) and the receiving party of the key
%% is called Key Receiving Device (KRD). During key export process, KDH is
%% Amazon Web Services Payment Cryptography which initiates key export and
%% KRD is the user receiving the key.
%%
%% To initiate TR-34 key export, the KRD must obtain an export token by
%% calling `GetParametersForExport'. This operation also generates a key
%% pair for the purpose of key export, signs the key and returns back the
%% signing public key certificate (also known as KDH signing certificate) and
%% root certificate chain. The KDH uses the private key to sign the the
%% export payload and the signing public key certificate is provided to KRD
%% to verify the signature. The KRD can import the root certificate into its
%% Hardware Security Module (HSM), as required. The export token and the
%% associated KDH signing certificate expires after 7 days.
%%
%% Next the KRD generates a key pair for the the purpose of encrypting the
%% KDH key and provides the public key cerificate (also known as KRD wrapping
%% certificate) back to KDH. The KRD will also import the root cerificate
%% chain into Amazon Web Services Payment Cryptography by calling
%% `ImportKey' for `RootCertificatePublicKey'. The KDH, Amazon Web
%% Services Payment Cryptography, will use the KRD wrapping cerificate to
%% encrypt (wrap) the key under export and signs it with signing private key
%% to generate a TR-34 WrappedKeyBlock. For more information on TR-34 key
%% export, see section Exporting symmetric keys:
%% https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-export.html
%% in the Amazon Web Services Payment Cryptography User Guide.
%%
%% Set the following parameters:
%%
%% <ul> <li> `ExportAttributes': Specify export attributes in case of
%% IPEK export. This parameter is optional for KEK export.
%%
%% </li> <li> `ExportKeyIdentifier': The `KeyARN' of the KEK or BDK
%% (in case of IPEK) under export.
%%
%% </li> <li> `KeyMaterial': Use `Tr34KeyBlock' parameters.
%%
%% </li> <li> `CertificateAuthorityPublicKeyIdentifier': The `KeyARN'
%% of the certificate chain that signed the KRD wrapping key certificate.
%%
%% </li> <li> `ExportToken': Obtained from KDH by calling
%% `GetParametersForImport'.
%%
%% </li> <li> `WrappingKeyCertificate': The public key certificate in PEM
%% format (base64 encoded) of the KRD wrapping key Amazon Web Services
%% Payment Cryptography uses for encryption of the TR-34 export payload. This
%% certificate must be signed by the root certificate
%% (CertificateAuthorityPublicKeyIdentifier) imported into Amazon Web
%% Services Payment Cryptography.
%%
%% </li> </ul> When this operation is successful, Amazon Web Services Payment
%% Cryptography returns the KEK or IPEK as a TR-34 WrappedKeyBlock.
%%
%% To export initial keys (KEK) or IPEK using RSA Wrap and Unwrap
%%
%% Using this operation, you can export initial key using asymmetric RSA wrap
%% and unwrap key exchange method. To initiate export, generate an asymmetric
%% key pair on the receiving HSM and obtain the public key certificate in PEM
%% format (base64 encoded) for the purpose of wrapping and the root
%% certifiate chain. Import the root certificate into Amazon Web Services
%% Payment Cryptography by calling `ImportKey' for
%% `RootCertificatePublicKey'.
%%
%% Next call `ExportKey' and set the following parameters:
%%
%% <ul> <li> `CertificateAuthorityPublicKeyIdentifier': The `KeyARN'
%% of the certificate chain that signed wrapping key certificate.
%%
%% </li> <li> `KeyMaterial': Set to `KeyCryptogram'.
%%
%% </li> <li> `WrappingKeyCertificate': The public key certificate in PEM
%% format (base64 encoded) obtained by the receiving HSM and signed by the
%% root certificate (CertificateAuthorityPublicKeyIdentifier) imported into
%% Amazon Web Services Payment Cryptography. The receiving HSM uses its
%% private key component to unwrap the WrappedKeyCryptogram.
%%
%% </li> </ul> When this operation is successful, Amazon Web Services Payment
%% Cryptography returns the WrappedKeyCryptogram.
%%
%% To export working keys or IPEK using TR-31
%%
%% Using this operation, you can export working keys or IPEK using TR-31
%% symmetric key exchange. In TR-31, you must use an initial key such as KEK
%% to encrypt or wrap the key under export. To establish a KEK, you can use
%% `CreateKey' or `ImportKey'.
%%
%% Set the following parameters:
%%
%% <ul> <li> `ExportAttributes': Specify export attributes in case of
%% IPEK export. This parameter is optional for KEK export.
%%
%% </li> <li> `ExportKeyIdentifier': The `KeyARN' of the KEK or BDK
%% (in case of IPEK) under export.
%%
%% </li> <li> `KeyMaterial': Use `Tr31KeyBlock' parameters.
%%
%% </li> </ul> When this operation is successful, Amazon Web Services Payment
%% Cryptography returns the working key or IPEK as a TR-31 WrappedKeyBlock.
%%
%% Cross-account use: This operation can't be used across different
%% Amazon Web Services accounts.
%%
%% Related operations:
%%
%% <ul> <li> `GetParametersForExport'
%%
%% </li> <li> `ImportKey'
%%
%% </li> </ul>
export_key(Client, Input)
  when is_map(Client), is_map(Input) ->
    export_key(Client, Input, []).
export_key(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ExportKey">>, Input, Options).

%% @doc Gets the Amazon Web Services Payment Cryptography key associated with
%% the alias.
%%
%% Cross-account use: This operation can't be used across different
%% Amazon Web Services accounts.
%%
%% Related operations:
%%
%% <ul> <li> `CreateAlias'
%%
%% </li> <li> `DeleteAlias'
%%
%% </li> <li> `ListAliases'
%%
%% </li> <li> `UpdateAlias'
%%
%% </li> </ul>
get_alias(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_alias(Client, Input, []).
get_alias(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetAlias">>, Input, Options).

%% @doc Gets the key material for an Amazon Web Services Payment Cryptography
%% key, including the immutable and mutable data specified when the key was
%% created.
%%
%% Cross-account use: This operation can't be used across different
%% Amazon Web Services accounts.
%%
%% Related operations:
%%
%% <ul> <li> `CreateKey'
%%
%% </li> <li> `DeleteKey'
%%
%% </li> <li> `ListKeys'
%%
%% </li> </ul>
get_key(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_key(Client, Input, []).
get_key(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetKey">>, Input, Options).

%% @doc Gets the export token and the signing key certificate to initiate a
%% TR-34 key export from Amazon Web Services Payment Cryptography.
%%
%% The signing key certificate signs the wrapped key under export within the
%% TR-34 key payload. The export token and signing key certificate must be in
%% place and operational before calling `ExportKey'. The export token
%% expires in 7 days. You can use the same export token to export multiple
%% keys from your service account.
%%
%% Cross-account use: This operation can't be used across different
%% Amazon Web Services accounts.
%%
%% Related operations:
%%
%% <ul> <li> `ExportKey'
%%
%% </li> <li> `GetParametersForImport'
%%
%% </li> </ul>
get_parameters_for_export(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_parameters_for_export(Client, Input, []).
get_parameters_for_export(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetParametersForExport">>, Input, Options).

%% @doc Gets the import token and the wrapping key certificate in PEM format
%% (base64 encoded) to initiate a TR-34 WrappedKeyBlock or a RSA
%% WrappedKeyCryptogram import into Amazon Web Services Payment Cryptography.
%%
%% The wrapping key certificate wraps the key under import. The import token
%% and wrapping key certificate must be in place and operational before
%% calling `ImportKey'. The import token expires in 7 days. You can use
%% the same import token to import multiple keys into your service account.
%%
%% Cross-account use: This operation can't be used across different
%% Amazon Web Services accounts.
%%
%% Related operations:
%%
%% <ul> <li> `GetParametersForExport'
%%
%% </li> <li> `ImportKey'
%%
%% </li> </ul>
get_parameters_for_import(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_parameters_for_import(Client, Input, []).
get_parameters_for_import(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetParametersForImport">>, Input, Options).

%% @doc Gets the public key certificate of the asymmetric key pair that
%% exists within Amazon Web Services Payment Cryptography.
%%
%% Unlike the private key of an asymmetric key, which never leaves Amazon Web
%% Services Payment Cryptography unencrypted, callers with
%% `GetPublicKeyCertificate' permission can download the public key
%% certificate of the asymmetric key. You can share the public key
%% certificate to allow others to encrypt messages and verify signatures
%% outside of Amazon Web Services Payment Cryptography
%%
%% Cross-account use: This operation can't be used across different
%% Amazon Web Services accounts.
get_public_key_certificate(Client, Input)
  when is_map(Client), is_map(Input) ->
    get_public_key_certificate(Client, Input, []).
get_public_key_certificate(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"GetPublicKeyCertificate">>, Input, Options).

%% @doc Imports symmetric keys and public key certificates in PEM format
%% (base64 encoded) into Amazon Web Services Payment Cryptography.
%%
%% Amazon Web Services Payment Cryptography simplifies key exchange by
%% replacing the existing paper-based approach with a modern electronic
%% approach. With `ImportKey' you can import symmetric keys using either
%% symmetric and asymmetric key exchange mechanisms.
%%
%% For symmetric key exchange, Amazon Web Services Payment Cryptography uses
%% the ANSI X9 TR-31 norm in accordance with PCI PIN guidelines. And for
%% asymmetric key exchange, Amazon Web Services Payment Cryptography supports
%% ANSI X9 TR-34 norm and RSA wrap and unwrap key exchange mechanisms.
%% Asymmetric key exchange methods are typically used to establish
%% bi-directional trust between the two parties exhanging keys and are used
%% for initial key exchange such as Key Encryption Key (KEK) or Zone Master
%% Key (ZMK). After which you can import working keys using symmetric method
%% to perform various cryptographic operations within Amazon Web Services
%% Payment Cryptography.
%%
%% The TR-34 norm is intended for exchanging 3DES keys only and keys are
%% imported in a WrappedKeyBlock format. Key attributes (such as KeyUsage,
%% KeyAlgorithm, KeyModesOfUse, Exportability) are contained within the key
%% block. With RSA wrap and unwrap, you can exchange both 3DES and AES-128
%% keys. The keys are imported in a WrappedKeyCryptogram format and you will
%% need to specify the key attributes during import.
%%
%% You can also import a root public key certificate, used to sign other
%% public key certificates, or a trusted public key certificate under an
%% already established root public key certificate.
%%
%% To import a public root key certificate
%%
%% You can also import a root public key certificate, used to sign other
%% public key certificates, or a trusted public key certificate under an
%% already established root public key certificate.
%%
%% To import a public root key certificate
%%
%% Using this operation, you can import the public component (in PEM
%% cerificate format) of your private root key. You can use the imported
%% public root key certificate for digital signatures, for example signing
%% wrapping key or signing key in TR-34, within your Amazon Web Services
%% Payment Cryptography account.
%%
%% Set the following parameters:
%%
%% <ul> <li> `KeyMaterial': `RootCertificatePublicKey'
%%
%% </li> <li> `KeyClass': `PUBLIC_KEY'
%%
%% </li> <li> `KeyModesOfUse': `Verify'
%%
%% </li> <li> `KeyUsage':
%% `TR31_S0_ASYMMETRIC_KEY_FOR_DIGITAL_SIGNATURE'
%%
%% </li> <li> `PublicKeyCertificate': The public key certificate in PEM
%% format (base64 encoded) of the private root key under import.
%%
%% </li> </ul> To import a trusted public key certificate
%%
%% The root public key certificate must be in place and operational before
%% you import a trusted public key certificate. Set the following parameters:
%%
%% <ul> <li> `KeyMaterial': `TrustedCertificatePublicKey'
%%
%% </li> <li> `CertificateAuthorityPublicKeyIdentifier': `KeyArn' of
%% the `RootCertificatePublicKey'.
%%
%% </li> <li> `KeyModesOfUse' and `KeyUsage': Corresponding to the
%% cryptographic operations such as wrap, sign, or encrypt that you will
%% allow the trusted public key certificate to perform.
%%
%% </li> <li> `PublicKeyCertificate': The trusted public key certificate
%% in PEM format (base64 encoded) under import.
%%
%% </li> </ul> To import initial keys (KEK or ZMK or similar) using TR-34
%%
%% Using this operation, you can import initial key using TR-34 asymmetric
%% key exchange. In TR-34 terminology, the sending party of the key is called
%% Key Distribution Host (KDH) and the receiving party of the key is called
%% Key Receiving Device (KRD). During the key import process, KDH is the user
%% who initiates the key import and KRD is Amazon Web Services Payment
%% Cryptography who receives the key.
%%
%% To initiate TR-34 key import, the KDH must obtain an import token by
%% calling `GetParametersForImport'. This operation generates an
%% encryption keypair for the purpose of key import, signs the key and
%% returns back the wrapping key certificate (also known as KRD wrapping
%% certificate) and the root certificate chain. The KDH must trust and
%% install the KRD wrapping certificate on its HSM and use it to encrypt
%% (wrap) the KDH key during TR-34 WrappedKeyBlock generation. The import
%% token and associated KRD wrapping certificate expires after 7 days.
%%
%% Next the KDH generates a key pair for the purpose of signing the encrypted
%% KDH key and provides the public certificate of the signing key to Amazon
%% Web Services Payment Cryptography. The KDH will also need to import the
%% root certificate chain of the KDH signing certificate by calling
%% `ImportKey' for `RootCertificatePublicKey'. For more information
%% on TR-34 key import, see section Importing symmetric keys:
%% https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-import.html
%% in the Amazon Web Services Payment Cryptography User Guide.
%%
%% Set the following parameters:
%%
%% <ul> <li> `KeyMaterial': Use `Tr34KeyBlock' parameters.
%%
%% </li> <li> `CertificateAuthorityPublicKeyIdentifier': The `KeyARN'
%% of the certificate chain that signed the KDH signing key certificate.
%%
%% </li> <li> `ImportToken': Obtained from KRD by calling
%% `GetParametersForImport'.
%%
%% </li> <li> `WrappedKeyBlock': The TR-34 wrapped key material from KDH.
%% It contains the KDH key under import, wrapped with KRD wrapping
%% certificate and signed by KDH signing private key. This TR-34 key block is
%% typically generated by the KDH Hardware Security Module (HSM) outside of
%% Amazon Web Services Payment Cryptography.
%%
%% </li> <li> `SigningKeyCertificate': The public key certificate in PEM
%% format (base64 encoded) of the KDH signing key generated under the root
%% certificate (CertificateAuthorityPublicKeyIdentifier) imported in Amazon
%% Web Services Payment Cryptography.
%%
%% </li> </ul> To import initial keys (KEK or ZMK or similar) using RSA Wrap
%% and Unwrap
%%
%% Using this operation, you can import initial key using asymmetric RSA wrap
%% and unwrap key exchange method. To initiate import, call
%% `GetParametersForImport' with `KeyMaterial' set to
%% `KEY_CRYPTOGRAM' to generate an import token. This operation also
%% generates an encryption keypair for the purpose of key import, signs the
%% key and returns back the wrapping key certificate in PEM format (base64
%% encoded) and its root certificate chain. The import token and associated
%% KRD wrapping certificate expires after 7 days.
%%
%% You must trust and install the wrapping certificate and its certificate
%% chain on the sending HSM and use it to wrap the key under export for
%% WrappedKeyCryptogram generation. Next call `ImportKey' with
%% `KeyMaterial' set to `KEY_CRYPTOGRAM' and provide the
%% `ImportToken' and `KeyAttributes' for the key under import.
%%
%% To import working keys using TR-31
%%
%% Amazon Web Services Payment Cryptography uses TR-31 symmetric key exchange
%% norm to import working keys. A KEK must be established within Amazon Web
%% Services Payment Cryptography by using TR-34 key import or by using
%% `CreateKey'. To initiate a TR-31 key import, set the following
%% parameters:
%%
%% <ul> <li> `KeyMaterial': Use `Tr31KeyBlock' parameters.
%%
%% </li> <li> `WrappedKeyBlock': The TR-31 wrapped key material. It
%% contains the key under import, encrypted using KEK. The TR-31 key block is
%% typically generated by a HSM outside of Amazon Web Services Payment
%% Cryptography.
%%
%% </li> <li> `WrappingKeyIdentifier': The `KeyArn' of the KEK that
%% Amazon Web Services Payment Cryptography uses to decrypt or unwrap the key
%% under import.
%%
%% </li> </ul> Cross-account use: This operation can't be used across
%% different Amazon Web Services accounts.
%%
%% Related operations:
%%
%% <ul> <li> `ExportKey'
%%
%% </li> <li> `GetParametersForImport'
%%
%% </li> </ul>
import_key(Client, Input)
  when is_map(Client), is_map(Input) ->
    import_key(Client, Input, []).
import_key(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ImportKey">>, Input, Options).

%% @doc Lists the aliases for all keys in the caller's Amazon Web
%% Services account and Amazon Web Services Region.
%%
%% You can filter the list of aliases. For more information, see Using
%% aliases:
%% https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-managealias.html
%% in the Amazon Web Services Payment Cryptography User Guide.
%%
%% This is a paginated operation, which means that each response might
%% contain only a subset of all the aliases. When the response contains only
%% a subset of aliases, it includes a `NextToken' value. Use this value
%% in a subsequent `ListAliases' request to get more aliases. When you
%% receive a response with no NextToken (or an empty or null value), that
%% means there are no more aliases to get.
%%
%% Cross-account use: This operation can't be used across different
%% Amazon Web Services accounts.
%%
%% Related operations:
%%
%% <ul> <li> `CreateAlias'
%%
%% </li> <li> `DeleteAlias'
%%
%% </li> <li> `GetAlias'
%%
%% </li> <li> `UpdateAlias'
%%
%% </li> </ul>
list_aliases(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_aliases(Client, Input, []).
list_aliases(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListAliases">>, Input, Options).

%% @doc Lists the keys in the caller's Amazon Web Services account and
%% Amazon Web Services Region.
%%
%% You can filter the list of keys.
%%
%% This is a paginated operation, which means that each response might
%% contain only a subset of all the keys. When the response contains only a
%% subset of keys, it includes a `NextToken' value. Use this value in a
%% subsequent `ListKeys' request to get more keys. When you receive a
%% response with no NextToken (or an empty or null value), that means there
%% are no more keys to get.
%%
%% Cross-account use: This operation can't be used across different
%% Amazon Web Services accounts.
%%
%% Related operations:
%%
%% <ul> <li> `CreateKey'
%%
%% </li> <li> `DeleteKey'
%%
%% </li> <li> `GetKey'
%%
%% </li> </ul>
list_keys(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_keys(Client, Input, []).
list_keys(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListKeys">>, Input, Options).

%% @doc Lists the tags for an Amazon Web Services resource.
%%
%% This is a paginated operation, which means that each response might
%% contain only a subset of all the tags. When the response contains only a
%% subset of tags, it includes a `NextToken' value. Use this value in a
%% subsequent `ListTagsForResource' request to get more tags. When you
%% receive a response with no NextToken (or an empty or null value), that
%% means there are no more tags to get.
%%
%% Cross-account use: This operation can't be used across different
%% Amazon Web Services accounts.
%%
%% Related operations:
%%
%% <ul> <li> `TagResource'
%%
%% </li> <li> `UntagResource'
%%
%% </li> </ul>
list_tags_for_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    list_tags_for_resource(Client, Input, []).
list_tags_for_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"ListTagsForResource">>, Input, Options).

%% @doc Cancels a scheduled key deletion during the waiting period.
%%
%% Use this operation to restore a `Key' that is scheduled for deletion.
%%
%% During the waiting period, the `KeyState' is `DELETE_PENDING' and
%% `deletePendingTimestamp' contains the date and time after which the
%% `Key' will be deleted. After `Key' is restored, the `KeyState'
%% is `CREATE_COMPLETE', and the value for `deletePendingTimestamp'
%% is removed.
%%
%% Cross-account use: This operation can't be used across different
%% Amazon Web Services accounts.
%%
%% Related operations:
%%
%% <ul> <li> `DeleteKey'
%%
%% </li> <li> `StartKeyUsage'
%%
%% </li> <li> `StopKeyUsage'
%%
%% </li> </ul>
restore_key(Client, Input)
  when is_map(Client), is_map(Input) ->
    restore_key(Client, Input, []).
restore_key(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"RestoreKey">>, Input, Options).

%% @doc Enables an Amazon Web Services Payment Cryptography key, which makes
%% it active for cryptographic operations within Amazon Web Services Payment
%% Cryptography
%%
%% Cross-account use: This operation can't be used across different
%% Amazon Web Services accounts.
%%
%% Related operations:
%%
%% <ul> <li> `StopKeyUsage'
%%
%% </li> </ul>
start_key_usage(Client, Input)
  when is_map(Client), is_map(Input) ->
    start_key_usage(Client, Input, []).
start_key_usage(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"StartKeyUsage">>, Input, Options).

%% @doc Disables an Amazon Web Services Payment Cryptography key, which makes
%% it inactive within Amazon Web Services Payment Cryptography.
%%
%% You can use this operation instead of `DeleteKey' to deactivate a key.
%% You can enable the key in the future by calling `StartKeyUsage'.
%%
%% Cross-account use: This operation can't be used across different
%% Amazon Web Services accounts.
%%
%% Related operations:
%%
%% <ul> <li> `DeleteKey'
%%
%% </li> <li> `StartKeyUsage'
%%
%% </li> </ul>
stop_key_usage(Client, Input)
  when is_map(Client), is_map(Input) ->
    stop_key_usage(Client, Input, []).
stop_key_usage(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"StopKeyUsage">>, Input, Options).

%% @doc Adds or edits tags on an Amazon Web Services Payment Cryptography
%% key.
%%
%% Tagging or untagging an Amazon Web Services Payment Cryptography key can
%% allow or deny permission to the key.
%%
%% Each tag consists of a tag key and a tag value, both of which are
%% case-sensitive strings. The tag value can be an empty (null) string. To
%% add a tag, specify a new tag key and a tag value. To edit a tag, specify
%% an existing tag key and a new tag value. You can also add tags to an
%% Amazon Web Services Payment Cryptography key when you create it with
%% `CreateKey'.
%%
%% Cross-account use: This operation can't be used across different
%% Amazon Web Services accounts.
%%
%% Related operations:
%%
%% <ul> <li> `ListTagsForResource'
%%
%% </li> <li> `UntagResource'
%%
%% </li> </ul>
tag_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    tag_resource(Client, Input, []).
tag_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"TagResource">>, Input, Options).

%% @doc Deletes a tag from an Amazon Web Services Payment Cryptography key.
%%
%% Tagging or untagging an Amazon Web Services Payment Cryptography key can
%% allow or deny permission to the key.
%%
%% Cross-account use: This operation can't be used across different
%% Amazon Web Services accounts.
%%
%% Related operations:
%%
%% <ul> <li> `ListTagsForResource'
%%
%% </li> <li> `TagResource'
%%
%% </li> </ul>
untag_resource(Client, Input)
  when is_map(Client), is_map(Input) ->
    untag_resource(Client, Input, []).
untag_resource(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UntagResource">>, Input, Options).

%% @doc Associates an existing Amazon Web Services Payment Cryptography alias
%% with a different key.
%%
%% Each alias is associated with only one Amazon Web Services Payment
%% Cryptography key at a time, although a key can have multiple aliases. The
%% alias and the Amazon Web Services Payment Cryptography key must be in the
%% same Amazon Web Services account and Amazon Web Services Region
%%
%% Cross-account use: This operation can't be used across different
%% Amazon Web Services accounts.
%%
%% Related operations:
%%
%% <ul> <li> `CreateAlias'
%%
%% </li> <li> `DeleteAlias'
%%
%% </li> <li> `GetAlias'
%%
%% </li> <li> `ListAliases'
%%
%% </li> </ul>
update_alias(Client, Input)
  when is_map(Client), is_map(Input) ->
    update_alias(Client, Input, []).
update_alias(Client, Input, Options)
  when is_map(Client), is_map(Input), is_list(Options) ->
    request(Client, <<"UpdateAlias">>, Input, Options).

%%====================================================================
%% Internal functions
%%====================================================================

-spec request(aws_client:aws_client(), binary(), map(), list()) ->
    {ok, Result, {integer(), list(), hackney:client()}} |
    {error, Error, {integer(), list(), hackney:client()}} |
    {error, term()} when
    Result :: map() | undefined,
    Error :: map().
request(Client, Action, Input, Options) ->
    RequestFun = fun() -> do_request(Client, Action, Input, Options) end,
    aws_request:request(RequestFun, Options).

do_request(Client, Action, Input0, Options) ->
    Client1 = Client#{service => <<"payment-cryptography">>},
    Host = build_host(<<"controlplane.payment-cryptography">>, Client1),
    URL = build_url(Host, Client1),
    Headers = [
        {<<"Host">>, Host},
        {<<"Content-Type">>, <<"application/x-amz-json-1.0">>},
        {<<"X-Amz-Target">>, <<"PaymentCryptographyControlPlane.", Action/binary>>}
    ],

    Input = Input0,

    Payload = jsx:encode(Input),
    SignedHeaders = aws_request:sign_request(Client1, <<"POST">>, URL, Headers, Payload),
    Response = hackney:request(post, URL, SignedHeaders, Payload, Options),
    handle_response(Response).

handle_response({ok, 200, ResponseHeaders, Client}) ->
    case hackney:body(Client) of
        {ok, <<>>} ->
            {ok, undefined, {200, ResponseHeaders, Client}};
        {ok, Body} ->
            Result = jsx:decode(Body),
            {ok, Result, {200, ResponseHeaders, Client}}
    end;
handle_response({ok, StatusCode, ResponseHeaders, Client}) ->
    {ok, Body} = hackney:body(Client),
    Error = jsx:decode(Body),
    {error, Error, {StatusCode, ResponseHeaders, Client}};
handle_response({error, Reason}) ->
    {error, Reason}.

build_host(_EndpointPrefix, #{region := <<"local">>, endpoint := Endpoint}) ->
    Endpoint;
build_host(_EndpointPrefix, #{region := <<"local">>}) ->
    <<"localhost">>;
build_host(EndpointPrefix, #{region := Region, endpoint := Endpoint}) ->
    aws_util:binary_join([EndpointPrefix, Region, Endpoint], <<".">>).

build_url(Host, Client) ->
    Proto = aws_client:proto(Client),
    Port = aws_client:port(Client),
    aws_util:binary_join([Proto, <<"://">>, Host, <<":">>, Port, <<"/">>], <<"">>).
