const Map<String, String> threatNames = {
  'ROOT_DETECTED': 'Rooted device',
  'JAILBREAK_DETECTED': 'Jailbroken iPhone',
  'HOOKING_FRAMEWORK': 'Hooking tool (like Frida)',
  'SCREEN_OVERLAY': 'Screen overlay',
  'APP_TAMPERED': 'App was modified',
  'EMULATOR': 'Running on an emulator',
  'DEBUGGER_ATTACHED': 'Debugger attached',
};

String threatDisplayName(String code) => threatNames[code] ?? code;
