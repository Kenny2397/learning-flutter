void main() {
  print('init');

  httpGet('').then((data) {
    print(data);
  }).catchError((error) {
    print(error);
  });

  print('final');
}

Future<String> httpGet(String url) {
  // return Future.delayed(const Duration(seconds: 2), () => 'Hello World');
  return Future.delayed(
      const Duration(seconds: 2), () => throw 'Error en hhtpGet');
}
