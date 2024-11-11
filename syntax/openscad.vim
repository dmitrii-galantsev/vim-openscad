" Vim syntax file
" Language:     OpenSCAD
" Maintainer:   Sirtaj Singh Kang <sirtaj-vim@sirtaj.net>
" Last Changed: 2013 March 05

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif


"syn keyword openscadFunctionDef function
syn keyword openscadFunctionDef function nextgroup=openscadFunction skipwhite skipempty
syn match openscadFunction /\<\h\w*\>/ contained display

"syn keyword openscadModuleDef module
syn keyword openscadModuleDef module nextgroup=openscadModule skipwhite skipempty
syn match openscadModule /\<\h\w*\>/ contained display

syn keyword openscadStatement echo assign let assert
syn keyword openscadConditional if else
syn keyword openscadRepeat for intersection_for
syn keyword openscadInclude include use
syn keyword openscadCsgKeyword union difference intersection render intersection_for
syn keyword openscadTransform scale rotate translate mirror multmatrix color minkowski hull projection linear_extrude rotate_extrude offset
syn keyword openscadPrimitiveSolid cube sphere cylinder polyhedron surface
syn keyword openscadPrimitive2D square circle polygon import_dxf text
syn keyword openscadPrimitiveImport import child children 

" BOSL2 version: 802059f2cbf38be3c20127bee59d66f93e0302e5
syn keyword openscadBosl2affine affine2d_identity affine2d_mirror affine2d_scale affine2d_skew affine2d_translate affine2d_zrot affine3d_identity affine3d_mirror affine3d_rot_by_axis affine3d_rot_from_to affine3d_scale affine3d_skew affine3d_skew_xy affine3d_skew_xz affine3d_skew_yz affine3d_translate affine3d_xrot affine3d_yrot affine3d_zrot
syn keyword openscadBosl2attachments align anchor_arrow anchor_arrow2d attach attachable attach_geom conv_hull corner_mask corner_profile default_tag diff edge_mask edge_profile edge_profile_asym expose_anchors face_mask face_profile force_tag frame_ref generic_airplane hide hide_this intersect named_anchor orient position reorient show_all show_anchors show_int show_only show_transform_list tag tag_conv_hull tag_diff tag_intersect tag_scope tag_this
syn keyword openscadBosl2ball_bearings ball_bearing ball_bearing_info
syn keyword openscadBosl2beziers bez_begin bez_end bezier_closest_point bezier_curvature bezier_curve bezier_derivative bezier_length bezier_line_intersection bezier_patch_flat bezier_patch_normals bezier_patch_points bezier_patch_reverse bezier_points bezier_sheet bezier_tangent bezier_vnf bezier_vnf_degenerate_patch bez_joint bezpath_closest_point bezpath_close_to_axis bezpath_curve bezpath_length bezpath_offset bezpath_points bez_tang debug_bezier debug_bezier_patches is_bezier_patch path_to_bezpath
syn keyword openscadBosl2bosl1compat backcube chamfcube chamf_cyl chamferred_cylinder cube2pt downcube filleted_cylinder fwdcube grid_of leftcube offsetcube prism pyramid rcube rcylinder rightcube rrect spread thinning_brace translate_copies trapezoid upcube xring xspread yring yspread zring zspread
syn keyword openscadBosl2bottlecaps bottle_adapter_cap_to_cap bottle_adapter_neck_to_cap bottle_adapter_neck_to_neck generic_bottle_cap generic_bottle_neck pco1810_cap pco1810_neck pco1881_cap pco1881_neck sp_cap sp_diameter sp_neck
syn keyword openscadBosl2color color_overlaps color_this hsl hsv rainbow recolor
syn keyword openscadBosl2comparisons all_equal all_negative all_nonnegative all_nonpositive all_nonzero all_positive all_zero approx are_ends_equal cleanup_path close_path compare_lists compare_vals deduplicate deduplicate_indexed find_approx group_data group_sort is_decreasing is_increasing list_smallest list_unwrap list_wrap max_index min_index sort sortidx unique unique_count
syn keyword openscadBosl2coords altaz_to_xyz cylindrical_to_xyz lift_plane path2d path3d path4d point2d point3d point4d polar_to_xy project_plane spherical_to_xyz xy_to_polar xyz_to_altaz xyz_to_cylindrical xyz_to_spherical
syn keyword openscadBosl2cubetruss cubetruss cubetruss_clip cubetruss_corner cubetruss_dist cubetruss_foot cubetruss_joiner cubetruss_segment cubetruss_support cubetruss_uclip
syn keyword openscadBosl2distributors arc_copies arc_of distribute grid2d grid_copies line_copies line_of mirror_copy move_copies ovoid_spread path_copies path_spread rot_copies sphere_copies xcopies xdistribute xflip_copy xrot_copies ycopies ydistribute yflip_copy yrot_copies zcopies zdistribute zflip_copy zrot_copies
syn keyword openscadBosl2drawing arc catenary dashed_stroke debug_polygon helix stroke turtle
syn keyword openscadBosl2fnliterals accumulate binsearch f_1arg f_2arg f_2arg_simple f_3arg f_abs f_acos f_add f_and f_approx f_asin f_atan f_atan2 f_ceil f_chr f_cmp f_cos f_cross f_div f_eq f_even f_exp f_floor f_gt f_gte filter find_all find_first f_is_bool f_is_def f_is_finite f_is_function f_is_int f_is_list f_is_nan f_is_num f_is_patch f_is_path f_is_range f_is_region f_is_string f_is_undef f_is_vector f_is_vnf f_len f_ln f_log f_lt f_lte f_max f_max2 f_max3 f_min f_min2 f_min3 f_mod f_mul f_nand f_napprox f_neg f_neq f_nor f_norm f_not f_odd f_or f_ord for_n f_pow f_round f_sign f_sin f_sqr f_sqrt f_str f_str2 f_str3 f_sub f_tan f_xor hashmap ival map reduce simple_hash while xval
syn keyword openscadBosl2gears auto_profile_shift bevel_gear bevel_pitch_angle circular_pitch crown_gear diametral_pitch enveloping_worm gear_dist gear_dist_skew gear_shorten gear_shorten_skew gear_skew_angle get_profile_shift module_value outer_radius pitch_radius planetary_gears rack rack2d ring_gear ring_gear2d spur_gear spur_gear2d worm worm_dist worm_gear worm_gear_thickness
syn keyword openscadBosl2geometry align_polygon are_points_on_plane are_polygons_equal ccw_polygon centroid circle_2tangents circle_3points circle_circle_intersection circle_circle_tangents circle_line_intersection circle_point_tangents clockwise_polygon convex_collision convex_distance hull hull2d_path hull3d_faces hull_points is_collinear is_coplanar is_point_on_line is_polygon_clockwise is_polygon_convex line_closest_point line_from_points line_intersection line_normal plane3pt plane3pt_indexed plane_closest_point plane_from_normal plane_from_points plane_from_polygon plane_intersection plane_line_angle plane_line_intersection plane_normal plane_offset point_in_polygon point_line_distance point_plane_distance polygon_area polygon_line_intersection polygon_normal polygon_triangulate reindex_polygon reverse_polygon rot_decode segment_distance sphere_line_intersection
syn keyword openscadBosl2hinges apply_folding_hinges_and_snaps folding_hinge_mask knuckle_hinge living_hinge_mask snap_lock snap_socket
syn keyword openscadBosl2joiners dovetail half_joiner half_joiner2 half_joiner_clear hirth joiner joiner_clear rabbit_clip snap_pin snap_pin_socket
syn keyword openscadBosl2linalg back_substitute block_matrix cholesky column det2 det3 det4 determinant diagonal_matrix echo_matrix hstack ident is_matrix is_matrix_symmetric is_rotation linear_solve linear_solve3 matrix_inverse matrix_trace norm_fro null_space outer_product qr_factor rot_inverse submatrix submatrix_set transpose
syn keyword openscadBosl2linear_bearings linear_bearing linear_bearing_housing lmXuu_bearing lmXuu_housing lmXuu_info
syn keyword openscadBosl2lists bselect combinations flatten force_list full_flatten idx in_list is_homogeneous is_homogenous last list list_bset list_head list_insert list_pad list_remove list_remove_values list_rotate list_set list_shape list_tail list_to_matrix max_length min_length pair permutations repeat repeat_entries reverse select set_difference set_intersection set_union shuffle slice triplet
syn keyword openscadBosl2masks2d mask2d_chamfer mask2d_cove mask2d_dovetail mask2d_ogee mask2d_rabbet mask2d_roundover mask2d_teardrop
syn keyword openscadBosl2masks3d chamfer_corner_mask chamfer_cylinder_mask chamfer_edge_mask rounding_angled_corner_mask rounding_angled_edge_mask rounding_corner_mask rounding_cylinder_mask rounding_edge_mask rounding_hole_mask teardrop_corner_mask teardrop_edge_mask
syn keyword openscadBosl2math acosh asinh atanh binomial binomial_coefficient c_conj c_div c_ident c_imag c_mul c_norm complex constrain convolve cosh count c_real cumprod cumsum deltas deriv deriv2 deriv3 exponential_rands factorial gaussian_rands gcd hypot lcm lerp lerpn log2 mean median modang poly_add poly_div poly_mult polynomial poly_roots posmod product quadratic_roots quant quantdn quantup rand_int random_points random_polygon rational_approx real_roots root_find sinh spherical_random_points sqr sum sum_of_sines tanh
syn keyword openscadBosl2metric_screws generic_screw get_metric_bolt_head_height get_metric_bolt_head_size get_metric_iso_coarse_thread_pitch get_metric_iso_fine_thread_pitch get_metric_iso_superfine_thread_pitch get_metric_jis_thread_pitch get_metric_nut_size get_metric_nut_thickness get_metric_socket_cap_diam get_metric_socket_cap_height get_metric_socket_cap_socket_depth get_metric_socket_cap_socket_size metric_bolt metric_nut
syn keyword openscadBosl2miscellaneous bounding_box chain_hull cylindrical_extrude extrude_from_to minkowski_difference offset3d path_extrude path_extrude2d round3d
syn keyword openscadBosl2modular_hose modular_hose modular_hose_radius
syn keyword openscadBosl2nema_steppers nema_motor_info nema_mount_mask nema_stepper_motor
syn keyword openscadBosl2nurbs bspline_pt_recurse debug_nurbs is_nurbs_patch nurbs_curve nurbs_patch_points nurbs_vnf
syn keyword openscadBosl2partitions back_half bottom_half front_half half_of left_half partition partition_cut_mask partition_mask right_half top_half
syn keyword openscadBosl2paths force_path is_1region is_path is_path_simple path_closest_point path_curvature path_cut path_cut_points path_cut_points_recurse path_length path_length_fractions path_merge_collinear path_normals path_segment_lengths path_tangents path_torsion polygon_parts resample_path split_path_at_self_crossings subdivide_path
syn keyword openscadBosl2polyhedra regular_polyhedron regular_polyhedron_info
syn keyword openscadBosl2regions are_regions_equal debug_region difference exclusive_or force_region hull_region intersection is_region is_region_simple is_valid_region make_region offset point_in_region region region_area region_parts split_region_at_region_crossings union
syn keyword openscadBosl2rounding angle_between_lines bent_cutout_mask convex_offset_extrude join_prism offset_stroke offset_sweep os_chamfer os_circle os_flat os_mask os_pointed os_profile os_round os_smooth os_teardrop path_join round_corners rounded_prism smooth_path
syn keyword openscadBosl2screw_drive hex_drive_mask phillips_depth phillips_diam phillips_mask robertson_mask torx_depth torx_diam torx_info torx_mask torx_mask2d
syn keyword openscadBosl2screws nut nut_info nut_trap_inline nut_trap_side screw screw_head screw_hole screw_info shoulder_screw thread_specification
syn keyword openscadBosl2shapes2d circle egg ellipse glued_circles hexagon jittered_poly keyhole octagon pentagon rect regular_ngon reuleaux_polygon right_triangle ring round2d shell2d square star supershape teardrop2d text trapezoid
syn keyword openscadBosl2shapes3d cube cuboid cyl cylinder cylindrical_heightfield fillet heightfield interior_fillet octahedron onion path_text pie_slice prismoid rect_tube regular_prism ruler sphere spheroid teardrop text3d torus tube wedge xcyl ycyl zcyl
syn keyword openscadBosl2skin associate_vertices linear_sweep path_sweep path_sweep2d rotate_sweep rot_resample skin slice_profiles spiral_sweep subdivide_and_slice sweep sweep_attach texture
syn keyword openscadBosl2sliders rail slider
syn keyword openscadBosl2strings downcase ends_with format format_fixed format_float format_int is_digit is_hexdigit is_letter is_lower is_upper parse_float parse_frac parse_int parse_num rand_str starts_with str_find str_join str_pad str_replace_char str_split str_strip substr substr_match suffix upcase
syn keyword openscadBosl2structs echo_struct is_struct struct_keys struct_remove struct_set struct_val
syn keyword openscadBosl2threading acme_threaded_nut acme_threaded_rod ball_screw_rod buttress_threaded_nut buttress_threaded_rod generic_threaded_nut generic_threaded_rod npt_threaded_rod square_threaded_nut square_threaded_rod threaded_nut threaded_rod thread_helix trapezoidal_threaded_nut trapezoidal_threaded_rod
syn keyword openscadBosl2transforms apply back down frame_map fwd is_2d_transform left mirror move right rot scale skew tilt translate up xflip xmove xrot xscale yflip ymove yrot yscale zflip zmove zrot zscale
syn keyword openscadBosl2trigonometry adj_ang_to_hyp adj_ang_to_opp adj_hyp_to_ang adj_hyp_to_opp adj_opp_to_ang adj_opp_to_hyp ang_adj_to_hyp ang_adj_to_opp ang_hyp_to_adj ang_hyp_to_opp ang_opp_to_adj ang_opp_to_hyp hyp_adj_to_ang hyp_adj_to_opp hyp_ang_to_adj hyp_ang_to_opp hyp_opp_to_adj hyp_opp_to_ang law_of_cosines law_of_sines opp_adj_to_ang opp_adj_to_hyp opp_ang_to_adj opp_ang_to_hyp opp_hyp_to_adj opp_hyp_to_ang
syn keyword openscadBosl2tripod_mounts manfrotto_rc2_plate
syn keyword openscadBosl2turtle3d turtle3d
syn keyword openscadBosl2utility all all_defined all_integer any any_defined assert_approx assert_equal default deprecate first_defined get_anchor get_radius is_bool_list is_consistent is_def is_finite is_func is_int is_integer is_nan is_range is_str is_type loop_done looping loop_while no_children no_function no_module num_defined num_true one_defined req_children same_shape scalar_vec3 segs shape_compare typeof u_add u_div u_mul u_sub valid_range
syn keyword openscadBosl2vectors add_scalar closest_point furthest_point is_vector pointlist_bounds unit v_abs v_ceil v_div vector_angle vector_axis vector_bisect vector_nearest vector_search vector_search_tree v_floor v_lookup v_mul v_theta
syn keyword openscadBosl2version bosl_required bosl_version bosl_version_num bosl_version_str version_cmp version_to_list version_to_num version_to_str
syn keyword openscadBosl2vnf debug_vnf is_vnf is_vnf_list projection vnf_area vnf_bend vnf_boundary vnf_drop_unused_points vnf_faces vnf_from_polygons vnf_from_region vnf_halfspace vnf_hull vnf_join vnf_merge_points vnf_polyhedron vnf_quantize vnf_reverse_faces vnf_sheet vnf_slice vnf_small_offset vnf_triangulate vnf_tri_array vnf_unify_faces vnf_validate vnf_vertex_array vnf_vertices vnf_volume vnf_wireframe
syn keyword openscadBosl2walls corrugated_wall hex_panel narrowing_strut sparse_cuboid sparse_wall sparse_wall2d thinning_triangle thinning_wall
syn keyword openscadBosl2wiring wire_bundle
syn keyword openscadBosl2constants INCH RIGHT FRONT FWD FORWARD BOT DOWN TOP UP CENTER CTR CENTRE SEGMENT RAY LINE



