// _Pointers_ are objects that store a memory address.

const std = @import("std");
const print = std.debug.print;

// _Single-item pointers_ point to exactly one value.
const Single = *bool;

// _Many-item pointers_ point to an unknown number of values. Unless you're
// interfacing with C code, you probably won't use these types of pointers, so
// we'll skip over them.
const Many = [*]bool;

// All pointers in Zig point to a non-`null` value. To define a `null` pointer,
// you must make the pointer type
// <a href="https://zig-by-example.com/optionals">optional</a>.
const Null = ?*bool;

pub fn main() !void {

    // To create a single-item pointer, use the `&` operator.
    var v = false;
    const ptr: *bool = &v;
    print("pointer: {}\n", .{ptr});

    // To access the value located at the memory address stored by a
    // single-item pointer, use the `*` operator.
    ptr.* = true;
    print("value: {}\n", .{ptr.*});

    // If a _pointer_ is `const`, the value of its pointee can be modified, but
    // the pointer itself cannot be re-assigned.
    const const_ptr: *bool = &v;
    const_ptr.* = false;

    // If a _pointee_ is `const`, its pointer type will reflect that. The value
    // of `const` pointees cannot be modified, but the pointer itself can be
    // re-assigned.
    const cf = false;
    const ct = true;
    var ptr_to_const: *const bool = &cf;
    ptr_to_const = &ct;
}
