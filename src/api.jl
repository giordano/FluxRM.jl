module API

using flux_core_jll

using CEnum

function flux_withenv(f)
    prefix = flux_core_jll.artifact_dir
    withenv(f,
        "FLUX_PMI_LIBRARY_PATH" => joinpath(prefix, "lib/flux/libpmi.so"),
        "LUA_PATH"              => joinpath(prefix, "share/lua/5.3/?.lua;;;"),
        "FLUX_EXEC_PATH"        => joinpath(prefix, "libexec/flux/cmd"),
        "PYTHONPATH"            => joinpath(prefix, "lib/flux/python"),
        "LUA_CPATH"             => joinpath(prefix, "lib/lua/5.3/?.so;;;"),
        "FLUX_CONNECTOR_PATH"   => joinpath(prefix, "lib/flux/connectors"),
        "FLUX_MODULE_PATH"      => joinpath(prefix, "lib/flux/modules")
    )
end

include("api/ctypes.jl")

include("api/libflux_common.jl")
include("api/libflux_h.jl")

end