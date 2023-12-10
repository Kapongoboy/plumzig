const std = @import("std");
const plnum = @import("numbers.zig");

pub fn main() !void {
    const value = try plnum.fibonacciNumber(@as(usize, 19));
    std.debug.print("{}", .{value});
}
