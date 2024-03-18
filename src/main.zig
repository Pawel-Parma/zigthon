const py = @import("common.zig").py;
const PyMethodDef = py.PyMethodDef;
const METH_NOARGS = py.METH_NOARGS;
const METH_VARARGS = py.METH_VARARGS;
const METH_KEYWORDS = py.METH_KEYWORDS;
const METH_O = py.METH_O;

const sf = @import("simplefunc.zig");


var methods = [_]PyMethodDef{
    PyMethodDef{
        .ml_name = "sqr",
        .ml_meth = sf.sqr,
        .ml_flags = METH_VARARGS,
        .ml_doc = null,
    },
    PyMethodDef{
        .ml_name = "sqr_sum",
        .ml_meth = sf.sqr_sum,
        .ml_flags = METH_VARARGS,
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
    .m_methods = &methods,
    .m_slots = null,
    .m_traverse = null,
    .m_clear = null,
    .m_free = null,
};

pub export fn PyInit_zigthon() [*]py.PyObject {
    return py.PyModule_Create(&module);
}
