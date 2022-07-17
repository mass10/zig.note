const std = @import("std");

/// スレッド関数
///
/// # Arguments
/// * `param1` スレッドのパラメーター1
fn threadFunc(param1: i32) void {
    std.log.info("<thread1> called. ({d})", .{param1});

    std.time.sleep(1000 * 1000 * 1000 * 5);

    std.log.info("<thread1> exit.", .{});

    // TODO: u8 を返せるようだが、値をどうやって受け取る？？
    // return 0;
}

/// エントリーポイント
pub fn main() anyerror!void {
    std.log.info("<main> ### star t###", .{});

    const thread1 = try std.Thread.spawn(.{}, threadFunc, .{
        500, // スレッドのパラメーター1
    });

    thread1.join();

    std.log.info("<main> --- end ---", .{});
}
