﻿// Generated by HLC 4.1.5 (HL v5)
#ifndef HL_NATIVES_H
#define HL_NATIVES_H
// Abstract decls
typedef struct _alc_context alc_context;
typedef struct _alc_device alc_device;
typedef struct _ereg ereg;
typedef struct _fmt_mp3 fmt_mp3;
typedef struct _fmt_ogg fmt_ogg;
typedef struct _fmt_zip fmt_zip;
typedef struct _hl_bytes_map hl_bytes_map;
typedef struct _hl_deque hl_deque;
typedef struct _hl_fdesc hl_fdesc;
typedef struct _hl_int_map hl_int_map;
typedef struct _hl_mutex hl_mutex;
typedef struct _hl_obj_map hl_obj_map;
typedef struct _hl_random hl_random;
typedef struct _sdl_cursor sdl_cursor;
typedef struct _sdl_gamecontroller sdl_gamecontroller;
typedef struct _sdl_gl sdl_gl;
typedef struct _sdl_haptic sdl_haptic;
typedef struct _sdl_surface sdl_surface;
typedef struct _sdl_window sdl_window;
typedef struct _ui_sentinel ui_sentinel;
typedef struct _ui_window ui_window;

#include <hl/natives.h>
#include <_std/String.h>

// Natives functions
HL_API bool fmt_compute_mikkt_tangents(vdynamic*,double);
HL_API int fmt_deflate_bound(fmt_zip*,int);
HL_API bool fmt_deflate_buffer(fmt_zip*,vbyte*,int,int,vbyte*,int,int,int*,int*);
HL_API fmt_zip* fmt_deflate_init(int);
HL_API void fmt_digest(vbyte*,vbyte*,int,int);
HL_API bool fmt_dxt_decode(vbyte*,vbyte*,int,int,int);
HL_API bool fmt_inflate_buffer(fmt_zip*,vbyte*,int,int,vbyte*,int,int,int*,int*);
HL_API fmt_zip* fmt_inflate_init(int);
HL_API bool fmt_jpg_decode(vbyte*,int,vbyte*,int,int,int,int,int);
HL_API int fmt_mp3_decode_frame(fmt_mp3*,vbyte*,int,int,vbyte*,int,int);
HL_API fmt_mp3* fmt_mp3_open(vbyte*,int);
HL_API void fmt_ogg_info(fmt_ogg*,int*,int*,int*,int*);
HL_API fmt_ogg* fmt_ogg_open(vbyte*,int);
HL_API int fmt_ogg_read(fmt_ogg*,vbyte*,int,int);
HL_API bool fmt_ogg_seek(fmt_ogg*,int);
HL_API bool fmt_png_decode(vbyte*,int,vbyte*,int,int,int,int,int);
HL_API void fmt_zip_end(fmt_zip*);
HL_API void fmt_zip_flush_mode(fmt_zip*,int);
HL_API void openal_al_auxiliary_effect_slotf(int,int,float);
HL_API void openal_al_auxiliary_effect_slotfv(int,int,vbyte*);
HL_API void openal_al_auxiliary_effect_sloti(int,int,int);
HL_API void openal_al_auxiliary_effect_slotiv(int,int,vbyte*);
HL_API void openal_al_buffer3f(int,int,float,float,float);
HL_API void openal_al_buffer3i(int,int,int,int,int);
HL_API void openal_al_buffer_data(int,int,vbyte*,int,int);
HL_API void openal_al_bufferf(int,int,float);
HL_API void openal_al_bufferfv(int,int,vbyte*);
HL_API void openal_al_bufferi(int,int,int);
HL_API void openal_al_bufferiv(int,int,vbyte*);
HL_API void openal_al_delete_auxiliary_effect_slots(int,vbyte*);
HL_API void openal_al_delete_buffers(int,vbyte*);
HL_API void openal_al_delete_effects(int,vbyte*);
HL_API void openal_al_delete_filters(int,vbyte*);
HL_API void openal_al_delete_sources(int,vbyte*);
HL_API void openal_al_disable(int);
HL_API void openal_al_distance_model(int);
HL_API void openal_al_doppler_factor(float);
HL_API void openal_al_doppler_velocity(float);
HL_API void openal_al_effectf(int,int,float);
HL_API void openal_al_effectfv(int,int,vbyte*);
HL_API void openal_al_effecti(int,int,int);
HL_API void openal_al_effectiv(int,int,vbyte*);
HL_API void openal_al_enable(int);
HL_API void openal_al_filterf(int,int,float);
HL_API void openal_al_filterfv(int,int,vbyte*);
HL_API void openal_al_filteri(int,int,int);
HL_API void openal_al_filteriv(int,int,vbyte*);
HL_API void openal_al_gen_auxiliary_effect_slots(int,vbyte*);
HL_API void openal_al_gen_buffers(int,vbyte*);
HL_API void openal_al_gen_effects(int,vbyte*);
HL_API void openal_al_gen_filters(int,vbyte*);
HL_API void openal_al_gen_sources(int,vbyte*);
HL_API float openal_al_get_auxiliary_effect_slotf(int,int);
HL_API void openal_al_get_auxiliary_effect_slotfv(int,int,vbyte*);
HL_API int openal_al_get_auxiliary_effect_sloti(int,int);
HL_API void openal_al_get_auxiliary_effect_slotiv(int,int,vbyte*);
HL_API bool openal_al_get_boolean(int);
HL_API void openal_al_get_booleanv(int,vbyte*);
HL_API void openal_al_get_buffer3f(int,int,float*,float*,float*);
HL_API void openal_al_get_buffer3i(int,int,int*,int*,int*);
HL_API float openal_al_get_bufferf(int,int);
HL_API void openal_al_get_bufferfv(int,int,vbyte*);
HL_API int openal_al_get_bufferi(int,int);
HL_API void openal_al_get_bufferiv(int,int,vbyte*);
HL_API double openal_al_get_double(int);
HL_API void openal_al_get_doublev(int,vbyte*);
HL_API float openal_al_get_effectf(int,int);
HL_API void openal_al_get_effectfv(int,int,vbyte*);
HL_API int openal_al_get_effecti(int,int);
HL_API void openal_al_get_effectiv(int,int,vbyte*);
HL_API int openal_al_get_enum_value(vbyte*);
HL_API int openal_al_get_error(void);
HL_API float openal_al_get_filterf(int,int);
HL_API void openal_al_get_filterfv(int,int,vbyte*);
HL_API int openal_al_get_filteri(int,int);
HL_API void openal_al_get_filteriv(int,int,vbyte*);
HL_API float openal_al_get_float(int);
HL_API void openal_al_get_floatv(int,vbyte*);
HL_API int openal_al_get_integer(int);
HL_API void openal_al_get_integerv(int,vbyte*);
HL_API void openal_al_get_listener3f(int,float*,float*,float*);
HL_API void openal_al_get_listener3i(int,int*,int*,int*);
HL_API float openal_al_get_listenerf(int);
HL_API void openal_al_get_listenerfv(int,vbyte*);
HL_API int openal_al_get_listeneri(int);
HL_API void openal_al_get_listeneriv(int,vbyte*);
HL_API void openal_al_get_source3f(int,int,float*,float*,float*);
HL_API void openal_al_get_source3i(int,int,int*,int*,int*);
HL_API float openal_al_get_sourcef(int,int);
HL_API void openal_al_get_sourcefv(int,int,vbyte*);
HL_API int openal_al_get_sourcei(int,int);
HL_API void openal_al_get_sourceiv(int,int,vbyte*);
HL_API vbyte* openal_al_get_string(int);
HL_API bool openal_al_is_auxiliary_effect_slot(int);
HL_API bool openal_al_is_buffer(int);
HL_API bool openal_al_is_effect(int);
HL_API bool openal_al_is_enabled(int);
HL_API bool openal_al_is_extension_present(vbyte*);
HL_API bool openal_al_is_filter(int);
HL_API bool openal_al_is_source(int);
HL_API void openal_al_listener3f(int,float,float,float);
HL_API void openal_al_listener3i(int,int,int,int);
HL_API void openal_al_listenerf(int,float);
HL_API void openal_al_listenerfv(int,vbyte*);
HL_API void openal_al_listeneri(int,int);
HL_API void openal_al_listeneriv(int,vbyte*);
HL_API void openal_al_load_extensions(void);
HL_API void openal_al_source3f(int,int,float,float,float);
HL_API void openal_al_source3i(int,int,int,int,int);
HL_API void openal_al_source_pause(int);
HL_API void openal_al_source_pausev(int,vbyte*);
HL_API void openal_al_source_play(int);
HL_API void openal_al_source_playv(int,vbyte*);
HL_API void openal_al_source_queue_buffers(int,int,vbyte*);
HL_API void openal_al_source_rewind(int);
HL_API void openal_al_source_rewindv(int,vbyte*);
HL_API void openal_al_source_stop(int);
HL_API void openal_al_source_stopv(int,vbyte*);
HL_API void openal_al_source_unqueue_buffers(int,int,vbyte*);
HL_API void openal_al_sourcef(int,int,float);
HL_API void openal_al_sourcefv(int,int,vbyte*);
HL_API void openal_al_sourcei(int,int,int);
HL_API void openal_al_sourceiv(int,int,vbyte*);
HL_API void openal_al_speed_of_sound(float);
HL_API bool openal_alc_capture_close_device(alc_device*);
HL_API alc_device* openal_alc_capture_open_device(vbyte*,int,int,int);
HL_API void openal_alc_capture_samples(alc_device*,vbyte*,int);
HL_API void openal_alc_capture_start(alc_device*);
HL_API void openal_alc_capture_stop(alc_device*);
HL_API bool openal_alc_close_device(alc_device*);
HL_API alc_context* openal_alc_create_context(alc_device*,vbyte*);
HL_API void openal_alc_destroy_context(alc_context*);
HL_API alc_device* openal_alc_get_contexts_device(alc_context*);
HL_API alc_context* openal_alc_get_current_context(void);
HL_API int openal_alc_get_enum_value(alc_device*,vbyte*);
HL_API int openal_alc_get_error(alc_device*);
HL_API void openal_alc_get_integerv(alc_device*,int,int,vbyte*);
HL_API vbyte* openal_alc_get_string(alc_device*,int);
HL_API bool openal_alc_is_extension_present(alc_device*,vbyte*);
HL_API void openal_alc_load_extensions(alc_device*);
HL_API bool openal_alc_make_context_current(alc_context*);
HL_API alc_device* openal_alc_open_device(vbyte*);
HL_API void openal_alc_process_context(alc_context*);
HL_API void openal_alc_suspend_context(alc_context*);
HL_API sdl_cursor* sdl_cursor_create(sdl_surface*,int,int);
HL_API sdl_cursor* sdl_cursor_create_system(int);
HL_API bool sdl_detect_win32(void);
HL_API bool sdl_event_loop(vdynamic*);
HL_API void sdl_free_surface(sdl_surface*);
HL_API void sdl_gctrl_close(sdl_gamecontroller*);
HL_API int sdl_gctrl_get_axis(sdl_gamecontroller*,int);
HL_API bool sdl_gctrl_get_button(sdl_gamecontroller*,int);
HL_API int sdl_gctrl_get_id(sdl_gamecontroller*);
HL_API sdl_gamecontroller* sdl_gctrl_open(int);
HL_API varray* sdl_get_devices(void);
HL_API void sdl_gl_active_texture(int);
HL_API void sdl_gl_attach_shader(vdynamic*,vdynamic*);
HL_API void sdl_gl_bind_buffer(int,vdynamic*);
HL_API void sdl_gl_bind_buffer_base(int,int,vdynamic*);
HL_API void sdl_gl_bind_frag_data_location(vdynamic*,int,String);
HL_API void sdl_gl_bind_framebuffer(int,vdynamic*);
HL_API void sdl_gl_bind_renderbuffer(int,vdynamic*);
HL_API void sdl_gl_bind_texture(int,vdynamic*);
HL_API void sdl_gl_bind_vertex_array(vdynamic*);
HL_API void sdl_gl_blend_equation(int);
HL_API void sdl_gl_blend_equation_separate(int,int);
HL_API void sdl_gl_blend_func(int,int);
HL_API void sdl_gl_blend_func_separate(int,int,int,int);
HL_API void sdl_gl_buffer_data_size(int,int,int);
HL_API void sdl_gl_buffer_sub_data(int,int,vbyte*,int,int);
HL_API void sdl_gl_clear(int);
HL_API void sdl_gl_clear_color(double,double,double,double);
HL_API void sdl_gl_clear_depth(double);
HL_API void sdl_gl_clear_stencil(int);
HL_API void sdl_gl_color_mask(bool,bool,bool,bool);
HL_API void sdl_gl_compile_shader(vdynamic*);
HL_API void sdl_gl_compressed_tex_image2d(int,int,int,int,int,int,int,vbyte*);
HL_API vdynamic* sdl_gl_create_buffer(void);
HL_API vdynamic* sdl_gl_create_framebuffer(void);
HL_API vdynamic* sdl_gl_create_program(void);
HL_API vdynamic* sdl_gl_create_renderbuffer(void);
HL_API vdynamic* sdl_gl_create_shader(int);
HL_API vdynamic* sdl_gl_create_texture(void);
HL_API vdynamic* sdl_gl_create_vertex_array(void);
HL_API void sdl_gl_cull_face(int);
HL_API void sdl_gl_delete_buffer(vdynamic*);
HL_API void sdl_gl_delete_renderbuffer(vdynamic*);
HL_API void sdl_gl_delete_shader(vdynamic*);
HL_API void sdl_gl_delete_texture(vdynamic*);
HL_API void sdl_gl_depth_func(int);
HL_API void sdl_gl_depth_mask(bool);
HL_API void sdl_gl_disable(int);
HL_API void sdl_gl_disable_vertex_attrib_array(int);
HL_API void sdl_gl_draw_buffers(int,vbyte*);
HL_API void sdl_gl_draw_elements(int,int,int,int);
HL_API void sdl_gl_enable(int);
HL_API void sdl_gl_enable_vertex_attrib_array(int);
HL_API void sdl_gl_finish(void);
HL_API void sdl_gl_framebuffer_renderbuffer(int,int,int,vdynamic*);
HL_API void sdl_gl_framebuffer_texture2d(int,int,int,vdynamic*,int);
HL_API void sdl_gl_framebuffer_texture_layer(int,int,vdynamic*,int,int);
HL_API void sdl_gl_generate_mipmap(int);
HL_API int sdl_gl_get_attrib_location(vdynamic*,String);
HL_API int sdl_gl_get_config_parameter(int);
HL_API int sdl_gl_get_error(void);
HL_API vbyte* sdl_gl_get_program_info_bytes(vdynamic*);
HL_API vdynamic* sdl_gl_get_program_parameter(vdynamic*,int);
HL_API vbyte* sdl_gl_get_shader_info_bytes(vdynamic*);
HL_API vdynamic* sdl_gl_get_shader_parameter(vdynamic*,int);
HL_API vbyte* sdl_gl_get_string(int);
HL_API int sdl_gl_get_uniform_block_index(vdynamic*,String);
HL_API vdynamic* sdl_gl_get_uniform_location(vdynamic*,String);
HL_API bool sdl_gl_init(void);
HL_API bool sdl_gl_is_context_lost(void);
HL_API void sdl_gl_link_program(vdynamic*);
HL_API void sdl_gl_pixel_storei(int,int);
HL_API void sdl_gl_polygon_mode(int,int);
HL_API void sdl_gl_renderbuffer_storage(int,int,int,int);
HL_API void sdl_gl_scissor(int,int,int,int);
HL_API void sdl_gl_shader_source(vdynamic*,String);
HL_API void sdl_gl_stencil_func_separate(int,int,int,int);
HL_API void sdl_gl_stencil_mask_separate(int,int);
HL_API void sdl_gl_stencil_op_separate(int,int,int,int);
HL_API void sdl_gl_tex_image2d(int,int,int,int,int,int,int,int,vbyte*);
HL_API void sdl_gl_tex_image3d(int,int,int,int,int,int,int,int,int,vbyte*);
HL_API void sdl_gl_tex_parameterf(int,int,float);
HL_API void sdl_gl_tex_parameteri(int,int,int);
HL_API void sdl_gl_uniform1i(vdynamic*,int);
HL_API void sdl_gl_uniform4fv(vdynamic*,vbyte*,int,int);
HL_API void sdl_gl_uniform_block_binding(vdynamic*,int,int);
HL_API void sdl_gl_use_program(vdynamic*);
HL_API void sdl_gl_vertex_attrib_divisor(int,int);
HL_API void sdl_gl_vertex_attrib_pointer(int,int,int,bool,int,int);
HL_API void sdl_gl_viewport(int,int,int,int);
HL_API void sdl_haptic_close(sdl_haptic*);
HL_API bool sdl_init_once(void);
HL_API void sdl_set_cursor(sdl_cursor*);
HL_API void sdl_set_vsync(bool);
HL_API void sdl_show_cursor(bool);
HL_API sdl_surface* sdl_surface_from(vbyte*,int,int,int,int,int,int,int,int);
HL_API sdl_window* sdl_win_create_ex(int,int,int,int,int);
HL_API void sdl_win_destroy(sdl_window*,sdl_gl*);
HL_API sdl_gl* sdl_win_get_glcontext(sdl_window*);
HL_API void sdl_win_get_size(sdl_window*,int*,int*);
HL_API bool sdl_win_set_fullscreen(sdl_window*,int);
HL_API void sdl_win_set_title(sdl_window*,vbyte*);
HL_API void sdl_win_swap_window(sdl_window*);
HL_API varray* hl_alloc_array(hl_type*,int);
HL_API vbyte* hl_alloc_bytes(int);
HL_API vbyte* hl_alloc_bytes(int);
HL_API vdynamic* hl_alloc_enum_dyn(hl_type*,int,varray*,int);
HL_API vdynamic* hl_alloc_obj(hl_type*);
HL_API void hl_array_blit(varray*,int,varray*,int,int);
HL_API hl_type* hl_array_type(varray*);
HL_API void hl_breakpoint(void);
HL_API void hl_bsort_f64(vbyte*,int,int,vclosure*);
HL_API void hl_bsort_i32(vbyte*,int,int,vclosure*);
HL_API void hl_bytes_blit(vbyte*,int,vbyte*,int,int);
HL_API int hl_bytes_compare(vbyte*,int,vbyte*,int,int);
HL_API int hl_bytes_compare16(vbyte*,vbyte*,int);
HL_API void hl_bytes_fill(vbyte*,int,int,int);
HL_API int hl_bytes_find(vbyte*,int,int,vbyte*,int,int);
HL_API vbyte* hl_bytes_offset(vbyte*,int);
HL_API vdynamic* hl_call_method(vdynamic*,varray*);
HL_API int hl_date_from_string(vbyte*,int);
HL_API int hl_date_from_time(double);
HL_API void hl_date_get_inf(int,int*,int*,int*,int*,int*,int*,int*);
HL_API double hl_date_get_time(int);
HL_API int hl_date_new(int,int,int,int,int,int);
HL_API int hl_date_now(void);
HL_API vbyte* hl_date_to_string(int,int*);
HL_API hl_deque* hl_deque_alloc(void);
HL_API vdynamic* hl_deque_pop(hl_deque*,bool);
HL_API int hl_dyn_compare(vdynamic*,vdynamic*);
HL_API varray* hl_enum_parameters(vdynamic*);
HL_API varray* hl_exception_stack(void);
HL_API void hl_file_close(hl_fdesc*);
HL_API vbyte* hl_file_contents(vbyte*,int*);
HL_API bool hl_file_flush(hl_fdesc*);
HL_API hl_fdesc* hl_file_open(vbyte*,int,bool);
HL_API int hl_file_read(hl_fdesc*,vbyte*,int,int);
HL_API int hl_file_read_char(hl_fdesc*);
HL_API hl_fdesc* hl_file_stderr(void);
HL_API int hl_file_write(hl_fdesc*,vbyte*,int,int);
HL_API bool hl_file_write_char(hl_fdesc*,int);
HL_API vbyte* hl_ftos(double,int*);
HL_API bool hl_fun_compare(vdynamic*,vdynamic*);
HL_API vdynamic* hl_get_closure_value(vdynamic*);
HL_API vdynamic* hl_get_virtual_value(vdynamic*);
HL_API int hl_hash(vbyte*);
HL_API hl_bytes_map* hl_hballoc(void);
HL_API bool hl_hbexists(hl_bytes_map*,vbyte*);
HL_API vdynamic* hl_hbget(hl_bytes_map*,vbyte*);
HL_API varray* hl_hbkeys(hl_bytes_map*);
HL_API bool hl_hbremove(hl_bytes_map*,vbyte*);
HL_API void hl_hbset(hl_bytes_map*,vbyte*,vdynamic*);
HL_API varray* hl_hbvalues(hl_bytes_map*);
HL_API hl_int_map* hl_hialloc(void);
HL_API bool hl_hiexists(hl_int_map*,int);
HL_API vdynamic* hl_higet(hl_int_map*,int);
HL_API varray* hl_hikeys(hl_int_map*);
HL_API bool hl_hiremove(hl_int_map*,int);
HL_API void hl_hiset(hl_int_map*,int,vdynamic*);
HL_API varray* hl_hivalues(hl_int_map*);
HL_API hl_obj_map* hl_hoalloc(void);
HL_API bool hl_hoexists(hl_obj_map*,vdynamic*);
HL_API vdynamic* hl_hoget(hl_obj_map*,vdynamic*);
HL_API varray* hl_hokeys(hl_obj_map*);
HL_API bool hl_horemove(hl_obj_map*,vdynamic*);
HL_API void hl_hoset(hl_obj_map*,vdynamic*,vdynamic*);
HL_API vbyte* hl_itos(int,int*);
HL_API vdynamic* hl_make_closure(vdynamic*,vdynamic*);
HL_API vdynamic* hl_make_var_args(vclosure*);
HL_API double hl_math_abs(double);
HL_API double hl_math_atan(double);
HL_API double hl_math_atan2(double,double);
HL_API int hl_math_ceil(double);
HL_API double hl_math_cos(double);
HL_API double hl_math_fceil(double);
HL_API double hl_math_ffloor(double);
HL_API int hl_math_floor(double);
HL_API double hl_math_fround(double);
HL_API bool hl_math_isfinite(double);
HL_API bool hl_math_isnan(double);
HL_API double hl_math_pow(double,double);
HL_API int hl_math_round(double);
HL_API double hl_math_sin(double);
HL_API double hl_math_sqrt(double);
HL_API double hl_math_tan(double);
HL_API void hl_mutex_acquire(hl_mutex*);
HL_API hl_mutex* hl_mutex_alloc(bool);
HL_API void hl_mutex_release(hl_mutex*);
HL_API vdynamic* hl_no_closure(vdynamic*);
HL_API bool hl_obj_delete_field(vdynamic*,int);
HL_API varray* hl_obj_fields(vdynamic*);
HL_API vdynamic* hl_obj_get_field(vdynamic*,int);
HL_API bool hl_obj_has_field(vdynamic*,int);
HL_API void hl_obj_set_field(vdynamic*,int,vdynamic*);
HL_API double hl_parse_float(vbyte*,int,int);
HL_API vdynamic* hl_parse_int(vbyte*,int,int);
HL_API int hl_ptr_compare(vdynamic*,vdynamic*);
HL_API bool hl_regexp_match(ereg*,vbyte*,int,int);
HL_API int hl_regexp_matched_pos(ereg*,int,int*);
HL_API ereg* hl_regexp_new_options(vbyte*,vbyte*);
HL_API hl_random* hl_rnd_init_system(void);
HL_API void hl_set_error_handler(vclosure*);
HL_API int hl_string_compare(vbyte*,vbyte*,int);
HL_API int hl_sys_command(vbyte*);
HL_API bool hl_sys_create_dir(vbyte*,int);
HL_API bool hl_sys_delete(vbyte*);
HL_API bool hl_sys_exists(vbyte*);
HL_API void hl_sys_exit(int);
HL_API vbyte* hl_sys_get_cwd(void);
HL_API bool hl_sys_is64(void);
HL_API bool hl_sys_is_dir(vbyte*);
HL_API void hl_sys_print(vbyte*);
HL_API varray* hl_sys_read_dir(vbyte*);
HL_API bool hl_sys_rename(vbyte*,vbyte*);
HL_API void hl_sys_sleep(double);
HL_API vbyte* hl_sys_string(void);
HL_API double hl_sys_time(void);
HL_API bool hl_sys_utf8_path(void);
HL_API int hl_type_args_count(hl_type*);
HL_API bool hl_type_enum_eq(vdynamic*,vdynamic*);
HL_API varray* hl_type_enum_fields(hl_type*);
HL_API varray* hl_type_enum_values(hl_type*);
HL_API vdynamic* hl_type_get_global(hl_type*);
HL_API vbyte* hl_type_name(hl_type*);
HL_API bool hl_type_safe_cast(hl_type*,hl_type*);
HL_API bool hl_type_set_global(hl_type*,vdynamic*);
HL_API hl_type* hl_type_super(hl_type*);
HL_API vbyte* hl_ucs2_lower(vbyte*,int,int);
HL_API vbyte* hl_ucs2_upper(vbyte*,int,int);
HL_API int hl_ucs2length(vbyte*,int);
HL_API vbyte* hl_url_decode(vbyte*,int*);
HL_API vbyte* hl_url_encode(vbyte*,int*);
HL_API vbyte* hl_utf16_to_utf8(vbyte*,int,int*);
HL_API vbyte* hl_utf8_to_utf16(vbyte*,int,int*);
HL_API vdynamic* hl_value_cast(vdynamic*,hl_type*);
HL_API vbyte* hl_value_to_string(vdynamic*,int*);
HL_API ui_window* ui_ui_button_new(ui_window*,vbyte*,vclosure*);
HL_API vbyte* ui_ui_choose_file(bool,vdynamic*);
HL_API void ui_ui_close_console(void);
HL_API int ui_ui_dialog(vbyte*,vbyte*,int);
HL_API void ui_ui_init(void);
HL_API int ui_ui_loop(bool);
HL_API bool ui_ui_sentinel_is_paused(ui_sentinel*);
HL_API void ui_ui_sentinel_pause(ui_sentinel*,bool);
HL_API void ui_ui_sentinel_tick(ui_sentinel*);
HL_API ui_sentinel* ui_ui_start_sentinel(double,vclosure*);
HL_API void ui_ui_stop_loop(void);
HL_API void ui_ui_win_destroy(ui_window*);
HL_API ui_window* ui_ui_winlog_new(vbyte*,int,int);
HL_API void ui_ui_winlog_set_text(ui_window*,vbyte*,bool);
#endif

