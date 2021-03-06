import 'package:flutter/material.dart';
import 'package:flutter_application/MongoDBModel.dart';
import 'package:flutter_application/dbHelper/mongodb.dart';
import 'package:flutter_application/login.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class Register extends StatefulWidget {
  const Register({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var emailController = new TextEditingController();
  var passwordController = new TextEditingController();
  var confirmpasswordController = new TextEditingController();
  var addressController = new TextEditingController();
  var phonenumController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.jpg'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 36),
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 60,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 246, 246, 246),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Masukkan Email',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 60,
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 246, 246, 246),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Password',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 60,
                child: TextField(
                  controller: confirmpasswordController,
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 246, 246, 246),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Konfirmasi Ulang Password',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 246, 246, 246),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Masukkan Alamat',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 60,
                child: TextField(
                  controller: phonenumController,
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 246, 246, 246),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Nomor Handphone',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 63, 186, 126)),
                  child: const Text('DAFTAR'),
                  onPressed: () {
                    _insertData(emailController.text, passwordController.text,
                        addressController.text, phonenumController.text);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage(
                                  title: 'Bakmie Kim-An',
                                )));
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  const Text(
                    'Sudah Punya Akun?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage(
                                    title: 'Bakmie Kim-An',
                                  )));
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              Container(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Image(
                      image: AssetImage('images/logo.png'),
                      width: 190,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _insertData(
      String email, String password, String address, String phonenum) async {
    var _id = M.ObjectId();
    final data = MongoDbModel(
        id: _id,
        email: email,
        password: password,
        address: address,
        phonenum: phonenum);
    var result = await MongoDatabase.insert(data);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(" Inserted ID " + _id.$oid)));
    _clearAll();
  }

  void _clearAll() {
    emailController.text = "";
    passwordController.text = "";
    addressController.text = "";
    phonenumController.text = "";
  }
}
