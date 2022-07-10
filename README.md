# ABOUT

　Zig いろいろメモ。

# 2022-07-10 ZLS をビルドする (Windows)

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
    "zigLanguageClient.path": "C:\\Users\\irisawamasaru\\workspace\\zls\\zig-out\\bin\\zls.exe"
}
```
