const std = @import("std");

// const String 

/// ファイル全体を読み込みます。
///
/// # Returns
/// ファイルの内容 TODO: どうやって返す？
fn readTextFile1(path: []const u8) !void {
    // ダメ
    // const allocator = std.heap.GeneralPurposeAllocator;
    const allocator = std.heap.page_allocator;
    // const allocator = std.testing.allocator;

    // ファイルを開く
    const file = try std.fs.openFileAbsolute(path, .{ .mode = .read_only });
    defer file.close();

    // サイズを調べて
    const stats = try file.stat();
    const required_size = stats.size;

    // 全体を読み込む
    const content = try file.readToEndAlloc(allocator, required_size);
    // このバッファは解放が必要
    defer allocator.free(content);

    std.log.debug("{s}", .{content});
}

/// ファイル全体を読み込みます。
///
/// TODO: どうやって結果を返す？
fn readTextFile(path: []const u8) !void {
    std.log.debug("reading file... [{s}]", .{path});

    // const flags = std.fs.File.OpenFlags{ .mode = .read_only };
    const file = try std.fs.openFileAbsolute(path, .{ .mode = .read_only });
    defer file.close();

    // 必要ない？ (readLine 的な操作がみあたらない)
    // const stream = std.io.bufferedReader(file);

    // 読み込みバッファ
    const allocator = std.heap.page_allocator;
    var line = try allocator.alloc(u8, 4096);
    defer allocator.free(line);

    while (true) {
        // var line: [4096]u8 = undefined;

        const size_read = try file.readAll(line);

        // std.log.debug("{d}", .{sizeRead});
        std.log.debug("{s}", .{line});

        if (size_read < line.len) {
            break;
        }
    }

    std.log.debug("ok.", .{});
}

/// エントリーポイントです。
pub fn main() anyerror!void {
    // 普通のアロケータ
    const allocator = std.heap.page_allocator;
    // アロケータ
    // const allocator = std.heap.GeneralPurposeAllocator;

    const path = &[_][]const u8{"src\\main.zig"};

    // フルパスに変換
    const absolute_path = try std.fs.path.resolve(allocator, path);

    defer allocator.free(absolute_path);

    std.log.debug("absolute path: [{s}]", .{absolute_path});

    readTextFile(absolute_path) catch |err| {
        std.log.err("Unexpected runtime error! reason: {}", .{err});
    };

    readTextFile1(absolute_path) catch |err| {
        std.log.err("Unexpected runtime error! reason: {}", .{err});
    };
}

// 自動的に生成されたテストコード
test "basic test" {
    // const allocator = std.testing.allocator;
    try example_alloc2();
}
