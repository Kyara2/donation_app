import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import 'category.dart';
import 'create_item.dart';
import 'get_account.dart';

class CreateItemPage extends StatefulWidget {
  @override
  _CreateItemPageState createState() => _CreateItemPageState();
}

class _CreateItemPageState extends State<CreateItemPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  late String _name;
  late String _description;
  late String _address;
  late String _postalCode;
  late String _itemImage = ' ';
  String _selectedCategoryName = categories[0].name;
  String _userId = 'de80cc06-c69f-4e16-a6e7-c641d1cb62ae';

  void fetchUserId() async {
    AccountDetails accountDetails = await fetchAccountDetails();
    setState(() {
      _userId = accountDetails.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo anúncio"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Theme(
                data: Theme.of(context).copyWith(hintColor: Colors.white),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Item",
                    hintText: "Insira o nome do item",
                  ),
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira o nome do item";
                    }
                    return null;
                  },
                  onSaved: (value) => _name = value!,
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(hintColor: Colors.white),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Descrição",
                    hintText: "Insira a descrição do item",
                  ),
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira a descrição do item";
                    }
                    return null;
                  },
                  onSaved: (value) => _description = value!,
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(hintColor: Colors.white),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Endereço",
                    hintText: "Insira o endereço",

                  ),
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira o endereço";
                    }
                    return null;
                  },
                  onSaved: (value) => _address = value!,
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(hintColor: Colors.white),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "CEP",
                      hintText: "Insira o CEP",
                      hintStyle: TextStyle(color: Colors.white)),
                  obscureText: false,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),

                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira o CEP";
                    }
                    return null;
                  },
                  onSaved: (value) => _postalCode = value!,
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepOrange),
                ),
                child: Text("Escolher imagem"),
                onPressed: () async {
                  final image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      File imagePath = File(image.path);
                      _itemImage = basename(imagePath.path);
                      print(_itemImage);
                    });
                  }
                },
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                ),
                hint: const Text('Categoria', style: TextStyle(color: Colors.black)),
                value: _selectedCategoryName,
                onChanged: (dynamic value) {
                  setState(() {
                    _selectedCategoryName = value;
                  });
                },
                items: categories.map((Category category) {
                  return DropdownMenuItem<String>(
                    value: category.name,
                    child: Text(category.name),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null) {
                    return "Selecione uma categoria";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.deepOrange),
                      ),
                      onPressed: _submit,
                      child: const Text("Publicar anúncio"),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      setState(() => _isLoading = true);
      try {
        final Item = await createItem(_name, _description, _address,
            _postalCode, _userId, _itemImage, _selectedCategoryName);
        // Do something with the created Item
        print(Item);
      } catch (e) {
        // Handle the error
        print(e);
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }
}
