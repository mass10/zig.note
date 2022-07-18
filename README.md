# ABOUT

　Zig いろいろメモ。(2022-07-08)

# 2022-07-08 Zig をセットアップする

1. Zig をダウンロード (zip)
2. どこかに配置
3. PATH を通す


# 2022-07-10 ZLS をビルドする for Windows

ZLS for VSCode は、Zig Language Server のクライアントアプリケーションで、Zig Language Server がインストールされている必要がある。

👇language server をビルドする。

```CMD
git clone --recurse-submodules https://github.com/zigtools/zls

CD zls

zig build -Drelease-safe
```

👇language server のコンフィギュレーション。

```CMD
zig-out\bin\zls.exe config
```

👇path to ZLS を設定。

```
{
    ...
    // deprecated
    // "zigLanguageClient.path": "C:\\Users\\irisawamasaru\\workspace\\zls\\zig-out\\bin\\zls.exe"
    // 2022-07-13 New!
    "zls.path": "C:\\Users\\irisawamasaru\\workspace\\zls\\zig-out\\bin\\zls.exe"
}
```

# 2022-07-10 Zig ファイルを直接実行できる！

　長いシェルは不の遺産。

```sh
zig run main.zig
```

# ビルド

実行する
```sh
zig build run
```

ビルドだけ
```sh
zig build
```

# フォーマット
```sh
zig fmt src
```
