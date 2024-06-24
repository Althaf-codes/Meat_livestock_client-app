import 'package:flutter/material.dart';

import 'package:mq/constants/Global_Variables.dart';

class MyForm extends StatefulWidget {
  String hint;
  String label;
  List<String?> list;

  MyForm(
      {Key? key, required this.hint, required this.label, required this.list})
      : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  static late List<String?> friendsList;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    setState(() {
      friendsList = widget.list;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.label,
                  style: TextStyle(
                      color: GlobalVariables.selectedNavBarColor, fontSize: 18),
                ),
              ),
              ..._getFriends(hint: widget.hint, label: 'Enter size'),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    print(' the friends list are ${widget.list}');
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// get firends text-fields
  List<Widget> _getFriends({required String hint, required String label}) {
    List<Widget> friendsTextFields = [];
    for (int i = 0; i < widget.list.length; i++) {
      friendsTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Expanded(
                child: FriendTextFields(
              i,
              hint: hint,
              label: label,
            )),
            SizedBox(
              width: 16,
            ),
            // we need add button at last friends row
            _addRemoveButton(i == widget.list.length - 1, i),
          ],
        ),
      ));
    }
    return friendsTextFields;
  }

  /// add / remove button
  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          // add new text-fields at the top of all friends textfields
          widget.list.insert(index + 1, null);
        } else
          widget.list.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}

class FriendTextFields extends StatefulWidget {
  final int index;
  String hint;
  String label;
  FriendTextFields(this.index,
      {Key? key, required this.hint, required this.label})
      : super(key: key);
  @override
  _FriendTextFieldsState createState() => _FriendTextFieldsState();
}

class _FriendTextFieldsState extends State<FriendTextFields> {
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text = _MyFormState.friendsList[widget.index] ?? '';
    });

    return TextFormField(
      cursorColor: const Color.fromARGB(255, 29, 201, 192),
      decoration: InputDecoration(
          labelStyle:
              const TextStyle(color: const Color.fromARGB(255, 29, 201, 192)),
          hintText: widget.hint,
          labelText: widget.label,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
                color: Colors.red, style: BorderStyle.solid, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 10,
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 29, 201, 192),
                style: BorderStyle.solid,
                width: 1),
          ),
          focusColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
                color: Colors.transparent, style: BorderStyle.solid, width: 5),
          ),
          prefixIcon: IconButton(
            icon: const Icon(
              Icons.expand_circle_down,
              color: Color.fromARGB(255, 29, 201, 192),
            ),
            onPressed: () {},
          ),
          fillColor: Colors.white,
          filled: true),
      controller: _nameController,
      onChanged: (v) => _MyFormState.friendsList[widget.index] = v,
      validator: (v) {
        if (v!.trim().isEmpty) return 'Please enter something';
        return null;
      },
    );
  }
}


//  TextFormField(
//       controller: _nameController,
//       onChanged: (v) => _MyFormState.friendsList[widget.index] = v,
//       decoration: InputDecoration(hintText: 'Enter your friend\'s name'),
//       validator: (v) {
//         if (v!.trim().isEmpty) return 'Please enter something';
//         return null;
//       },
//     );











