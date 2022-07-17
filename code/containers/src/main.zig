//!
//! Zig の様々なコレクション
//!

const std = @import("std");

/// エントリーポイント
pub fn main() anyerror!void {

    // 普通のアロケータ
    const allocator = std.heap.page_allocator;

    // いるの いらないの
    // defer allocator.free();

    {
        std.log.debug("========== ArrayList(u32) ==========", .{});
        var list = std.ArrayList(u32).init(allocator);
        // TODO: いるの？
        defer list.deinit();
        try list.append(0);
        try list.append(2);
        try list.append(700);

        std.log.debug("list: {any}", .{list.items});
    }

    {
        std.log.debug("========== ArrayList([]const u8) ==========", .{});
        var list = std.ArrayList([]const u8).init(allocator);
        // TODO: いるの？
        defer list.deinit();
        try list.append("");
        try list.append("1");
        try list.append("Jimmy Page");

        std.log.debug("list: \"{s}\"", .{list.items});
    }

    {
        std.log.debug("========== ArrayList(f64) ==========", .{});
        var list = std.ArrayList(f64).init(allocator);
        // TODO: いるの？
        defer list.deinit();
        try list.append(0.0);
        try list.append(2.345);
        try list.append(123.456);

        std.log.debug("list: {any}", .{list.items});
    }

    {
        std.log.debug("========== ArrayList(u8) ==========", .{});
        var list = std.ArrayList(u8).init(allocator);
        // TODO: いるの？
        defer list.deinit();
        try list.append('a');
        try list.append('b');
        try list.append('c');

        std.log.debug("list: {c}", .{list.items});
    }

    {
        std.log.debug("========== StringHashMap([]const u8) ==========", .{});
        var map = std.StringHashMap([]const u8).init(allocator);
        // TODO: いるの？
        defer map.deinit();
        try map.put("0", "zero");
        try map.put("1", "one");
        try map.put("2", "two");

        var i = map.iterator();
        while (i.next()) |entry| { // entry is called "capture".
            std.log.debug("map entry: [\"{s}\"]=[\"{s}\"]", .{entry.key_ptr.*, entry.value_ptr.*});
        }
    }
}