syn match openscadSpecialVariable "\$[a-zA-Z0-9_]\+\>" display
syn match openscadModifier "^\s*[\*\!\#\%]" display

syn match openscadNumbers "\<\d\|\.\d" contains=openscadNumber display transparent
syn match openscadNumber "\d\+" display contained 
syn match openscadNumber "\.\d\+" display contained 

syn region openscadString start=/"/ skip=/\\"/ end=/"/

syn keyword openscadBoolean true false

syn keyword openscadCommentTodo TODO FIXME XXX contained display
syn match openscadInlineComment ://.*$: contains=openscadCommentTodo
syn region openscadBlockComment start=:/\*: end=:\*/: fold contains=openscadCommentTodo

syn region openscadBlock start="{" end="}" transparent fold
syn region openscadVector start="\[" end="\]" transparent fold

syn keyword openscadBuiltin abs acos asin atan atan2 ceil cos exp floor ln log
syn keyword openscadBuiltin lookup max min pow rands round sign sin sqrt tan
syn keyword openscadBuiltin str len search version version_num concat chr
syn keyword openscadBuiltin dxf_cross dxf_dim

hi def link openscadFunctionDef			Structure
hi def link openscadFunction			Function
hi def link openscadModuleDef			Structure
hi def link openscadModule			    Function
hi def link openscadBlockComment		Comment
hi def link openscadBoolean			    Boolean
hi def link openscadBuiltin			    Function
hi def link openscadConditional			Conditional
hi def link openscadCsgKeyword			Structure
hi def link openscadInclude			    Include
hi def link openscadInlineComment	    Comment
hi def link openscadModifier			Special
hi def link openscadStatement			Statement
hi def link openscadNumbers			    Number
hi def link openscadNumber			    Number
hi def link openscadPrimitiveSolid		Keyword
hi def link openscadPrimitive2D 		Keyword
hi def link openscadPrimitiveImport 	Keyword
hi def link openscadRepeat			    Repeat
hi def link openscadSpecialVariable		Special
hi def link openscadString			    String
hi def link openscadTransform			Statement
hi def link openscadCommentTodo			Todo

