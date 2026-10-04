// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CreditApplicationsTable extends CreditApplications
    with TableInfo<$CreditApplicationsTable, LocalCreditApplication> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CreditApplicationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<int> serverId = GeneratedColumn<int>(
    'server_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _requestedAmountCentsMeta =
      const VerificationMeta('requestedAmountCents');
  @override
  late final GeneratedColumn<int> requestedAmountCents = GeneratedColumn<int>(
    'requested_amount_cents',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _creditScoreMeta = const VerificationMeta(
    'creditScore',
  );
  @override
  late final GeneratedColumn<double> creditScore = GeneratedColumn<double>(
    'credit_score',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _amlMatchMeta = const VerificationMeta(
    'amlMatch',
  );
  @override
  late final GeneratedColumn<bool> amlMatch = GeneratedColumn<bool>(
    'aml_match',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("aml_match" IN (0, 1))',
    ),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ipAddressMeta = const VerificationMeta(
    'ipAddress',
  );
  @override
  late final GeneratedColumn<String> ipAddress = GeneratedColumn<String>(
    'ip_address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countryMeta = const VerificationMeta(
    'country',
  );
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
    'country',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _regionMeta = const VerificationMeta('region');
  @override
  late final GeneratedColumn<String> region = GeneratedColumn<String>(
    'region',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    clientId,
    serverId,
    requestedAmountCents,
    creditScore,
    amlMatch,
    status,
    ipAddress,
    country,
    region,
    city,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'credit_applications';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalCreditApplication> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    }
    if (data.containsKey('requested_amount_cents')) {
      context.handle(
        _requestedAmountCentsMeta,
        requestedAmountCents.isAcceptableOrUnknown(
          data['requested_amount_cents']!,
          _requestedAmountCentsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_requestedAmountCentsMeta);
    }
    if (data.containsKey('credit_score')) {
      context.handle(
        _creditScoreMeta,
        creditScore.isAcceptableOrUnknown(
          data['credit_score']!,
          _creditScoreMeta,
        ),
      );
    }
    if (data.containsKey('aml_match')) {
      context.handle(
        _amlMatchMeta,
        amlMatch.isAcceptableOrUnknown(data['aml_match']!, _amlMatchMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('ip_address')) {
      context.handle(
        _ipAddressMeta,
        ipAddress.isAcceptableOrUnknown(data['ip_address']!, _ipAddressMeta),
      );
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    }
    if (data.containsKey('region')) {
      context.handle(
        _regionMeta,
        region.isAcceptableOrUnknown(data['region']!, _regionMeta),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalCreditApplication map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalCreditApplication(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}client_id'],
      )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_id'],
      ),
      requestedAmountCents: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}requested_amount_cents'],
      )!,
      creditScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}credit_score'],
      ),
      amlMatch: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}aml_match'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      ipAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ip_address'],
      ),
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      ),
      region: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}region'],
      ),
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CreditApplicationsTable createAlias(String alias) {
    return $CreditApplicationsTable(attachedDatabase, alias);
  }
}

