//!
//! 高階関数の例
//!

const std = @import("std");

/// ハンドラーの型宣言
///
/// @param1 u32 パラメーター
/// @returns 何も返さない
const HandlerType = fn (_: u32) void;

/// 渡された関数を呼び出すだけの関数
fn invoke(handler: fn (u32) void, param1: u32) void {
    handler(param1);
}

/// 文字列を表示するだけの関数
///
/// @s 文字列
fn info(s: []const u8) void {
    _ = std.log.info("[INFO] {s}", .{s});
}

/// 整数を表示するだけの関数
///
/// @d 整数
fn print_digit(d: u32) void {
    _ = std.log.info("[INFO] Digit: ({d})", .{d});
}

/// エントリーポイントです。
pub fn main() anyerror!void {
    info("HELLO");

    invoke(print_digit, 1);
}
