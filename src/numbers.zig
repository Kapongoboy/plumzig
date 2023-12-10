const std = @import("std");
const ally = std.heap.page_allocator;
const pi: f64 = std.math.pi;
const e: f64 = std.math.e;

pub fn parseFloatValue(f: f64, N: usize, c: u8) !f64 {
    const idx = switch (c) {
        'p' => if (N > 15) 15 else N,
        'e' => if (N > 6) 6 else N,
        else => N,
    };
    var buf: [512]u8 = undefined;
    var buf_stream = std.io.fixedBufferStream(&buf);
    const options = std.fmt.FormatOptions;
    var option = options{};
    option.precision = idx;
    option.width = idx;
    try std.fmt.formatFloatDecimal(f, option, buf_stream.writer());
    var float_str = std.ArrayList(u8).init(ally);
    defer float_str.deinit();
    for (buf) |value| {
        if (value != undefined and std.ascii.isASCII(value)) {
            try float_str.append(value);
        }
    }
    const value = try std.fmt.parseFloat(f64, float_str.items);
    return value;
}
pub fn piToNthDigit(N: usize) !f64 {
    // This function returns the value of pi to the Nth digit,
    // for a maximum of N = 15
    const value = try parseFloatValue(pi, N, 'p');
    return value;
}

pub fn eToNthDigit(N: usize) !f64 {
    const value = try parseFloatValue(e, N, 'e');
    return value;
}
