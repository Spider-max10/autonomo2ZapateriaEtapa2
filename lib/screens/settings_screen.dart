import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Color _backgroundColor = Colors.white; // Color inicial del fondo
  bool _notificationsEnabled = false;
  String _selectedTheme = 'Light';
  List<String> _themes = ['Light', 'Dark', 'System Default'];
  double _textSize = 14.0; // Tamaño de texto inicial
  List<double> _textSizes = [14.0, 16.0, 18.0, 20.0];

  void _changeTextSize() {
    setState(() {
      _textSize = _textSize == 20.0 ? 14.0 : _textSize + 2.0; // Alterna entre tamaños de texto
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configuración')),
      body: Container(
        color: _backgroundColor, 
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Notificaciones', style: TextStyle(fontSize: _textSize)),
              trailing: Switch(
                value: _notificationsEnabled,
                onChanged: (bool value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Tema', style: TextStyle(fontSize: _textSize)),
              trailing: DropdownButton<String>(
                value: _selectedTheme,
                items: _themes.map((String theme) {
                  return DropdownMenuItem<String>(
                    value: theme,
                    child: Text(theme, style: TextStyle(fontSize: _textSize)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTheme = newValue!;
                    if (_selectedTheme == 'Dark') {
                      _backgroundColor = Color.fromARGB(255, 86, 86, 86);
                    } else if (_selectedTheme == 'Light') {
                      _backgroundColor = Colors.white;
                    } else {
                      // Lógica para el tema por defecto del sistema
                      _backgroundColor = Colors.grey[300]!;
                    }
                  });
                },
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _changeTextSize,
              child: Text('Cambiar Tamaño de Texto', style: TextStyle(fontSize: _textSize)),
            ),
          ],
        ),
      ),
    );
  }
}
