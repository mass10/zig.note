const std = @import("std");

/// エントリーポイント
pub fn main() anyerror!void {
    const allocator = std.heap.page_allocator;

    {
        std.log.debug("========== ArrayList(u32) ==========", .{});
        var list = std.ArrayList(u32).init(allocator);
        defer list.deinit();
        try list.append(0);
        try list.append(2);
        try list.append(700);
        std.log.debug("list: {any}", .{list.items});
    }

    {
        std.log.debug("========== ArrayList(f64) ==========", .{});
        var list = std.ArrayList(f64).init(allocator);
        defer list.deinit();
        try list.append(0.0);
        try list.append(2.345);
        try list.append(123.456);
        std.log.debug("list: {any}", .{list.items});
    }

    {
        std.log.debug("========== ArrayList(u8) ==========", .{});
        var list = std.ArrayList(u8).init(allocator);
        defer list.deinit();
        try list.append('a');
        try list.append('b');
        try list.append('c');
        std.log.debug("list: {c}", .{list.items});
    }
}

test "basic test" {
    try std.testing.expectEqual(10, 3 + 7);
}
