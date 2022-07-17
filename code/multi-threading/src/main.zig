const std = @import("std");

/// スレッド関数
fn threadFunc() void {
    std.log.info("<thread1> called.", .{});

    std.time.sleep(1000 * 1000 * 1000 * 5);

    std.log.info("<thread1> exit.", .{});
}

/// エントリーポイント
pub fn main() anyerror!void {
    std.log.info("<main> ### star t###", .{});

    const thread1 = try std.Thread.spawn(.{}, threadFunc, .{});

    thread1.join();

    std.log.info("<main> --- end ---", .{});
}
