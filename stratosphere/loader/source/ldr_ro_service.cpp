#include <switch.h>
#include <cstdio>
#include <algorithm>

#include "ldr_ro_service.hpp"
#include "ldr_registration.hpp"

Result RelocatableObjectsService::dispatch(IpcParsedCommand &r, IpcCommand &out_c, u64 cmd_id, u8 *pointer_buffer, size_t pointer_buffer_size) {
    Result rc = 0xF601;
        
    switch ((RoServiceCmd)cmd_id) {
        case Ro_Cmd_LoadNro:
            rc = WrapIpcCommandImpl<&RelocatableObjectsService::load_nro>(this, r, out_c, pointer_buffer, pointer_buffer_size);
            break;
        case Ro_Cmd_UnloadNro:
            rc = WrapIpcCommandImpl<&RelocatableObjectsService::unload_nro>(this, r, out_c, pointer_buffer, pointer_buffer_size);
            break;
        case Ro_Cmd_LoadNrr:
            rc = WrapIpcCommandImpl<&RelocatableObjectsService::load_nrr>(this, r, out_c, pointer_buffer, pointer_buffer_size);
            break;
        case Ro_Cmd_UnloadNrr:
            rc = WrapIpcCommandImpl<&RelocatableObjectsService::unload_nrr>(this, r, out_c, pointer_buffer, pointer_buffer_size);
            break;
        case Ro_Cmd_Initialize:
            rc = WrapIpcCommandImpl<&RelocatableObjectsService::initialize>(this, r, out_c, pointer_buffer, pointer_buffer_size);
            break;
        default:
            break;
    }
    return rc;
}


std::tuple<Result, u64> RelocatableObjectsService::load_nro(PidDescriptor pid_desc, u64 nro_address, u64 nro_size, u64 bss_address, u64 bss_size) {
    /* TODO */
    return std::make_tuple(0xF601, 0);
}

std::tuple<Result> RelocatableObjectsService::unload_nro(PidDescriptor pid_desc, u64 nro_address) {
    /* TODO */
    return std::make_tuple(0xF601);
}

std::tuple<Result> RelocatableObjectsService::load_nrr(PidDescriptor pid_desc, u64 nrr_address, u64 nrr_size) {
    /* TODO */
    return std::make_tuple(0xF601);
}

std::tuple<Result> RelocatableObjectsService::unload_nrr(PidDescriptor pid_desc, u64 nrr_address) {
    /* TODO */
    return std::make_tuple(0xF601);
}

std::tuple<Result> RelocatableObjectsService::initialize(PidDescriptor pid_desc, CopiedHandle process_h) {
    u64 handle_pid;
    Result rc = 0xAE09;
    if (R_SUCCEEDED(svcGetProcessId(&handle_pid, process_h.handle)) && handle_pid == pid_desc.pid) {
        if (this->has_initialized) {
            svcCloseHandle(this->process_handle);
        }
        this->process_handle = process_h.handle;
        this->has_initialized = true;
        rc = 0;
    }
    return std::make_tuple(rc);
}
