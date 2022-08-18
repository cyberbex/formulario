import 'package:flutter/material.dart';
import 'package:validator_less/validators.dart';
import 'package:validatorless/validatorless.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmpasswordEC = TextEditingController();
  final _dataEC = TextEditingController();

  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  String? selectedItem = 'Item 1';

  @override
  void dispose() {
    _nomeEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmpasswordEC.dispose();
    _dataEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validação de Formulário'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  DropdownButton(
                    value: selectedItem,
                    items: items
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item,
                                style: const TextStyle(fontSize: 24)),
                          ),
                        )
                        .toList(),
                    onChanged: (item) =>
                        setState(() => selectedItem = item as String?),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print(selectedItem);
                    },
                    child: const Text('click'),
                  ),
                  TextFormField(
                    controller: _nomeEC,
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: Validatorless.required('Nome Obrigatório'),
                  ),
                  TextFormField(
                    controller: _emailEC,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: Validatorless.multiple([
                      Validatorless.required('Email-Obrigatório'),
                      Validatorless.email('Email-Inválido'),
                    ]),
                  ),
                  TextFormField(
                    controller: _passwordEC,
                    decoration: const InputDecoration(labelText: 'PassWord'),
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha Obrigatória'),
                      Validatorless.min(
                          6, 'Senha precisa ter pelo menos 6 caracteres'),
                    ]),
                  ),
                  TextFormField(
                    controller: _confirmpasswordEC,
                    decoration:
                        const InputDecoration(labelText: 'ConfirmPassWord'),
                    validator: Validatorless.multiple([
                      Validatorless.required('Confirmar Senha Obrigatória'),
                      Validators.compare(
                          _passwordEC, 'Senha diferente de Confirma Senha')
                    ]),
                  ),
                  TextFormField(
                    controller: _dataEC,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(labelText: 'Data'),
                    validator: Validatorless.multiple([
                      Validatorless.required('Data Obrigatória'),
                      Validators.validaData('Data inválida')
                    ]),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var formValid =
                          _formKey.currentState?.validate() ?? false;
                      if (formValid) {
                        //chamaria minha controller para salvar os dados
                      }
                    },
                    child: const Text('Salvar'),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
