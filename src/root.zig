const std = @import("std");
const numbers = @import("numbers.zig");

test "pi to the nth" {
    const max_value: f64 = 3.141592653589793;
    const first_couple: [4]f64 = .{ 3, 3.1, 3.14, 3.142 };
    const past_index: usize = 20;
    for (first_couple, 0..) |result, idx| {
        const actual_result = try numbers.piToNthDigit(idx);
        try std.testing.expectEqual(result, actual_result);
    }
    const actual_max_result = try numbers.piToNthDigit(past_index);
    try std.testing.expectEqual(max_value, actual_max_result);
}

test "e to the nth" {
    const max_value: f64 = 2.718282;
    const first_couple: [4]f64 = .{ 3, 2.7, 2.72, 2.718 };
    const past_index: usize = 6;
    for (first_couple, 0..) |result, idx| {
        const actual_result = try numbers.eToNthDigit(idx);
        try std.testing.expectEqual(result, actual_result);
    }
    const actual_max_result = try numbers.eToNthDigit(past_index);
    try std.testing.expectEqual(max_value, actual_max_result);
}

test "fibonnaci numbers" {
    const example_idx = [4]usize{ 1, 11, 16, 19 };
    const expected_result = [4]usize{ 1, 89, 987, 4181 };
    for (example_idx, expected_result) |idx, expected_value| {
        const result = try numbers.fibonacciNumber(idx);
        try std.testing.expectEqual(expected_value, result);
    }
}
