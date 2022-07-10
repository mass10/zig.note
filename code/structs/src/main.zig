//!
//! 構造体を扱う小さなアプリケーションの例
//!

const std = @import("std");

/// コンフィギュレーション構造体
const Configuration = struct {
    /// --help
    help: bool = false,

    /// --version
    version: bool = false,

    /// コンフィギュレーション
    pub fn configure() Configuration {
        const conf = Configuration {
            .help = false,
            .version = false,
        };
        return conf;
    }
};

/// アプリケーション本体の構造体
const Application = struct {
    /// アプリケーションが生成されたタイムスタンプ
    timestamp: []const u8 = "",

    /// 名前
    name: []const u8 = "アプリケーション",

    /// アプリケーションを呼び出します。
    pub fn start(self: *Application, conf: *const Configuration) !void {
        std.log.info("object was born at {s}", .{self.timestamp});
        std.log.info("conf: {}", .{conf});
    }

    /// 名前を返します。
    pub fn getName(self: *Application) []u8 {
        return self.name;
    }
};

/// エントリーポイントです。
pub fn main() anyerror!void {

    // ========== CONFIGURATION ==========
    var conf = Configuration.configure();

    std.log.info("### START ###", .{});

    // std.log.debug("{}", .{conf});

    // アプリケーションを作成
    var application = Application{};
    const result = application.start(&conf) catch |err| {
        std.log.err("予期しない実行時エラーが発生しています。{}", .{err});
    };

    std.log.debug("result: {}", .{result});
    std.log.info("--- END ---", .{});
}

test "basic test" {
    try std.testing.expectEqual(10, 3 + 7);
}
