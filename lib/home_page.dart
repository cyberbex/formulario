import 'package:flutter/material.dart';

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
        body: Container(
          child: DropdownButton(
            value: selectedItem,
            items: items
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: const TextStyle(fontSize: 24)),
                  ),
                )
                .toList(),
            onChanged: (item) => setState(() => selectedItem = item as String?),
          ),
        ));
  }
}
