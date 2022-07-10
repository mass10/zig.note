# zig.note

# 2022-07-10 ZLS をビルドする (Windows)

```CMD
git clone --recurse-submodules https://github.com/zigtools/zls

CD zls

zig build -Drelease-safe

zig-out\bin\zls.exe config
```
