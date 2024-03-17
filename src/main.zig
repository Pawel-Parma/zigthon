const py = @import("common.zig").py;

const sf = @import("simplefunc.zig");

const PyMethodDef = py.PyMethodDef;
const METH_NOARGS = py.METH_NOARGS;


var Methods = [_]PyMethodDef{
    PyMethodDef{
        .ml_name = "sum",
        .ml_meth = sf.sum,
        .ml_flags = @as(c_int, 1),
        .ml_doc = null,
    },
    PyMethodDef{
        .ml_name = "mul",
        .ml_meth = sf.mul,
        .ml_flags = @as(c_int, 1),
        .ml_doc = null,
    },
    PyMethodDef{
        .ml_name = "hello",
        .ml_meth = sf.hello,
        .ml_flags = METH_NOARGS,
        .ml_doc = null,
    },
    PyMethodDef{
        .ml_name = "printSt",
        .ml_meth = sf.printSt,
        .ml_flags = @as(c_int, 1),
        .ml_doc = null,
    },
    PyMethodDef{
        .ml_name = "returnArrayWithInput",
        .ml_meth = sf.returnArrayWithInput,
        .ml_flags = @as(c_int, 1),
        .ml_doc = null,
    },
    PyMethodDef{
        .ml_name = null,
        .ml_meth = null,
        .ml_flags = 0,
        .ml_doc = null,
    },
};

var module = py.PyModuleDef{
    .m_base = py.PyModuleDef_Base{
        .ob_base = py.PyObject{
            .ob_refcnt = 1,
            .ob_type = null,
        },
        .m_init = null,
        .m_index = 0,
        .m_copy = null,
    },
    .m_name = "zigthon",
    .m_doc = null,
    .m_size = -1,
    .m_methods = &Methods,
    .m_slots = null,
    .m_traverse = null,
    .m_clear = null,
    .m_free = null,
};

pub export fn PyInit_zigthon() [*]py.PyObject {
    return py.PyModule_Create(&module);
}
