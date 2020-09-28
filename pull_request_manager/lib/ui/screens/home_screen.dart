import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../blocs/user_bloc.dart';
import '../../data/models/user.dart';
import '../widgtes/user_info.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _userBloc = Provider.of<UserBloc>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'GitHub - Pull Request Manager',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nome do usuário',
                ),
                controller: _textController,
              ),
              SizedBox(height: 18.0),
              FlatButton(
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  child: Text(
                    'Procurar',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
                onPressed: () {
                  _userBloc.searchUser(_textController.text);
                  _textController.clear();
                },
              ),
              StreamBuilder<User>(
                stream: _userBloc.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Usuário não encontrado.');
                  }

                  if (snapshot.hasData) {
                    final user = snapshot.data;
                    return UserInfo(user: user);
                  }

                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
