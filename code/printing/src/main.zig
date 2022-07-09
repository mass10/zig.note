//!
//! 実行するには make
//!

const std = @import("std");

/// エントリーポイント
pub fn main() anyerror!void {
    // 標準出力？
    std.log.info("Hello!", .{});
}

/// 自動的に挿入されていたテストコード
test "basic test" {
    try std.testing.expectEqual(10, 3 + 7);
}
