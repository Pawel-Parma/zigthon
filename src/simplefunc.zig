const py = @import("common.zig").py;
const std = @import("std");
const print = std.debug.print;

const PyObject = py.PyObject;
const Py_BuildValue = py.Py_BuildValue;
const PyLong_FromLong = py.PyLong_FromLong;
const PyArg_ParseTuple = py.PyArg_ParseTuple;



pub fn sqr(self: [*c]PyObject, args: [*c]PyObject) callconv(.C) [*]PyObject {
    _ = self;
    var a: c_long = undefined;
    if (PyArg_ParseTuple(args, "l", &a) == 0) return Py_BuildValue("");
    return PyLong_FromLong((a * a));
}

pub fn sqr_sum(self: [*c]PyObject, args: [*c]PyObject) callconv(.C) [*]PyObject {
    _ = self;
    var x: c_long = undefined;
    if (PyArg_ParseTuple(args, "l", &x) == 0) return Py_BuildValue("");

    var tmp: c_long = 0;
    var ret: c_long = 0;
    while (tmp < x) : (tmp += 1) {
        ret += tmp * tmp;
    }

    return PyLong_FromLong(ret);
}
