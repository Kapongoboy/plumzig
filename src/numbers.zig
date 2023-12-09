const std = @import("std");
const ally = std.heap.page_allocator;
const pi: f64 = std.math.pi;

pub fn piToNthDigit(N: usize) !f64 {
    // This function returns the value of pi to the Nth digit,
    // for a maximum of N = 15
    const idx = if (N > 15) 15 else N;
    var buf: [512]u8 = undefined;
    var buf_stream = std.io.fixedBufferStream(&buf);
    const options = std.fmt.FormatOptions;
    var option = options{};
    option.precision = idx;
    option.width = idx;
    try std.fmt.formatFloatDecimal(pi, option, buf_stream.writer());
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
