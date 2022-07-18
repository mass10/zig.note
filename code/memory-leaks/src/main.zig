//!
//! メモリリークを検出できる？
//! https://ziglang.org/learn/samples/#memory-leak-detection
//!

const std = @import("std");

/// 検査 その1
fn example_alloc1() !void {

    // 普通のアロケータ
    // const allocator = std.heap.page_allocator;

    // メモリリークを検出できるアロケータ。
    // double free や leaks を検出できるようです。
    var general_purpose_allocator = std.heap.GeneralPurposeAllocator(.{}){};

    // このスコープを抜けるときにメモリリークを検証する
    defer std.debug.assert(!general_purpose_allocator.deinit());

    const allocator = general_purpose_allocator.allocator();
    _ = allocator;

    const u32_ptr = try allocator.create(u32);
    _ = u32_ptr; // コンパイルエラーを回避

    // トレースが出力される？？？
}

/// 検査 その2
fn example_alloc2() !void {
    // 👇リークの検査を勝手にやってくれる、という話だけど、何も出ない。
    const allocator = std.testing.allocator;
    const u32_ptr = try allocator.create(u32);
    _ = u32_ptr;
}

/// エントリーポイント
pub fn main() !void {
    // try example_alloc1();
    try example_alloc2();
}

// 自動的に生成されたテストコード
test "basic test" {
    // const allocator = std.testing.allocator;
    try example_alloc2();
}
