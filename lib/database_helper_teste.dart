import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'sensor_model.dart';

// flutter pub get -> esse comando no terminal pega as biblioteca que adicionou no pubsped.yaml e instala
// final -> não sabe o vallor na hora de compilar

class DatabaseHelper {
  
  // criar apenas uma instancia do banco de dados em toda a aplicação, declarando essas 3 linhas iniciais
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  // Tipo banco de dados, e em algum momento pode ser nulo
  static Database? _database;
  
  // primeira para o banco de dados e a segunda para a tabela 
  static const String _databaseName = 'sensors.db';
  static const String _tableName = 'sensors';

  // future, metodo que pode ser que demore para responder - inicializa o banco de dados

  Future<Database> get database async {
    if(_database != null) return _database!;
    _database = await _initDatabase(); // chama o metodo e espera ser executado, dar um resposta
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      // se o banco de dados já existe e você altera a versão para um superior, por exemplo, de 1 para 2
      // o metodo onUpgrade é chamado, permitindo que escreva a logica de migracação para atualizar o esquema sem perder o que já tinha
      version: 1,
      // _onCreate será executado caso não exista as tabelas criadas
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    return await db.execute('''
      CREATE TABLE $_tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        tipo TEXT,
        mac_address TEXT,
        latitude REAL,
        longitude REAL,
        localizacao TEXT NOT NULL,
        responsavel TEXT,
        unidade_medida TEXT
        status operacional INTEGER,
        observacao TEXT
      )
    ''');
  }

  // Inserir um sensor no banco de dados
  Future<int> insertSensor(Map<String, dynamic> sensorData) async {
    Database db = await database;
    return await db.insert(_tableName, sensorData);
  }

  // Atualizar um sensor no banco de dados
  Future<int> updateSensor(Map<String, dynamic> sensorData, int id) async {
    Database db = await database;
    return await db.update(
      _tableName, 
      sensorData,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Excluir um sensor pelo id
  Future<int> deleteSensor(int id) async {
    Database db = await database;
    return await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Obter todos os sensores
  Future<List<Sensor>> getAllSensors() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return Sensor.fromMap(maps[i]);
    });
  }

  // Obter sensor pelo id
  Future<Sensor?> getSensorById(int id) async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isEmpty) {
      return Sensor.fromMap(result.first);
    }
    return null;
  }

}

