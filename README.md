# ABOUT

　Zig いろいろメモ。

# 2022-07-10 ZLS をビルドする (Windows)

ZLS for VSCode は、Zig Language Server のクライアントアプリケーションで、Zig Language Server がインストールされている必要がある。

👇サーバーのセットアップ。

```CMD
git clone --recurse-submodules https://github.com/zigtools/zls

CD zls

zig build -Drelease-safe

zig-out\bin\zls.exe config
```

settings.json にパスを追加する。

```
{
    ...
    "zigLanguageClient.path": "C:\\Users\\irisawamasaru\\workspace\\zls\\zig-out\\bin\\zls.exe"
}
```
