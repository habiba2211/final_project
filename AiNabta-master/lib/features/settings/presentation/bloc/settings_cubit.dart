import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
  bool arSwitch = false;
  bool darkSwitch = false;
  String currentLocale = "en";
  ThemeMode currentMode = ThemeMode.light;
  TextEditingController _roleText = TextEditingController();
  TextEditingController _workText = TextEditingController();
  TextEditingController _usageText = TextEditingController();
  TextEditingController _fName = TextEditingController();
  TextEditingController _lName = TextEditingController();
  TextEditingController _uName = TextEditingController();
  TextEditingController _eMail = TextEditingController();
  TextEditingController _Phone = TextEditingController();
  TextEditingController _Street = TextEditingController();
  TextEditingController _City = TextEditingController();
  TextEditingController _Country = TextEditingController();
  TextEditingController _Old = TextEditingController();
  TextEditingController _New = TextEditingController();
  TextEditingController _Confirm = TextEditingController();

  void setCurrentLocale(String newLocale) async {
    currentLocale = newLocale;
    emit(SettingsLocale());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("locale", currentLocale);
  }

  void setCurrentMode(ThemeMode newThemeMode) async {
    currentMode = newThemeMode;
    emit(SettingsTheme());
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDark", currentMode == ThemeMode.dark);
  }

  bool isDark() {
    return currentMode == ThemeMode.dark;
  }

  void usageText(TextEditingController value) async {
    _usageText = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("usage", _usageText.text);
  }

  void workText(TextEditingController value) async {
    _workText = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("work", _workText.text);
  }

  void roleText(TextEditingController value) async {
    _roleText = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("role", _roleText.text);
  }

  void fName(TextEditingController value) async {
    _fName = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("fname", _fName.text);
  }

  void lName(TextEditingController value) async {
    _lName = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("lname", _lName.text);
  }

  void uName(TextEditingController value) async {
    _uName = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("uname", _uName.text);
  }

  void eMail(TextEditingController value) async {
    _eMail = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("email", _eMail.text);
  }

  void Street(TextEditingController value) async {
    _Street = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("street", _Street.text);
  }

  void City(TextEditingController value) async {
    _City = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("city", _City.text);
  }

  void Country(TextEditingController value) async {
    _Country = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("country", _Country.text);
  }

  void Phone(TextEditingController value) async {
    _Phone = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("phone", _Phone.text);
  }

  void Old(TextEditingController value) async {
    _Old = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("old", _Old.text);
  }

  void Neww(TextEditingController value) async {
    _New = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("new", _New.text);
  }

  void Confirm(TextEditingController value) async {
    _Confirm = value;
    emit(TextFieldState());
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("confirm", _Confirm.text);
  }

  void getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    var usage = prefs.getString("usage");
    if (usage != null) usageText(usageTextGet);
    var role = prefs.getString("role");
    if (role != null) roleText(roleTextGet);
    var work = prefs.getString("work");
    if (work != null) workText(workTextGet);
    var fname = prefs.getString("fname");
    if (fname != null) fName(fNameGet);
    var lname = prefs.getString("lname");
    if (lname != null) lName(lNameGet);
    var uname = prefs.getString("uname");
    if (uname != null) uName(uNameGet);
    var email = prefs.getString("email");
    if (email != null) eMail(eMailGet);
    var phone = prefs.getString("phone");
    if (phone != null) Phone(PhoneGet);
    var street = prefs.getString("street");
    if (street != null) Street(StreetGet);
    var city = prefs.getString("city");
    if (city != null) City(CityGet);
    var country = prefs.getString("country");
    if (country != null) Country(CountryGet);
    var old = prefs.getString("old");
    if (old != null) Old(OldGet);
    var New = prefs.getString("New");
    if (New != null) Neww(NewGet);
    var confirm = prefs.getString("confirm");
    if (confirm != null) Confirm(ConfirmGet);
    emit(GetUserDataState());
  }

  TextEditingController get usageTextGet => _usageText;

  TextEditingController get workTextGet => _workText;

  TextEditingController get roleTextGet => _roleText;

  TextEditingController get lNameGet => _lName;

  TextEditingController get uNameGet => _uName;

  TextEditingController get eMailGet => _eMail;

  TextEditingController get fNameGet => _fName;

  TextEditingController get CountryGet => _Country;

  TextEditingController get CityGet => _City;

  TextEditingController get StreetGet => _Street;

  TextEditingController get PhoneGet => _Phone;

  TextEditingController get ConfirmGet => _Confirm;

  TextEditingController get NewGet => _New;

  TextEditingController get OldGet => _Old;
}