hi def link openscadBosl2affine        Keyword
hi def link openscadBosl2attachments        Keyword
hi def link openscadBosl2ball_bearings        Keyword
hi def link openscadBosl2beziers        Keyword
hi def link openscadBosl2bosl1compat        Keyword
hi def link openscadBosl2bottlecaps        Keyword
hi def link openscadBosl2color        Keyword
hi def link openscadBosl2comparisons        Keyword
hi def link openscadBosl2coords        Keyword
hi def link openscadBosl2cubetruss        Keyword
hi def link openscadBosl2distributors        Keyword
hi def link openscadBosl2drawing        Keyword
hi def link openscadBosl2fnliterals        Keyword
hi def link openscadBosl2gears        Keyword
hi def link openscadBosl2geometry        Keyword
hi def link openscadBosl2hinges        Keyword
hi def link openscadBosl2joiners        Keyword
hi def link openscadBosl2linalg        Keyword
hi def link openscadBosl2linear_bearings        Keyword
hi def link openscadBosl2lists        Keyword
hi def link openscadBosl2masks2d        Keyword
hi def link openscadBosl2masks3d        Keyword
hi def link openscadBosl2math        Keyword
hi def link openscadBosl2metric_screws        Keyword
hi def link openscadBosl2miscellaneous        Keyword
hi def link openscadBosl2modular_hose        Keyword
hi def link openscadBosl2nema_steppers        Keyword
hi def link openscadBosl2nurbs        Keyword
hi def link openscadBosl2partitions        Keyword
hi def link openscadBosl2paths        Keyword
hi def link openscadBosl2polyhedra        Keyword
hi def link openscadBosl2regions        Keyword
hi def link openscadBosl2rounding        Keyword
hi def link openscadBosl2screw_drive        Keyword
hi def link openscadBosl2screws        Keyword
hi def link openscadBosl2shapes2d        Keyword
hi def link openscadBosl2shapes3d        Keyword
hi def link openscadBosl2skin        Keyword
hi def link openscadBosl2sliders        Keyword
hi def link openscadBosl2strings        Keyword
hi def link openscadBosl2structs        Keyword
hi def link openscadBosl2threading        Keyword
hi def link openscadBosl2transforms        Keyword
hi def link openscadBosl2trigonometry        Keyword
hi def link openscadBosl2tripod_mounts        Keyword
hi def link openscadBosl2turtle3d        Keyword
hi def link openscadBosl2utility        Keyword
hi def link openscadBosl2vectors        Keyword
hi def link openscadBosl2version        Keyword
hi def link openscadBosl2vnf        Keyword
hi def link openscadBosl2walls        Keyword
hi def link openscadBosl2wiring        Keyword
hi def link openscadBosl2constants        Special

" Blatantly stolen from vim74\syntax\c.vim
"when wanted, highlight trailing white space
if exists("openscad_space_errors")
  if !exists("openscad_no_trail_space_error")
    syn match	openscadSpaceError	display excludenl "\s\+$"
  endif
  if !exists("openscad_no_tab_space_error")
    syn match	openscadSpaceError	display " \+\t"me=e-1
  endif
endif

let b:current_syntax = "openscad"

" vim: expandtab tabstop=4 shiftwidth=4 softtabstop=4 nowrap

