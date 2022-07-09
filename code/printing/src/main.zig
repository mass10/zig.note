//!
//! 実行するには make
//!

const std = @import("std");

/// 標準出力
fn println(line: []const u8) anyerror!void {
    const writer = std.io.getStdOut().writer();
    try writer.print("{s}\n", .{line});
}

/// エントリーポイント
pub fn main() anyerror!void {

    // 標準出力
    const print = std.io.getStdOut().writer().print;
    try print("### START ###\n", .{});

    // 標準エラー出力 (※日本語化け)
    std.debug.print("{s}\n", .{"文字列"});

    try println("Printing letters by my println.");

    // 標準エラー出力
    std.log.info("Hello!", .{});

    // 文字列？
    {
        const value = "コニチハ";
        std.log.info("{s}", .{value});
        std.log.info("{s}", .{@TypeOf(value)});
        std.log.info("{s}", .{@typeInfo(@TypeOf(value))});
    }

    // {d} は DIGIT か？
    {
        const value = 99;
        std.log.info("{d}", .{value});
        std.log.info("{s}", .{@TypeOf(value)});
        std.log.info("{s}", .{@typeInfo(@TypeOf(value))});
    }

    {
        const value = 12.3456;
        std.log.info("{d}", .{value});
    }
}

// 自動的に生成されたテストコード
test "basic test" {
    try std.testing.expectEqual(10, 3 + 7);
}
