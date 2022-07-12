//!
//! メモリリークを検出できる？
//! https://ziglang.org/learn/samples/
//!
//!

const std = @import("std");

fn getAllocator() std.mem.Allocator {
    var general_purpose_allocator = std.heap.GeneralPurposeAllocator(.{}){};
    defer std.debug.assert(!general_purpose_allocator.deinit());
    const allocator = general_purpose_allocator.allocator();
    return allocator;
}

pub fn main() !void {

    // 普通のアロケータ
    // const allocator = std.heap.page_allocator;

    // メモリリーク検出用のアロケータ？
    var general_purpose_allocator = std.heap.GeneralPurposeAllocator(.{}){};
    defer std.debug.assert(!general_purpose_allocator.deinit());
    const allocator = general_purpose_allocator.allocator();

    // テスト用アロケータ？(※ようわからん)
    // https://ziglang.org/documentation/master/#Report-Memory-Leaks
    // const allocator = std.testing.allocator;

    const u32_ptr = try allocator.create(u32);
    _ = u32_ptr; // コンパイルエラーを回避

    // トレースが出力される？？？
}
