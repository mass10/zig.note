const std = @import("std");

/// ハンドラーの型宣言
///
/// @param1 u32 パラメーター
/// @returns 何も返さない
const HandlerType = fn (param1: u32) void;

/// 渡された関数を呼び出すだけの関数
fn invoke(handler: fn (u32) void) void {
    handler(0);
}

/// 文字列を表示するだけの関数
///
/// @s 文字列
fn info(s: []const u8) void {
    _ = std.log.info("[INFO] {s}", .{s});
}

fn print_digit(d: u32) void {
    _ = std.log.info("[INFO] Digit: ({d})", .{d});
}

pub fn main() anyerror!void {
    info("HELLO");

    invoke(print_digit);
}

test "basic test" {
    try std.testing.expectEqual(10, 3 + 7);
}
