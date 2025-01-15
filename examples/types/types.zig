// Demonstrates the use of constants (`const`), variables (`var`),
// type annotations, type coercion, and handling undefined values in Zig.
const std = @import("std");
const print = std.debug.print;

pub fn main() !void {

    // Constants store immutable values.
    const constant: i32 = 12;

    // Variables store mutable values.
    var variable: u32 = 5000;
    variable += 100;

    // Explicit type coercion using `@as`.
    const inferred_constant = @as(i32, 5);
    var inferred_variable = @as(u32, 5000);
    inferred_variable += 100;

    // Undefined value usage (for demonstration purposes).
    const a: i32 = undefined;

    print("Constant value: {d}\n", .{constant});
    print("Variable value: {d}\n", .{variable});

    const message1 = "Inferred constant value: {d}\n";
    print(message1, .{inferred_constant});

    const message2 = "Inferred variable value: {d}\n";
    print(message2, .{inferred_variable});
    print("a: {d}\n", .{a});

    // Undefined value in a mutable variable.
    var b: u16 = undefined;
    b += 1; // Incrementing an arbitrary value.

    // Explanation:
    // var b: u16 = undefined; reserves space in memory for a u16 (16-bit unsigned integer), but does not initialize it.
    // The value of b starts as an arbitrary bit pattern left in memory from previous operations.
    // b += 1; increments this arbitrary value by 1, which might result in 43691 + 1 = 43692.
    print("b: {d}\n", .{b}); // Output: 43691

    // Solution: Always initialize variables.
    var c: u16 = 0;
    c += 1;
    print("c: {d}\n", .{c}); // Output: 1
}
