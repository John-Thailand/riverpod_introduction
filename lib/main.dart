import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.g.dart';

// 値 (ここでは「Hello world」) を保存する「プロバイダー」を作成します。
// プロバイダーを使用すると、公開された値をモック/オーバーライドできるようになります。
@riverpod
String helloWorld(HelloWorldRef ref) {
  return 'Hello world';
}

void main() {
  runApp(
    // ウィジェットがプロバイダーを読み取れるようにするには、全体をラップする必要があります
    // 「ProviderScope」ウィジェット内のアプリケーション。
    // ここにプロバイダーの状態が保存されます。
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// Riverpod によって公開される StatelessWidget の代わりに ConsumerWidget を拡張します。
class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: Center(
          child: Text(value),
        ),
      ),
    );
  }
}
