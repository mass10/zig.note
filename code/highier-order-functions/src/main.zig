//!
//! 高階関数の例
//!

const std = @import("std");

/// ハンドラーの型宣言
///
/// # Arguments
/// * `u32` パラメーター
const HandlerType = fn (_: u32) void;

/// 渡された関数を呼び出すだけの関数
/// # Arguments
/// * `handler` HandlerType
/// * `param1` 整数
fn invoke(handler: HandlerType, param1: u32) void {
    handler(param1);
}

/// 整数を表示するだけの関数
///
/// * `param` 整数
fn print_digit(param: u32) void {
    _ = std.log.info("Digit: [{d}]", .{param});
}

/// エントリーポイントです。
pub fn main() anyerror!void {
    invoke(print_digit, 1);
    invoke(print_digit, 100);
}
