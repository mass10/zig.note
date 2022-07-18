//!
//! メモリリークを検出できる？
//! https://ziglang.org/learn/samples/#memory-leak-detection
//!

const std = @import("std");

pub fn main() !void {

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