class LocalCreditApplication extends DataClass
    implements Insertable<LocalCreditApplication> {
  final int id;
  final int clientId;
  final int? serverId;
  final int requestedAmountCents;
  final double? creditScore;
  final bool? amlMatch;
  final String status;
  final String? ipAddress;
  final String? country;
  final String? region;
  final String? city;
  final DateTime createdAt;
  final DateTime updatedAt;
  const LocalCreditApplication({
    required this.id,
    required this.clientId,
    this.serverId,
    required this.requestedAmountCents,
    this.creditScore,
    this.amlMatch,
    required this.status,
    this.ipAddress,
    this.country,
    this.region,
    this.city,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['client_id'] = Variable<int>(clientId);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<int>(serverId);
    }
    map['requested_amount_cents'] = Variable<int>(requestedAmountCents);
    if (!nullToAbsent || creditScore != null) {
      map['credit_score'] = Variable<double>(creditScore);
    }
    if (!nullToAbsent || amlMatch != null) {
      map['aml_match'] = Variable<bool>(amlMatch);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || ipAddress != null) {
      map['ip_address'] = Variable<String>(ipAddress);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    if (!nullToAbsent || region != null) {
      map['region'] = Variable<String>(region);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CreditApplicationsCompanion toCompanion(bool nullToAbsent) {
    return CreditApplicationsCompanion(
      id: Value(id),
      clientId: Value(clientId),
      serverId: serverId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverId),
      requestedAmountCents: Value(requestedAmountCents),
      creditScore: creditScore == null && nullToAbsent
          ? const Value.absent()
          : Value(creditScore),
      amlMatch: amlMatch == null && nullToAbsent
          ? const Value.absent()
          : Value(amlMatch),
      status: Value(status),
      ipAddress: ipAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(ipAddress),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      region: region == null && nullToAbsent
          ? const Value.absent()
          : Value(region),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory LocalCreditApplication.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalCreditApplication(
      id: serializer.fromJson<int>(json['id']),
      clientId: serializer.fromJson<int>(json['clientId']),
      serverId: serializer.fromJson<int?>(json['serverId']),
      requestedAmountCents: serializer.fromJson<int>(
        json['requestedAmountCents'],
      ),
      creditScore: serializer.fromJson<double?>(json['creditScore']),
      amlMatch: serializer.fromJson<bool?>(json['amlMatch']),
      status: serializer.fromJson<String>(json['status']),
      ipAddress: serializer.fromJson<String?>(json['ipAddress']),
      country: serializer.fromJson<String?>(json['country']),
      region: serializer.fromJson<String?>(json['region']),
      city: serializer.fromJson<String?>(json['city']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'clientId': serializer.toJson<int>(clientId),
      'serverId': serializer.toJson<int?>(serverId),
      'requestedAmountCents': serializer.toJson<int>(requestedAmountCents),
      'creditScore': serializer.toJson<double?>(creditScore),
      'amlMatch': serializer.toJson<bool?>(amlMatch),
      'status': serializer.toJson<String>(status),
      'ipAddress': serializer.toJson<String?>(ipAddress),
      'country': serializer.toJson<String?>(country),
      'region': serializer.toJson<String?>(region),
      'city': serializer.toJson<String?>(city),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  LocalCreditApplication copyWith({
    int? id,
    int? clientId,
    Value<int?> serverId = const Value.absent(),
    int? requestedAmountCents,
    Value<double?> creditScore = const Value.absent(),
    Value<bool?> amlMatch = const Value.absent(),
    String? status,
    Value<String?> ipAddress = const Value.absent(),
    Value<String?> country = const Value.absent(),
    Value<String?> region = const Value.absent(),
    Value<String?> city = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => LocalCreditApplication(
    id: id ?? this.id,
    clientId: clientId ?? this.clientId,
    serverId: serverId.present ? serverId.value : this.serverId,
    requestedAmountCents: requestedAmountCents ?? this.requestedAmountCents,
    creditScore: creditScore.present ? creditScore.value : this.creditScore,
    amlMatch: amlMatch.present ? amlMatch.value : this.amlMatch,
    status: status ?? this.status,
    ipAddress: ipAddress.present ? ipAddress.value : this.ipAddress,
    country: country.present ? country.value : this.country,
    region: region.present ? region.value : this.region,
    city: city.present ? city.value : this.city,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  LocalCreditApplication copyWithCompanion(CreditApplicationsCompanion data) {
    return LocalCreditApplication(
      id: data.id.present ? data.id.value : this.id,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      requestedAmountCents: data.requestedAmountCents.present
          ? data.requestedAmountCents.value
          : this.requestedAmountCents,
      creditScore: data.creditScore.present
          ? data.creditScore.value
          : this.creditScore,
      amlMatch: data.amlMatch.present ? data.amlMatch.value : this.amlMatch,
      status: data.status.present ? data.status.value : this.status,
      ipAddress: data.ipAddress.present ? data.ipAddress.value : this.ipAddress,
      country: data.country.present ? data.country.value : this.country,
      region: data.region.present ? data.region.value : this.region,
      city: data.city.present ? data.city.value : this.city,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalCreditApplication(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('serverId: $serverId, ')
          ..write('requestedAmountCents: $requestedAmountCents, ')
          ..write('creditScore: $creditScore, ')
          ..write('amlMatch: $amlMatch, ')
          ..write('status: $status, ')
          ..write('ipAddress: $ipAddress, ')
          ..write('country: $country, ')
          ..write('region: $region, ')
          ..write('city: $city, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    clientId,
    serverId,
    requestedAmountCents,
    creditScore,
    amlMatch,
    status,
    ipAddress,
    country,
    region,
    city,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalCreditApplication &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.serverId == this.serverId &&
          other.requestedAmountCents == this.requestedAmountCents &&
          other.creditScore == this.creditScore &&
          other.amlMatch == this.amlMatch &&
          other.status == this.status &&
          other.ipAddress == this.ipAddress &&
          other.country == this.country &&
          other.region == this.region &&
          other.city == this.city &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CreditApplicationsCompanion
    extends UpdateCompanion<LocalCreditApplication> {
  final Value<int> id;
  final Value<int> clientId;
  final Value<int?> serverId;
  final Value<int> requestedAmountCents;
  final Value<double?> creditScore;
  final Value<bool?> amlMatch;
  final Value<String> status;
  final Value<String?> ipAddress;
  final Value<String?> country;
  final Value<String?> region;
  final Value<String?> city;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const CreditApplicationsCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.serverId = const Value.absent(),
    this.requestedAmountCents = const Value.absent(),
    this.creditScore = const Value.absent(),
    this.amlMatch = const Value.absent(),
    this.status = const Value.absent(),
    this.ipAddress = const Value.absent(),
    this.country = const Value.absent(),
    this.region = const Value.absent(),
    this.city = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CreditApplicationsCompanion.insert({
    this.id = const Value.absent(),
    required int clientId,
    this.serverId = const Value.absent(),
    required int requestedAmountCents,
    this.creditScore = const Value.absent(),
    this.amlMatch = const Value.absent(),
    required String status,
    this.ipAddress = const Value.absent(),
    this.country = const Value.absent(),
    this.region = const Value.absent(),
    this.city = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : clientId = Value(clientId),
       requestedAmountCents = Value(requestedAmountCents),
       status = Value(status);
  static Insertable<LocalCreditApplication> custom({
    Expression<int>? id,
    Expression<int>? clientId,
    Expression<int>? serverId,
    Expression<int>? requestedAmountCents,
    Expression<double>? creditScore,
    Expression<bool>? amlMatch,
    Expression<String>? status,
    Expression<String>? ipAddress,
    Expression<String>? country,
    Expression<String>? region,
    Expression<String>? city,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (serverId != null) 'server_id': serverId,
      if (requestedAmountCents != null)
        'requested_amount_cents': requestedAmountCents,
      if (creditScore != null) 'credit_score': creditScore,
      if (amlMatch != null) 'aml_match': amlMatch,
      if (status != null) 'status': status,
      if (ipAddress != null) 'ip_address': ipAddress,
      if (country != null) 'country': country,
      if (region != null) 'region': region,
      if (city != null) 'city': city,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CreditApplicationsCompanion copyWith({
    Value<int>? id,
    Value<int>? clientId,
    Value<int?>? serverId,
    Value<int>? requestedAmountCents,
    Value<double?>? creditScore,
    Value<bool?>? amlMatch,
    Value<String>? status,
    Value<String?>? ipAddress,
    Value<String?>? country,
    Value<String?>? region,
    Value<String?>? city,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return CreditApplicationsCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      serverId: serverId ?? this.serverId,
      requestedAmountCents: requestedAmountCents ?? this.requestedAmountCents,
      creditScore: creditScore ?? this.creditScore,
      amlMatch: amlMatch ?? this.amlMatch,
      status: status ?? this.status,
      ipAddress: ipAddress ?? this.ipAddress,
      country: country ?? this.country,
      region: region ?? this.region,
      city: city ?? this.city,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<int>(clientId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<int>(serverId.value);
    }
    if (requestedAmountCents.present) {
      map['requested_amount_cents'] = Variable<int>(requestedAmountCents.value);
    }
    if (creditScore.present) {
      map['credit_score'] = Variable<double>(creditScore.value);
    }
    if (amlMatch.present) {
      map['aml_match'] = Variable<bool>(amlMatch.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (ipAddress.present) {
      map['ip_address'] = Variable<String>(ipAddress.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (region.present) {
      map['region'] = Variable<String>(region.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CreditApplicationsCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('serverId: $serverId, ')
          ..write('requestedAmountCents: $requestedAmountCents, ')
          ..write('creditScore: $creditScore, ')
          ..write('amlMatch: $amlMatch, ')
          ..write('status: $status, ')
          ..write('ipAddress: $ipAddress, ')
          ..write('country: $country, ')
          ..write('region: $region, ')
          ..write('city: $city, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CreditApplicationsTable creditApplications =
      $CreditApplicationsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [creditApplications];
}

typedef $$CreditApplicationsTableCreateCompanionBuilder =
    CreditApplicationsCompanion Function({
      Value<int> id,
      required int clientId,
      Value<int?> serverId,
      required int requestedAmountCents,
      Value<double?> creditScore,
      Value<bool?> amlMatch,
      required String status,
      Value<String?> ipAddress,
      Value<String?> country,
      Value<String?> region,
      Value<String?> city,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$CreditApplicationsTableUpdateCompanionBuilder =
    CreditApplicationsCompanion Function({
      Value<int> id,
      Value<int> clientId,
      Value<int?> serverId,
      Value<int> requestedAmountCents,
      Value<double?> creditScore,
      Value<bool?> amlMatch,
      Value<String> status,
      Value<String?> ipAddress,
      Value<String?> country,
      Value<String?> region,
      Value<String?> city,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$CreditApplicationsTableFilterComposer
    extends Composer<_$AppDatabase, $CreditApplicationsTable> {
  $$CreditApplicationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get requestedAmountCents => $composableBuilder(
    column: $table.requestedAmountCents,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get creditScore => $composableBuilder(
    column: $table.creditScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get amlMatch => $composableBuilder(
    column: $table.amlMatch,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ipAddress => $composableBuilder(
    column: $table.ipAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get region => $composableBuilder(
    column: $table.region,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CreditApplicationsTableOrderingComposer
    extends Composer<_$AppDatabase, $CreditApplicationsTable> {
  $$CreditApplicationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get requestedAmountCents => $composableBuilder(
    column: $table.requestedAmountCents,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get creditScore => $composableBuilder(
    column: $table.creditScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get amlMatch => $composableBuilder(
    column: $table.amlMatch,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ipAddress => $composableBuilder(
    column: $table.ipAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get region => $composableBuilder(
    column: $table.region,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CreditApplicationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CreditApplicationsTable> {
  $$CreditApplicationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get clientId =>
      $composableBuilder(column: $table.clientId, builder: (column) => column);

  GeneratedColumn<int> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<int> get requestedAmountCents => $composableBuilder(
    column: $table.requestedAmountCents,
    builder: (column) => column,
  );

  GeneratedColumn<double> get creditScore => $composableBuilder(
    column: $table.creditScore,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get amlMatch =>
      $composableBuilder(column: $table.amlMatch, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get ipAddress =>
      $composableBuilder(column: $table.ipAddress, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<String> get region =>
      $composableBuilder(column: $table.region, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CreditApplicationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CreditApplicationsTable,
          LocalCreditApplication,
          $$CreditApplicationsTableFilterComposer,
          $$CreditApplicationsTableOrderingComposer,
          $$CreditApplicationsTableAnnotationComposer,
          $$CreditApplicationsTableCreateCompanionBuilder,
          $$CreditApplicationsTableUpdateCompanionBuilder,
          (
            LocalCreditApplication,
            BaseReferences<
              _$AppDatabase,
              $CreditApplicationsTable,
              LocalCreditApplication
            >,
          ),
          LocalCreditApplication,
          PrefetchHooks Function()
        > {
  $$CreditApplicationsTableTableManager(
    _$AppDatabase db,
    $CreditApplicationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CreditApplicationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CreditApplicationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CreditApplicationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> clientId = const Value.absent(),
                Value<int?> serverId = const Value.absent(),
                Value<int> requestedAmountCents = const Value.absent(),
                Value<double?> creditScore = const Value.absent(),
                Value<bool?> amlMatch = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> ipAddress = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<String?> region = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => CreditApplicationsCompanion(
                id: id,
                clientId: clientId,
                serverId: serverId,
                requestedAmountCents: requestedAmountCents,
                creditScore: creditScore,
                amlMatch: amlMatch,
                status: status,
                ipAddress: ipAddress,
                country: country,
                region: region,
                city: city,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int clientId,
                Value<int?> serverId = const Value.absent(),
                required int requestedAmountCents,
                Value<double?> creditScore = const Value.absent(),
                Value<bool?> amlMatch = const Value.absent(),
                required String status,
                Value<String?> ipAddress = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<String?> region = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => CreditApplicationsCompanion.insert(
                id: id,
                clientId: clientId,
                serverId: serverId,
                requestedAmountCents: requestedAmountCents,
                creditScore: creditScore,
                amlMatch: amlMatch,
                status: status,
                ipAddress: ipAddress,
                country: country,
                region: region,
                city: city,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CreditApplicationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CreditApplicationsTable,
      LocalCreditApplication,
      $$CreditApplicationsTableFilterComposer,
      $$CreditApplicationsTableOrderingComposer,
      $$CreditApplicationsTableAnnotationComposer,
      $$CreditApplicationsTableCreateCompanionBuilder,
      $$CreditApplicationsTableUpdateCompanionBuilder,
      (
        LocalCreditApplication,
        BaseReferences<
          _$AppDatabase,
          $CreditApplicationsTable,
          LocalCreditApplication
        >,
      ),
      LocalCreditApplication,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CreditApplicationsTableTableManager get creditApplications =>
      $$CreditApplicationsTableTableManager(_db, _db.creditApplications);
}
