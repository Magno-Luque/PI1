; HEADER_BLOCK_START
; BambuStudio 01.08.04.51
; model printing time: 57m 34s; total estimated time: 1h 3m 21s
; total layer number: 89
; model label id: 164
; filament_density: 1.26
; filament_diameter: 1.75
; max_z_height: 15.13
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 70
; auxiliary_fan = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0
; change_filament_gcode = M620 S[next_extruder]A\nM204 S9000\n{if toolchange_count > 1 && (z_hop_types[current_extruder] == 0 || z_hop_types[current_extruder] == 3)}\nG17\nG2 Z{z_after_toolchange + 0.4} I0.86 J0.86 P1 F10000 ; spiral lift a little from second lift\n{endif}\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\n\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\n\n{if next_extruder < 255}\nM400\n\nG92 E0\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == "PETG"}\nM109 S220\n{else}\nM109 S[nozzle_temperature_range_high]\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\n{if (flush_length_2 > 1) && (filament_type[next_extruder]=="PLA-CF" || filament_type[next_extruder]=="PETG")}\nM106 P1 S255\nM400 S3\nM106 P1 S0\nG1 X80 F15000\nG1 X60 F15000\nG1 X80 F15000\nG1 X60 F15000; shake to put down garbage\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y245 F21000\nG1 X65 \nG1 Y265 F3000\n{endif}\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\n{if (flush_length_3 > 1) && (filament_type[next_extruder]=="PLA-CF" || filament_type[next_extruder]=="PETG")}\nM106 P1 S255\nM400 S3\nM106 P1 S0\nG1 X80 F15000\nG1 X60 F15000\nG1 X80 F15000\nG1 X60 F15000; shake to put down garbage\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y245 F21000\nG1 X65 \nG1 Y265 F3000\n{endif}\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\n{if (flush_length_4 > 1) && (filament_type[next_extruder]=="PLA-CF" || filament_type[next_extruder]=="PETG")}\nM106 P1 S255\nM400 S3\nM106 P1 S0\nG1 X80 F15000\nG1 X60 F15000\nG1 X80 F15000\nG1 X60 F15000; shake to put down garbage\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y245 F21000\nG1 X65 \nG1 Y265 F3000\n{endif}\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\nG1 X80 F15000\nG1 X60 F15000\nG1 X80 F15000\nG1 X60 F15000; shake to put down garbage\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
; close_fan_the_first_x_layers = 1
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
; curr_bed_type = High Temp Plate
; default_acceleration = 10000
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL X1"
; default_jerk = 0
; default_print_profile = 0.20mm Standard @BBL P1P
; deretraction_speed = 30
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; different_settings_to_system = initial_layer_print_height;layer_height;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0.15
; enable_arc_fitting = 1
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pressure_advance = 0
; enable_prime_tower = 0
; enable_support = 0
; enforce_support_layers = 0
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
; ensure_vertical_shell_thickness = 1
; exclude_object = 1
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 36
; extruder_clearance_max_radius = 68
; extruder_clearance_radius = 57
; extruder_colour = #018001
; extruder_offset = 0x2
; extruder_type = DirectDrive
; fan_cooling_layer_time = 80
; fan_max_speed = 100
; fan_min_speed = 50
; filament_colour = #00AE42
; filament_cost = 24.99
; filament_density = 1.26
; filament_diameter = 1.75
; filament_end_gcode = "; filament end gcode \nM106 P3 S0\n"
; filament_flow_ratio = 0.98
; filament_ids = GFA00
; filament_is_support = 0
; filament_max_volumetric_speed = 21
; filament_minimal_purge_on_wipe_tower = 15
; filament_settings_id = "Bambu PLA Basic @BBL P1P"
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA
; filament_vendor = "Bambu Lab"
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; head_wrap_detect_zone = 
; host_type = octoprint
; hot_plate_temp = 65
; hot_plate_temp_initial_layer = 65
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_jerk = 9
; infill_wall_overlap = 15%
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.17
; initial_layer_speed = 50
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_flow = 10%
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 E-[retraction_length] F1800\nG17\nG2 Z{layer_z + 0.4} I0.86 J0.86 P1 F20000 ; spiral lift a little\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 E[retraction_length] F300\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.17
; line_width = 0.42
; machine_end_gcode = ;===== date: 20230428 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of "timelapse_record_flag"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X128 Y250 F3600\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n
; machine_load_filament_time = 29
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,200
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_start_gcode = ;===== machine: P1P ========================\n;===== date: 20230707 =====================\n;===== turn on the HB fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\n;===== reset machine status =================\nG91\nM17 Z0.4 ; lower the z-motor current\nG380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed\nG380 S2 Z-25 F300 ;\nG1 Z5 F300;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\nM204 S10000 ; init ACC set to 10m/s^2\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action : 2\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {elsif (bed_temperature[initial_extruder] >50)||(bed_temperature_initial_layer[initial_extruder] >50)}\n    M106 P3 S255\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_extruder]A\nM620.1 E F{filament_max_volumetric_speed[initial_extruder]/2.4053*60} T{nozzle_temperature_range_high[initial_extruder]}\n\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X230 Y15\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {elsif (bed_temperature[initial_extruder] >50)||(bed_temperature_initial_layer[initial_extruder] >50)}\n    M106 P3 S255\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== fmech mode fast check============================\n\n\n;===== noozle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature_initial_layer[initial_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X18 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression
; machine_unload_filament_time = 28
; max_bridge_length = 10
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; nozzle_diameter = 0.4
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
; nozzle_type = stainless_steel
; nozzle_volume = 107
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
; post_process = 
; pressure_advance = 0.02
; prime_tower_brim_width = 3
; prime_tower_width = 35
; prime_volume = 45
; print_compatible_printers = "Bambu Lab P1P 0.4 nozzle"
; print_flow_ratio = 1
; print_host = 
; print_host_webui = 
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL P1P
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_model = Bambu Lab P1P
; printer_settings_id = Bambu Lab P1P 0.4 nozzle
; printer_structure = corexy
; printer_technology = FFF
; printer_variant = 0.4
; printhost_apikey = 
; printhost_authorization_type = key
; printhost_cafile = 
; printhost_password = 
; printhost_port = 
; printhost_ssl_ignore_revoke = 0
; printhost_user = 
; printing_by_object_gcode = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = 2
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; scan_first_layer = 0
; seam_gap = 15%
; seam_position = aligned
; silent_mode = 0
; single_extruder_multi_material = 1
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 8
; slow_down_min_speed = 20
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; solid_infill_filament = 1
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = normal(auto)
; temperature_vitrification = 45
; template_custom_gcode = 
; textured_plate_temp = 65
; textured_plate_temp_initial_layer = 65
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = 
; timelapse_type = 0
; top_area_threshold = 100%
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; travel_jerk = 9
; travel_speed = 500
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_distance = 5
; tree_support_brim_width = 0
; tree_support_wall_count = 0
; upward_compatible_machine = "Bambu Lab P1S 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; wall_distribution_count = 1
; wall_filament = 1
; wall_generator = classic
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 165
; wipe_tower_y = 250
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R63
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: P1P ========================
;===== date: 20230707 =====================
;===== turn on the HB fan =================
M104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle
;===== reset machine status =================
G91
M17 Z0.4 ; lower the z-motor current
G380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed
G380 S2 Z-25 F300 ;
G1 Z5 F300;
G90
M17 X1.2 Y1.2 Z0.75 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 5
M221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem
G29.1 Z0 ; clear z-trim value first
M204 S10000 ; init ACC set to 10m/s^2

;===== heatbed preheat ====================
M1002 gcode_claim_action : 2
M140 S65 ;set bed temp
M190 S65 ;wait for bed temp



;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S220 ;set extruder temp
G91
G0 Z10 F1200
G90
G28 X
M975 S1 ; turn on
M73 P6 R59
G1 X60 F12000
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
M73 P6 R58
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
    G1 X54 F12000
    G1 Y265
    M400
M621 S0A
M620.1 E F523.843 T240


M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
G1 E50 F200
M400
M104 S220
G92 E0
G1 E50 F200
M400
M106 P1 S255
G92 E0
M73 P7 R58
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

G1 X70 F9000
G1 X76 F15000
G1 X65 F15000
G1 X76 F15000
G1 X65 F15000; shake to put down garbage
G1 X80 F6000
G1 X95 F15000
G1 X80 F15000
G1 X165 F15000; wipe and shake
M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1
M106 S255
G1 X65 Y230 F18000
G1 Y264 F6000
M109 S200
G1 X100 F18000 ; first wipe mouth

G0 X135 Y253 F20000  ; move to exposed steel surface edge
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
G0 Z5 F20000

G1 X60 Y265
G92 E0
G1 E-0.5 F300 ; retrack more
G1 X100 F5000; second wipe mouth
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X90 F5000
G0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle
M104 S140 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)

M221 S; push soft endstop status
M221 Z0 ;turn off Z axis endstop
G0 Z0.5 F20000
G0 X125 Y259.5 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 X128
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300

M109 S140 ; wait nozzle temp down to heatbed acceptable
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
M73 P8 R58
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000

M221 R; pop softend status
G1 Z10 F1200
M400
G1 Z10
G1 F30000
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X69.1938 Y56.3938 I100.003 J135
    M400
    M500 ; save cali data

M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623
;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression


;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead


M104 S220 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q1 A7 B30 C80  H15 K0
M974 Q1 S2 P0

G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q0 A7 B30 C90 Q0 H15 K0
M974 Q0 S2 P0

M975 S1
G1 F30000
G1 X230 Y15
G28 X ; re-home XY
;===== fmech mode fast check============================


;===== noozle load line ===============================
M975 S1
G90
M83
T1000
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S220
G1 Z0.2
G0 E2 F300
G0 X240 E15 F6033.27
G0 Y11 E0.700 F1508.32
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X18 E15 F6033.27
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=High Temp Plate

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
G21
M83 ; use relative distances for extrusion
; filament start gcode
M106 P3 S200


M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.17
; LAYER_HEIGHT: 0.17
G1 E-.8 F1800
; layer num/total_layer_count: 1/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S500
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G1 X103.53 Y147.177 F30000
G1 Z.4
G1 Z.17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X103.362 Y146.986 E.00817
G1 X103.071 Y146.819 E.01076
G1 X102.702 Y146.737 E.01213
G1 X102.569 Y146.768 E.00438
G1 X93.932 Y146.738 E.27731
M73 P8 R57
G1 X81.311 Y146.67 E.40518
G1 X71.027 Y146.569 E.33021
G1 X71.027 Y56.213 E2.90088
G1 X74.766 Y56.153 E.12008
G1 X125.83 Y55.948 E1.63942
G1 X167.72 Y55.868 E1.3449
G1 X167.72 Y187.928 E4.23981
G1 X110.548 Y187.792 E1.83554
G1 X103.721 Y147.687 E1.30609
G1 X103.705 Y147.509 E.00574
G2 X103.569 Y147.223 I-1.095 J.344 E.01021
G1 X103.173 Y147.473 F30000
; FEATURE: Outer wall
G1 F3000
G2 X102.621 Y147.231 I-.46 J.298 E.0205
G1 X81.308 Y147.134 E.68428
G1 X70.563 Y147.028 E.34497
G1 X70.563 Y55.757 E2.93025
G1 X74.762 Y55.689 E.13481
G1 X125.829 Y55.485 E1.63954
G1 X168.182 Y55.405 E1.35978
G1 X168.184 Y188.344 E4.26803
G3 X168.148 Y188.393 I-.044 J.005 E.00215
G1 X110.156 Y188.254 E1.86183
G1 X103.261 Y147.748 E1.31918
G2 X103.203 Y147.525 I-.547 J.024 E.00742
; WIPE_START
G1 F24000
G1 X103.065 Y147.35 E-.08486
G1 X102.901 Y147.256 E-.0716
G1 X102.704 Y147.212 E-.07691
G1 X102.621 Y147.231 E-.03225
G1 X101.32 Y147.225 E-.49438
; WIPE_END
G1 E-.04 F1800
G1 X105.836 Y141.072 Z.57 F30000
G1 X167.535 Y56.993 Z.57
G1 Z.17
M73 P9 R57
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.500837
G1 F6300
G1 X166.806 Y56.264 E.03315
G1 X166.151 Y56.265 E.02108
G1 X167.326 Y57.441 E.05347
G1 X167.326 Y58.097 E.02112
G1 X165.495 Y56.266 E.08329
G1 X164.84 Y56.268 E.02108
G1 X167.326 Y58.754 E.1131
G1 X167.326 Y59.411 E.02112
G1 X164.184 Y56.269 E.14291
G1 X163.529 Y56.27 E.02108
G1 X167.326 Y60.068 E.17273
G1 X167.326 Y60.724 E.02112
G1 X162.873 Y56.271 E.20254
G1 X162.218 Y56.273 E.02108
G1 X167.326 Y61.381 E.23235
G1 X167.326 Y62.038 E.02112
G1 X161.563 Y56.274 E.26217
G1 X160.907 Y56.275 E.02108
G1 X167.326 Y62.694 E.29198
G1 X167.326 Y63.351 E.02112
G1 X160.252 Y56.276 E.32179
G1 X159.596 Y56.278 E.02108
G1 X167.326 Y64.008 E.35161
G1 X167.326 Y64.664 E.02112
G1 X158.941 Y56.279 E.38142
G1 X158.285 Y56.28 E.02108
G1 X167.326 Y65.321 E.41123
G1 X167.326 Y65.978 E.02112
G1 X157.63 Y56.281 E.44105
G1 X156.974 Y56.283 E.02108
G1 X167.326 Y66.635 E.47086
G1 X167.326 Y67.291 E.02112
G1 X156.319 Y56.284 E.50067
G1 X155.664 Y56.285 E.02108
G1 X167.326 Y67.948 E.53049
G1 X167.326 Y68.605 E.02112
G1 X155.008 Y56.286 E.5603
G1 X154.353 Y56.288 E.02108
G1 X167.326 Y69.261 E.59011
G1 X167.326 Y69.918 E.02112
G1 X153.697 Y56.289 E.61993
G1 X153.042 Y56.29 E.02108
G1 X167.326 Y70.575 E.64974
G1 X167.326 Y71.231 E.02112
G1 X152.386 Y56.291 E.67955
G1 X151.731 Y56.293 E.02108
G1 X167.326 Y71.888 E.70937
G1 X167.326 Y72.545 E.02112
G1 X151.075 Y56.294 E.73918
G1 X150.42 Y56.295 E.02108
G1 X167.326 Y73.202 E.76899
G1 X167.326 Y73.858 E.02112
G1 X149.765 Y56.296 E.79881
G1 X149.109 Y56.298 E.02108
G1 X167.326 Y74.515 E.82862
G1 X167.326 Y75.172 E.02112
G1 X148.454 Y56.299 E.85843
G1 X147.798 Y56.3 E.02108
G1 X167.326 Y75.828 E.88825
G1 X167.326 Y76.485 E.02112
G1 X147.143 Y56.302 E.91806
G1 X146.487 Y56.303 E.02108
G1 X167.326 Y77.142 E.94787
G1 X167.326 Y77.798 E.02112
G1 X145.832 Y56.304 E.97769
G1 X145.176 Y56.305 E.02108
G1 X167.326 Y78.455 E1.0075
G1 X167.326 Y79.112 E.02112
G1 X144.521 Y56.307 E1.03731
G1 X143.866 Y56.308 E.02108
G1 X167.326 Y79.768 E1.06713
G1 X167.326 Y80.425 E.02112
G1 X143.21 Y56.309 E1.09694
G1 X142.555 Y56.31 E.02108
G1 X167.326 Y81.082 E1.12675
G1 X167.326 Y81.739 E.02112
G1 X141.899 Y56.312 E1.15656
G1 X141.244 Y56.313 E.02108
G1 X167.326 Y82.395 E1.18638
G1 X167.326 Y83.052 E.02112
G1 X140.588 Y56.314 E1.21619
G1 X139.933 Y56.315 E.02108
G1 X167.326 Y83.709 E1.246
G1 X167.326 Y84.365 E.02112
G1 X139.277 Y56.317 E1.27582
G1 X138.622 Y56.318 E.02108
G1 X167.326 Y85.022 E1.30563
G1 X167.326 Y85.679 E.02112
G1 X137.967 Y56.319 E1.33544
G1 X137.311 Y56.32 E.02108
G1 X167.326 Y86.335 E1.36526
G1 X167.326 Y86.992 E.02112
G1 X136.656 Y56.322 E1.39507
G1 X136 Y56.323 E.02108
G1 X167.326 Y87.649 E1.42488
G1 X167.326 Y88.306 E.02112
G1 X135.345 Y56.324 E1.4547
G1 X134.689 Y56.325 E.02108
G1 X167.326 Y88.962 E1.48451
G1 X167.326 Y89.619 E.02112
G1 X134.034 Y56.327 E1.51432
G1 X133.378 Y56.328 E.02108
G1 X167.326 Y90.276 E1.54414
G1 X167.326 Y90.932 E.02112
G1 X132.723 Y56.329 E1.57395
G1 X132.068 Y56.33 E.02108
G1 X167.326 Y91.589 E1.60376
G1 X167.326 Y92.246 E.02112
G1 X131.412 Y56.332 E1.63358
G1 X130.757 Y56.333 E.02108
G1 X167.326 Y92.902 E1.66339
G1 X167.326 Y93.559 E.02112
G1 X130.101 Y56.334 E1.6932
G1 X129.446 Y56.335 E.02108
G1 X167.326 Y94.216 E1.72302
G1 X167.326 Y94.873 E.02112
G1 X128.79 Y56.337 E1.75283
G1 X128.135 Y56.338 E.02108
G1 X167.326 Y95.529 E1.78264
G1 X167.326 Y96.186 E.02112
G1 X127.479 Y56.339 E1.81246
G1 X126.824 Y56.34 E.02108
G1 X167.326 Y96.843 E1.84227
G1 X167.326 Y97.499 E.02112
G1 X126.169 Y56.342 E1.87208
M73 P10 R57
G2 X125.514 Y56.344 I.131 J156.459 E.02106
G1 X167.326 Y98.156 E1.90187
G1 X167.326 Y98.813 E.02112
G1 X124.86 Y56.346 E1.93162
G1 X124.206 Y56.349 E.02104
G1 X167.326 Y99.469 E1.96137
M73 P10 R56
G1 X167.326 Y100.126 E.02112
G1 X123.552 Y56.351 E1.99112
G1 X122.897 Y56.354 E.02104
G1 X167.326 Y100.783 E2.02087
G1 X167.326 Y101.439 E.02112
G1 X122.243 Y56.357 E2.05062
G1 X121.589 Y56.359 E.02104
G1 X167.326 Y102.096 E2.08037
G1 X167.326 Y102.753 E.02112
G1 X120.935 Y56.362 E2.11012
G1 X120.281 Y56.364 E.02104
G1 X167.326 Y103.41 E2.13988
G1 X167.326 Y104.066 E.02112
G1 X119.627 Y56.367 E2.16963
G1 X118.973 Y56.37 E.02104
G1 X167.326 Y104.723 E2.19938
G1 X167.326 Y105.38 E.02112
G1 X118.319 Y56.372 E2.22913
G1 X117.665 Y56.375 E.02104
G1 X167.326 Y106.036 E2.25888
G1 X167.326 Y106.693 E.02112
G1 X117.011 Y56.378 E2.28863
G1 X116.357 Y56.38 E.02104
G1 X167.326 Y107.35 E2.31838
G1 X167.326 Y108.006 E.02112
G1 X115.703 Y56.383 E2.34813
G1 X115.049 Y56.385 E.02104
G1 X167.326 Y108.663 E2.37789
G1 X167.326 Y109.32 E.02112
G1 X114.394 Y56.388 E2.40764
G1 X113.74 Y56.391 E.02104
G1 X167.326 Y109.977 E2.43739
G1 X167.326 Y110.633 E.02112
G1 X113.086 Y56.393 E2.46714
G1 X112.432 Y56.396 E.02104
G1 X167.326 Y111.29 E2.49689
G1 X167.326 Y111.947 E.02112
G1 X111.778 Y56.399 E2.52664
G1 X111.124 Y56.401 E.02104
G1 X167.326 Y112.603 E2.55639
G1 X167.326 Y113.26 E.02112
G1 X110.47 Y56.404 E2.58614
G1 X109.816 Y56.406 E.02104
G1 X167.326 Y113.917 E2.61589
G1 X167.326 Y114.573 E.02112
G1 X109.162 Y56.409 E2.64565
G1 X108.508 Y56.412 E.02104
G1 X167.326 Y115.23 E2.6754
G1 X167.326 Y115.887 E.02112
G1 X107.854 Y56.414 E2.70515
G1 X107.2 Y56.417 E.02104
G1 X167.326 Y116.544 E2.7349
G1 X167.326 Y117.2 E.02112
G1 X106.545 Y56.419 E2.76465
G1 X105.891 Y56.422 E.02104
G1 X167.326 Y117.857 E2.7944
G1 X167.326 Y118.514 E.02112
G1 X105.237 Y56.425 E2.82415
G1 X104.583 Y56.427 E.02104
G1 X167.326 Y119.17 E2.8539
G1 X167.326 Y119.827 E.02112
G1 X103.929 Y56.43 E2.88365
G1 X103.275 Y56.433 E.02104
G1 X167.326 Y120.484 E2.91341
G1 X167.326 Y121.14 E.02112
G1 X102.621 Y56.435 E2.94316
G1 X101.967 Y56.438 E.02104
G1 X167.326 Y121.797 E2.97291
G1 X167.326 Y122.454 E.02112
G1 X101.313 Y56.44 E3.00266
G1 X100.659 Y56.443 E.02104
G1 X167.326 Y123.11 E3.03241
G1 X167.326 Y123.767 E.02112
G1 X100.005 Y56.446 E3.06216
G1 X99.351 Y56.448 E.02104
G1 X167.326 Y124.424 E3.09191
G1 X167.326 Y125.081 E.02112
G1 X98.697 Y56.451 E3.12166
G1 X98.042 Y56.454 E.02104
G1 X167.326 Y125.737 E3.15142
G1 X167.326 Y126.394 E.02112
G1 X97.388 Y56.456 E3.18117
G1 X96.734 Y56.459 E.02104
G1 X167.326 Y127.051 E3.21092
G1 X167.326 Y127.707 E.02112
G1 X96.08 Y56.461 E3.24067
G1 X95.426 Y56.464 E.02104
G1 X167.326 Y128.364 E3.27042
G1 X167.326 Y129.021 E.02112
G1 X94.772 Y56.467 E3.30017
G1 X94.118 Y56.469 E.02104
G1 X167.326 Y129.677 E3.32992
G1 X167.326 Y130.334 E.02112
G1 X93.464 Y56.472 E3.35967
M73 P11 R56
G1 X92.81 Y56.474 E.02104
G1 X167.326 Y130.991 E3.38942
G1 X167.326 Y131.648 E.02112
G1 X92.156 Y56.477 E3.41918
G1 X91.502 Y56.48 E.02104
G1 X167.326 Y132.304 E3.44893
G1 X167.326 Y132.961 E.02112
G1 X90.848 Y56.482 E3.47868
G1 X90.194 Y56.485 E.02104
G1 X167.326 Y133.618 E3.50843
G1 X167.326 Y134.274 E.02112
G1 X89.539 Y56.488 E3.53818
G1 X88.885 Y56.49 E.02104
G1 X167.326 Y134.931 E3.56793
G1 X167.326 Y135.588 E.02112
G1 X88.231 Y56.493 E3.59768
G1 X87.577 Y56.495 E.02104
G1 X167.326 Y136.244 E3.62743
G1 X167.326 Y136.901 E.02112
G1 X86.923 Y56.498 E3.65718
G1 X86.269 Y56.501 E.02104
G1 X167.326 Y137.558 E3.68694
G1 X167.326 Y138.215 E.02112
G1 X85.615 Y56.503 E3.71669
G1 X84.961 Y56.506 E.02104
G1 X167.326 Y138.871 E3.74644
G1 X167.326 Y139.528 E.02112
G1 X84.307 Y56.509 E3.77619
G1 X83.653 Y56.511 E.02104
G1 X167.326 Y140.185 E3.80594
G1 X167.326 Y140.841 E.02112
G1 X82.999 Y56.514 E3.83569
G1 X82.345 Y56.516 E.02104
G1 X167.326 Y141.498 E3.86544
G1 X167.326 Y142.155 E.02112
G1 X81.691 Y56.519 E3.89519
G1 X81.036 Y56.522 E.02104
G1 X167.326 Y142.811 E3.92495
G1 X167.326 Y143.468 E.02112
G1 X80.382 Y56.524 E3.9547
G1 X79.728 Y56.527 E.02104
G1 X167.326 Y144.125 E3.98445
G1 X167.326 Y144.781 E.02112
G1 X79.074 Y56.529 E4.0142
M73 P11 R55
G1 X78.42 Y56.532 E.02104
G1 X167.326 Y145.438 E4.04395
G1 X167.326 Y146.095 E.02112
G1 X77.766 Y56.535 E4.0737
G1 X77.112 Y56.537 E.02104
G1 X167.326 Y146.752 E4.10345
G1 X167.326 Y147.408 E.02112
G1 X76.458 Y56.54 E4.1332
G1 X75.804 Y56.543 E.02104
G1 X167.326 Y148.065 E4.16295
G1 X167.326 Y148.722 E.02112
G1 X75.15 Y56.545 E4.19271
G2 X74.499 Y56.551 I-.083 J26.605 E.02093
G1 X167.326 Y149.378 E4.22231
G1 X167.326 Y150.035 E.02112
G1 X73.853 Y56.562 E4.2517
G1 X73.207 Y56.572 E.02079
G1 X167.326 Y150.692 E4.28109
G1 X167.326 Y151.348 E.02112
G1 X72.56 Y56.583 E4.31049
G1 X71.914 Y56.593 E.02079
G1 X167.326 Y152.005 E4.33988
G1 X167.326 Y152.662 E.02112
M73 P12 R55
G1 X71.421 Y56.756 E4.36233
G1 X71.421 Y57.413 E.02112
G1 X167.326 Y153.319 E4.36233
G1 X167.326 Y153.975 E.02112
G1 X71.421 Y58.07 E4.36233
G1 X71.421 Y58.726 E.02112
G1 X167.326 Y154.632 E4.36233
G1 X167.326 Y155.289 E.02112
G1 X71.421 Y59.383 E4.36233
G1 X71.421 Y60.04 E.02112
G1 X167.326 Y155.945 E4.36233
G1 X167.326 Y156.602 E.02112
G1 X71.421 Y60.696 E4.36233
G1 X71.421 Y61.353 E.02112
G1 X167.326 Y157.259 E4.36233
G1 X167.326 Y157.915 E.02112
G1 X71.421 Y62.01 E4.36233
G1 X71.421 Y62.666 E.02112
G1 X167.326 Y158.572 E4.36233
G1 X167.326 Y159.229 E.02112
G1 X71.421 Y63.323 E4.36233
G1 X71.421 Y63.98 E.02112
G1 X167.326 Y159.886 E4.36233
G1 X167.326 Y160.542 E.02112
G1 X71.421 Y64.637 E4.36233
G1 X71.421 Y65.293 E.02112
G1 X167.326 Y161.199 E4.36233
G1 X167.326 Y161.856 E.02112
G1 X71.421 Y65.95 E4.36233
G1 X71.421 Y66.607 E.02112
G1 X167.326 Y162.512 E4.36233
G1 X167.326 Y163.169 E.02112
G1 X71.421 Y67.263 E4.36233
G1 X71.421 Y67.92 E.02112
G1 X167.326 Y163.826 E4.36233
G1 X167.326 Y164.482 E.02112
G1 X71.421 Y68.577 E4.36233
G1 X71.421 Y69.233 E.02112
G1 X167.326 Y165.139 E4.36233
G1 X167.326 Y165.796 E.02112
G1 X71.421 Y69.89 E4.36233
G1 X71.421 Y70.547 E.02112
G1 X167.326 Y166.453 E4.36233
G1 X167.326 Y167.109 E.02112
G1 X71.421 Y71.203 E4.36233
G1 X71.421 Y71.86 E.02112
G1 X167.326 Y167.766 E4.36233
G1 X167.326 Y168.423 E.02112
G1 X71.421 Y72.517 E4.36233
G1 X71.421 Y73.174 E.02112
G1 X167.326 Y169.079 E4.36233
G1 X167.326 Y169.736 E.02112
G1 X71.421 Y73.83 E4.36233
G1 X71.421 Y74.487 E.02112
G1 X167.326 Y170.393 E4.36233
M73 P13 R55
G1 X167.326 Y171.049 E.02112
G1 X71.421 Y75.144 E4.36233
G1 X71.421 Y75.8 E.02112
G1 X167.326 Y171.706 E4.36233
G1 X167.326 Y172.363 E.02112
G1 X71.421 Y76.457 E4.36233
G1 X71.421 Y77.114 E.02112
G1 X167.326 Y173.019 E4.36233
G1 X167.326 Y173.676 E.02112
G1 X71.421 Y77.77 E4.36233
M73 P13 R54
G1 X71.421 Y78.427 E.02112
G1 X167.326 Y174.333 E4.36233
G1 X167.326 Y174.99 E.02112
G1 X71.421 Y79.084 E4.36233
G1 X71.421 Y79.741 E.02112
G1 X167.326 Y175.646 E4.36233
G1 X167.326 Y176.303 E.02112
G1 X71.421 Y80.397 E4.36233
G1 X71.421 Y81.054 E.02112
G1 X167.326 Y176.96 E4.36233
G1 X167.326 Y177.616 E.02112
G1 X71.421 Y81.711 E4.36233
G1 X71.421 Y82.367 E.02112
G1 X167.326 Y178.273 E4.36233
G1 X167.326 Y178.93 E.02112
G1 X71.421 Y83.024 E4.36233
G1 X71.421 Y83.681 E.02112
G1 X167.326 Y179.586 E4.36233
G1 X167.326 Y180.243 E.02112
G1 X71.421 Y84.337 E4.36233
G1 X71.421 Y84.994 E.02112
G1 X167.326 Y180.9 E4.36233
G1 X167.326 Y181.557 E.02112
G1 X71.421 Y85.651 E4.36233
G1 X71.421 Y86.308 E.02112
G1 X167.326 Y182.213 E4.36233
G1 X167.326 Y182.87 E.02112
G1 X71.421 Y86.964 E4.36233
G1 X71.421 Y87.621 E.02112
G1 X167.326 Y183.527 E4.36233
G1 X167.326 Y184.183 E.02112
G1 X71.421 Y88.278 E4.36233
G1 X71.421 Y88.934 E.02112
G1 X167.326 Y184.84 E4.36233
G1 X167.326 Y185.497 E.02112
G1 X71.421 Y89.591 E4.36233
G1 X71.421 Y90.248 E.02112
G1 X167.326 Y186.153 E4.36233
G1 X167.326 Y186.81 E.02112
G1 X71.421 Y90.904 E4.36233
M73 P14 R54
G1 X71.421 Y91.561 E.02112
G1 X167.326 Y187.467 E4.36233
G1 X167.326 Y187.533 E.00214
G1 X166.735 Y187.532 E.01903
G1 X71.421 Y92.218 E4.33542
G1 X71.421 Y92.874 E.02112
G1 X166.076 Y187.53 E4.30548
G1 X165.418 Y187.529 E.02117
G1 X71.421 Y93.531 E4.27553
G1 X71.421 Y94.188 E.02112
G1 X164.76 Y187.527 E4.24559
G1 X164.101 Y187.526 E.02117
G1 X71.421 Y94.845 E4.21565
G1 X71.421 Y95.501 E.02112
G1 X163.443 Y187.524 E4.18571
G1 X162.785 Y187.522 E.02117
G1 X71.421 Y96.158 E4.15577
G1 X71.421 Y96.815 E.02112
G1 X162.127 Y187.521 E4.12583
G1 X161.468 Y187.519 E.02117
G1 X71.421 Y97.471 E4.09588
G1 X71.421 Y98.128 E.02112
G1 X160.81 Y187.518 E4.06594
G1 X160.152 Y187.516 E.02117
G1 X71.421 Y98.785 E4.036
G1 X71.421 Y99.441 E.02112
G1 X159.494 Y187.515 E4.00606
G1 X158.835 Y187.513 E.02117
G1 X71.421 Y100.098 E3.97612
G1 X71.421 Y100.755 E.02112
G1 X158.177 Y187.511 E3.94618
G1 X157.519 Y187.51 E.02117
G1 X71.421 Y101.412 E3.91623
G1 X71.421 Y102.068 E.02112
G1 X156.861 Y187.508 E3.88629
G1 X156.202 Y187.507 E.02117
G1 X71.421 Y102.725 E3.85635
G1 X71.421 Y103.382 E.02112
G1 X155.544 Y187.505 E3.82641
G1 X154.886 Y187.504 E.02117
M73 P14 R53
G1 X71.421 Y104.038 E3.79647
G1 X71.421 Y104.695 E.02112
G1 X154.227 Y187.502 E3.76653
G1 X153.569 Y187.5 E.02117
G1 X71.421 Y105.352 E3.73658
G1 X71.421 Y106.008 E.02112
G1 X152.911 Y187.499 E3.70664
G1 X152.253 Y187.497 E.02117
G1 X71.421 Y106.665 E3.6767
G1 X71.421 Y107.322 E.02112
M73 P15 R53
G1 X151.594 Y187.496 E3.64676
G1 X150.936 Y187.494 E.02117
G1 X71.421 Y107.979 E3.61682
G1 X71.421 Y108.635 E.02112
G1 X150.278 Y187.493 E3.58688
G1 X149.62 Y187.491 E.02117
G1 X71.421 Y109.292 E3.55693
G1 X71.421 Y109.949 E.02112
G1 X148.961 Y187.489 E3.52699
G1 X148.303 Y187.488 E.02117
G1 X71.421 Y110.605 E3.49705
G1 X71.421 Y111.262 E.02112
G1 X147.645 Y187.486 E3.46711
G1 X146.987 Y187.485 E.02117
G1 X71.421 Y111.919 E3.43717
G1 X71.421 Y112.575 E.02112
G1 X146.328 Y187.483 E3.40722
G1 X145.67 Y187.482 E.02117
G1 X71.421 Y113.232 E3.37728
G1 X71.421 Y113.889 E.02112
G1 X145.012 Y187.48 E3.34734
G1 X144.353 Y187.478 E.02117
G1 X71.421 Y114.545 E3.3174
G1 X71.421 Y115.202 E.02112
G1 X102.579 Y146.361 E1.41728
G1 X101.933 Y146.372 E.02079
G1 X71.421 Y115.859 E1.38789
G1 X71.421 Y116.516 E.02112
G1 X101.274 Y146.369 E1.35791
G1 X100.615 Y146.367 E.02119
G1 X71.421 Y117.172 E1.32794
G1 X71.421 Y117.829 E.02112
G1 X99.956 Y146.365 E1.29796
G1 X99.297 Y146.362 E.02119
G1 X71.421 Y118.486 E1.26799
G1 X71.421 Y119.142 E.02112
G1 X98.638 Y146.36 E1.23802
G1 X97.979 Y146.358 E.02119
G1 X71.421 Y119.799 E1.20804
G1 X71.421 Y120.456 E.02112
G1 X97.32 Y146.356 E1.17807
G1 X96.661 Y146.353 E.02119
G1 X71.421 Y121.112 E1.1481
G1 X71.421 Y121.769 E.02112
G1 X96.002 Y146.351 E1.11812
G1 X95.343 Y146.349 E.02119
G1 X71.421 Y122.426 E1.08815
G1 X71.421 Y123.083 E.02112
G1 X94.684 Y146.347 E1.05818
G1 X94.026 Y146.344 E.02119
G1 X71.421 Y123.739 E1.0282
G1 X71.421 Y124.396 E.02112
G1 X93.365 Y146.341 E.99818
G1 X92.705 Y146.337 E.02124
G1 X71.421 Y125.053 E.96815
G1 X71.421 Y125.709 E.02112
G1 X92.045 Y146.334 E.93811
M73 P16 R53
G1 X91.385 Y146.33 E.02124
G1 X71.421 Y126.366 E.90808
G1 X71.421 Y127.023 E.02112
G1 X90.724 Y146.327 E.87805
G1 X90.064 Y146.323 E.02124
G1 X71.421 Y127.679 E.84802
G1 X71.421 Y128.336 E.02112
G1 X89.404 Y146.32 E.81799
G1 X88.744 Y146.316 E.02124
G1 X71.421 Y128.993 E.78796
G1 X71.421 Y129.65 E.02112
G1 X88.083 Y146.312 E.75792
G1 X87.423 Y146.309 E.02124
G1 X71.421 Y130.306 E.72789
G1 X71.421 Y130.963 E.02112
G1 X86.763 Y146.305 E.69786
G1 X86.103 Y146.302 E.02124
G1 X71.421 Y131.62 E.66783
G1 X71.421 Y132.276 E.02112
G1 X85.442 Y146.298 E.6378
G1 X84.782 Y146.295 E.02124
G1 X71.421 Y132.933 E.60777
G1 X71.421 Y133.59 E.02112
G1 X84.122 Y146.291 E.57773
G1 X83.462 Y146.288 E.02124
G1 X71.421 Y134.246 E.5477
M73 P16 R52
G1 X71.421 Y134.903 E.02112
G1 X82.801 Y146.284 E.51767
G1 X82.141 Y146.281 E.02124
G1 X71.421 Y135.56 E.48764
G1 X71.421 Y136.217 E.02112
G1 X81.481 Y146.277 E.45761
G3 X80.819 Y146.271 I.316 J-74.259 E.02131
G1 X71.421 Y136.873 E.42747
G1 X71.421 Y137.53 E.02112
G1 X80.155 Y146.265 E.39731
G1 X79.492 Y146.258 E.02133
G1 X71.421 Y138.187 E.36714
G1 X71.421 Y138.843 E.02112
G1 X78.829 Y146.252 E.33697
G1 X78.166 Y146.245 E.02133
G1 X71.421 Y139.5 E.3068
G1 X71.421 Y140.157 E.02112
G1 X77.502 Y146.239 E.27664
G1 X76.839 Y146.232 E.02133
G1 X71.421 Y140.813 E.24647
G1 X71.421 Y141.47 E.02112
G1 X76.176 Y146.225 E.2163
G1 X75.513 Y146.219 E.02133
G1 X71.421 Y142.127 E.18614
G1 X71.421 Y142.783 E.02112
G1 X74.849 Y146.212 E.15597
G1 X74.186 Y146.206 E.02133
G1 X71.421 Y143.44 E.1258
G1 X71.421 Y144.097 E.02112
G1 X73.523 Y146.199 E.09563
G1 X72.86 Y146.193 E.02133
G1 X71.421 Y144.754 E.06547
G1 X71.421 Y145.41 E.02112
G1 X72.197 Y146.186 E.0353
G1 X71.533 Y146.18 E.02133
G1 X71.212 Y145.858 E.01462
; WIPE_START
G1 F24000
G1 X71.533 Y146.18 E-.17274
G1 X72.197 Y146.186 E-.25204
G1 X71.573 Y145.563 E-.33522
; WIPE_END
G1 E-.04 F1800
G1 X79.189 Y146.064 Z.57 F30000
G1 X103.91 Y147.691 Z.57
G1 Z.17
G1 E.8 F1800
G1 F6300
G1 X143.695 Y187.477 E1.80967
G1 X143.037 Y187.475 E.02117
G1 X104.299 Y148.738 E1.762
G1 X104.434 Y149.529 E.02582
G1 X142.379 Y187.474 E1.72593
G1 X141.72 Y187.472 E.02117
G1 X104.569 Y150.321 E1.68986
G1 X104.704 Y151.112 E.02582
G1 X141.062 Y187.471 E1.65379
G1 X140.404 Y187.469 E.02117
G1 X104.838 Y151.903 E1.61772
G1 X104.973 Y152.695 E.02582
G1 X139.746 Y187.467 E1.58165
G1 X139.087 Y187.466 E.02117
G1 X105.108 Y153.486 E1.54558
G1 X105.242 Y154.278 E.02582
G1 X138.429 Y187.464 E1.50951
G1 X137.771 Y187.463 E.02117
G1 X105.377 Y155.069 E1.47344
G1 X105.512 Y155.86 E.02582
G1 X137.113 Y187.461 E1.43738
G1 X136.454 Y187.46 E.02117
G1 X105.647 Y156.652 E1.40131
G1 X105.781 Y157.443 E.02582
G1 X135.796 Y187.458 E1.36524
G1 X135.138 Y187.456 E.02117
G1 X105.916 Y158.235 E1.32917
G1 X106.051 Y159.026 E.02582
G1 X134.479 Y187.455 E1.2931
G1 X133.821 Y187.453 E.02117
G1 X106.185 Y159.818 E1.25703
G1 X106.32 Y160.609 E.02582
G1 X133.163 Y187.452 E1.22096
G1 X132.505 Y187.45 E.02117
G1 X106.455 Y161.4 E1.18489
G1 X106.59 Y162.192 E.02582
G1 X131.846 Y187.449 E1.14882
G1 X131.188 Y187.447 E.02117
G1 X106.724 Y162.983 E1.11275
G1 X106.859 Y163.775 E.02582
G1 X130.53 Y187.445 E1.07668
G1 X129.872 Y187.444 E.02117
G1 X106.994 Y164.566 E1.04061
G1 X107.128 Y165.357 E.02582
G1 X129.213 Y187.442 E1.00454
G1 X128.555 Y187.441 E.02117
G1 X107.263 Y166.149 E.96847
G1 X107.398 Y166.94 E.02582
G1 X127.897 Y187.439 E.9324
G1 X127.238 Y187.438 E.02117
G1 X107.533 Y167.732 E.89633
G1 X107.667 Y168.523 E.02582
G1 X126.58 Y187.436 E.86026
G1 X125.922 Y187.434 E.02117
G1 X107.802 Y169.315 E.8242
G1 X107.937 Y170.106 E.02582
G1 X125.264 Y187.433 E.78813
G1 X124.605 Y187.431 E.02117
G1 X108.071 Y170.897 E.75206
G1 X108.206 Y171.689 E.02582
G1 X123.947 Y187.43 E.71599
G1 X123.289 Y187.428 E.02117
G1 X108.341 Y172.48 E.67992
G1 X108.476 Y173.272 E.02582
G1 X122.631 Y187.427 E.64385
G1 X121.972 Y187.425 E.02117
G1 X108.61 Y174.063 E.60778
G1 X108.745 Y174.854 E.02582
G1 X121.314 Y187.423 E.57171
G1 X120.656 Y187.422 E.02117
G1 X108.88 Y175.646 E.53564
M73 P17 R52
G1 X109.014 Y176.437 E.02582
G1 X119.998 Y187.42 E.49957
G1 X119.339 Y187.419 E.02117
G1 X109.149 Y177.229 E.4635
G1 X109.284 Y178.02 E.02582
G1 X118.681 Y187.417 E.42743
G1 X118.023 Y187.416 E.02117
G1 X109.419 Y178.812 E.39136
G1 X109.553 Y179.603 E.02582
G1 X117.364 Y187.414 E.35529
G1 X116.706 Y187.412 E.02117
G1 X109.688 Y180.394 E.31922
G1 X109.823 Y181.186 E.02582
G1 X116.048 Y187.411 E.28315
G1 X115.39 Y187.409 E.02117
G1 X109.958 Y181.977 E.24709
G1 X110.092 Y182.769 E.02582
G1 X114.731 Y187.408 E.21102
G1 X114.073 Y187.406 E.02117
G1 X110.227 Y183.56 E.17495
G1 X110.362 Y184.351 E.02582
G1 X113.415 Y187.405 E.13888
G1 X112.757 Y187.403 E.02117
G1 X110.496 Y185.143 E.10281
G1 X110.631 Y185.934 E.02582
G1 X112.098 Y187.401 E.06674
G1 X111.44 Y187.4 E.02117
G1 X110.511 Y186.471 E.04227
; CHANGE_LAYER
; Z_HEIGHT: 0.34
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X111.44 Y187.4 E-.49937
G1 X112.098 Y187.401 E-.25014
G1 X112.079 Y187.382 E-.01048
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 2/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S127.5
M106 P2 S178
; open powerlost recovery
M1003 S1
M204 S10000
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z.57 I-.023 J1.217 P1  F30000
G1 X168.252 Y188.452 Z.57
G1 Z.34
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X110.039 Y188.389 E1.66732
G1 X103.213 Y148.365 E1.16292
G1 X103.145 Y148.092 E.00807
G1 X103.079 Y147.971 E.00396
G2 X102.051 Y147.383 I-.976 J.515 E.03577
G1 X82.788 Y147.359 E.55174
G1 X72.116 Y147.346 E.30567
G1 F3000
G1 X70.247 Y147.343 E.05353
G1 X70.247 Y55.45 E2.63199
G1 X70.881 Y55.45 E.01816
G1 F17923.694
G1 X84.133 Y55.434 E.37957
G1 X168.252 Y55.336 E2.40933
G1 X168.252 Y188.392 E3.811
G1 X168.537 Y188.679 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F1800
G3 X168.179 Y188.851 I-.37 J-.312 E.01086
G1 X151.3 Y188.834 E.44838
M106 S127.5
M106 S255
G1 F600
G1 X110.059 Y188.788 E1.09552
G3 X109.644 Y188.44 I.009 J-.433 E.01555
G1 X102.823 Y148.447 E1.07772
G2 X102.721 Y148.147 I-.625 J.044 E.00852
M106 S127.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G2 X102.348 Y147.83 I-.539 J.257 E.01443
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G2 X102.036 Y147.782 I-.266 J.682 E.00846
G1 X86.673 Y147.762 E.40811
M106 S127.5
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X70.213 Y147.742 E.47145
G3 X69.849 Y147.384 I-.002 J-.363 E.01622
G1 X69.849 Y55.418 E2.63409
G3 X70.21 Y55.052 I.353 J-.012 E.01648
G1 X89.783 Y55.029 E.56061
M106 S127.5
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X153.886 Y54.954 E1.70285
M106 S127.5
M106 S255
G1 F1800
G1 X168.183 Y54.937 E.37979
G1 X168.295 Y54.95 E.00298
M106 S127.5
M106 S255
G3 X168.65 Y55.406 I-.147 J.482 E.01636
G1 X168.65 Y188.378 E3.53228
G3 X168.572 Y188.631 I-.484 J-.011 E.00713
M106 S127.5
M204 S10000
; WIPE_START
G1 F24000
G1 X168.401 Y188.796 E-.09054
G1 X168.179 Y188.851 E-.08679
G1 X166.646 Y188.849 E-.58267
; WIPE_END
G1 E-.04 F1800
G1 X167.31 Y188.285 Z.74 F30000
G1 Z.34
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420752
G1 F15000
G1 X167.913 Y187.682 E.02271
G1 X167.913 Y187.138 E.01446
G1 X166.939 Y188.112 E.03666
G1 X166.396 Y188.112 E.01445
G1 X167.913 Y186.595 E.05709
G1 X167.913 Y186.051 E.01446
G1 X165.854 Y188.111 E.07753
G1 X165.311 Y188.11 E.01445
G1 X167.913 Y185.508 E.09796
G1 X167.913 Y184.964 E.01446
G1 X164.768 Y188.11 E.11839
G1 X164.225 Y188.109 E.01445
G1 X167.913 Y184.421 E.13883
G1 X167.913 Y183.878 E.01446
G1 X163.682 Y188.109 E.15926
G1 X163.139 Y188.108 E.01445
G1 X167.913 Y183.334 E.17969
G1 X167.913 Y182.791 E.01446
G1 X162.597 Y188.107 E.20013
G1 X162.054 Y188.107 E.01445
G1 X167.913 Y182.247 E.22056
G1 X167.913 Y181.704 E.01446
G1 X161.511 Y188.106 E.24099
G1 X160.968 Y188.106 E.01445
G1 X167.913 Y181.16 E.26143
G1 X167.913 Y180.617 E.01446
G1 X160.425 Y188.105 E.28186
G1 X159.882 Y188.104 E.01445
G1 X167.913 Y180.073 E.30229
G1 X167.913 Y179.53 E.01446
G1 X159.339 Y188.104 E.32273
G1 X158.797 Y188.103 E.01445
G1 X167.913 Y178.987 E.34316
G1 X167.913 Y178.443 E.01446
G1 X158.254 Y188.103 E.36359
M73 P18 R51
G1 X157.711 Y188.102 E.01445
G1 X167.913 Y177.9 E.38403
G1 X167.913 Y177.356 E.01446
G1 X157.168 Y188.102 E.40446
G1 X156.625 Y188.101 E.01445
G1 X167.913 Y176.813 E.4249
G1 X167.913 Y176.269 E.01446
G1 X156.082 Y188.1 E.44533
G1 X155.539 Y188.1 E.01445
G1 X167.913 Y175.726 E.46576
G1 X167.913 Y175.183 E.01446
G1 X154.997 Y188.099 E.4862
G1 X154.454 Y188.099 E.01445
G1 X167.913 Y174.639 E.50663
G1 X167.913 Y174.096 E.01446
G1 X153.911 Y188.098 E.52706
G1 X153.368 Y188.097 E.01445
G1 X167.913 Y173.552 E.5475
G1 X167.913 Y173.009 E.01446
G1 X152.825 Y188.097 E.56793
G1 X152.282 Y188.096 E.01445
G1 X167.913 Y172.465 E.58836
G1 X167.913 Y171.922 E.01446
G1 X151.739 Y188.096 E.6088
G1 X151.197 Y188.095 E.01445
G1 X167.913 Y171.378 E.62923
G1 X167.913 Y170.835 E.01446
G1 X150.654 Y188.095 E.64966
G1 X150.111 Y188.094 E.01445
G1 X167.913 Y170.292 E.6701
G1 X167.913 Y169.748 E.01446
G1 X149.568 Y188.093 E.69053
G1 X149.025 Y188.093 E.01445
G1 X167.913 Y169.205 E.71096
G1 X167.913 Y168.661 E.01446
G1 X148.482 Y188.092 E.7314
G1 X147.939 Y188.092 E.01445
G1 X167.913 Y168.118 E.75183
G1 X167.913 Y167.574 E.01446
G1 X147.397 Y188.091 E.77227
G1 X146.854 Y188.09 E.01445
G1 X167.913 Y167.031 E.7927
G1 X167.913 Y166.487 E.01446
G1 X146.311 Y188.09 E.81313
G1 X145.768 Y188.089 E.01445
G1 X167.913 Y165.944 E.83357
G1 X167.913 Y165.401 E.01446
G1 X145.225 Y188.089 E.854
G1 X144.682 Y188.088 E.01445
G1 X167.913 Y164.857 E.87443
G1 X167.913 Y164.314 E.01446
G1 X144.139 Y188.087 E.89487
G1 X143.597 Y188.087 E.01445
G1 X167.913 Y163.77 E.9153
G1 X167.913 Y163.227 E.01446
G1 X143.054 Y188.086 E.93573
G1 X142.511 Y188.086 E.01445
G1 X167.913 Y162.683 E.95617
G1 X167.913 Y162.14 E.01446
G1 X141.968 Y188.085 E.9766
G1 X141.425 Y188.085 E.01445
G1 X167.913 Y161.597 E.99703
G1 X167.913 Y161.053 E.01446
G1 X140.882 Y188.084 E1.01747
G1 X140.339 Y188.083 E.01445
G1 X167.913 Y160.51 E1.0379
G1 X167.913 Y159.966 E.01446
G1 X139.797 Y188.083 E1.05833
G1 X139.254 Y188.082 E.01445
G1 X167.913 Y159.423 E1.07877
G1 X167.913 Y158.879 E.01446
G1 X138.711 Y188.082 E1.0992
G1 X138.168 Y188.081 E.01445
G1 X167.913 Y158.336 E1.11964
G1 X167.913 Y157.792 E.01446
G1 X137.625 Y188.08 E1.14007
G1 X137.082 Y188.08 E.01445
G1 X167.913 Y157.249 E1.1605
G1 X167.913 Y156.706 E.01446
G1 X136.54 Y188.079 E1.18094
G1 X135.997 Y188.079 E.01445
G1 X167.913 Y156.162 E1.20137
G1 X167.913 Y155.619 E.01446
G1 X135.454 Y188.078 E1.2218
G1 X134.911 Y188.078 E.01445
G1 X167.913 Y155.075 E1.24224
G1 X167.913 Y154.532 E.01446
G1 X134.368 Y188.077 E1.26267
G1 X133.825 Y188.076 E.01445
G1 X167.913 Y153.988 E1.2831
G1 X167.913 Y153.445 E.01446
G1 X133.282 Y188.076 E1.30354
G1 X132.74 Y188.075 E.01445
G1 X167.913 Y152.901 E1.32397
G1 X167.913 Y152.358 E.01446
G1 X132.197 Y188.075 E1.3444
G1 X131.654 Y188.074 E.01445
G1 X167.913 Y151.815 E1.36484
G1 X167.913 Y151.271 E.01446
G1 X131.111 Y188.073 E1.38527
G1 X130.568 Y188.073 E.01445
G1 X167.913 Y150.728 E1.4057
G1 X167.913 Y150.184 E.01446
G1 X130.025 Y188.072 E1.42614
G1 X129.482 Y188.072 E.01445
G1 X167.913 Y149.641 E1.44657
G1 X167.913 Y149.097 E.01446
G1 X128.94 Y188.071 E1.46701
G1 X128.397 Y188.07 E.01445
G1 X167.913 Y148.554 E1.48744
G1 X167.913 Y148.011 E.01446
G1 X127.854 Y188.07 E1.50787
G1 X127.311 Y188.069 E.01445
G1 X167.913 Y147.467 E1.52831
G1 X167.913 Y146.924 E.01446
G1 X126.768 Y188.069 E1.54874
G1 X126.225 Y188.068 E.01445
G1 X167.913 Y146.38 E1.56917
G1 X167.913 Y145.837 E.01446
G1 X125.682 Y188.068 E1.58961
G1 X125.14 Y188.067 E.01445
G1 X167.913 Y145.293 E1.61004
G1 X167.913 Y144.75 E.01446
G1 X124.597 Y188.066 E1.63047
G1 X124.054 Y188.066 E.01445
G1 X167.913 Y144.206 E1.65091
G1 X167.913 Y143.663 E.01446
G1 X123.511 Y188.065 E1.67134
G1 X122.968 Y188.065 E.01445
G1 X167.913 Y143.12 E1.69177
G1 X167.913 Y142.576 E.01446
G1 X122.425 Y188.064 E1.71221
G1 X121.882 Y188.063 E.01445
G1 X167.913 Y142.033 E1.73264
G1 X167.913 Y141.489 E.01446
G1 X121.34 Y188.063 E1.75307
G1 X120.797 Y188.062 E.01445
G1 X167.913 Y140.946 E1.77351
G1 X167.913 Y140.402 E.01446
G1 X120.254 Y188.062 E1.79394
G1 X119.711 Y188.061 E.01445
G1 X167.913 Y139.859 E1.81437
G1 X167.913 Y139.316 E.01446
G1 X119.168 Y188.061 E1.83481
G1 X118.625 Y188.06 E.01445
G1 X167.913 Y138.772 E1.85524
G1 X167.913 Y138.229 E.01446
G1 X118.082 Y188.059 E1.87568
G1 X117.54 Y188.059 E.01445
G1 X167.913 Y137.685 E1.89611
G1 X167.913 Y137.142 E.01446
G1 X116.997 Y188.058 E1.91654
G1 X116.454 Y188.058 E.01445
G1 X167.913 Y136.598 E1.93698
G1 X167.913 Y136.055 E.01446
G1 X115.911 Y188.057 E1.95741
G1 X115.368 Y188.056 E.01445
G1 X167.913 Y135.511 E1.97784
G1 X167.913 Y134.968 E.01446
G1 X114.825 Y188.056 E1.99828
G1 X114.283 Y188.055 E.01445
G1 X167.913 Y134.425 E2.01871
G1 X167.913 Y133.881 E.01446
G1 X113.74 Y188.055 E2.03914
G1 X113.197 Y188.054 E.01445
G1 X167.913 Y133.338 E2.05958
G1 X167.913 Y132.794 E.01446
G1 X112.654 Y188.053 E2.08001
G1 X112.111 Y188.053 E.01445
G1 X167.913 Y132.251 E2.10044
G1 X167.913 Y131.707 E.01446
G1 X111.568 Y188.052 E2.12088
G1 X111.025 Y188.052 E.01445
G1 X167.913 Y131.164 E2.14131
G1 X167.913 Y130.62 E.01446
G1 X110.483 Y188.051 E2.16174
G1 X110.325 Y188.051 E.00418
G1 X110.269 Y187.721 E.00891
G1 X167.913 Y130.077 E2.16978
G1 X167.913 Y129.534 E.01446
G1 X110.19 Y187.257 E2.17276
G1 X110.111 Y186.793 E.01254
G1 X167.913 Y128.99 E2.17574
G1 X167.913 Y128.447 E.01446
G1 X110.032 Y186.328 E2.17872
G1 X109.952 Y185.864 E.01254
G1 X167.913 Y127.903 E2.1817
G1 X167.913 Y127.36 E.01446
G1 X109.873 Y185.4 E2.18468
G1 X109.794 Y184.936 E.01254
G1 X167.913 Y126.816 E2.18766
G1 X167.913 Y126.273 E.01446
G1 X109.715 Y184.471 E2.19064
G1 X109.636 Y184.007 E.01254
G1 X167.913 Y125.73 E2.19362
G1 X167.913 Y125.186 E.01446
G1 X109.556 Y183.543 E2.1966
G1 X109.477 Y183.079 E.01254
G1 X167.913 Y124.643 E2.19958
G1 X167.913 Y124.099 E.01446
G1 X109.398 Y182.614 E2.20256
G1 X109.319 Y182.15 E.01254
G1 X167.913 Y123.556 E2.20554
G1 X167.913 Y123.012 E.01446
G1 X109.24 Y181.686 E2.20853
G1 X109.161 Y181.222 E.01254
G1 X167.913 Y122.469 E2.21151
G1 X167.913 Y121.925 E.01446
G1 X109.081 Y180.757 E2.21449
G1 X109.002 Y180.293 E.01254
G1 X167.913 Y121.382 E2.21747
G1 X167.913 Y120.839 E.01446
G1 X108.923 Y179.829 E2.22045
G1 X108.844 Y179.365 E.01254
G1 X167.913 Y120.295 E2.22343
G1 X167.913 Y119.752 E.01446
G1 X108.765 Y178.9 E2.22641
G1 X108.685 Y178.436 E.01254
G1 X167.913 Y119.208 E2.22939
G1 X167.913 Y118.665 E.01446
G1 X108.606 Y177.972 E2.23237
G1 X108.527 Y177.507 E.01254
G1 X167.913 Y118.121 E2.23535
G1 X167.913 Y117.578 E.01446
G1 X108.448 Y177.043 E2.23833
G1 X108.369 Y176.579 E.01254
G1 X167.913 Y117.034 E2.24131
G1 X167.913 Y116.491 E.01446
G1 X108.29 Y176.115 E2.24429
G1 X108.21 Y175.65 E.01254
G1 X167.913 Y115.948 E2.24727
G1 X167.913 Y115.404 E.01446
G1 X108.131 Y175.186 E2.25025
G1 X108.052 Y174.722 E.01254
G1 X167.913 Y114.861 E2.25323
G1 X167.913 Y114.317 E.01446
G1 X107.973 Y174.258 E2.25622
G1 X107.894 Y173.793 E.01254
G1 X167.913 Y113.774 E2.2592
G1 X167.913 Y113.23 E.01446
G1 X107.814 Y173.329 E2.26218
G1 X107.735 Y172.865 E.01254
G1 X167.913 Y112.687 E2.26516
G1 X167.913 Y112.144 E.01446
G1 X107.656 Y172.401 E2.26814
G1 X107.577 Y171.936 E.01254
G1 X167.913 Y111.6 E2.27112
G1 X167.913 Y111.057 E.01446
G1 X107.498 Y171.472 E2.2741
G1 X107.418 Y171.008 E.01254
G1 X167.913 Y110.513 E2.27708
G1 X167.913 Y109.97 E.01446
G1 X107.339 Y170.544 E2.28006
G1 X107.26 Y170.079 E.01254
G1 X167.913 Y109.426 E2.28304
G1 X167.913 Y108.883 E.01446
G1 X107.181 Y169.615 E2.28602
G1 X107.102 Y169.151 E.01254
G1 X167.913 Y108.339 E2.289
G1 X167.913 Y107.796 E.01446
G1 X107.023 Y168.687 E2.29198
G1 X106.943 Y168.222 E.01254
G1 X167.913 Y107.253 E2.29496
G1 X167.913 Y106.709 E.01446
G1 X106.864 Y167.758 E2.29794
G1 X106.785 Y167.294 E.01254
G1 X167.913 Y106.166 E2.30092
G1 X167.913 Y105.622 E.01446
G1 X106.706 Y166.83 E2.3039
G1 X106.627 Y166.365 E.01254
G1 X167.913 Y105.079 E2.30689
G1 X167.913 Y104.535 E.01446
G1 X106.547 Y165.901 E2.30987
G1 X106.468 Y165.437 E.01254
G1 X167.913 Y103.992 E2.31285
G1 X167.913 Y103.448 E.01446
G1 X106.389 Y164.973 E2.31583
G1 X106.31 Y164.508 E.01254
G1 X167.913 Y102.905 E2.31881
G1 X167.913 Y102.362 E.01446
G1 X106.231 Y164.044 E2.32179
G1 X106.152 Y163.58 E.01254
G1 X167.913 Y101.818 E2.32477
G1 X167.913 Y101.275 E.01446
G1 X106.072 Y163.116 E2.32775
M73 P19 R51
G1 X105.993 Y162.651 E.01254
G1 X167.913 Y100.731 E2.33073
G1 X167.913 Y100.188 E.01446
G1 X105.914 Y162.187 E2.33371
G1 X105.835 Y161.723 E.01254
G1 X167.913 Y99.644 E2.33669
G1 X167.913 Y99.101 E.01446
G1 X105.756 Y161.259 E2.33967
G1 X105.676 Y160.794 E.01254
G1 X167.913 Y98.558 E2.34265
G1 X167.913 Y98.014 E.01446
G1 X105.597 Y160.33 E2.34563
G1 X105.518 Y159.866 E.01254
G1 X167.913 Y97.471 E2.34861
G1 X167.913 Y96.927 E.01446
G1 X105.439 Y159.402 E2.35159
G1 X105.36 Y158.937 E.01254
G1 X167.913 Y96.384 E2.35458
G1 X167.913 Y95.84 E.01446
G1 X105.28 Y158.473 E2.35756
G1 X105.201 Y158.009 E.01254
G1 X167.913 Y95.297 E2.36054
G1 X167.913 Y94.753 E.01446
G1 X105.122 Y157.545 E2.36352
G1 X105.043 Y157.08 E.01254
G1 X167.913 Y94.21 E2.3665
G1 X167.913 Y93.667 E.01446
G1 X104.964 Y156.616 E2.36948
G1 X104.885 Y156.152 E.01254
G1 X167.913 Y93.123 E2.37246
G1 X167.913 Y92.58 E.01446
G1 X104.805 Y155.688 E2.37544
G1 X104.726 Y155.223 E.01254
G1 X167.913 Y92.036 E2.37842
G1 X167.913 Y91.493 E.01446
G1 X104.647 Y154.759 E2.3814
G1 X104.568 Y154.295 E.01254
G1 X167.913 Y90.949 E2.38438
G1 X167.913 Y90.406 E.01446
G1 X104.489 Y153.831 E2.38736
G1 X104.409 Y153.366 E.01254
G1 X167.913 Y89.862 E2.39034
G1 X167.913 Y89.319 E.01446
G1 X104.33 Y152.902 E2.39332
G1 X104.251 Y152.438 E.01254
G1 X167.913 Y88.776 E2.3963
G1 X167.913 Y88.232 E.01446
G1 X104.172 Y151.973 E2.39928
G1 X104.093 Y151.509 E.01254
G1 X167.913 Y87.689 E2.40226
G1 X167.913 Y87.145 E.01446
G1 X104.014 Y151.045 E2.40525
G1 X103.934 Y150.581 E.01254
G1 X167.913 Y86.602 E2.40823
G1 X167.913 Y86.058 E.01446
G1 X103.855 Y150.116 E2.41121
G1 X103.776 Y149.652 E.01254
G1 X167.913 Y85.515 E2.41419
G1 X167.913 Y84.972 E.01446
G1 X103.697 Y149.188 E2.41717
G1 X103.618 Y148.724 E.01254
G1 X167.913 Y84.428 E2.42015
G1 X167.913 Y83.885 E.01446
G1 X103.536 Y148.262 E2.42321
G1 X103.463 Y147.968 E.00806
G1 X103.401 Y147.854 E.00346
G1 X167.913 Y83.341 E2.42831
G1 X167.913 Y82.798 E.01446
G1 X103.181 Y147.529 E2.43656
G2 X102.888 Y147.28 I-.646 J.462 E.01036
G1 X167.913 Y82.254 E2.44762
G1 X167.913 Y81.711 E.01446
G1 X102.516 Y147.108 E2.46162
G2 X102.036 Y147.044 I-.532 J2.161 E.0129
G1 X167.913 Y81.167 E2.47967
G1 X167.913 Y80.624 E.01446
G1 X101.493 Y147.044 E2.5001
G1 X100.951 Y147.043 E.01445
G1 X167.913 Y80.081 E2.52053
G1 X167.913 Y79.537 E.01446
G1 X100.408 Y147.042 E2.54096
G1 X99.865 Y147.042 E.01445
G1 X167.913 Y78.994 E2.56139
G1 X167.913 Y78.45 E.01446
G1 X99.322 Y147.041 E2.58182
G1 X98.78 Y147.04 E.01445
G1 X167.913 Y77.907 E2.60225
G1 X167.913 Y77.363 E.01446
G1 X98.237 Y147.04 E2.62268
G1 X97.694 Y147.039 E.01445
G1 X167.913 Y76.82 E2.64311
G1 X167.913 Y76.276 E.01446
G1 X97.151 Y147.038 E2.66354
G1 X96.609 Y147.038 E.01445
G1 X167.913 Y75.733 E2.68397
G1 X167.913 Y75.19 E.01446
G1 X96.066 Y147.037 E2.7044
G1 X95.523 Y147.036 E.01445
G1 X167.913 Y74.646 E2.72483
G1 X167.913 Y74.103 E.01446
M73 P19 R50
G1 X94.98 Y147.036 E2.74526
G1 X94.438 Y147.035 E.01445
G1 X167.913 Y73.559 E2.76569
G1 X167.913 Y73.016 E.01446
G1 X93.895 Y147.034 E2.78612
G1 X93.352 Y147.034 E.01445
G1 X167.913 Y72.472 E2.80655
G1 X167.913 Y71.929 E.01446
G1 X92.809 Y147.033 E2.82698
G1 X92.267 Y147.032 E.01445
G1 X167.913 Y71.386 E2.84741
G1 X167.913 Y70.842 E.01446
G1 X91.724 Y147.031 E2.86784
G1 X91.181 Y147.031 E.01445
G1 X167.913 Y70.299 E2.88827
G1 X167.913 Y69.755 E.01446
G1 X90.638 Y147.03 E2.9087
G1 X90.096 Y147.029 E.01445
G1 X167.913 Y69.212 E2.92913
G1 X167.913 Y68.668 E.01446
G1 X89.553 Y147.029 E2.94956
G1 X89.01 Y147.028 E.01445
G1 X167.913 Y68.125 E2.96999
G1 X167.913 Y67.581 E.01446
G1 X88.467 Y147.027 E2.99042
G1 X87.925 Y147.027 E.01445
G1 X167.913 Y67.038 E3.01085
G1 X167.913 Y66.495 E.01446
G1 X87.382 Y147.026 E3.03128
G1 X86.839 Y147.025 E.01445
G1 X167.913 Y65.951 E3.05171
G1 X167.913 Y65.408 E.01446
G1 X86.296 Y147.025 E3.07214
G1 X85.753 Y147.024 E.01445
G1 X167.913 Y64.864 E3.09257
G1 X167.913 Y64.321 E.01446
G1 X85.211 Y147.023 E3.113
G1 X84.668 Y147.023 E.01445
G1 X167.913 Y63.777 E3.13343
G1 X167.913 Y63.234 E.01446
G1 X84.125 Y147.022 E3.15386
G1 X83.582 Y147.021 E.01445
G1 X167.913 Y62.69 E3.17429
G1 X167.913 Y62.147 E.01446
G1 X83.04 Y147.021 E3.19472
G1 X82.497 Y147.02 E.01445
G1 X167.913 Y61.604 E3.21515
G1 X167.913 Y61.06 E.01446
G1 X81.954 Y147.019 E3.23558
G1 X81.411 Y147.019 E.01445
G1 X167.913 Y60.517 E3.25601
G1 X167.913 Y59.973 E.01446
G1 X80.869 Y147.018 E3.27644
G1 X80.326 Y147.017 E.01445
G1 X167.913 Y59.43 E3.29687
G1 X167.913 Y58.886 E.01446
G1 X79.783 Y147.016 E3.3173
G1 X79.24 Y147.016 E.01445
G1 X167.913 Y58.343 E3.33773
G1 X167.913 Y57.8 E.01446
G1 X78.698 Y147.015 E3.35816
G1 X78.155 Y147.014 E.01445
G1 X167.913 Y57.256 E3.37859
G1 X167.913 Y56.713 E.01446
G1 X77.612 Y147.014 E3.39902
G1 X77.069 Y147.013 E.01445
G1 X167.913 Y56.169 E3.41945
G1 X167.913 Y55.675 E.01316
G1 X167.864 Y55.675 E.00131
G1 X76.527 Y147.012 E3.43803
G1 X75.984 Y147.012 E.01445
G1 X167.32 Y55.676 E3.43798
G1 X166.776 Y55.676 E.01448
G1 X75.441 Y147.011 E3.43793
G1 X74.898 Y147.01 E.01445
G1 X166.232 Y55.677 E3.43788
G1 X165.688 Y55.678 E.01448
G1 X74.356 Y147.01 E3.43783
G1 X73.813 Y147.009 E.01445
G1 X165.144 Y55.678 E3.43778
G1 X164.6 Y55.679 E.01448
G1 X73.27 Y147.008 E3.43773
G1 X72.727 Y147.008 E.01445
G1 X164.055 Y55.679 E3.43768
G1 X163.511 Y55.68 E.01448
M73 P20 R50
G1 X72.185 Y147.007 E3.43763
G1 X71.642 Y147.006 E.01445
G1 X162.967 Y55.681 E3.43758
G1 X162.423 Y55.681 E.01448
G1 X71.099 Y147.006 E3.43753
G1 X70.586 Y147.005 E.01366
G1 X70.586 Y146.975 E.00079
G1 X161.879 Y55.682 E3.43636
G1 X161.335 Y55.683 E.01448
G1 X70.586 Y146.432 E3.41589
G1 X70.586 Y145.888 E.01446
G1 X160.791 Y55.683 E3.39541
G1 X160.247 Y55.684 E.01448
G1 X70.586 Y145.345 E3.37493
G1 X70.586 Y144.802 E.01446
G1 X159.703 Y55.685 E3.35445
G1 X159.159 Y55.685 E.01448
G1 X70.586 Y144.258 E3.33397
G1 X70.586 Y143.715 E.01446
G1 X158.615 Y55.686 E3.31349
G1 X158.071 Y55.686 E.01448
G1 X70.586 Y143.171 E3.29301
G1 X70.586 Y142.628 E.01446
G1 X157.527 Y55.687 E3.27253
G1 X156.982 Y55.688 E.01448
G1 X70.586 Y142.084 E3.25205
G1 X70.586 Y141.541 E.01446
G1 X156.438 Y55.688 E3.23157
G1 X155.894 Y55.689 E.01448
G1 X70.586 Y140.997 E3.21109
G1 X70.586 Y140.454 E.01446
G1 X155.35 Y55.69 E3.19061
G1 X154.806 Y55.69 E.01448
G1 X70.586 Y139.911 E3.17013
G1 X70.586 Y139.367 E.01446
G1 X154.262 Y55.691 E3.14965
G1 X153.718 Y55.692 E.01448
G1 X70.586 Y138.824 E3.12917
G1 X70.586 Y138.28 E.01446
G1 X153.174 Y55.692 E3.10869
G1 X152.63 Y55.693 E.01448
G1 X70.586 Y137.737 E3.08821
G1 X70.586 Y137.193 E.01446
G1 X152.086 Y55.693 E3.06773
G1 X151.542 Y55.694 E.01448
G1 X70.586 Y136.65 E3.04725
G1 X70.586 Y136.106 E.01446
G1 X150.998 Y55.695 E3.02677
G1 X150.454 Y55.695 E.01448
G1 X70.586 Y135.563 E3.00629
G1 X70.586 Y135.02 E.01446
G1 X149.909 Y55.696 E2.98582
G1 X149.365 Y55.697 E.01448
G1 X70.586 Y134.476 E2.96534
G1 X70.586 Y133.933 E.01446
G1 X148.821 Y55.697 E2.94486
G1 X148.277 Y55.698 E.01448
G1 X70.586 Y133.389 E2.92438
G1 X70.586 Y132.846 E.01446
G1 X147.733 Y55.699 E2.9039
G1 X147.189 Y55.699 E.01448
G1 X70.586 Y132.302 E2.88342
G1 X70.586 Y131.759 E.01446
G1 X146.645 Y55.7 E2.86294
G1 X146.101 Y55.7 E.01448
G1 X70.586 Y131.216 E2.84246
G1 X70.586 Y130.672 E.01446
G1 X145.557 Y55.701 E2.82198
G1 X145.013 Y55.702 E.01448
G1 X70.586 Y130.129 E2.8015
G1 X70.586 Y129.585 E.01446
G1 X144.469 Y55.702 E2.78102
G1 X143.925 Y55.703 E.01448
G1 X70.586 Y129.042 E2.76054
G1 X70.586 Y128.498 E.01446
G1 X143.381 Y55.704 E2.74006
G1 X142.836 Y55.704 E.01448
G1 X70.586 Y127.955 E2.71958
G1 X70.586 Y127.411 E.01446
G1 X142.292 Y55.705 E2.6991
G1 X141.748 Y55.706 E.01448
G1 X70.586 Y126.868 E2.67862
G1 X70.586 Y126.325 E.01446
G1 X141.204 Y55.706 E2.65814
G1 X140.66 Y55.707 E.01448
G1 X70.586 Y125.781 E2.63766
G1 X70.586 Y125.238 E.01446
G1 X140.116 Y55.707 E2.61718
G1 X139.572 Y55.708 E.01448
G1 X70.586 Y124.694 E2.5967
G1 X70.586 Y124.151 E.01446
G1 X139.028 Y55.709 E2.57622
G1 X138.484 Y55.709 E.01448
G1 X70.586 Y123.607 E2.55574
G1 X70.586 Y123.064 E.01446
G1 X137.94 Y55.71 E2.53527
G1 X137.396 Y55.711 E.01448
G1 X70.586 Y122.52 E2.51479
G1 X70.586 Y121.977 E.01446
G1 X136.852 Y55.711 E2.49431
G1 X136.308 Y55.712 E.01448
G1 X70.586 Y121.434 E2.47383
G1 X70.586 Y120.89 E.01446
G1 X135.763 Y55.713 E2.45335
G1 X135.219 Y55.713 E.01448
G1 X70.586 Y120.347 E2.43287
G1 X70.586 Y119.803 E.01446
G1 X134.675 Y55.714 E2.41239
G1 X134.131 Y55.714 E.01448
G1 X70.586 Y119.26 E2.39191
G1 X70.586 Y118.716 E.01446
G1 X133.587 Y55.715 E2.37143
G1 X133.043 Y55.716 E.01448
G1 X70.586 Y118.173 E2.35095
G1 X70.586 Y117.63 E.01446
G1 X132.499 Y55.716 E2.33047
G1 X131.955 Y55.717 E.01448
G1 X70.586 Y117.086 E2.30999
G1 X70.586 Y116.543 E.01446
G1 X131.411 Y55.718 E2.28951
G1 X130.867 Y55.718 E.01448
G1 X70.586 Y115.999 E2.26903
G1 X70.586 Y115.456 E.01446
G1 X130.323 Y55.719 E2.24855
G1 X129.779 Y55.72 E.01448
G1 X70.586 Y114.912 E2.22807
G1 X70.586 Y114.369 E.01446
G1 X129.235 Y55.72 E2.20759
G1 X128.69 Y55.721 E.01448
G1 X70.586 Y113.825 E2.18711
G1 X70.586 Y113.282 E.01446
G1 X128.146 Y55.721 E2.16663
G1 X127.602 Y55.722 E.01448
G1 X70.586 Y112.739 E2.14615
G1 X70.586 Y112.195 E.01446
G1 X127.058 Y55.723 E2.12567
G1 X126.514 Y55.723 E.01448
G1 X70.586 Y111.652 E2.10519
G1 X70.586 Y111.108 E.01446
G1 X125.97 Y55.724 E2.08472
G1 X125.426 Y55.725 E.01448
G1 X70.586 Y110.565 E2.06424
G1 X70.586 Y110.021 E.01446
G1 X124.882 Y55.725 E2.04376
G1 X124.338 Y55.726 E.01448
G1 X70.586 Y109.478 E2.02328
G1 X70.586 Y108.934 E.01446
G1 X123.794 Y55.727 E2.0028
G1 X123.25 Y55.727 E.01448
G1 X70.586 Y108.391 E1.98232
G1 X70.586 Y107.848 E.01446
G1 X122.706 Y55.728 E1.96184
G1 X122.162 Y55.728 E.01448
G1 X70.586 Y107.304 E1.94136
G1 X70.586 Y106.761 E.01446
G1 X121.618 Y55.729 E1.92088
M73 P21 R50
G1 X121.073 Y55.73 E.01448
G1 X70.586 Y106.217 E1.9004
G1 X70.586 Y105.674 E.01446
G1 X120.529 Y55.73 E1.87992
G1 X119.985 Y55.731 E.01448
G1 X70.586 Y105.13 E1.85944
G1 X70.586 Y104.587 E.01446
G1 X119.441 Y55.732 E1.83896
G1 X118.897 Y55.732 E.01448
G1 X70.586 Y104.044 E1.81848
G1 X70.586 Y103.5 E.01446
G1 X118.353 Y55.733 E1.798
G1 X117.809 Y55.734 E.01448
G1 X70.586 Y102.957 E1.77752
G1 X70.586 Y102.413 E.01446
G1 X117.265 Y55.734 E1.75704
M73 P21 R49
G1 X116.721 Y55.735 E.01448
G1 X70.586 Y101.87 E1.73656
G1 X70.586 Y101.326 E.01446
G1 X116.177 Y55.735 E1.71608
G1 X115.633 Y55.736 E.01448
G1 X70.586 Y100.783 E1.6956
G1 X70.586 Y100.239 E.01446
G1 X115.089 Y55.737 E1.67512
G1 X114.545 Y55.737 E.01448
G1 X70.586 Y99.696 E1.65465
G1 X70.586 Y99.153 E.01446
G1 X114 Y55.738 E1.63417
G1 X113.456 Y55.739 E.01448
G1 X70.586 Y98.609 E1.61369
G1 X70.586 Y98.066 E.01446
G1 X112.912 Y55.739 E1.59321
G1 X112.368 Y55.74 E.01448
G1 X70.586 Y97.522 E1.57273
G1 X70.586 Y96.979 E.01446
G1 X111.824 Y55.741 E1.55225
G1 X111.28 Y55.741 E.01448
G1 X70.586 Y96.435 E1.53177
G1 X70.586 Y95.892 E.01446
G1 X110.736 Y55.742 E1.51129
G1 X110.192 Y55.742 E.01448
G1 X70.586 Y95.349 E1.49081
G1 X70.586 Y94.805 E.01446
G1 X109.648 Y55.743 E1.47033
G1 X109.104 Y55.744 E.01448
G1 X70.586 Y94.262 E1.44985
G1 X70.586 Y93.718 E.01446
G1 X108.56 Y55.744 E1.42937
G1 X108.016 Y55.745 E.01448
G1 X70.586 Y93.175 E1.40889
G1 X70.586 Y92.631 E.01446
G1 X107.472 Y55.746 E1.38841
G1 X106.927 Y55.746 E.01448
G1 X70.586 Y92.088 E1.36793
G1 X70.586 Y91.544 E.01446
G1 X106.383 Y55.747 E1.34745
G1 X105.839 Y55.748 E.01448
G1 X70.586 Y91.001 E1.32697
G1 X70.586 Y90.458 E.01446
G1 X105.295 Y55.748 E1.30649
G1 X104.751 Y55.749 E.01448
G1 X70.586 Y89.914 E1.28601
G1 X70.586 Y89.371 E.01446
G1 X104.207 Y55.749 E1.26553
G1 X103.663 Y55.75 E.01448
G1 X70.586 Y88.827 E1.24505
G1 X70.586 Y88.284 E.01446
G1 X103.119 Y55.751 E1.22457
G1 X102.575 Y55.751 E.01448
G1 X70.586 Y87.74 E1.2041
G1 X70.586 Y87.197 E.01446
G1 X102.031 Y55.752 E1.18362
G1 X101.487 Y55.753 E.01448
G1 X70.586 Y86.653 E1.16314
G1 X70.586 Y86.11 E.01446
G1 X100.943 Y55.753 E1.14266
G1 X100.399 Y55.754 E.01448
G1 X70.586 Y85.567 E1.12218
G1 X70.586 Y85.023 E.01446
G1 X99.854 Y55.755 E1.1017
G1 X99.31 Y55.755 E.01448
G1 X70.586 Y84.48 E1.08122
G1 X70.586 Y83.936 E.01446
G1 X98.766 Y55.756 E1.06074
G1 X98.222 Y55.756 E.01448
G1 X70.586 Y83.393 E1.04026
G1 X70.586 Y82.849 E.01446
G1 X97.678 Y55.757 E1.01978
G1 X97.134 Y55.758 E.01448
G1 X70.586 Y82.306 E.9993
G1 X70.586 Y81.763 E.01446
G1 X96.59 Y55.758 E.97882
G1 X96.046 Y55.759 E.01448
G1 X70.586 Y81.219 E.95834
G1 X70.586 Y80.676 E.01446
G1 X95.502 Y55.76 E.93786
G1 X94.958 Y55.76 E.01448
G1 X70.586 Y80.132 E.91738
G1 X70.586 Y79.589 E.01446
G1 X94.414 Y55.761 E.8969
G1 X93.87 Y55.762 E.01448
G1 X70.586 Y79.045 E.87642
G1 X70.586 Y78.502 E.01446
G1 X93.326 Y55.762 E.85594
G1 X92.781 Y55.763 E.01448
G1 X70.586 Y77.958 E.83546
G1 X70.586 Y77.415 E.01446
G1 X92.237 Y55.763 E.81498
G1 X91.693 Y55.764 E.01448
G1 X70.586 Y76.872 E.7945
G1 X70.586 Y76.328 E.01446
G1 X91.149 Y55.765 E.77402
G1 X90.605 Y55.765 E.01448
G1 X70.586 Y75.785 E.75355
G1 X70.586 Y75.241 E.01446
G1 X90.061 Y55.766 E.73307
G1 X89.517 Y55.767 E.01448
G1 X70.586 Y74.698 E.71259
G1 X70.586 Y74.154 E.01446
G1 X88.973 Y55.767 E.69211
G1 X88.429 Y55.768 E.01448
G1 X70.586 Y73.611 E.67163
G1 X70.586 Y73.067 E.01446
G1 X87.885 Y55.769 E.65115
G1 X87.341 Y55.769 E.01448
G1 X70.586 Y72.524 E.63067
G1 X70.586 Y71.981 E.01446
G1 X86.797 Y55.77 E.61019
G1 X86.253 Y55.77 E.01448
G1 X70.586 Y71.437 E.58971
G1 X70.586 Y70.894 E.01446
G1 X85.708 Y55.771 E.56923
G1 X85.164 Y55.772 E.01448
G1 X70.586 Y70.35 E.54875
G1 X70.586 Y69.807 E.01446
G1 X84.62 Y55.772 E.52827
G1 X84.076 Y55.773 E.01448
G1 X70.586 Y69.263 E.50779
G1 X70.586 Y68.72 E.01446
G1 X83.532 Y55.774 E.48731
G1 X82.988 Y55.774 E.01448
G1 X70.586 Y68.177 E.46683
G1 X70.586 Y67.633 E.01446
G1 X82.444 Y55.775 E.44635
G1 X81.9 Y55.776 E.01448
G1 X70.586 Y67.09 E.42587
G1 X70.586 Y66.546 E.01446
G1 X81.356 Y55.776 E.40539
G1 X80.812 Y55.777 E.01448
G1 X70.586 Y66.003 E.38491
G1 X70.586 Y65.459 E.01446
G1 X80.268 Y55.777 E.36443
G1 X79.724 Y55.778 E.01448
G1 X70.586 Y64.916 E.34395
G1 X70.586 Y64.372 E.01446
G1 X79.18 Y55.779 E.32348
G1 X78.635 Y55.779 E.01448
G1 X70.586 Y63.829 E.303
G1 X70.586 Y63.286 E.01446
G1 X78.091 Y55.78 E.28252
G1 X77.547 Y55.781 E.01448
G1 X70.586 Y62.742 E.26204
G1 X70.586 Y62.199 E.01446
G1 X77.003 Y55.781 E.24156
G1 X76.459 Y55.782 E.01448
G1 X70.586 Y61.655 E.22108
G1 X70.586 Y61.112 E.01446
G1 X75.915 Y55.783 E.2006
G1 X75.371 Y55.783 E.01448
G1 X70.586 Y60.568 E.18012
G1 X70.586 Y60.025 E.01446
G1 X74.827 Y55.784 E.15964
G1 X74.283 Y55.784 E.01448
G1 X70.586 Y59.481 E.13916
G1 X70.586 Y58.938 E.01446
G1 X73.739 Y55.785 E.11868
G1 X73.195 Y55.786 E.01448
G1 X70.586 Y58.395 E.0982
G1 X70.586 Y57.851 E.01446
G1 X72.651 Y55.786 E.07772
G1 X72.107 Y55.787 E.01448
G1 X70.586 Y57.308 E.05724
G1 X70.586 Y56.764 E.01446
G1 X71.562 Y55.788 E.03676
G1 X71.018 Y55.788 E.01448
G1 X70.413 Y56.393 E.02278
; CHANGE_LAYER
; Z_HEIGHT: 0.51
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X71.018 Y55.788 E-.3252
G1 X71.562 Y55.788 E-.20675
G1 X71.138 Y56.212 E-.22805
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 3/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z.74 I-1.15 J.397 P1  F30000
G1 X103.084 Y148.669 Z.74
G1 Z.51
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X103.005 Y148.376 E.00867
G2 X101.758 Y147.56 I-1.213 J.493 E.04541
G1 X70.237 Y147.537 E.9028
G3 X70.053 Y147.377 I-.015 J-.168 E.00781
G1 X70.053 Y55.411 E2.63408
G3 X70.224 Y55.257 I.174 J.021 E.00719
G1 X168.239 Y55.195 E2.80733
G3 X168.402 Y55.428 I-.071 J.223 E.00875
G1 X168.402 Y188.373 E3.80781
G3 X168.162 Y188.602 I-.229 J0 E.0106
G1 X110.075 Y188.561 E1.66373
G3 X109.918 Y188.517 I.006 J-.324 E.00473
G3 X109.863 Y188.385 I.36 J-.229 E.00412
G1 X103.095 Y148.728 E1.15229
G1 X102.702 Y148.795 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X102.698 Y148.77 E.00069
G1 X102.625 Y148.511 E.00713
G2 X101.739 Y147.959 I-.847 J.372 E.02949
G1 X70.208 Y147.936 E.83758
G3 X69.655 Y147.384 I-.009 J-.545 E.02315
G1 X69.655 Y55.404 E2.44337
G3 X70.204 Y54.858 I.534 J-.011 E.02299
G1 X153.171 Y54.795 E2.20393
G1 X168.182 Y54.787 E.39875
G1 X168.328 Y54.804 E.00391
G3 X168.8 Y55.406 I-.141 J.597 E.02194
G1 X168.8 Y188.387 E3.53252
G3 X168.183 Y189 I-.623 J-.01 E.0256
G1 X110.05 Y188.96 E1.54423
G3 X109.474 Y188.477 I-.001 J-.584 E.0217
G1 X102.713 Y148.854 E1.06775
M204 S10000
; WIPE_START
G1 F24000
G1 X102.698 Y148.77 E-.03264
G1 X102.625 Y148.511 E-.10194
G1 X102.525 Y148.327 E-.07975
G1 X102.383 Y148.169 E-.08065
G1 X102.204 Y148.056 E-.08056
G1 X101.987 Y147.982 E-.08702
G1 X101.739 Y147.959 E-.09474
G1 X101.206 Y147.958 E-.20269
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.91 I.765 J.947 P1  F30000
G1 X101.89 Y147.406 Z.91
G1 Z.51
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42079
G1 F15000
G1 X70.392 Y115.908 E1.18573
G1 X70.392 Y116.451 E.01447
G1 X101.162 Y147.221 E1.15832
G1 X100.618 Y147.221 E.01448
G1 X70.392 Y116.995 E1.13784
G1 X70.392 Y117.538 E.01447
G1 X100.074 Y147.22 E1.11737
G1 X99.53 Y147.22 E.01448
G1 X70.392 Y118.082 E1.09689
G1 X70.392 Y118.625 E.01447
G1 X98.986 Y147.219 E1.07642
G1 X98.442 Y147.219 E.01448
G1 X70.392 Y119.169 E1.05594
G1 X70.392 Y119.712 E.01447
G1 X97.899 Y147.219 E1.03547
G1 X97.355 Y147.218 E.01448
G1 X70.392 Y120.256 E1.01499
G1 X70.392 Y120.799 E.01447
G1 X96.811 Y147.218 E.99452
G1 X96.267 Y147.218 E.01448
G1 X70.392 Y121.343 E.97404
G1 X70.392 Y121.886 E.01447
G1 X95.723 Y147.217 E.95357
G1 X95.179 Y147.217 E.01448
G1 X70.392 Y122.43 E.9331
G1 X70.392 Y122.973 E.01447
G1 X94.635 Y147.216 E.91262
G1 X94.091 Y147.216 E.01448
G1 X70.392 Y123.517 E.89215
G1 X70.392 Y124.06 E.01447
G1 X93.547 Y147.216 E.87167
G1 X93.003 Y147.215 E.01448
G1 X70.392 Y124.604 E.8512
G1 X70.392 Y125.147 E.01447
G1 X92.46 Y147.215 E.83072
G1 X91.916 Y147.214 E.01448
G1 X70.392 Y125.691 E.81025
G1 X70.392 Y126.234 E.01447
G1 X91.372 Y147.214 E.78977
G1 X90.828 Y147.214 E.01448
G1 X70.392 Y126.778 E.7693
G1 X70.392 Y127.321 E.01447
G1 X90.284 Y147.213 E.74882
G1 X89.74 Y147.213 E.01448
G1 X70.392 Y127.865 E.72835
G1 X70.392 Y128.408 E.01447
G1 X89.196 Y147.212 E.70787
G1 X88.652 Y147.212 E.01448
G1 X70.392 Y128.952 E.6874
G1 X70.392 Y129.495 E.01447
G1 X88.108 Y147.212 E.66692
G1 X87.565 Y147.211 E.01448
G1 X70.392 Y130.039 E.64645
M73 P22 R49
G1 X70.392 Y130.582 E.01447
G1 X87.021 Y147.211 E.62598
G1 X86.477 Y147.21 E.01448
G1 X70.392 Y131.126 E.6055
G1 X70.392 Y131.669 E.01447
G1 X85.933 Y147.21 E.58503
G1 X85.389 Y147.21 E.01448
G1 X70.392 Y132.213 E.56455
G1 X70.392 Y132.756 E.01447
G1 X84.845 Y147.209 E.54408
G1 X84.301 Y147.209 E.01448
G1 X70.392 Y133.3 E.5236
G1 X70.392 Y133.843 E.01447
G1 X83.757 Y147.208 E.50313
G1 X83.213 Y147.208 E.01448
G1 X70.392 Y134.387 E.48265
G1 X70.392 Y134.93 E.01447
G1 X82.67 Y147.208 E.46218
G1 X82.126 Y147.207 E.01448
G1 X70.392 Y135.474 E.4417
G1 X70.392 Y136.017 E.01447
G1 X81.582 Y147.207 E.42123
G1 X81.038 Y147.206 E.01448
G1 X70.392 Y136.561 E.40075
G1 X70.392 Y137.104 E.01447
G1 X80.494 Y147.206 E.38028
G1 X79.95 Y147.206 E.01448
G1 X70.392 Y137.648 E.3598
G1 X70.392 Y138.191 E.01447
G1 X79.406 Y147.205 E.33933
G1 X78.862 Y147.205 E.01448
G1 X70.392 Y138.735 E.31886
G1 X70.392 Y139.278 E.01447
G1 X78.318 Y147.204 E.29838
G1 X77.774 Y147.204 E.01448
G1 X70.392 Y139.822 E.27791
G1 X70.392 Y140.365 E.01447
G1 X77.231 Y147.204 E.25743
G1 X76.687 Y147.203 E.01448
G1 X70.392 Y140.909 E.23696
G1 X70.392 Y141.452 E.01447
G1 X76.143 Y147.203 E.21648
G1 X75.599 Y147.202 E.01448
G1 X70.392 Y141.996 E.19601
G1 X70.392 Y142.539 E.01447
G1 X75.055 Y147.202 E.17553
G1 X74.511 Y147.202 E.01448
G1 X70.392 Y143.083 E.15506
G1 X70.392 Y143.626 E.01447
G1 X73.967 Y147.201 E.13458
G1 X73.423 Y147.201 E.01448
G1 X70.392 Y144.17 E.11411
G1 X70.392 Y144.713 E.01447
G1 X72.879 Y147.2 E.09363
G1 X72.336 Y147.2 E.01448
G1 X70.392 Y145.257 E.07316
G1 X70.392 Y145.8 E.01447
G1 X71.792 Y147.2 E.05268
G1 X71.248 Y147.199 E.01448
G1 X70.392 Y146.343 E.03221
G1 X70.392 Y146.887 E.01447
G1 X70.877 Y147.371 E.01824
; WIPE_START
G1 F24000
G1 X70.392 Y146.887 E-.26034
G1 X70.392 Y146.343 E-.20653
G1 X70.938 Y146.889 E-.29313
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.91 I-.878 J.843 P1  F30000
G1 X110.814 Y188.396 Z.91
G1 Z.51
G1 E.8 F1800
G1 F15000
G1 X110.083 Y187.665 E.02749
G1 X109.972 Y187.01 E.0177
G1 X111.185 Y188.223 E.04567
G1 X111.729 Y188.224 E.01448
G1 X109.86 Y186.355 E.07036
G1 X109.748 Y185.699 E.0177
G1 X112.273 Y188.224 E.09504
G1 X112.817 Y188.224 E.01448
G1 X109.636 Y185.044 E.11973
G1 X109.524 Y184.389 E.0177
G1 X113.36 Y188.225 E.14441
G1 X113.904 Y188.225 E.01448
G1 X109.413 Y183.733 E.16909
G1 X109.301 Y183.078 E.0177
G1 X114.448 Y188.226 E.19378
G1 X114.992 Y188.226 E.01448
G1 X109.189 Y182.423 E.21846
G1 X109.077 Y181.767 E.0177
G1 X115.536 Y188.226 E.24314
G1 X116.08 Y188.227 E.01448
G1 X108.965 Y181.112 E.26783
G1 X108.853 Y180.457 E.0177
G1 X116.624 Y188.227 E.29251
G1 X117.168 Y188.227 E.01448
G1 X108.742 Y179.801 E.31719
G1 X108.63 Y179.146 E.0177
G1 X117.711 Y188.228 E.34188
G1 X118.255 Y188.228 E.01448
G1 X108.518 Y178.491 E.36656
G1 X108.406 Y177.835 E.0177
G1 X118.799 Y188.229 E.39125
G1 X119.343 Y188.229 E.01448
G1 X108.294 Y177.18 E.41593
G1 X108.182 Y176.525 E.0177
G1 X119.887 Y188.229 E.44061
G1 X120.431 Y188.23 E.01448
G1 X108.071 Y175.87 E.4653
G1 X107.959 Y175.214 E.0177
G1 X120.975 Y188.23 E.48998
G1 X121.519 Y188.231 E.01448
G1 X107.847 Y174.559 E.51466
G1 X107.735 Y173.904 E.0177
G1 X122.062 Y188.231 E.53935
G1 X122.606 Y188.231 E.01448
G1 X107.623 Y173.248 E.56403
G1 X107.511 Y172.593 E.0177
G1 X123.15 Y188.232 E.58872
G1 X123.694 Y188.232 E.01448
G1 X107.4 Y171.938 E.6134
G1 X107.288 Y171.282 E.0177
G1 X124.238 Y188.232 E.63808
G1 X124.782 Y188.233 E.01448
G1 X107.176 Y170.627 E.66277
G1 X107.064 Y169.972 E.0177
G1 X125.326 Y188.233 E.68745
G1 X125.87 Y188.234 E.01448
G1 X106.952 Y169.316 E.71213
G1 X106.84 Y168.661 E.0177
G1 X126.413 Y188.234 E.73682
G1 X126.957 Y188.234 E.01448
G1 X106.729 Y168.006 E.7615
G1 X106.617 Y167.35 E.0177
G1 X127.501 Y188.235 E.78619
G1 X128.045 Y188.235 E.01448
G1 X106.505 Y166.695 E.81087
G1 X106.393 Y166.04 E.0177
G1 X128.589 Y188.235 E.83555
G1 X129.133 Y188.236 E.01448
G1 X106.281 Y165.384 E.86024
G1 X106.169 Y164.729 E.0177
G1 X129.677 Y188.236 E.88492
G1 X130.221 Y188.237 E.01448
G1 X106.058 Y164.074 E.9096
G1 X105.946 Y163.418 E.0177
G1 X130.764 Y188.237 E.93429
G1 X131.308 Y188.237 E.01448
G1 X105.834 Y162.763 E.95897
G1 X105.722 Y162.108 E.0177
G1 X131.852 Y188.238 E.98366
G1 X132.396 Y188.238 E.01448
G1 X105.61 Y161.452 E1.00834
G1 X105.499 Y160.797 E.0177
G1 X132.94 Y188.239 E1.03302
G1 X133.484 Y188.239 E.01448
G1 X105.387 Y160.142 E1.05771
G1 X105.275 Y159.486 E.0177
G1 X134.028 Y188.239 E1.08239
G1 X134.572 Y188.24 E.01448
G1 X105.163 Y158.831 E1.10707
G1 X105.051 Y158.176 E.0177
G1 X135.115 Y188.24 E1.13176
G1 X135.659 Y188.24 E.01448
G1 X104.939 Y157.52 E1.15644
G1 X104.828 Y156.865 E.0177
G1 X136.203 Y188.241 E1.18112
G1 X136.747 Y188.241 E.01448
G1 X104.716 Y156.21 E1.20581
G1 X104.604 Y155.555 E.0177
G1 X137.291 Y188.242 E1.23049
G1 X137.835 Y188.242 E.01448
G1 X104.492 Y154.899 E1.25518
G1 X104.38 Y154.244 E.0177
G1 X138.379 Y188.242 E1.27986
G1 X138.923 Y188.243 E.01448
G1 X104.268 Y153.589 E1.30454
G1 X104.157 Y152.933 E.0177
G1 X139.466 Y188.243 E1.32923
G1 X140.01 Y188.243 E.01448
G1 X104.045 Y152.278 E1.35391
G1 X103.933 Y151.623 E.0177
G1 X140.554 Y188.244 E1.37859
G1 X141.098 Y188.244 E.01448
G1 X103.821 Y150.967 E1.40328
G1 X103.709 Y150.312 E.0177
G1 X141.642 Y188.245 E1.42796
G1 X142.186 Y188.245 E.01448
G1 X103.597 Y149.657 E1.45265
G1 X103.486 Y149.001 E.0177
G1 X142.73 Y188.245 E1.47733
G1 X143.274 Y188.246 E.01448
G1 X70.392 Y115.364 E2.7436
G1 X70.392 Y114.821 E.01447
G1 X143.817 Y188.246 E2.76407
G1 X144.361 Y188.247 E.01448
G1 X70.392 Y114.277 E2.78454
G1 X70.392 Y113.734 E.01447
G1 X144.905 Y188.247 E2.80502
G1 X145.449 Y188.247 E.01448
G1 X70.392 Y113.19 E2.82549
G1 X70.392 Y112.647 E.01447
G1 X145.993 Y188.248 E2.84597
G1 X146.537 Y188.248 E.01448
G1 X70.392 Y112.103 E2.86644
G1 X70.392 Y111.56 E.01447
G1 X147.081 Y188.248 E2.88691
G1 X147.625 Y188.249 E.01448
G1 X70.392 Y111.016 E2.90739
G1 X70.392 Y110.473 E.01447
G1 X148.168 Y188.249 E2.92786
G1 X148.712 Y188.25 E.01448
G1 X70.392 Y109.929 E2.94833
G1 X70.392 Y109.386 E.01447
G1 X149.256 Y188.25 E2.96881
G1 X149.8 Y188.25 E.01448
G1 X70.392 Y108.842 E2.98928
G1 X70.392 Y108.299 E.01447
G1 X150.344 Y188.251 E3.00976
G1 X150.888 Y188.251 E.01448
G1 X70.392 Y107.755 E3.03023
G1 X70.392 Y107.212 E.01447
G1 X151.432 Y188.251 E3.0507
G1 X151.976 Y188.252 E.01448
G1 X70.392 Y106.668 E3.07118
G1 X70.392 Y106.125 E.01447
G1 X152.519 Y188.252 E3.09165
G1 X153.063 Y188.253 E.01448
G1 X70.392 Y105.581 E3.11213
G1 X70.392 Y105.038 E.01447
G1 X153.607 Y188.253 E3.1326
G1 X154.151 Y188.253 E.01448
G1 X70.392 Y104.494 E3.15307
G1 X70.392 Y103.951 E.01447
G1 X154.695 Y188.254 E3.17355
G1 X155.239 Y188.254 E.01448
G1 X70.392 Y103.408 E3.19402
G1 X70.392 Y102.864 E.01447
G1 X155.783 Y188.254 E3.2145
G1 X156.327 Y188.255 E.01448
G1 X70.392 Y102.321 E3.23497
G1 X70.392 Y101.777 E.01447
G1 X156.87 Y188.255 E3.25544
G1 X157.414 Y188.256 E.01448
G1 X70.392 Y101.234 E3.27592
G1 X70.392 Y100.69 E.01447
G1 X157.958 Y188.256 E3.29639
G1 X158.502 Y188.256 E.01448
G1 X70.392 Y100.147 E3.31687
G1 X70.392 Y99.603 E.01447
G1 X159.046 Y188.257 E3.33734
G1 X159.59 Y188.257 E.01448
G1 X70.392 Y99.06 E3.35781
G1 X70.392 Y98.516 E.01447
G1 X160.134 Y188.258 E3.37829
G1 X160.678 Y188.258 E.01448
G1 X70.392 Y97.973 E3.39876
G1 X70.392 Y97.429 E.01447
G1 X161.221 Y188.258 E3.41924
G1 X161.765 Y188.259 E.01448
G1 X70.392 Y96.886 E3.43971
G1 X70.392 Y96.342 E.01447
G1 X162.309 Y188.259 E3.46018
G1 X162.853 Y188.259 E.01448
G1 X70.392 Y95.799 E3.48066
G1 X70.392 Y95.255 E.01447
G1 X163.397 Y188.26 E3.50113
G1 X163.941 Y188.26 E.01448
G1 X70.392 Y94.712 E3.52161
G1 X70.392 Y94.168 E.01447
G1 X164.485 Y188.261 E3.54208
G1 X165.028 Y188.261 E.01448
G1 X70.392 Y93.625 E3.56255
G1 X70.392 Y93.081 E.01447
G1 X165.572 Y188.261 E3.58303
G1 X166.116 Y188.262 E.01448
G1 X70.392 Y92.538 E3.6035
G1 X70.392 Y91.994 E.01447
G1 X166.66 Y188.262 E3.62398
G1 X167.204 Y188.262 E.01448
G1 X70.392 Y91.451 E3.64445
M73 P22 R48
G1 X70.392 Y90.907 E.01447
G1 X167.748 Y188.263 E3.66492
G1 X168.063 Y188.263 E.00838
G1 X168.063 Y188.034 E.00609
G1 X70.392 Y90.364 E3.67678
G1 X70.392 Y89.82 E.01447
G1 X168.063 Y187.491 E3.67678
G1 X168.063 Y186.947 E.01447
G1 X70.392 Y89.277 E3.67678
G1 X70.392 Y88.733 E.01447
G1 X168.063 Y186.404 E3.67678
G1 X168.063 Y185.86 E.01447
G1 X70.392 Y88.19 E3.67678
G1 X70.392 Y87.646 E.01447
G1 X168.063 Y185.317 E3.67678
G1 X168.063 Y184.773 E.01447
G1 X70.392 Y87.103 E3.67678
G1 X70.392 Y86.559 E.01447
G1 X168.063 Y184.23 E3.67678
G1 X168.063 Y183.686 E.01447
G1 X70.392 Y86.016 E3.67678
G1 X70.392 Y85.472 E.01447
G1 X168.063 Y183.143 E3.67678
G1 X168.063 Y182.599 E.01447
G1 X70.392 Y84.929 E3.67678
G1 X70.392 Y84.385 E.01447
G1 X168.063 Y182.056 E3.67678
G1 X168.063 Y181.512 E.01447
G1 X70.392 Y83.842 E3.67678
G1 X70.392 Y83.298 E.01447
G1 X168.063 Y180.969 E3.67678
G1 X168.063 Y180.425 E.01447
G1 X70.392 Y82.755 E3.67678
G1 X70.392 Y82.211 E.01447
G1 X168.063 Y179.882 E3.67678
G1 X168.063 Y179.338 E.01447
G1 X70.392 Y81.668 E3.67678
G1 X70.392 Y81.124 E.01447
G1 X168.063 Y178.795 E3.67678
G1 X168.063 Y178.251 E.01447
G1 X70.392 Y80.581 E3.67678
G1 X70.392 Y80.037 E.01447
G1 X168.063 Y177.708 E3.67678
G1 X168.063 Y177.164 E.01447
G1 X70.392 Y79.494 E3.67678
G1 X70.392 Y78.95 E.01447
M73 P23 R48
G1 X168.063 Y176.621 E3.67678
G1 X168.063 Y176.077 E.01447
G1 X70.392 Y78.407 E3.67678
G1 X70.392 Y77.863 E.01447
G1 X168.063 Y175.534 E3.67678
G1 X168.063 Y174.99 E.01447
G1 X70.392 Y77.32 E3.67678
G1 X70.392 Y76.776 E.01447
G1 X168.063 Y174.447 E3.67678
G1 X168.063 Y173.903 E.01447
G1 X70.392 Y76.233 E3.67678
G1 X70.392 Y75.689 E.01447
G1 X168.063 Y173.36 E3.67678
G1 X168.063 Y172.816 E.01447
G1 X70.392 Y75.146 E3.67678
G1 X70.392 Y74.602 E.01447
G1 X168.063 Y172.273 E3.67678
G1 X168.063 Y171.729 E.01447
G1 X70.392 Y74.059 E3.67678
G1 X70.392 Y73.515 E.01447
G1 X168.063 Y171.186 E3.67678
G1 X168.063 Y170.643 E.01447
G1 X70.392 Y72.972 E3.67678
G1 X70.392 Y72.428 E.01447
G1 X168.063 Y170.099 E3.67678
G1 X168.063 Y169.556 E.01447
G1 X70.392 Y71.885 E3.67678
G1 X70.392 Y71.341 E.01447
G1 X168.063 Y169.012 E3.67678
G1 X168.063 Y168.469 E.01447
G1 X70.392 Y70.798 E3.67678
G1 X70.392 Y70.254 E.01447
G1 X168.063 Y167.925 E3.67678
G1 X168.063 Y167.382 E.01447
G1 X70.392 Y69.711 E3.67678
G1 X70.392 Y69.167 E.01447
G1 X168.063 Y166.838 E3.67678
G1 X168.063 Y166.295 E.01447
G1 X70.392 Y68.624 E3.67678
G1 X70.392 Y68.08 E.01447
G1 X168.063 Y165.751 E3.67678
G1 X168.063 Y165.208 E.01447
G1 X70.392 Y67.537 E3.67678
G1 X70.392 Y66.993 E.01447
G1 X168.063 Y164.664 E3.67678
G1 X168.063 Y164.121 E.01447
G1 X70.392 Y66.45 E3.67678
G1 X70.392 Y65.906 E.01447
G1 X168.063 Y163.577 E3.67678
G1 X168.063 Y163.034 E.01447
G1 X70.392 Y65.363 E3.67678
G1 X70.392 Y64.819 E.01447
G1 X168.063 Y162.49 E3.67678
G1 X168.063 Y161.947 E.01447
G1 X70.392 Y64.276 E3.67678
G1 X70.392 Y63.732 E.01447
G1 X168.063 Y161.403 E3.67678
G1 X168.063 Y160.86 E.01447
G1 X70.392 Y63.189 E3.67678
G1 X70.392 Y62.645 E.01447
G1 X168.063 Y160.316 E3.67678
G1 X168.063 Y159.773 E.01447
G1 X70.392 Y62.102 E3.67678
G1 X70.392 Y61.558 E.01447
G1 X168.063 Y159.229 E3.67678
G1 X168.063 Y158.686 E.01447
G1 X70.392 Y61.015 E3.67678
G1 X70.392 Y60.472 E.01447
G1 X168.063 Y158.142 E3.67678
G1 X168.063 Y157.599 E.01447
G1 X70.392 Y59.928 E3.67678
G1 X70.392 Y59.385 E.01447
G1 X168.063 Y157.055 E3.67678
G1 X168.063 Y156.512 E.01447
G1 X70.392 Y58.841 E3.67678
G1 X70.392 Y58.298 E.01447
G1 X168.063 Y155.968 E3.67678
G1 X168.063 Y155.425 E.01447
G1 X70.392 Y57.754 E3.67678
G1 X70.392 Y57.211 E.01447
G1 X168.063 Y154.881 E3.67678
G1 X168.063 Y154.338 E.01447
G1 X70.392 Y56.667 E3.67678
G1 X70.392 Y56.124 E.01447
G1 X168.063 Y153.794 E3.67678
G1 X168.063 Y153.251 E.01447
G1 X70.408 Y55.595 E3.6762
G1 X70.951 Y55.595 E.01446
G1 X168.063 Y152.707 E3.65575
G1 X168.063 Y152.164 E.01447
G1 X71.494 Y55.595 E3.63531
G1 X72.037 Y55.594 E.01446
G1 X168.063 Y151.62 E3.61486
G1 X168.063 Y151.077 E.01447
G1 X72.58 Y55.594 E3.59441
G1 X73.123 Y55.594 E.01446
G1 X168.063 Y150.533 E3.57397
G1 X168.063 Y149.99 E.01447
G1 X73.666 Y55.593 E3.55352
G1 X74.21 Y55.593 E.01446
G1 X168.063 Y149.446 E3.53307
G1 X168.063 Y148.903 E.01447
G1 X74.753 Y55.593 E3.51263
G1 X75.296 Y55.592 E.01446
G1 X168.063 Y148.359 E3.49218
G1 X168.063 Y147.816 E.01447
G1 X75.839 Y55.592 E3.47173
G1 X76.382 Y55.592 E.01446
G1 X168.063 Y147.272 E3.45129
G1 X168.063 Y146.729 E.01447
G1 X76.925 Y55.591 E3.43084
G1 X77.468 Y55.591 E.01446
G1 X168.063 Y146.185 E3.41039
G1 X168.063 Y145.642 E.01447
G1 X78.012 Y55.591 E3.38995
G1 X78.555 Y55.59 E.01446
G1 X168.063 Y145.098 E3.3695
G1 X168.063 Y144.555 E.01447
G1 X79.098 Y55.59 E3.34905
G1 X79.641 Y55.59 E.01446
G1 X168.063 Y144.011 E3.32861
G1 X168.063 Y143.468 E.01447
G1 X80.184 Y55.589 E3.30816
G1 X80.727 Y55.589 E.01446
G1 X168.063 Y142.924 E3.28771
G1 X168.063 Y142.381 E.01447
G1 X81.271 Y55.589 E3.26727
G1 X81.814 Y55.588 E.01446
G1 X168.063 Y141.837 E3.24682
G1 X168.063 Y141.294 E.01447
G1 X82.357 Y55.588 E3.22637
M73 P24 R48
G1 X82.9 Y55.588 E.01446
G1 X168.063 Y140.75 E3.20593
G1 X168.063 Y140.207 E.01447
G1 X83.443 Y55.587 E3.18548
G1 X83.986 Y55.587 E.01446
G1 X168.063 Y139.663 E3.16503
G1 X168.063 Y139.12 E.01447
G1 X84.529 Y55.587 E3.14459
G1 X85.073 Y55.586 E.01446
G1 X168.063 Y138.576 E3.12414
G1 X168.063 Y138.033 E.01447
G1 X85.616 Y55.586 E3.10369
G1 X86.159 Y55.585 E.01446
G1 X168.063 Y137.489 E3.08325
G1 X168.063 Y136.946 E.01447
G1 X86.702 Y55.585 E3.0628
G1 X87.245 Y55.585 E.01446
G1 X168.063 Y136.402 E3.04235
G1 X168.063 Y135.859 E.01447
G1 X87.788 Y55.584 E3.0219
G1 X88.331 Y55.584 E.01446
G1 X168.063 Y135.315 E3.00146
G1 X168.063 Y134.772 E.01447
G1 X88.875 Y55.584 E2.98101
G1 X89.418 Y55.583 E.01446
G1 X168.063 Y134.228 E2.96056
G1 X168.063 Y133.685 E.01447
G1 X89.961 Y55.583 E2.94012
G1 X90.504 Y55.583 E.01446
G1 X168.063 Y133.141 E2.91967
G1 X168.063 Y132.598 E.01447
G1 X91.047 Y55.582 E2.89922
M73 P24 R47
G1 X91.59 Y55.582 E.01446
G1 X168.063 Y132.054 E2.87878
G1 X168.063 Y131.511 E.01447
G1 X92.134 Y55.582 E2.85833
G1 X92.677 Y55.581 E.01446
G1 X168.063 Y130.967 E2.83788
G1 X168.063 Y130.424 E.01447
G1 X93.22 Y55.581 E2.81744
G1 X93.763 Y55.581 E.01446
G1 X168.063 Y129.88 E2.79699
G1 X168.063 Y129.337 E.01447
G1 X94.306 Y55.58 E2.77654
G1 X94.849 Y55.58 E.01446
G1 X168.063 Y128.794 E2.7561
G1 X168.063 Y128.25 E.01447
G1 X95.392 Y55.58 E2.73565
G1 X95.936 Y55.579 E.01446
G1 X168.063 Y127.707 E2.7152
G1 X168.063 Y127.163 E.01447
G1 X96.479 Y55.579 E2.69476
G1 X97.022 Y55.579 E.01446
G1 X168.063 Y126.62 E2.67431
G1 X168.063 Y126.076 E.01447
G1 X97.565 Y55.578 E2.65386
G1 X98.108 Y55.578 E.01446
G1 X168.063 Y125.533 E2.63342
G1 X168.063 Y124.989 E.01447
G1 X98.651 Y55.578 E2.61297
G1 X99.194 Y55.577 E.01446
G1 X168.063 Y124.446 E2.59252
G1 X168.063 Y123.902 E.01447
G1 X99.738 Y55.577 E2.57208
G1 X100.281 Y55.577 E.01446
G1 X168.063 Y123.359 E2.55163
G1 X168.063 Y122.815 E.01447
G1 X100.824 Y55.576 E2.53118
G1 X101.367 Y55.576 E.01446
G1 X168.063 Y122.272 E2.51074
G1 X168.063 Y121.728 E.01447
G1 X101.91 Y55.576 E2.49029
G1 X102.453 Y55.575 E.01446
G1 X168.063 Y121.185 E2.46984
G1 X168.063 Y120.641 E.01447
G1 X102.997 Y55.575 E2.4494
G1 X103.54 Y55.574 E.01446
G1 X168.063 Y120.098 E2.42895
G1 X168.063 Y119.554 E.01447
G1 X104.083 Y55.574 E2.4085
G1 X104.626 Y55.574 E.01446
G1 X168.063 Y119.011 E2.38806
G1 X168.063 Y118.467 E.01447
G1 X105.169 Y55.573 E2.36761
G1 X105.712 Y55.573 E.01446
G1 X168.063 Y117.924 E2.34716
G1 X168.063 Y117.38 E.01447
G1 X106.255 Y55.573 E2.32672
G1 X106.799 Y55.572 E.01446
G1 X168.063 Y116.837 E2.30627
G1 X168.063 Y116.293 E.01447
G1 X107.342 Y55.572 E2.28582
G1 X107.885 Y55.572 E.01446
G1 X168.063 Y115.75 E2.26538
G1 X168.063 Y115.206 E.01447
G1 X108.428 Y55.571 E2.24493
G1 X108.971 Y55.571 E.01446
G1 X168.063 Y114.663 E2.22448
G1 X168.063 Y114.119 E.01447
G1 X109.514 Y55.571 E2.20404
G1 X110.057 Y55.57 E.01446
G1 X168.063 Y113.576 E2.18359
G1 X168.063 Y113.032 E.01447
G1 X110.601 Y55.57 E2.16314
G1 X111.144 Y55.57 E.01446
G1 X168.063 Y112.489 E2.1427
G1 X168.063 Y111.945 E.01447
G1 X111.687 Y55.569 E2.12225
G1 X112.23 Y55.569 E.01446
G1 X168.063 Y111.402 E2.1018
G1 X168.063 Y110.858 E.01447
G1 X112.773 Y55.569 E2.08136
G1 X113.316 Y55.568 E.01446
G1 X168.063 Y110.315 E2.06091
G1 X168.063 Y109.771 E.01447
G1 X113.86 Y55.568 E2.04046
G1 X114.403 Y55.568 E.01446
G1 X168.063 Y109.228 E2.02002
G1 X168.063 Y108.684 E.01447
G1 X114.946 Y55.567 E1.99957
G1 X115.489 Y55.567 E.01446
G1 X168.063 Y108.141 E1.97912
G1 X168.063 Y107.597 E.01447
G1 X116.032 Y55.567 E1.95868
G1 X116.575 Y55.566 E.01446
G1 X168.063 Y107.054 E1.93823
G1 X168.063 Y106.51 E.01447
G1 X117.118 Y55.566 E1.91778
G1 X117.662 Y55.566 E.01446
G1 X168.063 Y105.967 E1.89734
G1 X168.063 Y105.423 E.01447
G1 X118.205 Y55.565 E1.87689
G1 X118.748 Y55.565 E.01446
G1 X168.063 Y104.88 E1.85644
G1 X168.063 Y104.336 E.01447
G1 X119.291 Y55.565 E1.836
G1 X119.834 Y55.564 E.01446
G1 X168.063 Y103.793 E1.81555
G1 X168.063 Y103.249 E.01447
G1 X120.377 Y55.564 E1.7951
G1 X120.92 Y55.564 E.01446
G1 X168.063 Y102.706 E1.77466
G1 X168.063 Y102.162 E.01447
G1 X121.464 Y55.563 E1.75421
G1 X122.007 Y55.563 E.01446
G1 X168.063 Y101.619 E1.73376
G1 X168.063 Y101.075 E.01447
G1 X122.55 Y55.562 E1.71332
G1 X123.093 Y55.562 E.01446
G1 X168.063 Y100.532 E1.69287
G1 X168.063 Y99.988 E.01447
G1 X123.636 Y55.562 E1.67242
G1 X124.179 Y55.561 E.01446
G1 X168.063 Y99.445 E1.65198
G1 X168.063 Y98.901 E.01447
G1 X124.723 Y55.561 E1.63153
G1 X125.266 Y55.561 E.01446
G1 X168.063 Y98.358 E1.61108
G1 X168.063 Y97.814 E.01447
G1 X125.809 Y55.56 E1.59064
M73 P25 R47
G1 X126.352 Y55.56 E.01446
G1 X168.063 Y97.271 E1.57019
G1 X168.063 Y96.727 E.01447
G1 X126.895 Y55.56 E1.54974
G1 X127.438 Y55.559 E.01446
G1 X168.063 Y96.184 E1.5293
G1 X168.063 Y95.64 E.01447
G1 X127.981 Y55.559 E1.50885
G1 X128.525 Y55.559 E.01446
G1 X168.063 Y95.097 E1.4884
G1 X168.063 Y94.553 E.01447
G1 X129.068 Y55.558 E1.46796
G1 X129.611 Y55.558 E.01446
G1 X168.063 Y94.01 E1.44751
G1 X168.063 Y93.466 E.01447
G1 X130.154 Y55.558 E1.42706
G1 X130.697 Y55.557 E.01446
G1 X168.063 Y92.923 E1.40662
G1 X168.063 Y92.379 E.01447
G1 X131.24 Y55.557 E1.38617
G1 X131.783 Y55.557 E.01446
G1 X168.063 Y91.836 E1.36572
G1 X168.063 Y91.292 E.01447
G1 X132.327 Y55.556 E1.34528
G1 X132.87 Y55.556 E.01446
G1 X168.063 Y90.749 E1.32483
G1 X168.063 Y90.205 E.01447
G1 X133.413 Y55.556 E1.30438
G1 X133.956 Y55.555 E.01446
G1 X168.063 Y89.662 E1.28394
G1 X168.063 Y89.118 E.01447
G1 X134.499 Y55.555 E1.26349
G1 X135.042 Y55.555 E.01446
G1 X168.063 Y88.575 E1.24304
G1 X168.063 Y88.031 E.01447
G1 X135.586 Y55.554 E1.2226
G1 X136.129 Y55.554 E.01446
G1 X168.063 Y87.488 E1.20215
G1 X168.063 Y86.944 E.01447
G1 X136.672 Y55.554 E1.1817
G1 X137.215 Y55.553 E.01446
G1 X168.063 Y86.401 E1.16126
G1 X168.063 Y85.858 E.01447
G1 X137.758 Y55.553 E1.14081
G1 X138.301 Y55.553 E.01446
G1 X168.063 Y85.314 E1.12036
G1 X168.063 Y84.771 E.01447
G1 X138.844 Y55.552 E1.09992
G1 X139.388 Y55.552 E.01446
G1 X168.063 Y84.227 E1.07947
G1 X168.063 Y83.684 E.01447
G1 X139.931 Y55.551 E1.05902
G1 X140.474 Y55.551 E.01446
G1 X168.063 Y83.14 E1.03857
G1 X168.063 Y82.597 E.01447
G1 X141.017 Y55.551 E1.01813
G1 X141.56 Y55.55 E.01446
G1 X168.063 Y82.053 E.99768
G1 X168.063 Y81.51 E.01447
G1 X142.103 Y55.55 E.97723
G1 X142.646 Y55.55 E.01446
G1 X168.063 Y80.966 E.95679
G1 X168.063 Y80.423 E.01447
G1 X143.19 Y55.549 E.93634
G1 X143.733 Y55.549 E.01446
G1 X168.063 Y79.879 E.91589
G1 X168.063 Y79.336 E.01447
G1 X144.276 Y55.549 E.89545
G1 X144.819 Y55.548 E.01446
G1 X168.063 Y78.792 E.875
G1 X168.063 Y78.249 E.01447
G1 X145.362 Y55.548 E.85455
G1 X145.905 Y55.548 E.01446
G1 X168.063 Y77.705 E.83411
G1 X168.063 Y77.162 E.01447
G1 X146.449 Y55.547 E.81366
G1 X146.992 Y55.547 E.01446
G1 X168.063 Y76.618 E.79321
G1 X168.063 Y76.075 E.01447
G1 X147.535 Y55.547 E.77277
G1 X148.078 Y55.546 E.01446
G1 X168.063 Y75.531 E.75232
G1 X168.063 Y74.988 E.01447
G1 X148.621 Y55.546 E.73187
G1 X149.164 Y55.546 E.01446
G1 X168.063 Y74.444 E.71143
G1 X168.063 Y73.901 E.01447
G1 X149.707 Y55.545 E.69098
G1 X150.251 Y55.545 E.01446
G1 X168.063 Y73.357 E.67053
G1 X168.063 Y72.814 E.01447
G1 X150.794 Y55.545 E.65009
G1 X151.337 Y55.544 E.01446
G1 X168.063 Y72.27 E.62964
G1 X168.063 Y71.727 E.01447
G1 X151.88 Y55.544 E.60919
G1 X152.423 Y55.544 E.01446
G1 X168.063 Y71.183 E.58875
G1 X168.063 Y70.64 E.01447
G1 X152.966 Y55.543 E.5683
G1 X153.509 Y55.543 E.01446
G1 X168.063 Y70.096 E.54785
G1 X168.063 Y69.553 E.01447
G1 X154.053 Y55.543 E.52741
G1 X154.596 Y55.542 E.01446
G1 X168.063 Y69.009 E.50696
G1 X168.063 Y68.466 E.01447
G1 X155.139 Y55.542 E.48651
G1 X155.682 Y55.542 E.01446
G1 X168.063 Y67.922 E.46607
G1 X168.063 Y67.379 E.01447
G1 X156.225 Y55.541 E.44562
G1 X156.768 Y55.541 E.01446
G1 X168.063 Y66.835 E.42517
G1 X168.063 Y66.292 E.01447
G1 X157.312 Y55.54 E.40473
G1 X157.855 Y55.54 E.01446
G1 X168.063 Y65.748 E.38428
G1 X168.063 Y65.205 E.01447
G1 X158.398 Y55.54 E.36383
G1 X158.941 Y55.539 E.01446
G1 X168.063 Y64.661 E.34339
G1 X168.063 Y64.118 E.01447
G1 X159.484 Y55.539 E.32294
G1 X160.027 Y55.539 E.01446
G1 X168.063 Y63.574 E.30249
G1 X168.063 Y63.031 E.01447
G1 X160.57 Y55.538 E.28205
G1 X161.114 Y55.538 E.01446
G1 X168.063 Y62.487 E.2616
G1 X168.063 Y61.944 E.01447
G1 X161.657 Y55.538 E.24115
G1 X162.2 Y55.537 E.01446
G1 X168.063 Y61.4 E.22071
G1 X168.063 Y60.857 E.01447
G1 X162.743 Y55.537 E.20026
G1 X163.286 Y55.537 E.01446
G1 X168.063 Y60.313 E.17981
G1 X168.063 Y59.77 E.01447
G1 X163.829 Y55.536 E.15937
G1 X164.372 Y55.536 E.01446
G1 X168.063 Y59.226 E.13892
G1 X168.063 Y58.683 E.01447
G1 X164.916 Y55.536 E.11847
G1 X165.459 Y55.535 E.01446
G1 X168.063 Y58.139 E.09803
G1 X168.063 Y57.596 E.01447
G1 X166.002 Y55.535 E.07758
G1 X166.545 Y55.535 E.01446
G1 X168.063 Y57.052 E.05713
G1 X168.063 Y56.509 E.01447
G1 X167.088 Y55.534 E.03669
G1 X167.631 Y55.534 E.01446
G1 X168.235 Y56.138 E.02274
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X167.631 Y55.534 E-.32458
G1 X167.088 Y55.534 E-.2064
G1 X167.514 Y55.96 E-.22902
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 4/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S229.5
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z.91 I-.997 J-.698 P1  F30000
G1 X102.81 Y148.364 Z.91
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X102.749 Y148.261 E.00343
G2 X101.573 Y147.672 I-1.162 J.851 E.03912
G1 X70.228 Y147.657 E.89777
G3 X69.934 Y147.37 I-.018 J-.276 E.01329
G1 X69.934 Y55.417 E2.63371
G3 X70.213 Y55.136 I.267 J-.015 E.01281
G1 X168.259 Y55.099 E2.80823
G3 X168.499 Y55.428 I-.099 J.325 E.0125
G1 X168.499 Y188.376 E3.8079
G3 X168.168 Y188.699 I-.325 J-.002 E.01475
G1 X110.064 Y188.671 E1.66422
G3 X109.756 Y188.412 I-.007 J-.304 E.01259
G1 X103.009 Y148.885 E1.14851
G2 X102.919 Y148.565 I-1.422 J.227 E.00955
G1 X102.839 Y148.417 E.00482
G1 X102.573 Y148.806 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X102.546 Y148.716 E.00249
G2 X101.656 Y148.082 I-.92 J.35 E.03078
G1 F12000
G1 X70.205 Y148.056 E.83546
G3 X69.535 Y147.386 I-.003 J-.667 E.028
G1 X69.535 Y55.402 E2.44346
G3 X70.2 Y54.737 I.665 J.001 E.02773
G1 X168.182 Y54.69 E2.60278
G1 X168.348 Y54.708 E.00445
G3 X168.898 Y55.406 I-.161 J.692 E.02548
G1 X168.898 Y188.388 E3.53254
G3 X168.185 Y189.098 I-.729 J-.019 E.0295
G1 X110.046 Y189.07 E1.54439
G3 X109.366 Y188.498 I.01 J-.703 E.02555
G1 X104.042 Y157.286 E.8411
G1 X102.59 Y148.868 E.22691
G1 F3000
G1 X102.589 Y148.864 E.00012
M204 S10000
; WIPE_START
G1 F24000
G1 X102.546 Y148.716 E-.05843
G1 X102.426 Y148.492 E-.09684
G1 X102.262 Y148.313 E-.09211
G1 X102.058 Y148.181 E-.0921
G1 X101.817 Y148.099 E-.09686
G1 X101.656 Y148.082 E-.06154
G1 X100.966 Y148.081 E-.26211
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.08 I.376 J1.157 P1  F30000
G1 X103.026 Y147.412 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.406214
G1 F15000
G1 X102.755 Y147.292 E.00758
G1 X102.082 Y147.294 E.01724
G1 X102.047 Y147.324 E.0012
G1 X102.072 Y147.365 E.00123
G1 X102.426 Y147.474 E.00948
G1 X102.793 Y147.721 E.01133
G1 X103.084 Y148.06 E.01144
G1 X103.235 Y148.374 E.00892
G1 X103.308 Y148.349 E.00197
G1 X103.194 Y147.679 E.0174
G1 X103.058 Y147.462 E.00655
G1 X104.872 Y157.7 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X105.151 Y159.331 E.04738
G1 X168.146 Y96.336 E2.55166
G1 X168.146 Y92.87 E.09926
G1 X130.742 Y55.467 E1.51504
G1 X131.041 Y55.467 E.00854
G1 X70.893 Y115.614 E2.43632
G1 X70.893 Y112.578 E.08696
G1 X146.65 Y188.335 E3.0686
G1 X146.323 Y188.335 E.00938
G1 X168.146 Y166.512 E.88396
G1 X168.146 Y163.046 E.09926
G1 X70.893 Y65.794 E3.93929
G1 X70.893 Y68.83 E.08696
G1 X84.239 Y55.484 E.54059
G1 X83.976 Y55.485 E.00755
G1 X168.146 Y139.654 E3.40937
G1 X168.146 Y143.12 E.09926
G1 X122.942 Y188.324 E1.83102
G1 X123.247 Y188.324 E.00873
G1 X107.394 Y172.471 E.64214
G1 X107.425 Y172.652 E.00525
G1 X168.146 Y111.931 E2.45956
G1 X168.146 Y108.465 E.09926
G1 X115.154 Y55.473 E2.14649
G1 X115.44 Y55.473 E.00821
G1 X70.893 Y100.02 E1.80441
G1 X70.893 Y96.984 E.08696
G1 X162.252 Y188.343 E3.70058
G1 X161.91 Y188.343 E.00981
G1 X168.146 Y182.107 E.25259
G1 X168.146 Y178.641 E.09926
G1 X70.893 Y81.389 E3.93929
G1 X70.893 Y84.425 E.08696
G1 X99.84 Y55.479 E1.1725
G1 X99.565 Y55.479 E.00788
G1 X168.146 Y124.06 E2.77793
G1 X168.146 Y127.525 E.09926
G1 X109.698 Y185.972 E2.36746
G1 X109.977 Y187.603 E.04738
G1 X168.146 Y188.093 F30000
G1 F16200
G1 X168.146 Y186.439 E.04738
G1 X70.893 Y89.186 E3.93929
G1 X70.893 Y92.222 E.08696
G1 X107.64 Y55.476 E1.48846
G1 X107.359 Y55.476 E.00804
G1 X168.146 Y116.262 E2.46221
G1 X168.146 Y119.728 E.09926
G1 X108.561 Y179.312 E2.41351
G1 X108.999 Y181.873 E.07442
G1 X115.446 Y188.32 E.26114
G1 X115.148 Y188.32 E.00852
G1 X168.146 Y135.323 E2.1467
G1 X168.146 Y131.857 E.09926
G1 X91.77 Y55.482 E3.09365
G1 X92.039 Y55.482 E.00771
G1 X70.893 Y76.628 E.85654
G1 X70.893 Y73.592 E.08696
G1 X168.146 Y170.844 E3.93929
G1 X168.146 Y174.309 E.09926
G1 X154.116 Y188.339 E.56827
G1 X154.451 Y188.339 E.0096
G1 X70.893 Y104.781 E3.38459
G1 X70.893 Y107.817 E.08696
G1 X123.24 Y55.47 E2.12037
G1 X122.948 Y55.47 E.00838
G1 X168.146 Y100.668 E1.83077
G1 X168.146 Y104.133 E.09926
G1 X106.288 Y165.991 E2.50561
G1 X105.789 Y163.069 E.08491
G1 X131.048 Y188.328 E1.02314
G1 X130.735 Y188.328 E.00895
G1 X168.146 Y150.917 E1.51533
G1 X168.146 Y147.452 E.09926
G1 X76.706 Y56.012 E3.70386
G1 X75.911 Y56.015 E.02275
G1 X70.893 Y61.033 E.20326
G1 X70.893 Y57.997 E.08696
G1 X168.146 Y155.249 E3.93929
G1 X168.146 Y158.715 E.09926
G1 X138.529 Y188.331 E1.19964
G1 X138.849 Y188.331 E.00917
G1 X104.184 Y153.666 E1.40414
G1 X104.014 Y152.67 E.02895
G1 X168.146 Y88.538 E2.59771
G1 X168.146 Y85.073 E.09926
G1 X138.537 Y55.464 E1.19932
G1 X138.841 Y55.464 E.00871
G1 X70.893 Y123.412 E2.75228
G1 X70.893 Y120.376 E.08696
G1 X97.834 Y147.317 E1.09126
G1 X101.568 Y147.318 E.10695
M73 P25 R46
G2 X101.718 Y146.898 I-.22 J-.315 E.01363
G1 X101.988 Y146.899 E.00773
G1 X168.146 Y80.741 E2.67978
G1 X168.146 Y77.275 E.09926
G1 X146.331 Y55.461 E.8836
G1 X146.641 Y55.461 E.00888
G1 X70.893 Y131.209 E3.06824
G1 X70.893 Y128.173 E.08696
G1 X90.033 Y147.313 E.77527
G1 X93.775 Y147.315 E.10716
G1 X168.146 Y72.944 E3.01246
G1 X168.146 Y69.478 E.09926
G1 X154.126 Y55.458 E.56788
G1 X154.442 Y55.458 E.00904
G1 X70.893 Y139.007 E3.38419
G1 X70.893 Y135.97 E.08696
G1 X82.232 Y147.309 E.45928
G1 X85.981 Y147.311 E.10738
G1 X168.146 Y65.146 E3.32815
G1 X168.146 Y61.681 E.09926
G1 X161.92 Y55.456 E.25216
G1 X162.242 Y55.455 E.00921
G1 X70.995 Y146.702 E3.69602
G1 X73.855 Y146.73 E.08192
G1 X70.893 Y143.768 E.11998
G1 X70.893 Y142.114 E.04738
G1 X77.071 Y55.572 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.504083
G1 F15000
G1 X74.76 Y55.577 E.07486
; LINE_WIDTH: 0.524469
G1 X72.721 Y55.594 E.06891
; LINE_WIDTH: 0.55681
G1 F14244.421
G1 X70.682 Y55.611 E.07348
; LINE_WIDTH: 0.597354
G1 F13214.716
G1 X70.57 Y55.635 E.00446
; LINE_WIDTH: 0.633075
G1 F12423.491
G1 X70.458 Y55.66 E.00475
G1 X70.414 Y55.879 E.00925
; LINE_WIDTH: 0.5823
G1 F13579.187
G1 X70.414 Y146.906 E3.44132
; LINE_WIDTH: 0.6056
G1 F13023.247
G1 X70.437 Y147.018 E.00454
; LINE_WIDTH: 0.636493
M73 P26 R46
G1 F12352.713
G1 X70.46 Y147.131 E.00479
G1 X70.684 Y147.178 E.0095
; LINE_WIDTH: 0.561084
G1 F14128.37
G1 X75.048 Y147.201 E.15857
; LINE_WIDTH: 0.540511
G1 F14705.036
G1 X79.412 Y147.223 E.15235
G1 X168.146 Y55.695 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X168.146 Y57.349 E.04738
G1 X78.717 Y146.778 E3.62239
G1 X77.063 Y146.761 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 0.85
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X78.717 Y146.778 E-.62855
G1 X78.961 Y146.533 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 5/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M106 S232.05
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z1.08 I-.107 J1.212 P1  F30000
G1 X102.847 Y148.65 Z1.08
G1 Z.85
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X102.68 Y148.37 E.00935
G2 X101.457 Y147.742 I-1.25 J.929 E.04076
G1 X70.226 Y147.733 E.89452
G3 X69.859 Y147.372 I.001 J-.368 E.01632
G1 X69.859 Y55.415 E2.63383
G3 X70.205 Y55.06 I.341 J-.014 E.01588
G1 X168.16 Y55.033 E2.80562
G1 X168.273 Y55.046 E.00327
G3 X168.555 Y55.428 I-.119 J.383 E.01455
G1 X168.555 Y188.371 E3.80776
G3 X168.176 Y188.756 I-.377 J.007 E.01722
G1 X110.061 Y188.739 E1.66454
G3 X109.688 Y188.421 I-.015 J-.36 E.01544
G1 X102.96 Y149.01 E1.14512
G2 X102.87 Y148.706 I-1.53 J.289 E.00912
G1 X102.488 Y148.824 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.357 Y148.604 E.00679
G2 X101.435 Y148.14 I-.927 J.694 E.02843
G1 X70.205 Y148.131 E.8296
G3 X69.461 Y147.386 I.006 J-.75 E.031
G1 X69.461 Y55.401 E2.4435
G3 X70.197 Y54.662 I.733 J-.006 E.03086
G1 X168.198 Y54.636 E2.60329
G3 X168.953 Y55.406 I-.016 J.771 E.03171
G1 X168.953 Y188.386 E3.5325
G3 X168.188 Y189.155 I-.776 J-.007 E.03191
G1 X110.045 Y189.137 E1.54449
G3 X109.299 Y188.509 I-.004 J-.753 E.02821
G1 X102.571 Y149.099 E1.06201
G2 X102.51 Y148.88 I-1.141 J.199 E.00606
M204 S10000
; WIPE_START
G1 F24000
G1 X102.357 Y148.604 E-.11959
G1 X102.183 Y148.407 E-.10027
G1 X101.962 Y148.262 E-.1004
G1 X101.822 Y148.211 E-.05655
G1 X101.704 Y148.17 E-.04718
G1 X101.435 Y148.14 E-.10299
G1 X100.822 Y148.14 E-.23302
; WIPE_END
G1 E-.04 F1800
G1 X93.211 Y147.564 Z1.25 F30000
G1 X70.213 Y145.821 Z1.25
G1 Z.85
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X70.219 Y147.376 E.04453
G2 X70.318 Y147.379 I.063 J-.455 E.00283
G1 X162.309 Y55.388 E3.72617
G1 X161.853 Y55.388 E.01305
G1 X168.201 Y61.736 E.25712
G1 X168.201 Y65.091 E.09609
G1 X85.908 Y147.383 E3.33333
G1 X82.305 Y147.382 E.1032
G1 X70.213 Y135.29 E.4898
G1 X70.213 Y131.889 E.09741
G1 X146.71 Y55.393 E3.09857
G1 X146.263 Y55.393 E.0128
G1 X168.201 Y77.331 E.88862
G1 X168.201 Y80.686 E.09609
G1 X101.496 Y147.39 E2.70192
G1 X97.904 Y147.387 E.10288
G1 X70.213 Y119.696 E1.12166
G1 X70.213 Y116.295 E.09741
G1 X131.111 Y55.397 E2.46672
G1 X130.672 Y55.397 E.01256
G1 X168.201 Y92.926 E1.52013
G1 X168.201 Y96.28 E.09609
G1 X105.091 Y159.39 E2.55633
G1 X104.813 Y157.76 E.04738
; WIPE_START
G1 F24000
G1 X105.091 Y159.39 E-.62855
G1 X105.336 Y159.146 E-.13145
; WIPE_END
G1 E-.04 F1800
G1 X100.678 Y153.099 Z1.25 F30000
G1 X70.213 Y113.552 Z1.25
G1 Z.85
G1 E.8 F1800
G1 F16200
G1 X70.213 Y111.898 E.04738
G1 X146.711 Y188.396 E3.0986
G1 X146.262 Y188.396 E.01285
G1 X168.201 Y166.457 E.88866
G1 X168.201 Y163.102 E.09609
G1 X70.213 Y65.114 E3.96908
G1 X70.213 Y61.713 E.09741
G1 X76.514 Y55.412 E.25523
G1 X76.106 Y55.412 E.01169
G1 X168.201 Y147.507 E3.73039
G1 X168.201 Y150.862 E.09609
G1 X130.672 Y188.391 E1.52015
G1 X131.111 Y188.391 E.01259
G1 X105.704 Y162.984 E1.02913
G1 X106.228 Y166.051 E.0891
G1 X168.201 Y104.078 E2.51027
G1 X168.201 Y100.723 E.09609
G1 X122.877 Y55.399 E1.83588
G1 X123.311 Y55.399 E.01243
G1 X70.213 Y108.497 E2.15079
G1 X70.213 Y104.101 E.12592
G1 X154.51 Y188.398 E3.41454
G1 X154.057 Y188.398 E.01299
G1 X168.201 Y174.254 E.57291
G1 X168.201 Y170.899 E.09609
G1 X70.213 Y72.911 E3.96908
G1 X70.213 Y69.51 E.09741
G1 X84.314 Y55.41 E.57116
G1 X83.901 Y55.41 E.01182
G1 X168.201 Y139.71 E3.41464
G1 X168.201 Y143.065 E.09609
G1 X122.877 Y188.389 E1.83589
G1 X123.312 Y188.389 E.01245
G1 X107.31 Y172.387 E.64818
G1 X107.365 Y172.711 E.00942
G1 X168.201 Y111.875 E2.46421
G1 X168.201 Y108.52 E.09609
G1 X115.082 Y55.401 E2.15163
G1 X115.512 Y55.401 E.01231
G1 X70.213 Y100.7 E1.83486
G1 X70.213 Y96.303 E.12592
G1 X162.31 Y188.401 E3.73047
G1 X161.852 Y188.4 E.01312
G1 X168.201 Y182.051 E.25717
G1 X168.201 Y178.697 E.09609
G1 X70.213 Y80.709 E3.96908
G1 X70.213 Y77.308 E.09741
G1 X92.113 Y55.408 E.88708
G1 X91.696 Y55.408 E.01194
G1 X168.201 Y131.912 E3.09889
G1 X168.201 Y135.267 E.09609
G1 X115.082 Y188.386 E2.15163
G1 X115.512 Y188.386 E.01232
G1 X108.915 Y181.789 E.26722
G1 X108.502 Y179.371 E.07025
G1 X168.201 Y119.673 E2.41816
G1 X168.201 Y116.318 E.09609
G1 X107.287 Y55.404 E2.46738
G1 X107.712 Y55.403 E.01219
G1 X70.213 Y92.903 E1.51894
G1 X70.213 Y91.248 E.04738
G1 X168.201 Y55.64 F30000
G1 F16200
G1 X168.201 Y57.294 E.04738
G1 X78.113 Y147.381 E3.64908
G1 X74.506 Y147.38 E.10333
G1 X70.213 Y143.088 E.17387
G1 X70.213 Y139.687 E.09741
G1 X154.509 Y55.39 E3.41449
G1 X154.058 Y55.391 E.01293
G1 X168.201 Y69.533 E.57287
G1 X168.201 Y72.888 E.09609
G1 X93.704 Y147.386 E3.01758
G1 X90.105 Y147.385 E.10307
G1 X70.213 Y127.493 E.80573
G1 X70.213 Y124.092 E.09741
G1 X138.91 Y55.395 E2.78264
G1 X138.468 Y55.395 E.01268
G1 X168.201 Y85.128 E1.20437
G1 X168.201 Y88.483 E.09609
G1 X103.954 Y152.73 E2.60238
G1 X104.099 Y153.582 E.02475
G1 X138.911 Y188.393 E1.41008
G1 X138.467 Y188.393 E.01272
G1 X168.201 Y158.659 E1.2044
G1 X168.201 Y155.304 E.09609
G1 X70.213 Y57.317 E3.96908
G1 X70.213 Y55.663 E.04738
G1 X168.201 Y188.148 F30000
G1 F16200
G1 X168.201 Y186.494 E.04738
G1 X70.213 Y88.506 E3.96908
G1 X70.213 Y85.105 E.09741
G1 X99.913 Y55.406 E1.20301
G1 X99.492 Y55.406 E.01206
G1 X168.201 Y124.115 E2.78313
G1 X168.201 Y127.47 E.09609
G1 X109.639 Y186.032 E2.3721
G1 X109.917 Y187.662 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 1.02
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.639 Y186.032 E-.62855
G1 X109.884 Y185.787 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 6/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z1.25 I1.195 J-.228 P1  F30000
G1 X102.82 Y148.713 Z1.25
G1 Z1.02
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X102.646 Y148.429 E.00955
G2 X101.398 Y147.778 I-1.299 J.969 E.0417
G1 X70.195 Y147.772 E.8937
G3 X69.818 Y147.375 I.027 J-.403 E.01727
G1 X69.818 Y55.413 E2.63396
G3 X70.207 Y55.018 I.398 J.003 E.01757
G1 X168.274 Y55.021 E2.80883
G3 X168.578 Y55.418 I-.099 J.391 E.01548
G1 X168.578 Y188.37 E3.80801
G3 X168.176 Y188.778 I-.387 J.021 E.01846
G1 X110.06 Y188.773 E1.66458
G3 X109.648 Y188.399 I-.009 J-.403 E.01759
G1 X102.935 Y149.075 E1.1426
G2 X102.841 Y148.77 I-1.588 J.323 E.00917
G1 X102.441 Y148.854 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.325 Y148.665 E.00589
G2 X101.417 Y148.181 I-.966 J.718 E.02823
G1 X70.181 Y148.171 E.82976
G3 X69.465 Y147.648 I.021 J-.78 E.02505
G3 X69.419 Y147.387 I1.332 J-.367 E.00704
G1 X69.419 Y55.4 E2.44354
G3 X69.465 Y55.14 I1.377 J.106 E.00704
G1 X69.465 Y55.139 E.00001
G3 X70.058 Y54.631 I.736 J.259 E.02172
G3 X70.198 Y54.619 I.096 J.297 E.00378
G1 X76.385 Y54.619 E.16433
G1 X168.183 Y54.611 E2.43853
G3 X168.977 Y55.402 I.01 J.784 E.03319
G1 X168.977 Y188.386 E3.53258
G3 X168.188 Y189.177 I-.788 J.003 E.033
G1 X110.045 Y189.172 E1.5445
G3 X109.262 Y188.505 I-.001 J-.792 E.02973
G1 X102.533 Y149.121 E1.06135
G2 X102.465 Y148.909 I-1.175 J.262 E.00592
M204 S10000
; WIPE_START
G1 F24000
G1 X102.325 Y148.665 E-.10686
G1 X102.14 Y148.457 E-.10569
G1 X101.907 Y148.304 E-.10594
G1 X101.644 Y148.207 E-.10675
G1 X101.417 Y148.181 E-.08664
G1 X100.764 Y148.181 E-.24812
; WIPE_END
G1 E-.04 F1800
G1 X103.708 Y155.223 Z1.42 F30000
G1 X104.782 Y157.791 Z1.42
G1 Z1.02
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X105.06 Y159.421 E.04738
G1 X168.225 Y96.257 E2.55854
G1 X168.225 Y92.949 E.09473
G1 X130.649 Y55.373 E1.52205
G1 X131.134 Y55.373 E.0139
G1 X70.172 Y116.336 E2.46935
G1 X70.172 Y119.654 E.09503
G1 X97.941 Y147.423 E1.12482
G1 X101.458 Y147.429 E.10073
G1 X168.225 Y80.662 E2.70445
G1 X168.225 Y77.355 E.09473
G1 X146.244 Y55.374 E.89035
G1 X146.729 Y55.374 E.01388
G1 X70.172 Y131.931 E3.101
G1 X70.172 Y135.249 E.09503
G1 X82.344 Y147.421 E.49304
G1 X85.87 Y147.421 E.10102
G1 X168.225 Y65.067 E3.33583
G1 X168.225 Y61.76 E.09473
G1 X161.839 Y55.374 E.25865
G1 X162.323 Y55.374 E.01385
G1 X70.278 Y147.419 E3.72834
G3 X70.18 Y147.393 I-.026 J-.101 E.00306
G1 X70.172 Y145.848 E.04423
G1 X70.172 Y91.29 F30000
G1 F16200
G1 X70.172 Y92.944 E.04738
G1 X107.743 Y55.373 E1.52186
G1 X107.256 Y55.373 E.01394
G1 X168.225 Y116.341 E2.46959
G1 X168.225 Y119.649 E.09473
G1 X108.471 Y179.402 E2.42036
G1 X108.871 Y181.746 E.06811
G1 X115.545 Y188.42 E.27033
G1 X115.048 Y188.42 E.01424
G1 X168.225 Y135.243 E2.15396
G1 X168.225 Y131.936 E.09473
G1 X91.661 Y55.372 E3.10129
G1 X92.149 Y55.372 E.01397
G1 X70.172 Y77.349 E.8902
G1 X70.172 Y80.667 E.09503
G1 X168.225 Y178.72 E3.97173
G1 X168.225 Y182.028 E.09473
G1 X161.828 Y188.424 E.2591
G1 X162.334 Y188.424 E.01448
G1 X70.172 Y96.262 E3.73311
G1 X70.172 Y100.741 E.1283
G1 X115.54 Y55.373 E1.83769
G1 X115.054 Y55.373 E.01393
G1 X168.225 Y108.544 E2.15374
G1 X168.225 Y111.851 E.09473
G1 X107.334 Y172.742 E2.46642
G1 X107.266 Y172.343 E.01158
G1 X123.343 Y188.421 E.65122
G1 X122.845 Y188.421 E.01428
G1 X168.225 Y143.041 E1.83815
G1 X168.225 Y139.734 E.09473
G1 X83.863 Y55.372 E3.41714
G1 X84.351 Y55.372 E.01399
G1 X70.172 Y69.552 E.57437
G1 X70.172 Y72.87 E.09503
G1 X168.225 Y170.923 E3.97173
G1 X168.225 Y174.23 E.09473
G1 X154.032 Y188.423 E.57491
G1 X154.536 Y188.423 E.01444
G1 X70.172 Y104.059 E3.41724
G1 X70.172 Y108.539 E.1283
G1 X123.337 Y55.373 E2.15352
M73 P27 R46
G1 X122.851 Y55.373 E.01392
G1 X168.225 Y100.747 E1.83789
G1 X168.225 Y104.054 E.09473
G1 X106.197 Y166.082 E2.51248
G1 X105.661 Y162.941 E.09126
G1 X131.142 Y188.421 E1.03212
G1 X130.642 Y188.421 E.01432
G1 X168.225 Y150.838 E1.52234
G1 X168.225 Y147.531 E.09473
G1 X76.066 Y55.372 E3.73299
G1 X76.554 Y55.372 E.014
G1 X70.172 Y61.755 E.25854
G1 X70.172 Y65.073 E.09503
G1 X168.225 Y163.126 E3.97173
G1 X168.225 Y166.433 E.09473
G1 X146.235 Y188.423 E.89072
G1 X146.738 Y188.423 E.0144
G1 X70.172 Y111.857 E3.10138
G1 X70.172 Y113.511 E.04738
G1 X70.172 Y55.621 F30000
G1 F16200
G1 X70.172 Y57.275 E.04738
G1 X168.225 Y155.328 E3.97173
G1 X168.225 Y158.636 E.09473
G1 X138.438 Y188.422 E1.20653
G1 X138.94 Y188.422 E.01436
G1 X104.056 Y153.538 E1.41301
G1 X103.923 Y152.761 E.02258
G1 X168.225 Y88.459 E2.6046
G1 X168.225 Y85.152 E.09473
G1 X138.446 Y55.374 E1.2062
G1 X138.931 Y55.374 E.01389
G1 X70.172 Y124.133 E2.78517
G1 X70.172 Y127.451 E.09503
G1 X90.142 Y147.422 E.80893
G1 X93.667 Y147.423 E.10094
G1 X168.225 Y72.865 E3.02004
G1 X168.225 Y69.557 E.09473
G1 X154.042 Y55.374 E.5745
G1 X154.526 Y55.374 E.01386
G1 X70.172 Y139.728 E3.41683
G1 X70.172 Y143.046 E.09503
G1 X74.545 Y147.419 E.17714
G1 X78.074 Y147.42 E.10109
G1 X168.225 Y57.27 E3.65162
G1 X168.225 Y55.616 E.04738
G1 X109.887 Y187.693 F30000
G1 F16200
G1 X109.608 Y186.062 E.04738
G1 X168.225 Y127.446 E2.3743
G1 X168.225 Y124.139 E.09473
G1 X99.458 Y55.373 E2.78544
G1 X99.946 Y55.373 E.01396
G1 X70.172 Y85.147 E1.20603
G1 X70.172 Y88.465 E.09503
G1 X168.225 Y186.518 E3.97173
G1 X168.225 Y188.172 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 1.19
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X168.225 Y186.518 E-.62855
G1 X167.98 Y186.273 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 7/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z1.42 I.608 J-1.054 P1  F30000
G1 X102.78 Y148.663 Z1.42
G1 Z1.19
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X102.761 Y148.627 E.00116
G2 X101.383 Y147.785 I-1.422 J.779 E.04843
G1 X70.226 Y147.785 E.8924
G3 X69.802 Y147.378 I-.003 J-.421 E.01863
G1 X69.802 Y55.41 E2.63415
G3 X70.226 Y55.002 I.42 J.013 E.01863
G1 X168.271 Y55.014 E2.8082
G3 X168.585 Y55.41 I-.104 J.405 E.01555
G1 X168.585 Y188.378 E3.80847
G3 X168.177 Y188.785 I-.395 J.012 E.01851
G1 X110.059 Y188.785 E1.66463
G3 X109.649 Y188.443 I-.015 J-.398 E.01674
G1 X102.933 Y149.107 E1.14298
G2 X102.896 Y148.952 I-1.593 J.299 E.00458
G1 X102.802 Y148.719 E.00718
G1 X102.424 Y148.841 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.413 Y148.82 E.00063
G2 X101.361 Y148.184 I-1.072 J.585 E.03421
G1 X70.205 Y148.184 E.82765
G3 X69.404 Y147.388 I-.005 J-.796 E.03333
G1 X69.404 Y55.399 E2.4436
G3 X70.205 Y54.604 I.796 J.001 E.03333
G1 X168.183 Y54.604 E2.60269
G1 X168.353 Y54.622 E.00454
G3 X168.984 Y55.399 I-.172 J.784 E.02872
G1 X168.984 Y188.388 E3.53273
G3 X168.188 Y189.184 I-.793 J.002 E.03323
G1 X110.045 Y189.184 E1.54452
G3 X109.258 Y188.521 I-.002 J-.796 E.02971
G1 X102.542 Y149.185 E1.06006
G2 X102.513 Y149.062 I-1.201 J.22 E.00334
G1 X102.447 Y148.897 E.00474
M204 S10000
; WIPE_START
G1 F24000
M73 P27 R45
G1 X102.413 Y148.82 E-.0318
G1 X102.266 Y148.603 E-.0996
G1 X102.135 Y148.472 E-.07036
G1 X101.847 Y148.29 E-.12929
G1 X101.609 Y148.211 E-.09545
G1 X101.361 Y148.184 E-.09472
G1 X100.733 Y148.184 E-.23877
; WIPE_END
G1 E-.04 F1800
G1 X93.123 Y147.605 Z1.59 F30000
G1 X70.156 Y145.857 Z1.59
G1 Z1.19
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X70.156 Y147.349 E.04272
G2 X70.266 Y147.432 I.083 J.004 E.00462
G1 X162.33 Y55.367 E3.72917
G1 X161.831 Y55.367 E.01429
G1 X168.232 Y61.767 E.25924
G1 X168.232 Y65.06 E.09433
G1 X85.86 Y147.432 E3.33652
G1 X82.354 Y147.432 E.10042
G1 X70.156 Y135.233 E.4941
G1 X70.156 Y131.946 E.09414
G1 X146.738 Y55.365 E3.102
G1 X146.235 Y55.365 E.01439
G1 X168.232 Y77.362 E.89099
G1 X168.232 Y80.655 E.09433
G1 X101.45 Y147.437 E2.70505
G1 X97.949 Y147.432 E.10027
G1 X70.156 Y119.639 E1.12578
G1 X70.156 Y116.352 E.09414
G1 X131.145 Y55.363 E2.47039
G1 X130.638 Y55.363 E.0145
G1 X168.232 Y92.956 E1.52275
G1 X168.232 Y96.25 E.09433
G1 X105.054 Y159.427 E2.55907
G1 X104.775 Y157.797 E.04738
G1 X168.232 Y188.179 F30000
G1 F16200
G1 X168.232 Y186.525 E.04738
G1 X70.156 Y88.449 E3.97264
G1 X70.156 Y85.162 E.09414
G1 X99.959 Y55.359 E1.20718
G1 X99.445 Y55.359 E.01471
G1 X168.232 Y124.146 E2.78625
G1 X168.232 Y127.439 E.09433
G1 X109.602 Y186.068 E2.37483
G1 X109.881 Y187.699 E.04738
G1 X168.232 Y99.1 F30000
G1 F16200
G1 X168.232 Y100.754 E.04738
G1 X122.84 Y55.362 E1.83862
G1 X123.348 Y55.362 E.01455
G1 X70.156 Y108.554 E2.15459
G1 X70.156 Y111.841 E.09414
G1 X146.746 Y188.432 E3.10236
G1 X146.226 Y188.432 E.0149
G1 X168.232 Y166.426 E.89135
G1 X168.232 Y163.133 E.09433
G1 X70.156 Y65.057 E3.97264
G1 X70.156 Y61.77 E.09414
G1 X76.569 Y55.357 E.25978
G1 X76.051 Y55.357 E.01486
G1 X168.232 Y147.538 E3.73388
G1 X168.232 Y150.831 E.09433
G1 X130.631 Y188.432 E1.52303
G1 X131.152 Y188.432 E.0149
G1 X105.652 Y162.932 E1.03288
G1 X106.191 Y166.088 E.0917
G1 X168.232 Y104.047 E2.51301
G1 X168.232 Y108.551 E.129
G1 X115.042 Y55.361 E2.1545
G1 X115.552 Y55.361 E.0146
G1 X70.156 Y100.757 E1.83879
G1 X70.156 Y104.044 E.09414
G1 X154.544 Y188.432 E3.4182
G1 X154.023 Y188.432 E.0149
G1 X168.232 Y174.223 E.57551
G1 X168.232 Y170.93 E.09433
G1 X70.156 Y72.854 E3.97264
G1 X70.156 Y69.567 E.09414
G1 X84.366 Y55.358 E.57558
G1 X83.849 Y55.358 E.01481
G1 X168.232 Y139.74 E3.418
G1 X168.232 Y143.034 E.09433
G1 X122.834 Y188.432 E1.83887
G1 X123.354 Y188.432 E.0149
G1 X107.257 Y172.335 E.65202
G1 X107.328 Y172.748 E.01201
G1 X168.232 Y111.844 E2.46695
G1 X168.232 Y116.348 E.129
G1 X107.244 Y55.36 E2.47037
G1 X107.755 Y55.36 E.01465
G1 X70.156 Y92.96 E1.52299
G1 X70.156 Y96.246 E.09414
G1 X162.341 Y188.432 E3.73404
G1 X161.821 Y188.432 E.0149
G1 X168.232 Y182.021 E.25967
G1 X168.232 Y178.727 E.09433
G1 X70.156 Y80.652 E3.97264
G1 X70.156 Y77.365 E.09414
G1 X92.162 Y55.359 E.89138
G1 X91.647 Y55.359 E.01476
G1 X168.232 Y131.943 E3.10212
G1 X168.232 Y135.237 E.09433
G1 X115.037 Y188.432 E2.15471
G1 X115.557 Y188.432 E.0149
G1 X108.863 Y181.737 E.27115
G1 X108.465 Y179.408 E.06768
G1 X168.232 Y119.642 E2.42089
G1 X168.232 Y121.296 E.04738
G1 X168.232 Y55.609 F30000
G1 F16200
G1 X168.232 Y57.263 E.04738
G1 X78.063 Y147.432 E3.65236
G1 X74.557 Y147.432 E.10042
G1 X70.156 Y143.031 E.17826
G1 X70.156 Y139.744 E.09414
G1 X154.534 Y55.366 E3.4178
G1 X154.033 Y55.366 E.01434
G1 X168.232 Y69.564 E.57512
G1 X168.232 Y72.858 E.09433
G1 X93.658 Y147.432 E3.02068
G1 X90.152 Y147.432 E.10042
G1 X70.156 Y127.436 E.80994
G1 X70.156 Y124.149 E.09414
G1 X138.941 Y55.364 E2.7862
G1 X138.437 Y55.364 E.01445
G1 X168.232 Y85.159 E1.20687
G1 X168.232 Y88.452 E.09433
G1 X103.917 Y152.767 E2.60513
G1 X104.047 Y153.529 E.02214
G1 X138.949 Y188.432 E1.41375
G1 X138.429 Y188.432 E.0149
G1 X168.232 Y158.629 E1.20719
G1 X168.232 Y155.335 E.09433
G1 X70.156 Y57.26 E3.97264
G1 X70.156 Y55.606 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 1.36
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X70.156 Y57.26 E-.62855
G1 X70.401 Y57.504 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 8/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z1.59 I-1.147 J.407 P1  F30000
G1 X102.78 Y148.663 Z1.59
G1 Z1.36
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X102.762 Y148.627 E.00116
G2 X101.383 Y147.785 I-1.422 J.779 E.04843
G1 X70.226 Y147.785 E.8924
G3 X69.802 Y147.378 I-.003 J-.421 E.01863
G1 X69.802 Y55.41 E2.63415
G3 X70.226 Y55.002 I.42 J.013 E.01863
G1 X168.162 Y55.002 E2.80509
G1 X168.28 Y55.015 E.00338
G3 X168.585 Y55.41 I-.116 J.406 E.01531
G1 X168.585 Y188.378 E3.80847
G3 X168.176 Y188.785 I-.395 J.012 E.01855
G1 X110.059 Y188.785 E1.6646
G3 X109.649 Y188.443 I-.012 J-.402 E.0167
G1 X102.933 Y149.107 E1.14298
G2 X102.896 Y148.95 I-1.593 J.299 E.00461
G1 X102.802 Y148.719 E.00715
G1 X102.424 Y148.839 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.413 Y148.82 E.00058
G2 X101.362 Y148.184 I-1.072 J.585 E.03421
G1 X70.205 Y148.184 E.82765
G3 X69.404 Y147.388 I-.005 J-.796 E.03333
G1 X69.404 Y55.399 E2.4436
G3 X70.205 Y54.604 I.796 J.001 E.03333
M73 P28 R45
G1 X168.183 Y54.604 E2.60269
G1 X168.354 Y54.622 E.00458
G3 X168.984 Y55.399 I-.173 J.784 E.02869
G1 X168.984 Y188.388 E3.53273
G3 X168.188 Y189.184 I-.793 J.002 E.03324
G1 X110.045 Y189.184 E1.54451
G3 X109.258 Y188.521 I-.001 J-.797 E.02971
G1 X102.542 Y149.185 E1.06006
G2 X102.513 Y149.062 I-1.201 J.22 E.00335
G1 X102.446 Y148.895 E.00478
M204 S10000
; WIPE_START
G1 F24000
G1 X102.413 Y148.82 E-.03104
G1 X102.267 Y148.604 E-.09919
G1 X102.142 Y148.48 E-.06682
G1 X101.848 Y148.29 E-.13316
G1 X101.609 Y148.211 E-.09545
G1 X101.362 Y148.184 E-.09472
G1 X100.731 Y148.184 E-.23963
; WIPE_END
G1 E-.04 F1800
G1 X103.691 Y155.219 Z1.76 F30000
G1 X104.776 Y157.797 Z1.76
G1 Z1.36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X105.054 Y159.427 E.04738
G1 X168.232 Y96.25 E2.55907
G1 X168.232 Y92.956 E.09432
G1 X130.631 Y55.356 E1.52304
G1 X131.152 Y55.356 E.0149
G1 X70.156 Y116.351 E2.47068
G1 X70.156 Y119.639 E.09415
G1 X97.949 Y147.432 E1.12577
G1 X101.45 Y147.437 E.10027
G1 X168.232 Y80.655 E2.70506
G1 X168.232 Y77.362 E.09432
G1 X146.226 Y55.356 E.89136
G1 X146.746 Y55.356 E.0149
G1 X70.156 Y131.946 E3.10235
G1 X70.156 Y135.233 E.09415
G1 X82.354 Y147.432 E.4941
G1 X85.86 Y147.432 E.10042
G1 X168.232 Y65.06 E3.33652
G1 X168.232 Y61.767 E.09432
G1 X161.821 Y55.356 E.25968
G1 X162.341 Y55.356 E.0149
G1 X70.244 Y147.432 E3.73003
G3 X70.156 Y147.349 I-.008 J-.08 E.00392
G1 X70.156 Y145.857 E.04273
; WIPE_START
G1 F24000
G1 X70.156 Y147.349 E-.56688
G1 X70.244 Y147.432 E-.0459
G1 X70.518 Y147.158 E-.14722
; WIPE_END
G1 E-.04 F1800
G1 X75.835 Y152.634 Z1.76 F30000
G1 X109.881 Y187.699 Z1.76
G1 Z1.36
G1 E.8 F1800
G1 F16200
G1 X109.602 Y186.068 E.04738
G1 X168.232 Y127.439 E2.37483
G1 X168.232 Y124.146 E.09432
G1 X99.442 Y55.356 E2.78639
G1 X99.962 Y55.356 E.0149
G1 X70.156 Y85.162 E1.20732
G1 X70.156 Y88.449 E.09415
G1 X168.232 Y186.525 E3.97264
G1 X168.232 Y188.179 E.04738
G1 X168.232 Y121.296 F30000
G1 F16200
G1 X168.232 Y119.642 E.04738
G1 X108.465 Y179.408 E2.42089
G1 X108.863 Y181.738 E.06768
G1 X115.557 Y188.432 E.27114
G1 X115.037 Y188.432 E.0149
G1 X168.232 Y135.236 E2.15471
G1 X168.232 Y131.943 E.09432
G1 X91.645 Y55.356 E3.10223
G1 X92.165 Y55.356 E.0149
G1 X70.156 Y77.365 E.89148
G1 X70.156 Y80.652 E.09415
G1 X168.232 Y178.727 E3.97264
G1 X168.232 Y182.021 E.09432
G1 X161.821 Y188.432 E.25968
G1 X162.341 Y188.432 E.0149
G1 X70.156 Y96.247 E3.73403
G1 X70.156 Y92.959 E.09415
G1 X107.76 Y55.356 E1.52316
G1 X107.239 Y55.356 E.0149
G1 X168.232 Y116.348 E2.47055
G1 X168.232 Y111.844 E.12901
G1 X107.328 Y172.748 E2.46695
G1 X107.258 Y172.335 E.012
G1 X123.354 Y188.432 E.65201
G1 X122.834 Y188.432 E.0149
G1 X168.232 Y143.034 E1.83888
G1 X168.232 Y139.741 E.09432
G1 X83.847 Y55.356 E3.41807
G1 X84.368 Y55.356 E.0149
G1 X70.156 Y69.567 E.57564
G1 X70.156 Y72.855 E.09415
G1 X168.232 Y170.93 E3.97264
G1 X168.232 Y174.223 E.09432
G1 X154.023 Y188.432 E.57552
G1 X154.544 Y188.432 E.0149
G1 X70.156 Y104.044 E3.41819
G1 X70.156 Y100.757 E.09415
G1 X115.557 Y55.356 E1.839
G1 X115.037 Y55.356 E.0149
G1 X168.232 Y108.551 E2.15471
G1 X168.232 Y104.047 E.12901
G1 X106.191 Y166.088 E2.51301
G1 X105.652 Y162.932 E.09169
G1 X131.152 Y188.432 E1.03287
G1 X130.631 Y188.432 E.0149
G1 X168.232 Y150.831 E1.52304
G1 X168.232 Y147.538 E.09432
G1 X76.05 Y55.356 E3.73391
G1 X76.57 Y55.356 E.0149
G1 X70.156 Y61.77 E.2598
G1 X70.156 Y65.057 E.09415
G1 X168.232 Y163.133 E3.97264
G1 X168.232 Y166.426 E.09432
G1 X146.226 Y188.432 E.89136
G1 X146.746 Y188.432 E.0149
G1 X70.156 Y111.841 E3.10235
G1 X70.156 Y108.554 E.09415
G1 X123.354 Y55.356 E2.15484
G1 X122.834 Y55.356 E.0149
G1 X168.232 Y100.754 E1.83888
G1 X168.232 Y99.1 E.04738
G1 X70.156 Y55.606 F30000
G1 F16200
G1 X70.156 Y57.26 E.04738
G1 X168.232 Y155.335 E3.97264
G1 X168.232 Y158.629 E.09432
G1 X138.429 Y188.432 E1.2072
G1 X138.949 Y188.432 E.0149
G1 X104.047 Y153.529 E1.41374
G1 X103.917 Y152.767 E.02215
G1 X168.232 Y88.452 E2.60513
G1 X168.232 Y85.159 E.09432
G1 X138.429 Y55.356 E1.2072
G1 X138.949 Y55.356 E.0149
G1 X70.156 Y124.149 E2.78651
G1 X70.156 Y127.436 E.09415
G1 X90.152 Y147.432 E.80993
G1 X93.658 Y147.432 E.10042
G1 X168.232 Y72.858 E3.02069
G1 X168.232 Y69.564 E.09432
G1 X154.023 Y55.356 E.57552
G1 X154.544 Y55.356 E.0149
G1 X70.156 Y139.744 E3.41819
G1 X70.156 Y143.031 E.09415
G1 X74.557 Y147.432 E.17826
G1 X78.063 Y147.432 E.10042
G1 X168.232 Y57.263 E3.65236
G1 X168.232 Y55.609 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 1.53
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X168.232 Y57.263 E-.62855
G1 X167.987 Y57.507 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 9/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z1.76 I-.99 J-.708 P1  F30000
G1 X102.78 Y148.662 Z1.76
G1 Z1.53
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X102.761 Y148.626 E.00118
G2 X101.383 Y147.785 I-1.422 J.781 E.04838
G1 X70.226 Y147.785 E.8924
G3 X69.803 Y147.378 I-.003 J-.421 E.01863
G1 X69.803 Y55.41 E2.63415
G3 X70.226 Y55.002 I.42 J.013 E.01863
G1 X168.162 Y55.002 E2.80509
G1 X168.28 Y55.015 E.00338
G3 X168.586 Y55.41 I-.087 J.383 E.01551
G1 X168.586 Y188.378 E3.80847
G3 X168.175 Y188.785 I-.395 J.012 E.01858
G1 X110.059 Y188.785 E1.66456
G3 X109.649 Y188.443 I-.012 J-.402 E.0167
G1 X102.933 Y149.107 E1.14298
G2 X102.895 Y148.95 I-1.594 J.3 E.00464
G1 X102.802 Y148.718 E.00715
G1 X102.423 Y148.837 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.413 Y148.82 E.00053
G2 X101.362 Y148.184 I-1.073 J.586 E.03419
G1 X70.205 Y148.184 E.82765
G3 X69.404 Y147.388 I-.005 J-.796 E.03333
G1 X69.404 Y55.399 E2.4436
G3 X70.205 Y54.604 I.796 J.001 E.03333
G1 X168.183 Y54.604 E2.60269
G1 X168.346 Y54.621 E.00435
G3 X168.984 Y55.399 I-.148 J.772 E.02902
G1 X168.984 Y188.388 E3.53273
G3 X168.188 Y189.184 I-.793 J.002 E.03325
G1 X110.045 Y189.184 E1.5445
G3 X109.258 Y188.521 I-.001 J-.798 E.0297
G1 X102.542 Y149.185 E1.06006
G2 X102.513 Y149.062 I-1.202 J.221 E.00336
G1 X102.445 Y148.893 E.00483
M204 S10000
; WIPE_START
G1 F24000
G1 X102.413 Y148.82 E-.03033
G1 X102.266 Y148.603 E-.09953
G1 X102.131 Y148.469 E-.07234
G1 X101.851 Y148.292 E-.12581
G1 X101.61 Y148.211 E-.09686
G1 X101.362 Y148.184 E-.09472
G1 X100.729 Y148.184 E-.24041
; WIPE_END
G1 E-.04 F1800
G1 X93.119 Y147.605 Z1.93 F30000
G1 X70.156 Y145.857 Z1.93
G1 Z1.53
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X70.156 Y147.349 E.04273
G2 X70.266 Y147.432 I.083 J.004 E.00461
G1 X162.341 Y55.356 E3.7296
G1 X161.821 Y55.356 E.0149
G1 X168.232 Y61.767 E.25969
G1 X168.232 Y65.06 E.09432
G1 X85.86 Y147.432 E3.33653
G1 X82.354 Y147.432 E.10042
G1 X70.156 Y135.234 E.49409
G1 X70.156 Y131.946 E.09416
G1 X146.746 Y55.356 E3.10235
G1 X146.226 Y55.356 E.0149
G1 X168.232 Y77.362 E.89136
G1 X168.232 Y80.655 E.09432
G1 X101.45 Y147.437 E2.70506
G1 X97.949 Y147.432 E.10027
G1 X70.156 Y119.639 E1.12577
G1 X70.156 Y116.351 E.09416
G1 X131.152 Y55.356 E2.47067
G1 X130.631 Y55.356 E.0149
G1 X168.232 Y92.957 E1.52304
G1 X168.232 Y96.249 E.09432
G1 X105.054 Y159.427 E2.55907
G1 X104.776 Y157.797 E.04738
G1 X168.232 Y188.179 F30000
G1 F16200
G1 X168.232 Y186.525 E.04738
G1 X70.156 Y88.449 E3.97264
G1 X70.156 Y85.162 E.09416
G1 X99.962 Y55.356 E1.20731
G1 X99.442 Y55.356 E.0149
G1 X168.232 Y124.146 E2.7864
G1 X168.232 Y127.439 E.09432
G1 X109.603 Y186.068 E2.37483
G1 X109.881 Y187.699 E.04738
G1 X168.232 Y99.1 F30000
G1 F16200
G1 X168.232 Y100.754 E.04738
G1 X122.834 Y55.356 E1.83888
G1 X123.354 Y55.356 E.0149
G1 X70.156 Y108.554 E2.15483
G1 X70.156 Y111.841 E.09416
G1 X146.746 Y188.432 E3.10235
G1 X146.226 Y188.432 E.0149
G1 X168.232 Y166.426 E.89136
G1 X168.232 Y163.133 E.09432
G1 X70.156 Y65.057 E3.97264
G1 X70.156 Y61.77 E.09416
G1 X76.57 Y55.356 E.2598
G1 X76.05 Y55.356 E.0149
G1 X168.232 Y147.538 E3.73392
G1 X168.232 Y150.831 E.09432
G1 X130.631 Y188.432 E1.52304
G1 X131.152 Y188.432 E.0149
G1 X105.653 Y162.932 E1.03287
G1 X106.191 Y166.087 E.09168
G1 X168.232 Y104.047 E2.51301
G1 X168.232 Y108.551 E.12902
G1 X115.037 Y55.356 E2.15472
G1 X115.557 Y55.356 E.0149
G1 X70.156 Y100.757 E1.83899
G1 X70.156 Y104.044 E.09416
G1 X154.544 Y188.432 E3.41819
G1 X154.023 Y188.432 E.0149
G1 X168.232 Y174.223 E.57553
G1 X168.232 Y170.93 E.09432
G1 X70.156 Y72.855 E3.97264
G1 X70.156 Y69.567 E.09416
G1 X84.368 Y55.356 E.57564
G1 X83.847 Y55.356 E.0149
G1 X168.232 Y139.741 E3.41808
G1 X168.232 Y143.034 E.09432
G1 X122.834 Y188.432 E1.83888
G1 X123.354 Y188.432 E.0149
G1 X107.258 Y172.335 E.652
G1 X107.328 Y172.748 E.01199
G1 X168.232 Y111.844 E2.46695
G1 X168.232 Y116.349 E.12902
G1 X107.239 Y55.356 E2.47056
G1 X107.76 Y55.356 E.0149
G1 X70.156 Y92.959 E1.52315
G1 X70.156 Y96.247 E.09416
G1 X162.341 Y188.432 E3.73403
G1 X161.821 Y188.432 E.0149
G1 X168.232 Y182.02 E.25969
G1 X168.232 Y178.728 E.09432
M73 P28 R44
G1 X70.156 Y80.652 E3.97264
G1 X70.156 Y77.365 E.09416
G1 X92.165 Y55.356 E.89147
G1 X91.645 Y55.356 E.0149
G1 X168.232 Y131.943 E3.10224
G1 X168.232 Y135.236 E.09432
M73 P29 R44
G1 X115.037 Y188.432 E2.15472
G1 X115.557 Y188.432 E.0149
G1 X108.863 Y181.738 E.27114
G1 X108.465 Y179.408 E.06769
G1 X168.232 Y119.642 E2.42089
G1 X168.232 Y121.296 E.04738
G1 X168.232 Y55.609 F30000
G1 F16200
G1 X168.232 Y57.263 E.04738
G1 X78.063 Y147.432 E3.65237
G1 X74.557 Y147.432 E.10042
G1 X70.156 Y143.031 E.17825
G1 X70.156 Y139.743 E.09416
G1 X154.544 Y55.356 E3.41819
G1 X154.023 Y55.356 E.0149
G1 X168.232 Y69.564 E.57553
G1 X168.232 Y72.857 E.09432
G1 X93.658 Y147.432 E3.02069
G1 X90.152 Y147.432 E.10042
G1 X70.156 Y127.436 E.80993
G1 X70.156 Y124.149 E.09416
G1 X138.949 Y55.356 E2.78651
G1 X138.429 Y55.356 E.0149
G1 X168.232 Y85.159 E1.2072
G1 X168.232 Y88.452 E.09432
G1 X103.917 Y152.767 E2.60513
G1 X104.047 Y153.53 E.02216
G1 X138.949 Y188.432 E1.41373
G1 X138.429 Y188.432 E.0149
G1 X168.232 Y158.628 E1.2072
G1 X168.232 Y155.335 E.09432
G1 X70.156 Y57.26 E3.97264
G1 X70.156 Y55.606 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 1.7
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X70.156 Y57.26 E-.62855
G1 X70.401 Y57.505 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 10/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z1.93 I-1.147 J.407 P1  F30000
G1 X102.78 Y148.663 Z1.93
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X102.762 Y148.627 E.00115
G2 X101.383 Y147.785 I-1.421 J.778 E.04843
G1 X70.226 Y147.785 E.8924
G3 X69.803 Y147.378 I-.003 J-.421 E.01863
G1 X69.803 Y55.41 E2.63415
G3 X70.226 Y55.002 I.42 J.013 E.01863
G1 X168.275 Y55.014 E2.80831
G3 X168.586 Y55.41 I-.082 J.384 E.01564
G1 X168.586 Y188.378 E3.80847
G3 X168.174 Y188.785 I-.395 J.012 E.01861
G1 X110.061 Y188.785 E1.66446
G3 X109.649 Y188.443 I-.013 J-.403 E.01677
G1 X102.933 Y149.107 E1.14298
G2 X102.895 Y148.949 I-1.593 J.298 E.00466
G1 X102.803 Y148.718 E.00711
G1 X102.422 Y148.835 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.413 Y148.82 E.00045
G2 X101.362 Y148.184 I-1.072 J.585 E.03421
G1 X70.205 Y148.184 E.82765
G3 X69.404 Y147.388 I-.005 J-.796 E.03333
G1 X69.404 Y55.399 E2.4436
G3 X70.205 Y54.604 I.796 J.001 E.03333
G1 X168.183 Y54.604 E2.60269
G1 X168.348 Y54.621 E.00441
G1 X168.348 Y54.621 E0
G3 X168.984 Y55.399 I-.151 J.772 E.02896
G1 X168.984 Y188.388 E3.53273
G3 X168.187 Y189.184 I-.793 J.002 E.03326
G1 X110.046 Y189.184 E1.54447
G3 X109.258 Y188.521 I-.001 J-.798 E.02972
G1 X102.542 Y149.185 E1.06006
G2 X102.513 Y149.061 I-1.201 J.22 E.00337
G1 X102.444 Y148.89 E.0049
M204 S10000
; WIPE_START
G1 F24000
G1 X102.413 Y148.82 E-.02913
G1 X102.268 Y148.605 E-.09868
G1 X102.077 Y148.426 E-.09951
G1 X101.848 Y148.29 E-.10121
G1 X101.61 Y148.211 E-.09544
G1 X101.362 Y148.184 E-.09473
G1 X100.727 Y148.184 E-.2413
; WIPE_END
G1 E-.04 F1800
G1 X103.69 Y155.218 Z2.1 F30000
G1 X104.776 Y157.797 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X105.054 Y159.427 E.04738
G1 X168.232 Y96.249 E2.55907
G1 X168.232 Y92.957 E.09431
G1 X130.639 Y55.363 E1.52275
G1 X131.144 Y55.363 E.01448
G1 X70.157 Y116.351 E2.47037
G1 X70.157 Y119.639 E.09417
G1 X97.949 Y147.432 E1.12576
G1 X101.45 Y147.437 E.10027
G1 X168.232 Y80.655 E2.70507
G1 X168.232 Y77.362 E.09431
G1 X146.235 Y55.365 E.891
G1 X146.737 Y55.365 E.01438
G1 X70.157 Y131.946 E3.10197
G1 X70.157 Y135.234 E.09417
G1 X82.354 Y147.432 E.49408
G1 X85.86 Y147.432 E.10042
G1 X168.232 Y65.06 E3.33654
G1 X168.232 Y61.767 E.09431
G1 X161.832 Y55.367 E.25924
G1 X162.33 Y55.367 E.01427
G1 X70.245 Y147.432 E3.72957
G3 X70.157 Y147.349 I-.008 J-.08 E.00392
G1 X70.157 Y145.857 E.04274
; WIPE_START
G1 F24000
G1 X70.157 Y147.349 E-.56699
G1 X70.245 Y147.432 E-.0459
G1 X70.518 Y147.158 E-.14711
; WIPE_END
G1 E-.04 F1800
G1 X75.835 Y152.634 Z2.1 F30000
G1 X109.881 Y187.699 Z2.1
G1 Z1.7
G1 E.8 F1800
G1 F16200
G1 X109.603 Y186.068 E.04738
G1 X168.232 Y127.439 E2.37483
G1 X168.232 Y124.146 E.09431
G1 X99.445 Y55.36 E2.78626
G1 X99.959 Y55.36 E.0147
G1 X70.157 Y85.162 E1.20716
G1 X70.157 Y88.45 E.09417
G1 X168.232 Y186.525 E3.97264
G1 X168.232 Y188.179 E.04738
G1 X168.232 Y121.295 F30000
G1 F16200
G1 X168.232 Y119.641 E.04738
G1 X108.466 Y179.408 E2.42089
G1 X108.863 Y181.738 E.0677
G1 X115.557 Y188.432 E.27113
G1 X115.037 Y188.432 E.0149
G1 X168.232 Y135.236 E2.15473
G1 X168.232 Y131.944 E.09431
G1 X91.647 Y55.359 E3.10214
G1 X92.162 Y55.359 E.01475
G1 X70.157 Y77.364 E.89136
G1 X70.157 Y80.652 E.09417
G1 X168.232 Y178.728 E3.97264
G1 X168.232 Y182.02 E.09431
G1 X161.821 Y188.432 E.25969
G1 X162.341 Y188.432 E.0149
G1 X70.157 Y96.247 E3.73402
G1 X70.157 Y92.959 E.09417
G1 X107.755 Y55.361 E1.52296
G1 X107.244 Y55.36 E.01465
G1 X168.232 Y116.349 E2.47038
G1 X168.232 Y111.844 E.12902
G1 X107.328 Y172.748 E2.46695
G1 X107.258 Y172.335 E.01198
G1 X123.354 Y188.432 E.652
G1 X122.834 Y188.432 E.0149
G1 X168.232 Y143.033 E1.83889
G1 X168.232 Y139.741 E.09431
G1 X83.849 Y55.358 E3.41802
G1 X84.366 Y55.358 E.01481
G1 X70.157 Y69.567 E.57556
G1 X70.157 Y72.855 E.09417
G1 X168.232 Y170.93 E3.97264
G1 X168.232 Y174.223 E.09431
G1 X154.023 Y188.432 E.57553
G1 X154.544 Y188.432 E.0149
G1 X70.157 Y104.044 E3.41818
G1 X70.157 Y100.756 E.09417
G1 X115.552 Y55.361 E1.83876
G1 X115.042 Y55.361 E.01459
G1 X168.232 Y108.551 E2.15451
G1 X168.232 Y104.047 E.12902
G1 X106.191 Y166.087 E2.51301
G1 X105.653 Y162.933 E.09167
G1 X131.152 Y188.432 E1.03286
G1 X130.631 Y188.432 E.0149
G1 X168.232 Y150.831 E1.52305
G1 X168.232 Y147.538 E.09431
G1 X76.051 Y55.357 E3.73389
G1 X76.569 Y55.357 E.01486
G1 X70.157 Y61.77 E.25976
G1 X70.157 Y65.057 E.09417
G1 X168.232 Y163.133 E3.97264
G1 X168.232 Y166.426 E.09431
G1 X146.226 Y188.432 E.89137
G1 X146.746 Y188.432 E.0149
G1 X70.157 Y111.842 E3.10234
G1 X70.157 Y108.554 E.09417
G1 X123.348 Y55.362 E2.15457
G1 X122.84 Y55.362 E.01454
G1 X168.232 Y100.754 E1.83863
G1 X168.232 Y99.1 E.04738
G1 X70.157 Y55.606 F30000
G1 F16200
G1 X70.157 Y57.26 E.04738
G1 X168.232 Y155.336 E3.97264
G1 X168.232 Y158.628 E.09431
G1 X138.429 Y188.432 E1.20721
G1 X138.949 Y188.432 E.0149
G1 X104.047 Y153.53 E1.41372
G1 X103.917 Y152.767 E.02217
G1 X168.232 Y88.452 E2.60513
G1 X168.232 Y85.159 E.09431
G1 X138.437 Y55.364 E1.20688
G1 X138.941 Y55.364 E.01443
G1 X70.157 Y124.149 E2.78617
G1 X70.157 Y127.436 E.09417
G1 X90.152 Y147.432 E.80992
G1 X93.658 Y147.432 E.10042
G1 X168.232 Y72.857 E3.0207
G1 X168.232 Y69.565 E.09431
G1 X154.034 Y55.366 E.57512
G1 X154.534 Y55.366 E.01432
G1 X70.157 Y139.743 E3.41777
G1 X70.157 Y143.031 E.09417
G1 X74.557 Y147.432 E.17824
G1 X78.063 Y147.432 E.10042
G1 X168.232 Y57.263 E3.65238
G1 X168.232 Y55.608 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 1.87
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X168.232 Y57.263 E-.62855
G1 X167.987 Y57.507 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 11/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z2.1 I-.99 J-.708 P1  F30000
G1 X102.78 Y148.661 Z2.1
G1 Z1.87
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X102.76 Y148.625 E.00119
G2 X101.384 Y147.785 I-1.422 J.783 E.04834
G1 X70.226 Y147.785 E.8924
G3 X69.803 Y147.378 I-.003 J-.421 E.01863
G1 X69.803 Y55.41 E2.63415
G3 X70.226 Y55.002 I.42 J.013 E.01863
G1 X168.163 Y55.002 E2.80509
G1 X168.278 Y55.014 E.00334
G3 X168.586 Y55.41 I-.115 J.407 E.01535
G1 X168.586 Y188.378 E3.80847
G3 X168.173 Y188.785 I-.395 J.012 E.01864
G1 X110.059 Y188.785 E1.66451
G3 X109.649 Y188.443 I-.013 J-.401 E.01672
G1 X102.934 Y149.107 E1.14298
G2 X102.895 Y148.948 I-1.595 J.301 E.00468
G1 X102.802 Y148.717 E.00713
G1 X102.421 Y148.833 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.413 Y148.82 E.00042
G2 X101.362 Y148.184 I-1.073 J.587 E.03418
G1 X70.205 Y148.184 E.82765
G3 X69.404 Y147.388 I-.005 J-.796 E.03333
G1 X69.404 Y55.399 E2.4436
G3 X70.205 Y54.604 I.796 J.001 E.03333
G1 X168.183 Y54.604 E2.60269
G1 X168.34 Y54.62 E.00417
G1 X168.34 Y54.62 E0
G3 X168.984 Y55.399 I-.14 J.772 E.02919
G1 X168.984 Y188.388 E3.53273
G3 X168.187 Y189.184 I-.793 J.002 E.03327
G1 X110.045 Y189.184 E1.54448
G3 X109.258 Y188.521 I0 J-.799 E.02969
G1 X102.542 Y149.185 E1.06006
G2 X102.513 Y149.061 I-1.203 J.222 E.00337
G1 X102.444 Y148.888 E.00494
M204 S10000
; WIPE_START
G1 F24000
G1 X102.413 Y148.82 E-.02874
G1 X102.266 Y148.602 E-.09948
G1 X102.127 Y148.466 E-.07407
G1 X101.848 Y148.29 E-.12533
G1 X101.61 Y148.211 E-.09544
G1 X101.362 Y148.184 E-.09473
G1 X100.725 Y148.184 E-.2422
; WIPE_END
G1 E-.04 F1800
G1 X93.114 Y147.604 Z2.27 F30000
G1 X70.157 Y145.857 Z2.27
G1 Z1.87
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X70.157 Y147.349 E.04274
G2 X70.266 Y147.432 I.083 J.004 E.00461
G1 X162.341 Y55.356 E3.7296
G1 X161.821 Y55.356 E.0149
G1 X168.232 Y61.767 E.2597
G1 X168.232 Y65.06 E.0943
M73 P30 R44
G1 X85.86 Y147.432 E3.33654
G1 X82.354 Y147.432 E.10042
G1 X70.157 Y135.234 E.49408
G1 X70.157 Y131.946 E.09418
G1 X146.746 Y55.356 E3.10234
G1 X146.226 Y55.356 E.0149
G1 X168.232 Y77.362 E.89138
G1 X168.232 Y80.654 E.0943
G1 X101.45 Y147.437 E2.70507
G1 X97.949 Y147.432 E.10027
G1 X70.157 Y119.639 E1.12576
G1 X70.157 Y116.351 E.09418
G1 X131.152 Y55.356 E2.47066
G1 X130.631 Y55.356 E.0149
G1 X168.232 Y92.957 E1.52305
G1 X168.232 Y96.249 E.0943
G1 X105.054 Y159.427 E2.55907
G1 X104.776 Y157.797 E.04738
G1 X168.232 Y188.179 F30000
G1 F16200
G1 X168.232 Y186.525 E.04738
G1 X70.157 Y88.45 E3.97264
G1 X70.157 Y85.162 E.09418
G1 X99.962 Y55.356 E1.2073
G1 X99.442 Y55.356 E.0149
G1 X168.232 Y124.146 E2.78641
G1 X168.232 Y127.439 E.0943
G1 X109.603 Y186.068 E2.37484
G1 X109.881 Y187.698 E.04738
G1 X168.232 Y99.1 F30000
G1 F16200
G1 X168.232 Y100.754 E.04738
G1 X122.834 Y55.356 E1.83889
G1 X123.354 Y55.356 E.0149
G1 X70.157 Y108.554 E2.15482
G1 X70.157 Y111.842 E.09418
G1 X146.746 Y188.432 E3.10234
G1 X146.226 Y188.432 E.0149
G1 X168.232 Y166.425 E.89138
G1 X168.232 Y163.133 E.0943
G1 X70.157 Y65.058 E3.97264
G1 X70.157 Y61.77 E.09418
G1 X76.57 Y55.356 E.25978
G1 X76.05 Y55.356 E.0149
G1 X168.232 Y147.538 E3.73393
G1 X168.232 Y150.831 E.0943
G1 X130.631 Y188.432 E1.52305
G1 X131.152 Y188.432 E.0149
G1 X105.653 Y162.933 E1.03285
G1 X106.191 Y166.087 E.09166
G1 X168.232 Y104.047 E2.51301
G1 X168.232 Y108.552 E.12903
G1 X115.037 Y55.356 E2.15473
G1 X115.557 Y55.356 E.0149
G1 X70.157 Y100.756 E1.83898
G1 X70.157 Y104.044 E.09418
G1 X154.544 Y188.432 E3.41818
G1 X154.023 Y188.432 E.0149
G1 X168.232 Y174.223 E.57554
G1 X168.232 Y170.93 E.0943
G1 X70.157 Y72.855 E3.97264
G1 X70.157 Y69.567 E.09418
G1 X84.368 Y55.356 E.57562
G1 X83.847 Y55.356 E.0149
G1 X168.232 Y139.741 E3.41809
G1 X168.232 Y143.033 E.0943
G1 X122.834 Y188.432 E1.83889
G1 X123.354 Y188.432 E.0149
G1 X107.258 Y172.335 E.65199
G1 X107.329 Y172.748 E.01197
G1 X168.232 Y111.844 E2.46695
G1 X168.232 Y116.349 E.12903
G1 X107.239 Y55.356 E2.47057
G1 X107.76 Y55.356 E.0149
G1 X70.157 Y92.959 E1.52314
G1 X70.157 Y96.247 E.09418
G1 X162.341 Y188.432 E3.73401
G1 X161.821 Y188.432 E.0149
G1 X168.232 Y182.02 E.2597
G1 X168.232 Y178.728 E.0943
G1 X70.157 Y80.652 E3.97264
G1 X70.157 Y77.364 E.09418
G1 X92.165 Y55.356 E.89146
G1 X91.645 Y55.356 E.0149
G1 X168.232 Y131.944 E3.10225
G1 X168.232 Y135.236 E.0943
G1 X115.037 Y188.432 E2.15473
G1 X115.557 Y188.432 E.0149
G1 X108.864 Y181.738 E.27112
G1 X108.466 Y179.408 E.06771
G1 X168.232 Y119.641 E2.42089
G1 X168.232 Y121.295 E.04738
G1 X168.232 Y55.608 F30000
G1 F16200
G1 X168.232 Y57.262 E.04738
G1 X78.063 Y147.432 E3.65238
G1 X74.557 Y147.432 E.10042
G1 X70.157 Y143.031 E.17824
G1 X70.157 Y139.743 E.09418
G1 X154.544 Y55.356 E3.41818
G1 X154.023 Y55.356 E.0149
G1 X168.232 Y69.565 E.57554
G1 X168.232 Y72.857 E.0943
G1 X93.658 Y147.432 E3.0207
G1 X90.152 Y147.432 E.10042
G1 X70.157 Y127.436 E.80992
G1 X70.157 Y124.148 E.09418
G1 X138.949 Y55.356 E2.7865
G1 X138.429 Y55.356 E.0149
G1 X168.232 Y85.159 E1.20721
G1 X168.232 Y88.452 E.0943
G1 X103.917 Y152.767 E2.60513
G1 X104.048 Y153.53 E.02218
G1 X138.949 Y188.432 E1.41372
G1 X138.429 Y188.432 E.0149
G1 X168.232 Y158.628 E1.20722
G1 X168.232 Y155.336 E.0943
G1 X70.157 Y57.26 E3.97264
G1 X70.157 Y55.606 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 2.04
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X70.157 Y57.26 E-.62855
G1 X70.401 Y57.505 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 12/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z2.27 I-1.147 J.407 P1  F30000
G1 X102.78 Y148.662 Z2.27
G1 Z2.04
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X102.762 Y148.627 E.00114
G2 X101.384 Y147.785 I-1.423 J.78 E.04841
G1 X70.226 Y147.785 E.8924
G3 X69.803 Y147.378 I-.003 J-.421 E.01863
G1 X69.803 Y55.41 E2.63415
G3 X70.226 Y55.002 I.42 J.013 E.01863
G1 X168.272 Y55.014 E2.80821
G3 X168.586 Y55.41 I-.082 J.388 E.0157
G1 X168.586 Y188.378 E3.80847
G3 X168.173 Y188.785 I-.395 J.012 E.01867
G1 X110.059 Y188.785 E1.66448
G3 X109.65 Y188.443 I-.01 J-.404 E.01669
G1 X102.934 Y149.107 E1.14298
G2 X102.895 Y148.947 I-1.595 J.301 E.0047
G1 X102.803 Y148.718 E.00708
G1 X102.421 Y148.831 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.413 Y148.82 E.00034
G2 X101.362 Y148.184 I-1.074 J.587 E.0342
G1 X70.206 Y148.184 E.82765
G3 X69.405 Y147.388 I-.005 J-.796 E.03333
G1 X69.405 Y55.399 E2.4436
G3 X70.206 Y54.604 I.796 J.001 E.03333
G1 X168.184 Y54.604 E2.60269
G1 X168.331 Y54.619 E.00394
G3 X168.985 Y55.399 I-.145 J.785 E.02931
G1 X168.985 Y188.388 E3.53273
G3 X168.187 Y189.184 I-.793 J.002 E.03328
M73 P30 R43
G1 X110.046 Y189.184 E1.54447
G3 X109.259 Y188.521 I-.002 J-.796 E.02971
G1 X102.543 Y149.185 E1.06006
G2 X102.513 Y149.061 I-1.203 J.223 E.00338
G1 X102.443 Y148.886 E.00499
M204 S10000
; WIPE_START
G1 F24000
G1 X102.413 Y148.82 E-.02754
G1 X102.269 Y148.605 E-.09858
G1 X102.126 Y148.464 E-.07628
G1 X101.854 Y148.292 E-.12219
G1 X101.61 Y148.211 E-.09774
G1 X101.362 Y148.184 E-.09472
G1 X100.723 Y148.184 E-.24294
; WIPE_END
G1 E-.04 F1800
G1 X103.688 Y155.217 Z2.44 F30000
G1 X104.776 Y157.796 Z2.44
G1 Z2.04
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X105.054 Y159.427 E.04738
G1 X168.232 Y96.249 E2.55907
G1 X168.232 Y92.957 E.09429
G1 X130.638 Y55.363 E1.52277
G1 X131.145 Y55.363 E.0145
G1 X70.157 Y116.351 E2.47036
G1 X70.157 Y119.639 E.09418
G1 X97.949 Y147.432 E1.12575
G1 X101.45 Y147.437 E.10027
G1 X168.232 Y80.654 E2.70508
G1 X168.232 Y77.362 E.09429
G1 X146.235 Y55.365 E.89102
G1 X146.737 Y55.365 E.01439
G1 X70.157 Y131.946 E3.10197
G1 X70.157 Y135.234 E.09418
G1 X82.354 Y147.432 E.49407
G1 X85.86 Y147.432 E.10042
G1 X168.232 Y65.06 E3.33655
G1 X168.232 Y61.768 E.09429
G1 X161.832 Y55.367 E.25927
G1 X162.33 Y55.367 E.01429
G1 X70.245 Y147.432 E3.72958
G3 X70.157 Y147.349 I-.008 J-.08 E.00392
G1 X70.157 Y145.857 E.04274
; WIPE_START
G1 F24000
G1 X70.157 Y147.349 E-.5671
G1 X70.245 Y147.432 E-.0459
G1 X70.519 Y147.158 E-.147
; WIPE_END
G1 E-.04 F1800
G1 X75.835 Y152.634 Z2.44 F30000
G1 X109.881 Y187.698 Z2.44
G1 Z2.04
G1 E.8 F1800
G1 F16200
G1 X109.603 Y186.068 E.04738
G1 X168.232 Y127.438 E2.37484
G1 X168.232 Y124.146 E.09429
G1 X99.445 Y55.359 E2.78628
G1 X99.959 Y55.359 E.01471
G1 X70.157 Y85.161 E1.20716
G1 X70.157 Y88.45 E.09418
G1 X168.232 Y186.525 E3.97264
G1 X168.232 Y188.179 E.04738
G1 X168.232 Y121.295 F30000
G1 F16200
G1 X168.232 Y119.641 E.04738
G1 X108.466 Y179.408 E2.4209
G1 X108.864 Y181.738 E.06772
G1 X115.557 Y188.432 E.27112
G1 X115.037 Y188.432 E.0149
G1 X168.232 Y135.236 E2.15474
G1 X168.232 Y131.944 E.09429
G1 X91.647 Y55.359 E3.10215
G1 X92.162 Y55.359 E.01476
G1 X70.157 Y77.364 E.89135
G1 X70.157 Y80.652 E.09418
G1 X168.232 Y178.728 E3.97264
G1 X168.232 Y182.02 E.09429
G1 X161.821 Y188.432 E.2597
G1 X162.341 Y188.432 E.0149
G1 X70.157 Y96.247 E3.73401
G1 X70.157 Y92.959 E.09418
G1 X107.755 Y55.36 E1.52296
G1 X107.244 Y55.36 E.01465
G1 X168.232 Y116.349 E2.4704
G1 X168.232 Y111.844 E.12904
G1 X107.329 Y172.747 E2.46696
G1 X107.258 Y172.336 E.01197
G1 X123.354 Y188.432 E.65198
G1 X122.834 Y188.432 E.0149
G1 X168.232 Y143.033 E1.8389
G1 X168.232 Y139.741 E.09429
G1 X83.849 Y55.358 E3.41803
G1 X84.366 Y55.358 E.01481
G1 X70.157 Y69.567 E.57555
G1 X70.157 Y72.855 E.09418
G1 X168.232 Y170.931 E3.97264
G1 X168.232 Y174.223 E.09429
G1 X154.023 Y188.432 E.57554
G1 X154.544 Y188.432 E.0149
G1 X70.157 Y104.045 E3.41817
G1 X70.157 Y100.756 E.09418
G1 X115.552 Y55.361 E1.83876
G1 X115.042 Y55.361 E.0146
G1 X168.232 Y108.552 E2.15453
G1 X168.232 Y104.046 E.12904
G1 X106.192 Y166.087 E2.51302
G1 X105.653 Y162.933 E.09165
G1 X131.152 Y188.432 E1.03285
G1 X130.631 Y188.432 E.0149
G1 X168.232 Y150.831 E1.52306
G1 X168.232 Y147.539 E.09429
G1 X76.051 Y55.357 E3.73391
G1 X76.569 Y55.357 E.01486
G1 X70.157 Y61.769 E.25975
G1 X70.157 Y65.058 E.09418
G1 X168.232 Y163.133 E3.97264
G1 X168.232 Y166.425 E.09429
G1 X146.226 Y188.432 E.89138
G1 X146.746 Y188.432 E.0149
G1 X70.157 Y111.842 E3.10233
G1 X70.157 Y108.554 E.09418
G1 X123.348 Y55.362 E2.15456
G1 X122.84 Y55.362 E.01455
G1 X168.232 Y100.754 E1.83865
G1 X168.232 Y99.1 E.04738
G1 X70.157 Y55.606 F30000
G1 F16200
G1 X70.157 Y57.26 E.04738
G1 X168.232 Y155.336 E3.97264
G1 X168.232 Y158.628 E.09429
G1 X138.429 Y188.432 E1.20722
G1 X138.949 Y188.432 E.0149
G1 X104.048 Y153.53 E1.41371
G1 X103.917 Y152.767 E.02219
G1 X168.232 Y88.452 E2.60513
G1 X168.232 Y85.16 E.09429
G1 X138.437 Y55.364 E1.2069
G1 X138.941 Y55.364 E.01445
G1 X70.157 Y124.148 E2.78617
G1 X70.157 Y127.437 E.09418
G1 X90.152 Y147.432 E.80991
G1 X93.658 Y147.432 E.10042
M73 P31 R43
G1 X168.232 Y72.857 E3.02071
G1 X168.232 Y69.565 E.09429
G1 X154.033 Y55.366 E.57515
G1 X154.534 Y55.366 E.01434
G1 X70.157 Y139.743 E3.41777
G1 X70.157 Y143.031 E.09418
G1 X74.557 Y147.432 E.17823
G1 X78.063 Y147.432 E.10042
G1 X168.232 Y57.262 E3.65239
G1 X168.232 Y55.608 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 2.21
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X168.232 Y57.262 E-.62855
G1 X167.988 Y57.507 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 13/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z2.44 I-.99 J-.708 P1  F30000
G1 X102.78 Y148.662 Z2.44
G1 Z2.21
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X102.763 Y148.627 E.00114
G2 X101.384 Y147.785 I-1.419 J.774 E.04846
G1 X70.227 Y147.785 E.8924
G3 X69.803 Y147.378 I-.003 J-.421 E.01863
G1 X69.803 Y55.41 E2.63415
G3 X70.227 Y55.002 I.42 J.013 E.01863
G1 X168.272 Y55.014 E2.80822
G3 X168.586 Y55.41 I-.089 J.393 E.01565
G1 X168.586 Y188.378 E3.80847
G3 X168.172 Y188.785 I-.395 J.012 E.01869
G1 X110.059 Y188.785 E1.66446
G3 X109.65 Y188.443 I-.011 J-.404 E.01669
G1 X102.934 Y149.107 E1.14298
G2 X102.896 Y148.946 I-1.589 J.294 E.00473
G1 X102.803 Y148.718 E.00706
G1 X102.42 Y148.829 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.414 Y148.82 E.00028
G2 X101.362 Y148.184 I-1.07 J.582 E.03423
G1 X70.206 Y148.184 E.82765
G3 X69.405 Y147.388 I-.005 J-.796 E.03333
G1 X69.405 Y55.399 E2.4436
G3 X70.206 Y54.604 I.796 J.001 E.03333
G1 X168.184 Y54.604 E2.60269
G1 X168.322 Y54.618 E.0037
G3 X168.985 Y55.399 I-.135 J.786 E.02954
G1 X168.985 Y188.388 E3.53273
G3 X168.187 Y189.184 I-.793 J.002 E.03329
G1 X110.046 Y189.184 E1.54446
G3 X109.259 Y188.521 I-.002 J-.796 E.02971
G1 X102.543 Y149.185 E1.06006
G2 X102.514 Y149.06 I-1.198 J.217 E.00339
G1 X102.442 Y148.884 E.00505
M204 S10000
; WIPE_START
G1 F24000
G1 X102.414 Y148.82 E-.02669
G1 X102.269 Y148.605 E-.09851
G1 X102.124 Y148.463 E-.07731
G1 X101.857 Y148.293 E-.11998
G1 X101.61 Y148.211 E-.09907
G1 X101.362 Y148.184 E-.09472
G1 X100.721 Y148.184 E-.24373
; WIPE_END
G1 E-.04 F1800
G1 X93.111 Y147.604 Z2.61 F30000
G1 X70.157 Y145.856 Z2.61
G1 Z2.21
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X70.157 Y147.349 E.04275
G2 X70.266 Y147.432 I.083 J.004 E.0046
G1 X162.33 Y55.367 E3.72916
G1 X161.832 Y55.367 E.01429
G1 X168.232 Y61.768 E.25928
G1 X168.232 Y65.059 E.09428
G1 X85.86 Y147.432 E3.33655
G1 X82.354 Y147.432 E.10042
G1 X70.157 Y135.234 E.49407
G1 X70.157 Y131.945 E.09419
G1 X146.737 Y55.365 E3.10196
G1 X146.235 Y55.365 E.01439
G1 X168.232 Y77.362 E.89103
G1 X168.232 Y80.654 E.09428
G1 X101.45 Y147.437 E2.70508
G1 X97.949 Y147.432 E.10027
G1 X70.157 Y119.639 E1.12574
G1 X70.157 Y116.351 E.09419
G1 X131.145 Y55.363 E2.47036
G1 X130.638 Y55.363 E.0145
G1 X168.232 Y92.957 E1.52278
G1 X168.232 Y96.249 E.09428
G1 X105.055 Y159.427 E2.55908
G1 X104.776 Y157.796 E.04738
G1 X168.232 Y188.18 F30000
G1 F16200
G1 X168.232 Y186.525 E.04738
G1 X70.157 Y88.45 E3.97264
G1 X70.157 Y85.161 E.09419
G1 X99.959 Y55.36 E1.20715
G1 X99.445 Y55.359 E.01471
G1 X168.232 Y124.147 E2.78628
G1 X168.232 Y127.438 E.09428
G1 X109.603 Y186.068 E2.37484
G1 X109.881 Y187.698 E.04738
G1 X168.232 Y99.1 F30000
G1 F16200
G1 X168.232 Y100.754 E.04738
G1 X122.84 Y55.362 E1.83866
G1 X123.348 Y55.362 E.01455
G1 X70.157 Y108.553 E2.15456
G1 X70.157 Y111.842 E.09419
G1 X146.746 Y188.432 E3.10232
G1 X146.226 Y188.432 E.0149
G1 X168.232 Y166.425 E.89139
G1 X168.232 Y163.133 E.09428
G1 X70.157 Y65.058 E3.97264
G1 X70.157 Y61.769 E.09419
G1 X76.569 Y55.357 E.25974
G1 X76.051 Y55.357 E.01486
G1 X168.232 Y147.539 E3.73391
G1 X168.232 Y150.83 E.09428
G1 X130.631 Y188.432 E1.52307
G1 X131.152 Y188.432 E.0149
G1 X105.653 Y162.933 E1.03284
G1 X106.192 Y166.087 E.09164
G1 X168.232 Y104.046 E2.51302
G1 X168.232 Y108.552 E.12905
G1 X115.042 Y55.361 E2.15453
G1 X115.552 Y55.361 E.0146
G1 X70.157 Y100.756 E1.83875
G1 X70.157 Y104.045 E.09419
G1 X154.544 Y188.432 E3.41816
G1 X154.023 Y188.432 E.0149
G1 X168.232 Y174.223 E.57555
G1 X168.232 Y170.931 E.09428
G1 X70.157 Y72.855 E3.97264
G1 X70.157 Y69.567 E.09419
G1 X84.366 Y55.358 E.57554
G1 X83.849 Y55.358 E.01481
G1 X168.232 Y139.741 E3.41804
G1 X168.232 Y143.033 E.09428
G1 X122.834 Y188.432 E1.8389
G1 X123.354 Y188.432 E.0149
G1 X107.259 Y172.336 E.65197
G1 X107.329 Y172.747 E.01196
G1 X168.232 Y111.844 E2.46696
G1 X168.232 Y116.349 E.12905
G1 X107.244 Y55.36 E2.47041
G1 X107.755 Y55.36 E.01465
G1 X70.157 Y92.959 E1.52295
G1 X70.157 Y96.247 E.09419
G1 X162.341 Y188.432 E3.734
G1 X161.821 Y188.432 E.0149
G1 X168.232 Y182.02 E.25971
G1 X168.232 Y178.728 E.09428
G1 X70.157 Y80.653 E3.97264
G1 X70.157 Y77.364 E.09419
G1 X92.162 Y55.359 E.89135
G1 X91.647 Y55.359 E.01476
G1 X168.232 Y131.944 E3.10216
G1 X168.232 Y135.236 E.09428
G1 X115.037 Y188.432 E2.15474
G1 X115.557 Y188.432 E.0149
G1 X108.864 Y181.738 E.27111
G1 X108.466 Y179.408 E.06773
G1 X168.232 Y119.641 E2.4209
G1 X168.232 Y121.295 E.04738
G1 X168.232 Y55.608 F30000
G1 F16200
G1 X168.232 Y57.262 E.04738
G1 X78.063 Y147.432 E3.65239
G1 X74.557 Y147.432 E.10042
G1 X70.157 Y143.031 E.17823
G1 X70.157 Y139.743 E.09419
G1 X154.534 Y55.366 E3.41776
G1 X154.033 Y55.366 E.01434
G1 X168.232 Y69.565 E.57515
G1 X168.232 Y72.857 E.09428
G1 X93.658 Y147.432 E3.02072
G1 X90.152 Y147.432 E.10042
G1 X70.157 Y127.437 E.80991
G1 X70.157 Y124.148 E.09419
G1 X138.941 Y55.364 E2.78616
G1 X138.437 Y55.364 E.01444
G1 X168.232 Y85.16 E1.2069
G1 X168.232 Y88.452 E.09428
G1 X103.917 Y152.767 E2.60514
G1 X104.048 Y153.53 E.02219
G1 X138.949 Y188.432 E1.4137
G1 X138.429 Y188.432 E.0149
G1 X168.232 Y158.628 E1.20723
G1 X168.232 Y155.336 E.09428
G1 X70.157 Y57.261 E3.97264
G1 X70.157 Y55.606 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 2.38
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X70.157 Y57.261 E-.62855
G1 X70.402 Y57.505 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 14/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z2.61 I-1.147 J.407 P1  F30000
G1 X102.781 Y148.662 Z2.61
G1 Z2.38
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X102.763 Y148.627 E.00113
G2 X101.384 Y147.785 I-1.419 J.775 E.04845
G1 X70.227 Y147.785 E.8924
G3 X69.803 Y147.378 I-.003 J-.421 E.01863
G1 X69.803 Y55.41 E2.63415
G3 X70.227 Y55.002 I.42 J.013 E.01863
G1 X168.272 Y55.014 E2.80822
G3 X168.586 Y55.41 I-.089 J.393 E.01564
G1 X168.581 Y188.449 E3.81052
G3 X168.171 Y188.785 I-.394 J-.063 E.0166
G1 X110.06 Y188.785 E1.66443
G3 X109.65 Y188.443 I-.005 J-.41 E.01664
G1 X102.934 Y149.107 E1.14298
G2 X102.895 Y148.946 I-1.59 J.295 E.00475
G1 X102.803 Y148.718 E.00705
G1 X102.419 Y148.826 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.409 Y148.823 E.00028
G2 X101.362 Y148.184 I-1.089 J.608 E.03406
G1 X70.206 Y148.184 E.82765
G3 X69.405 Y147.388 I-.005 J-.796 E.03333
G1 X69.405 Y55.399 E2.4436
G3 X70.206 Y54.604 I.796 J.001 E.03333
G1 X168.184 Y54.604 E2.60269
G1 X168.314 Y54.617 E.00346
G1 X168.314 Y54.617 E0
G3 X168.985 Y55.399 I-.119 J.781 E.02982
G1 X168.985 Y188.388 E3.53273
G3 X168.187 Y189.184 I-.793 J.003 E.03329
G1 X110.046 Y189.184 E1.54446
G3 X109.259 Y188.521 I.002 J-.801 E.02968
G1 X102.543 Y149.185 E1.06006
G2 X102.511 Y149.061 I-1.223 J.246 E.00339
G1 X102.441 Y148.882 E.00511
M204 S10000
; WIPE_START
G1 F24000
G1 X102.409 Y148.823 E-.02555
G1 X102.27 Y148.606 E-.09785
G1 X102.079 Y148.426 E-.10004
G1 X101.857 Y148.293 E-.09789
G1 X101.61 Y148.211 E-.09907
G1 X101.362 Y148.184 E-.09472
G1 X100.718 Y148.184 E-.24489
; WIPE_END
G1 E-.04 F1800
G1 X103.687 Y155.215 Z2.78 F30000
G1 X104.776 Y157.796 Z2.78
G1 Z2.38
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X105.055 Y159.427 E.04738
G1 X168.233 Y96.249 E2.55908
G1 X168.233 Y92.957 E.09427
G1 X130.638 Y55.363 E1.52278
G1 X131.145 Y55.363 E.0145
G1 X70.157 Y116.351 E2.47035
G1 X70.157 Y119.64 E.0942
G1 X97.949 Y147.432 E1.12574
G1 X101.45 Y147.437 E.10027
G1 X168.233 Y80.654 E2.70509
G1 X168.233 Y77.363 E.09427
G1 X146.235 Y55.365 E.89103
G1 X146.737 Y55.365 E.01439
G1 X70.157 Y131.945 E3.10196
G1 X70.157 Y135.234 E.0942
G1 X82.354 Y147.432 E.49406
G1 X85.86 Y147.432 E.10042
G1 X168.233 Y65.059 E3.33656
G1 X168.233 Y61.768 E.09427
G1 X161.832 Y55.367 E.25928
G1 X162.33 Y55.367 E.01429
G1 X70.245 Y147.432 E3.72958
G3 X70.157 Y147.349 I-.008 J-.08 E.00392
G1 X70.157 Y145.856 E.04275
; WIPE_START
G1 F24000
G1 X70.157 Y147.349 E-.56721
G1 X70.245 Y147.432 E-.0459
G1 X70.519 Y147.158 E-.14689
; WIPE_END
G1 E-.04 F1800
G1 X75.836 Y152.634 Z2.78 F30000
G1 X109.882 Y187.698 Z2.78
G1 Z2.38
M73 P32 R43
G1 E.8 F1800
G1 F16200
G1 X109.603 Y186.068 E.04738
G1 X168.233 Y127.438 E2.37484
G1 X168.233 Y124.147 E.09427
G1 X99.445 Y55.359 E2.78629
G1 X99.959 Y55.36 E.01471
G1 X70.157 Y85.161 E1.20714
G1 X70.157 Y88.45 E.0942
G1 X168.233 Y186.526 E3.97264
G1 X168.233 Y188.18 E.04738
G1 X168.233 Y121.295 F30000
G1 F16200
G1 X168.233 Y119.641 E.04738
G1 X108.466 Y179.407 E2.4209
G1 X108.864 Y181.739 E.06774
G1 X115.557 Y188.432 E.2711
G1 X115.037 Y188.432 E.0149
G1 X168.233 Y135.236 E2.15475
G1 X168.233 Y131.944 E.09427
G1 X91.647 Y55.359 E3.10217
G1 X92.162 Y55.359 E.01476
G1 X70.157 Y77.364 E.89134
G1 X70.157 Y80.653 E.0942
G1 X168.233 Y178.728 E3.97264
G1 X168.233 Y182.02 E.09427
G1 X161.821 Y188.432 E.25972
G1 X162.341 Y188.432 E.0149
G1 X70.157 Y96.247 E3.734
G1 X70.157 Y92.959 E.0942
G1 X107.755 Y55.36 E1.52295
G1 X107.244 Y55.36 E.01465
G1 X168.233 Y116.349 E2.47041
G1 X168.233 Y111.843 E.12906
G1 X107.329 Y172.747 E2.46696
G1 X107.259 Y172.336 E.01195
G1 X123.354 Y188.432 E.65197
G1 X122.834 Y188.432 E.0149
G1 X168.233 Y143.033 E1.83891
G1 X168.233 Y139.741 E.09427
G1 X83.849 Y55.358 E3.41804
G1 X84.366 Y55.358 E.01481
G1 X70.157 Y69.566 E.57554
G1 X70.157 Y72.855 E.0942
G1 X168.233 Y170.931 E3.97264
G1 X168.233 Y174.222 E.09427
G1 X154.023 Y188.432 E.57555
G1 X154.544 Y188.432 E.0149
G1 X70.157 Y104.045 E3.41816
G1 X70.157 Y100.756 E.0942
G1 X115.552 Y55.361 E1.83875
G1 X115.042 Y55.361 E.0146
G1 X168.233 Y108.552 E2.15454
G1 X168.233 Y104.046 E.12906
G1 X106.192 Y166.087 E2.51302
G1 X105.653 Y162.933 E.09163
G1 X131.152 Y188.432 E1.03283
G1 X130.631 Y188.432 E.0149
M73 P32 R42
G1 X168.233 Y150.83 E1.52307
G1 X168.233 Y147.539 E.09427
G1 X76.051 Y55.357 E3.73392
G1 X76.569 Y55.357 E.01486
G1 X70.157 Y61.769 E.25974
G1 X70.157 Y65.058 E.0942
G1 X168.233 Y163.134 E3.97264
G1 X168.233 Y166.425 E.09427
G1 X146.226 Y188.432 E.89139
G1 X146.746 Y188.432 E.0149
G1 X70.157 Y111.842 E3.10232
G1 X70.157 Y108.553 E.0942
G1 X123.348 Y55.362 E2.15455
G1 X122.84 Y55.362 E.01455
G1 X168.233 Y100.755 E1.83866
G1 X168.233 Y99.101 E.04738
G1 X70.157 Y55.607 F30000
G1 F16200
G1 X70.157 Y57.261 E.04738
G1 X168.233 Y155.336 E3.97264
G1 X168.233 Y158.628 E.09427
G1 X138.429 Y188.432 E1.20723
G1 X138.949 Y188.432 E.0149
G1 X104.048 Y153.531 E1.4137
G1 X103.918 Y152.766 E.0222
G1 X168.233 Y88.451 E2.60514
G1 X168.233 Y85.16 E.09427
G1 X138.437 Y55.364 E1.20691
G1 X138.941 Y55.364 E.01444
G1 X70.157 Y124.148 E2.78615
G1 X70.157 Y127.437 E.0942
G1 X90.152 Y147.432 E.8099
G1 X93.658 Y147.432 E.10042
G1 X168.233 Y72.857 E3.02072
G1 X168.233 Y69.565 E.09427
G1 X154.033 Y55.366 E.57516
G1 X154.534 Y55.366 E.01434
G1 X70.157 Y139.743 E3.41776
G1 X70.157 Y143.032 E.0942
G1 X74.557 Y147.432 E.17822
G1 X78.063 Y147.432 E.10042
G1 X168.233 Y57.262 E3.6524
G1 X168.233 Y55.608 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 2.55
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X168.233 Y57.262 E-.62855
G1 X167.988 Y57.507 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 15/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z2.78 I-.99 J-.708 P1  F30000
G1 X102.781 Y148.662 Z2.78
G1 Z2.55
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X102.764 Y148.626 E.00113
G2 X101.384 Y147.785 I-1.416 J.771 E.04848
G1 X70.227 Y147.785 E.8924
G3 X69.803 Y147.378 I-.003 J-.421 E.01863
G1 X69.803 Y55.41 E2.63415
G3 X70.227 Y55.002 I.42 J.013 E.01863
G1 X168.273 Y55.014 E2.80823
G3 X168.586 Y55.41 I-.08 J.385 E.01571
G1 X168.586 Y188.378 E3.80847
G3 X168.171 Y188.785 I-.417 J-.01 E.01846
G1 X110.06 Y188.785 E1.66441
G3 X109.65 Y188.443 I.008 J-.426 E.01651
G1 X102.934 Y149.107 E1.14298
G2 X102.896 Y148.945 I-1.586 J.291 E.00477
G1 X102.803 Y148.718 E.00703
G1 X102.418 Y148.824 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.414 Y148.82 E.00015
G2 X101.363 Y148.184 I-1.071 J.583 E.03422
G1 X70.206 Y148.184 E.82765
G3 X69.405 Y147.388 I-.005 J-.796 E.03333
G1 X69.405 Y55.399 E2.4436
G3 X70.206 Y54.604 I.796 J.001 E.03333
G1 X168.184 Y54.604 E2.60269
G1 X168.305 Y54.616 E.00323
G3 X168.985 Y55.399 I-.109 J.782 E.03006
G1 X168.985 Y188.388 E3.53273
G3 X168.187 Y189.184 I-.793 J.003 E.0333
G1 X110.046 Y189.184 E1.54445
G3 X109.259 Y188.521 I.002 J-.801 E.02967
G1 X102.543 Y149.185 E1.06006
G2 X102.514 Y149.06 I-1.2 J.218 E.0034
G1 X102.441 Y148.88 E.00516
M204 S10000
; WIPE_START
G1 F24000
G1 X102.414 Y148.82 E-.02485
G1 X102.27 Y148.605 E-.09832
G1 X102.12 Y148.46 E-.07933
G1 X101.858 Y148.293 E-.11815
G1 X101.61 Y148.211 E-.09906
G1 X101.363 Y148.184 E-.09472
G1 X100.716 Y148.184 E-.24557
; WIPE_END
G1 E-.04 F1800
G1 X93.106 Y147.604 Z2.95 F30000
G1 X70.157 Y145.856 Z2.95
G1 Z2.55
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X70.157 Y147.349 E.04276
G2 X70.266 Y147.432 I.082 J.004 E.00459
G1 X162.33 Y55.367 E3.72916
G1 X161.832 Y55.367 E.01429
G1 X168.233 Y61.768 E.25929
G1 X168.233 Y65.059 E.09427
G1 X85.86 Y147.432 E3.33657
G1 X82.354 Y147.432 E.10042
G1 X70.157 Y135.234 E.49405
G1 X70.157 Y131.945 E.09421
G1 X146.737 Y55.365 E3.10195
G1 X146.235 Y55.365 E.01439
G1 X168.233 Y77.363 E.89104
G1 X168.233 Y80.654 E.09427
G1 X101.45 Y147.437 E2.70509
G1 X97.949 Y147.432 E.10027
G1 X70.157 Y119.64 E1.12573
G1 X70.157 Y116.35 E.09421
G1 X131.145 Y55.363 E2.47034
G1 X130.638 Y55.363 E.0145
G1 X168.233 Y92.957 E1.52279
G1 X168.233 Y96.249 E.09427
G1 X105.055 Y159.427 E2.55908
G1 X104.776 Y157.796 E.04738
G1 X168.233 Y188.18 F30000
G1 F16200
G1 X168.233 Y186.526 E.04738
G1 X70.157 Y88.45 E3.97264
G1 X70.157 Y85.161 E.09421
G1 X99.959 Y55.36 E1.20714
G1 X99.445 Y55.359 E.01471
G1 X168.233 Y124.147 E2.78629
G1 X168.233 Y127.438 E.09427
G1 X109.603 Y186.068 E2.37484
G1 X109.882 Y187.698 E.04738
G1 X168.233 Y99.101 F30000
G1 F16200
G1 X168.233 Y100.755 E.04738
G1 X122.84 Y55.362 E1.83867
G1 X123.348 Y55.362 E.01455
G1 X70.157 Y108.553 E2.15454
G1 X70.157 Y111.842 E.09421
G1 X146.746 Y188.432 E3.10231
G1 X146.226 Y188.432 E.0149
G1 X168.233 Y166.425 E.8914
G1 X168.233 Y163.134 E.09427
G1 X70.157 Y65.058 E3.97264
G1 X70.157 Y61.769 E.09421
G1 X76.569 Y55.357 E.25973
G1 X76.051 Y55.357 E.01486
G1 X168.233 Y147.539 E3.73392
G1 X168.233 Y150.83 E.09427
G1 X130.631 Y188.432 E1.52308
G1 X131.152 Y188.432 E.0149
G1 X105.654 Y162.933 E1.03282
G1 X106.192 Y166.087 E.09163
G1 X168.233 Y104.046 E2.51302
G1 X168.233 Y108.552 E.12907
G1 X115.042 Y55.361 E2.15454
G1 X115.552 Y55.361 E.0146
G1 X70.157 Y100.756 E1.83874
G1 X70.157 Y104.045 E.09421
G1 X154.544 Y188.432 E3.41815
G1 X154.023 Y188.432 E.0149
G1 X168.233 Y174.222 E.57556
G1 X168.233 Y170.931 E.09427
G1 X70.157 Y72.856 E3.97264
G1 X70.157 Y69.566 E.09421
G1 X84.366 Y55.358 E.57553
G1 X83.849 Y55.358 E.01481
G1 X168.233 Y139.742 E3.41805
G1 X168.233 Y143.033 E.09427
G1 X122.834 Y188.432 E1.83892
G1 X123.354 Y188.432 E.0149
G1 X107.259 Y172.336 E.65196
G1 X107.329 Y172.747 E.01194
G1 X168.233 Y111.843 E2.46696
G1 X168.233 Y116.349 E.12907
G1 X107.244 Y55.36 E2.47042
G1 X107.755 Y55.36 E.01465
G1 X70.157 Y92.958 E1.52294
G1 X70.157 Y96.248 E.09421
G1 X162.341 Y188.432 E3.73399
G1 X161.821 Y188.432 E.0149
G1 X168.233 Y182.02 E.25972
G1 X168.233 Y178.728 E.09427
G1 X70.157 Y80.653 E3.97264
G1 X70.157 Y77.364 E.09421
G1 X92.162 Y55.359 E.89134
G1 X91.647 Y55.359 E.01476
G1 X168.233 Y131.944 E3.10217
G1 X168.233 Y135.235 E.09427
G1 X115.037 Y188.432 E2.15476
G1 X115.557 Y188.432 E.0149
G1 X108.864 Y181.739 E.2711
G1 X108.466 Y179.407 E.06775
G1 X168.233 Y119.641 E2.4209
G1 X168.233 Y121.295 E.04738
G1 X168.233 Y55.608 F30000
G1 F16200
G1 X168.233 Y57.262 E.04738
G1 X78.063 Y147.432 E3.6524
G1 X74.557 Y147.432 E.10042
G1 X70.157 Y143.032 E.17822
G1 X70.157 Y139.743 E.09421
G1 X154.534 Y55.366 E3.41775
G1 X154.033 Y55.366 E.01434
G1 X168.233 Y69.565 E.57516
G1 X168.233 Y72.857 E.09427
G1 X93.658 Y147.432 E3.02073
G1 X90.152 Y147.432 E.10042
G1 X70.157 Y127.437 E.80989
G1 X70.157 Y124.148 E.09421
G1 X138.941 Y55.364 E2.78615
G1 X138.437 Y55.364 E.01444
G1 X168.233 Y85.16 E1.20691
G1 X168.233 Y88.451 E.09427
G1 X103.918 Y152.766 E2.60514
G1 X104.048 Y153.531 E.02221
G1 X138.949 Y188.432 E1.41369
G1 X138.429 Y188.432 E.0149
G1 X168.233 Y158.627 E1.20724
G1 X168.233 Y155.336 E.09427
G1 X70.157 Y57.261 E3.97264
G1 X70.157 Y55.607 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 2.72
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X70.157 Y57.261 E-.62855
G1 X70.402 Y57.505 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 16/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z2.95 I-1.147 J.407 P1  F30000
G1 X102.781 Y148.662 Z2.95
G1 Z2.72
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X102.764 Y148.626 E.00113
G2 X101.384 Y147.785 I-1.417 J.772 E.04848
G1 X70.227 Y147.785 E.8924
M73 P33 R42
G3 X69.804 Y147.378 I-.003 J-.421 E.01863
G1 X69.804 Y55.41 E2.63415
G3 X70.227 Y55.002 I.42 J.013 E.01863
G1 X168.254 Y55.012 E2.8077
G1 X168.254 Y55.012 E0
G3 X168.587 Y55.41 I-.063 J.39 E.01619
G1 X168.587 Y188.378 E3.80847
G3 X168.17 Y188.785 I-.419 J-.011 E.01846
G1 X110.06 Y188.785 E1.66439
G3 X109.65 Y188.443 I-.016 J-.397 E.01675
G1 X102.934 Y149.107 E1.14298
G2 X102.896 Y148.944 I-1.587 J.291 E.00478
G1 X102.803 Y148.717 E.00702
G1 X102.418 Y148.822 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.409 Y148.823 E.00022
G2 X101.363 Y148.184 I-1.09 J.609 E.03405
G1 X70.206 Y148.184 E.82765
G3 X69.405 Y147.388 I-.005 J-.796 E.03333
G1 X69.405 Y55.399 E2.4436
G3 X70.206 Y54.604 I.796 J.001 E.03333
G1 X168.296 Y54.616 E2.60567
G1 X168.296 Y54.616 E0
G3 X168.985 Y55.399 I-.099 J.782 E.03029
G1 X168.985 Y188.388 E3.53273
G3 X168.186 Y189.184 I-.793 J.003 E.03331
G1 X110.046 Y189.184 E1.54444
G3 X109.259 Y188.521 I-.003 J-.795 E.02972
G1 X102.543 Y149.185 E1.06006
G2 X102.511 Y149.061 I-1.224 J.247 E.0034
G1 X102.44 Y148.878 E.00522
M204 S10000
; WIPE_START
G1 F24000
G1 X102.409 Y148.823 E-.02377
G1 X102.271 Y148.606 E-.09759
G1 X102.079 Y148.426 E-.10003
G1 X101.858 Y148.293 E-.09816
G1 X101.611 Y148.211 E-.09906
G1 X101.363 Y148.184 E-.09472
G1 X100.714 Y148.184 E-.24667
; WIPE_END
G1 E-.04 F1800
G1 X103.685 Y155.214 Z3.12 F30000
G1 X104.777 Y157.796 Z3.12
G1 Z2.72
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X105.055 Y159.426 E.04738
G1 X168.233 Y96.248 E2.55908
G1 X168.233 Y92.958 E.09426
G1 X130.637 Y55.362 E1.52284
G1 X131.146 Y55.362 E.01456
G1 X70.157 Y116.35 E2.47039
G1 X70.157 Y119.64 E.09422
G1 X97.949 Y147.432 E1.12573
G1 X101.45 Y147.437 E.10028
G1 X168.233 Y80.654 E2.7051
G1 X168.233 Y77.363 E.09426
G1 X146.234 Y55.363 E.8911
G1 X146.739 Y55.364 E.01448
G1 X70.157 Y131.945 E3.102
G1 X70.157 Y135.235 E.09422
G1 X82.354 Y147.432 E.49405
G1 X85.86 Y147.432 E.10042
G1 X168.233 Y65.059 E3.33657
G1 X168.233 Y61.768 E.09426
G1 X161.83 Y55.365 E.25936
G1 X162.332 Y55.365 E.01439
G1 X70.246 Y147.432 E3.72964
G3 X70.157 Y147.349 I-.008 J-.08 E.00392
G1 X70.157 Y145.856 E.04276
; WIPE_START
G1 F24000
G1 X70.157 Y147.349 E-.56732
G1 X70.246 Y147.432 E-.0459
G1 X70.519 Y147.158 E-.14678
; WIPE_END
G1 E-.04 F1800
G1 X75.836 Y152.634 Z3.12 F30000
G1 X109.882 Y187.698 Z3.12
G1 Z2.72
G1 E.8 F1800
G1 F16200
G1 X109.603 Y186.067 E.04738
G1 X168.233 Y127.438 E2.37484
G1 X168.233 Y124.147 E.09426
G1 X99.445 Y55.359 E2.78632
G1 X99.959 Y55.359 E.01474
G1 X70.157 Y85.161 E1.20715
G1 X70.157 Y88.45 E.09422
G1 X168.233 Y186.526 E3.97264
G1 X168.233 Y188.18 E.04738
G1 X168.233 Y121.295 F30000
G1 F16200
G1 X168.233 Y119.641 E.04738
G1 X108.466 Y179.407 E2.4209
G1 X108.864 Y181.739 E.06775
G1 X115.557 Y188.432 E.27109
G1 X115.037 Y188.432 E.0149
G1 X168.233 Y135.235 E2.15476
G1 X168.233 Y131.944 E.09426
G1 X91.647 Y55.358 E3.10219
G1 X92.163 Y55.358 E.01478
G1 X70.157 Y77.364 E.89135
G1 X70.157 Y80.653 E.09422
G1 X168.233 Y178.729 E3.97264
G1 X168.233 Y182.019 E.09426
G1 X161.821 Y188.432 E.25973
G1 X162.341 Y188.432 E.0149
G1 X70.157 Y96.248 E3.73398
G1 X70.157 Y92.958 E.09422
G1 X107.756 Y55.36 E1.52296
G1 X107.243 Y55.36 E.01469
G1 X168.233 Y116.35 E2.47045
G1 X168.233 Y111.843 E.12907
G1 X107.329 Y172.747 E2.46696
G1 X107.259 Y172.336 E.01193
G1 X123.354 Y188.432 E.65195
G1 X122.834 Y188.432 E.0149
G1 X168.233 Y143.033 E1.83892
G1 X168.233 Y139.742 E.09426
G1 X83.849 Y55.357 E3.41806
G1 X84.366 Y55.357 E.01483
G1 X70.157 Y69.566 E.57554
G1 X70.157 Y72.856 E.09422
G1 X168.233 Y170.931 E3.97264
G1 X168.233 Y174.222 E.09426
G1 X154.023 Y188.432 E.57557
G1 X154.544 Y188.432 E.0149
G1 X70.157 Y104.045 E3.41815
G1 X70.157 Y100.756 E.09422
G1 X115.553 Y55.36 E1.83877
G1 X115.041 Y55.36 E.01465
G1 X168.233 Y108.552 E2.15458
G1 X168.233 Y104.046 E.12907
G1 X106.192 Y166.087 E2.51302
G1 X105.654 Y162.934 E.09162
G1 X131.152 Y188.432 E1.03282
G1 X130.631 Y188.432 E.0149
G1 X168.233 Y150.83 E1.52308
G1 X168.233 Y147.539 E.09426
G1 X76.05 Y55.357 E3.73393
G1 X76.57 Y55.357 E.01487
G1 X70.157 Y61.769 E.25973
G1 X70.157 Y65.058 E.09422
G1 X168.233 Y163.134 E3.97264
G1 X168.233 Y166.425 E.09426
G1 X146.226 Y188.432 E.89141
G1 X146.746 Y188.432 E.0149
G1 X70.157 Y111.842 E3.10231
G1 X70.157 Y108.553 E.09422
G1 X123.349 Y55.361 E2.15458
G1 X122.839 Y55.361 E.01461
G1 X168.233 Y100.755 E1.83871
G1 X168.233 Y99.101 E.04738
G1 X70.157 Y55.607 F30000
G1 F16200
G1 X70.157 Y57.261 E.04738
G1 X168.233 Y155.336 E3.97264
G1 X168.233 Y158.627 E.09426
G1 X138.429 Y188.432 E1.20724
G1 X138.949 Y188.432 E.0149
G1 X104.048 Y153.531 E1.41368
G1 X103.918 Y152.766 E.02222
G1 X168.233 Y88.451 E2.60514
G1 X168.233 Y85.16 E.09426
G1 X138.435 Y55.363 E1.20697
G1 X138.942 Y55.363 E.01452
G1 X70.157 Y124.148 E2.7862
G1 X70.157 Y127.437 E.09422
G1 X90.152 Y147.432 E.80989
G1 X93.658 Y147.432 E.10042
G1 X168.233 Y72.856 E3.02073
G1 X168.233 Y69.565 E.09426
G1 X154.032 Y55.364 E.57523
G1 X154.536 Y55.364 E.01443
G1 X70.157 Y139.742 E3.41781
G1 X70.157 Y143.032 E.09422
G1 X74.557 Y147.432 E.17821
G1 X78.063 Y147.432 E.10042
G1 X168.233 Y57.262 E3.65241
G1 X168.233 Y55.608 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 2.89
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X168.233 Y57.262 E-.62855
G1 X167.988 Y57.506 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 17/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z3.12 I-.99 J-.708 P1  F30000
G1 X102.781 Y148.662 Z3.12
G1 Z2.89
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X102.763 Y148.627 E.00112
G2 X101.384 Y147.785 I-1.422 J.78 E.04842
G1 X70.227 Y147.785 E.8924
G3 X69.804 Y147.378 I-.003 J-.421 E.01863
G1 X69.804 Y55.41 E2.63415
G3 X70.227 Y55.002 I.42 J.013 E.01863
G1 X168.246 Y55.011 E2.80745
G3 X168.587 Y55.41 I-.078 J.412 E.01623
G1 X168.587 Y188.378 E3.80848
G3 X168.169 Y188.785 I-.418 J-.01 E.01849
G1 X110.06 Y188.785 E1.66437
G3 X109.65 Y188.443 I.006 J-.423 E.01653
G1 X102.934 Y149.107 E1.14298
G2 X102.895 Y148.944 I-1.594 J.3 E.0048
G1 X102.803 Y148.717 E.007
G1 X102.417 Y148.82 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.414 Y148.82 E.00008
G2 X101.363 Y148.184 I-1.074 J.586 E.0342
G1 X70.206 Y148.184 E.82765
G3 X69.405 Y147.388 I-.005 J-.796 E.03333
G1 X69.405 Y55.399 E2.4436
G3 X70.206 Y54.604 I.796 J.001 E.03333
G1 X168.287 Y54.615 E2.60543
M73 P33 R41
G3 X168.985 Y55.399 I-.089 J.782 E.03054
G1 X168.985 Y188.388 E3.53273
G3 X168.186 Y189.184 I-.793 J.003 E.03332
G1 X110.046 Y189.184 E1.54444
G3 X109.259 Y188.521 I.003 J-.803 E.02966
G1 X102.543 Y149.185 E1.06006
G2 X102.513 Y149.06 I-1.203 J.222 E.00341
G1 X102.439 Y148.875 E.00528
M204 S10000
; WIPE_START
G1 F24000
G1 X102.414 Y148.82 E-.02297
G1 X102.27 Y148.604 E-.0987
G1 X102.082 Y148.427 E-.09818
G1 X101.858 Y148.293 E-.09906
G1 X101.611 Y148.211 E-.09907
G1 X101.363 Y148.184 E-.09472
G1 X100.712 Y148.184 E-.24729
; WIPE_END
G1 E-.04 F1800
G1 X93.102 Y147.604 Z3.29 F30000
G1 X70.158 Y145.856 Z3.29
G1 Z2.89
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X70.158 Y147.349 E.04277
G2 X70.266 Y147.432 I.082 J.004 E.00458
G1 X162.333 Y55.364 E3.72927
G1 X161.829 Y55.364 E.01444
G1 X168.233 Y61.768 E.25941
G1 X168.233 Y65.059 E.09425
G1 X85.86 Y147.432 E3.33658
G1 X82.354 Y147.432 E.10042
G1 X70.158 Y135.235 E.49404
G1 X70.158 Y131.945 E.09423
G1 X146.74 Y55.363 E3.10203
G1 X146.233 Y55.363 E.01452
G1 X168.233 Y77.363 E.89114
G1 X168.233 Y80.654 E.09425
G1 X101.45 Y147.437 E2.7051
G1 X97.949 Y147.432 E.10028
G1 X70.158 Y119.64 E1.12572
G1 X70.158 Y116.35 E.09423
G1 X131.146 Y55.361 E2.47041
G1 X130.637 Y55.361 E.0146
G1 X168.233 Y92.958 E1.52287
G1 X168.233 Y96.248 E.09425
G1 X105.055 Y159.426 E2.55908
G1 X104.777 Y157.796 E.04738
G1 X168.233 Y188.18 F30000
G1 F16200
G1 X168.233 Y186.526 E.04738
G1 X70.158 Y88.451 E3.97264
G1 X70.158 Y85.161 E.09423
G1 X99.96 Y55.359 E1.20716
G1 X99.444 Y55.359 E.01475
G1 X168.233 Y124.147 E2.78634
G1 X168.233 Y127.438 E.09425
G1 X109.604 Y186.067 E2.37484
G1 X109.882 Y187.698 E.04738
G1 X168.233 Y99.101 F30000
G1 F16200
G1 X168.233 Y100.755 E.04738
G1 X122.839 Y55.361 E1.83874
G1 X123.35 Y55.361 E.01464
G1 X70.158 Y108.553 E2.15459
G1 X70.158 Y111.843 E.09423
G1 X146.746 Y188.432 E3.1023
G1 X146.226 Y188.432 E.0149
G1 X168.233 Y166.425 E.89141
G1 X168.233 Y163.134 E.09425
G1 X70.158 Y65.058 E3.97264
G1 X70.158 Y61.769 E.09423
G1 X76.57 Y55.357 E.25973
G1 X76.05 Y55.357 E.01487
G1 X168.233 Y147.539 E3.73394
G1 X168.233 Y150.83 E.09425
G1 X130.631 Y188.432 E1.52309
G1 X131.152 Y188.432 E.0149
G1 X105.654 Y162.934 E1.03281
G1 X106.192 Y166.087 E.09161
G1 X168.233 Y104.046 E2.51302
G1 X168.233 Y108.552 E.12908
G1 X115.041 Y55.36 E2.15461
G1 X115.553 Y55.36 E.01468
G1 X70.158 Y100.755 E1.83878
G1 X70.158 Y104.045 E.09423
G1 X154.544 Y188.432 E3.41814
G1 X154.023 Y188.432 E.0149
G1 X168.233 Y174.222 E.57557
G1 X168.233 Y170.931 E.09425
G1 X70.158 Y72.856 E3.97264
G1 X70.158 Y69.566 E.09423
G1 X84.366 Y55.357 E.57554
G1 X83.848 Y55.357 E.01483
G1 X168.233 Y139.742 E3.41807
M73 P34 R41
G1 X168.233 Y143.032 E.09425
G1 X122.834 Y188.432 E1.83893
G1 X123.354 Y188.432 E.0149
G1 X107.259 Y172.336 E.65195
G1 X107.329 Y172.747 E.01192
G1 X168.233 Y111.843 E2.46696
G1 X168.233 Y116.35 E.12908
G1 X107.243 Y55.359 E2.47047
G1 X107.756 Y55.359 E.01471
G1 X70.158 Y92.958 E1.52297
G1 X70.158 Y96.248 E.09423
G1 X162.341 Y188.432 E3.73398
G1 X161.821 Y188.432 E.0149
G1 X168.233 Y182.019 E.25973
G1 X168.233 Y178.729 E.09425
G1 X70.158 Y80.653 E3.97264
G1 X70.158 Y77.363 E.09423
G1 X92.163 Y55.358 E.89135
G1 X91.646 Y55.358 E.01479
G1 X168.233 Y131.945 E3.10221
G1 X168.233 Y135.235 E.09425
G1 X115.037 Y188.432 E2.15477
G1 X115.557 Y188.432 E.0149
G1 X108.865 Y181.739 E.27108
G1 X108.466 Y179.407 E.06776
G1 X168.233 Y119.64 E2.4209
G1 X168.233 Y121.294 E.04738
G1 X168.233 Y55.607 F30000
G1 F16200
G1 X168.233 Y57.262 E.04738
G1 X78.063 Y147.432 E3.65242
G1 X74.557 Y147.432 E.10042
G1 X70.158 Y143.032 E.1782
G1 X70.158 Y139.742 E.09423
G1 X154.536 Y55.363 E3.41784
G1 X154.031 Y55.363 E.01448
G1 X168.233 Y69.566 E.57527
G1 X168.233 Y72.856 E.09425
G1 X93.658 Y147.432 E3.02074
G1 X90.152 Y147.432 E.10042
G1 X70.158 Y127.437 E.80988
G1 X70.158 Y124.148 E.09423
G1 X138.943 Y55.362 E2.78622
G1 X138.435 Y55.362 E.01456
G1 X168.233 Y85.16 E1.20701
G1 X168.233 Y88.451 E.09425
G1 X103.918 Y152.766 E2.60514
G1 X104.049 Y153.531 E.02223
G1 X138.949 Y188.432 E1.41367
G1 X138.429 Y188.432 E.0149
G1 X168.233 Y158.627 E1.20725
G1 X168.233 Y155.337 E.09425
G1 X70.158 Y57.261 E3.97264
G1 X70.158 Y55.607 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 3.06
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X70.158 Y57.261 E-.62855
G1 X70.402 Y57.506 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 18/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z3.29 I-1.147 J.407 P1  F30000
G1 X102.781 Y148.662 Z3.29
G1 Z3.06
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X102.763 Y148.627 E.00112
G2 X101.385 Y147.785 I-1.423 J.78 E.04842
G1 X70.227 Y147.785 E.8924
G3 X69.804 Y147.378 I-.003 J-.421 E.01863
G1 X69.804 Y55.41 E2.63415
G3 X70.227 Y55.002 I.42 J.013 E.01863
G1 X168.237 Y55.01 E2.8072
G1 X168.237 Y55.01 E0
G3 X168.587 Y55.41 I-.069 J.413 E.01648
G1 X168.587 Y188.378 E3.80847
G3 X168.169 Y188.785 I-.418 J-.011 E.0185
G1 X110.06 Y188.785 E1.66435
G3 X109.65 Y188.443 I.014 J-.433 E.01646
G1 X102.935 Y149.107 E1.14298
G2 X102.895 Y148.944 I-1.595 J.301 E.00481
G1 X102.803 Y148.717 E.00699
G1 X102.417 Y148.819 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.266 Y148.608 E.00688
G2 X101.363 Y148.184 I-.927 J.8 E.0273
G1 X70.206 Y148.184 E.82765
G3 X69.405 Y147.388 I-.005 J-.796 E.03333
G1 X69.405 Y55.399 E2.4436
G3 X70.206 Y54.604 I.796 J.001 E.03333
G1 X168.279 Y54.614 E2.6052
G1 X168.279 Y54.614 E0
G3 X168.985 Y55.399 I-.093 J.794 E.03066
G1 X168.985 Y188.388 E3.53273
G3 X168.186 Y189.184 I-.792 J.003 E.03333
G1 X110.046 Y189.184 E1.54443
G3 X109.259 Y188.521 I-.003 J-.795 E.02972
G1 X102.543 Y149.185 E1.06006
G2 X102.44 Y148.871 I-1.204 J.223 E.0088
M204 S10000
; WIPE_START
G1 F24000
G1 X102.266 Y148.608 E-.11979
G1 X102.082 Y148.427 E-.09811
G1 X101.858 Y148.293 E-.09906
G1 X101.611 Y148.211 E-.09907
G1 X101.363 Y148.184 E-.09473
G1 X100.707 Y148.184 E-.24925
; WIPE_END
G1 E-.04 F1800
G1 X103.683 Y155.212 Z3.46 F30000
G1 X104.777 Y157.796 Z3.46
G1 Z3.06
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X105.055 Y159.426 E.04738
G1 X168.233 Y96.248 E2.55908
G1 X168.233 Y92.958 E.09424
G1 X130.636 Y55.361 E1.5229
G1 X131.147 Y55.361 E.01463
G1 X70.158 Y116.35 E2.47042
G1 X70.158 Y119.64 E.09423
G1 X97.949 Y147.432 E1.12571
G1 X101.45 Y147.437 E.10028
G1 X168.233 Y80.653 E2.70511
G1 X168.233 Y77.363 E.09424
G1 X146.232 Y55.362 E.89117
G1 X146.74 Y55.362 E.01456
G1 X70.158 Y131.945 E3.10205
G1 X70.158 Y135.235 E.09423
G1 X82.354 Y147.432 E.49404
G1 X85.86 Y147.432 E.10042
G1 X168.233 Y65.059 E3.33658
G1 X168.233 Y61.768 E.09424
G1 X161.828 Y55.363 E.25945
G1 X162.334 Y55.363 E.01449
G1 X70.246 Y147.432 E3.72971
G3 X70.158 Y147.349 I-.008 J-.08 E.00392
G1 X70.158 Y145.856 E.04277
; WIPE_START
G1 F24000
G1 X70.158 Y147.349 E-.56743
G1 X70.246 Y147.432 E-.0459
G1 X70.519 Y147.159 E-.14667
; WIPE_END
G1 E-.04 F1800
G1 X75.836 Y152.634 Z3.46 F30000
G1 X109.882 Y187.698 Z3.46
G1 Z3.06
G1 E.8 F1800
G1 F16200
G1 X109.604 Y186.067 E.04738
G1 X168.233 Y127.438 E2.37484
G1 X168.233 Y124.147 E.09424
G1 X99.444 Y55.358 E2.78636
G1 X99.96 Y55.358 E.01477
G1 X70.158 Y85.161 E1.20717
G1 X70.158 Y88.451 E.09423
G1 X168.233 Y186.526 E3.97264
G1 X168.233 Y188.18 E.04738
G1 X168.233 Y121.294 F30000
G1 F16200
G1 X168.233 Y119.64 E.04738
G1 X108.467 Y179.407 E2.4209
G1 X108.865 Y181.739 E.06777
G1 X115.557 Y188.432 E.27107
G1 X115.037 Y188.432 E.0149
G1 X168.233 Y135.235 E2.15477
G1 X168.233 Y131.945 E.09424
G1 X91.646 Y55.358 E3.10222
G1 X92.163 Y55.358 E.01481
G1 X70.158 Y77.363 E.89135
G1 X70.158 Y80.653 E.09423
G1 X168.233 Y178.729 E3.97264
G1 X168.233 Y182.019 E.09424
G1 X161.821 Y188.432 E.25974
G1 X162.341 Y188.432 E.0149
G1 X70.158 Y96.248 E3.73397
G1 X70.158 Y92.958 E.09423
G1 X107.757 Y55.359 E1.52298
G1 X107.242 Y55.359 E.01474
G1 X168.233 Y116.35 E2.47049
G1 X168.233 Y111.843 E.12909
G1 X107.329 Y172.747 E2.46696
G1 X107.259 Y172.337 E.01191
G1 X123.354 Y188.432 E.65194
G1 X122.834 Y188.432 E.0149
G1 X168.233 Y143.032 E1.83893
G1 X168.233 Y139.742 E.09424
G1 X83.848 Y55.357 E3.41809
G1 X84.366 Y55.357 E.01484
G1 X70.158 Y69.566 E.57554
G1 X70.158 Y72.856 E.09423
G1 X168.233 Y170.931 E3.97264
G1 X168.233 Y174.222 E.09424
G1 X154.023 Y188.432 E.57558
G1 X154.544 Y188.432 E.0149
G1 X70.158 Y104.045 E3.41813
G1 X70.158 Y100.755 E.09423
G1 X115.553 Y55.36 E1.83879
G1 X115.04 Y55.36 E.0147
G1 X168.233 Y108.553 E2.15463
G1 X168.233 Y104.046 E.12909
G1 X106.192 Y166.086 E2.51302
G1 X105.654 Y162.934 E.0916
G1 X131.152 Y188.432 E1.0328
G1 X130.631 Y188.432 E.0149
G1 X168.233 Y150.83 E1.5231
G1 X168.233 Y147.539 E.09424
G1 X76.05 Y55.356 E3.73395
G1 X76.57 Y55.357 E.01488
G1 X70.158 Y61.769 E.25972
G1 X70.158 Y65.059 E.09423
G1 X168.233 Y163.134 E3.97264
G1 X168.233 Y166.424 E.09424
G1 X146.226 Y188.432 E.89142
G1 X146.746 Y188.432 E.0149
G1 X70.158 Y111.843 E3.1023
G1 X70.158 Y108.553 E.09423
G1 X123.35 Y55.36 E2.15461
G1 X122.838 Y55.36 E.01466
G1 X168.233 Y100.755 E1.83877
G1 X168.233 Y99.101 E.04738
G1 X70.158 Y55.607 F30000
G1 F16200
G1 X70.158 Y57.261 E.04738
G1 X168.233 Y155.337 E3.97264
G1 X168.233 Y158.627 E.09424
G1 X138.429 Y188.432 E1.20726
G1 X138.949 Y188.432 E.0149
G1 X104.049 Y153.531 E1.41367
G1 X103.918 Y152.766 E.02224
G1 X168.233 Y88.451 E2.60514
G1 X168.233 Y85.16 E.09424
G1 X138.434 Y55.361 E1.20704
G1 X138.944 Y55.361 E.01459
G1 X70.158 Y124.147 E2.78624
G1 X70.158 Y127.437 E.09423
G1 X90.152 Y147.432 E.80988
G1 X93.658 Y147.432 E.10042
G1 X168.233 Y72.856 E3.02074
G1 X168.233 Y69.566 E.09424
G1 X154.03 Y55.363 E.57531
G1 X154.537 Y55.363 E.01452
G1 X70.158 Y139.742 E3.41787
G1 X70.158 Y143.032 E.09423
G1 X74.557 Y147.432 E.1782
G1 X78.063 Y147.432 E.10042
G1 X168.233 Y57.261 E3.65242
G1 X168.233 Y55.607 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 3.23
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X168.233 Y57.261 E-.62855
G1 X167.989 Y57.506 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 19/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
M106 S229.5
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z3.46 I-.99 J-.708 P1  F30000
G1 X102.781 Y148.661 Z3.46
G1 Z3.23
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X102.763 Y148.627 E.00111
G2 X101.385 Y147.785 I-1.424 J.781 E.04841
G1 X70.227 Y147.785 E.8924
G3 X69.804 Y147.378 I-.003 J-.421 E.01863
G1 X69.804 Y55.41 E2.63415
G3 X70.227 Y55.002 I.42 J.013 E.01863
G1 X168.228 Y55.009 E2.80694
G3 X168.587 Y55.41 I-.057 J.412 E.01674
G1 X168.587 Y188.378 E3.80847
G3 X168.169 Y188.785 I-.418 J-.011 E.01852
G1 X110.068 Y188.785 E1.66412
G3 X109.651 Y188.443 I-.016 J-.406 E.01689
G1 X102.935 Y149.107 E1.14298
G2 X102.895 Y148.943 I-1.595 J.302 E.00483
G1 X102.804 Y148.717 E.00698
G1 X102.415 Y148.816 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.267 Y148.608 E.0068
G2 X101.363 Y148.184 I-.927 J.801 E.02731
G1 X70.207 Y148.184 E.82765
G3 X69.406 Y147.388 I-.005 J-.796 E.03333
G1 X69.406 Y55.399 E2.4436
G3 X70.207 Y54.604 I.796 J.001 E.03333
G1 X168.27 Y54.613 E2.60496
G3 X168.986 Y55.399 I-.074 J.786 E.03098
G1 X168.986 Y188.388 E3.53273
M73 P35 R41
G3 X168.186 Y189.184 I-.795 J.001 E.03331
G1 X110.049 Y189.184 E1.54436
G3 X109.26 Y188.521 I.002 J-.804 E.02972
G1 X102.544 Y149.185 E1.06006
G2 X102.439 Y148.87 I-1.204 J.224 E.00883
M204 S10000
; WIPE_START
G1 F24000
G1 X102.267 Y148.608 E-.11922
G1 X102.082 Y148.427 E-.09819
G1 X101.858 Y148.293 E-.09906
G1 X101.611 Y148.211 E-.09907
G1 X101.363 Y148.184 E-.09472
G1 X100.706 Y148.184 E-.24974
; WIPE_END
G1 E-.04 F1800
G1 X102.432 Y155.618 Z3.63 F30000
G1 X109.882 Y187.698 Z3.63
G1 Z3.23
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.604 Y186.067 E.04738
G1 X148.903 Y146.768 E1.59183
G1 X148.903 Y143.804 E.08492
G1 X70.158 Y65.059 E3.18963
G1 X70.158 Y61.768 E.09424
G1 X76.57 Y55.356 E.25972
G1 X76.05 Y55.356 E.01488
G1 X148.903 Y128.209 E2.95095
G1 X148.903 Y131.173 E.08492
G1 X107.33 Y172.747 E1.68395
G1 X107.26 Y172.337 E.01191
G1 X123.354 Y188.432 E.65193
G1 X122.834 Y188.432 E.0149
G1 X148.903 Y162.363 E1.05593
G1 X148.903 Y159.398 E.08491
G1 X70.158 Y80.653 E3.18963
G1 X70.158 Y77.363 E.09424
G1 X92.163 Y55.358 E.89136
G1 X91.646 Y55.358 E.01482
G1 X148.903 Y112.614 E2.31923
G1 X148.903 Y115.579 E.08492
G1 X105.055 Y159.426 E1.77607
G1 X104.777 Y157.796 E.04738
G1 X167.82 Y180.778 F30000
G1 F16200
G1 X167.82 Y182.433 E.04738
G1 X162.234 Y188.018 E.22624
G1 X161.928 Y188.018 E.00879
G1 X149.73 Y175.82 E.49409
G1 X149.73 Y177.131 E.03754
G1 X167.82 Y159.04 E.73276
G1 X167.82 Y162.721 E.10541
G1 X149.73 Y144.631 E.73276
G1 X149.73 Y145.941 E.03754
G1 X167.82 Y127.851 E.73276
G1 X167.82 Y131.531 E.10541
G1 X149.73 Y113.441 E.73276
G1 X149.73 Y114.752 E.03754
G1 X167.82 Y96.662 E.73276
G1 X167.82 Y100.342 E.10541
G1 X149.73 Y82.252 E.73276
G1 X149.73 Y83.562 E.03754
G1 X167.82 Y65.472 E.73276
G1 X167.82 Y69.152 E.10541
G1 X154.443 Y55.775 E.54185
G1 X154.124 Y55.775 E.00912
G1 X149.729 Y60.17 E.17803
G1 X149.729 Y58.859 E.03755
G1 X167.82 Y76.95 E.73277
G1 X167.82 Y73.269 E.10541
G1 X149.73 Y91.36 E.73276
G1 X149.73 Y90.049 E.03754
G1 X167.82 Y108.139 E.73276
G1 X167.82 Y104.459 E.10541
G1 X149.73 Y122.549 E.73276
G1 X149.73 Y121.238 E.03754
G1 X167.82 Y139.329 E.73276
G1 X167.82 Y135.648 E.10541
G1 X149.73 Y153.739 E.73276
G1 X149.73 Y152.428 E.03754
G1 X167.82 Y170.518 E.73276
G1 X167.82 Y166.838 E.10541
G1 X149.729 Y184.928 E.73277
G1 X149.729 Y183.617 E.03755
G1 X154.13 Y188.018 E.17826
G1 X154.437 Y188.018 E.00878
G1 X167.82 Y174.635 E.54208
G1 X167.82 Y178.315 E.10541
G1 X149.73 Y160.225 E.73276
G1 X149.73 Y161.536 E.03754
G1 X167.82 Y143.446 E.73276
G1 X167.82 Y147.126 E.10541
G1 X149.73 Y129.036 E.73276
G1 X149.73 Y130.346 E.03754
G1 X167.82 Y112.256 E.73276
G1 X167.82 Y115.937 E.10541
G1 X149.73 Y97.846 E.73276
G1 X149.73 Y99.157 E.03754
G1 X167.82 Y81.067 E.73276
G1 X167.82 Y84.747 E.10541
G1 X149.73 Y66.657 E.73276
G1 X149.73 Y67.968 E.03754
G1 X161.921 Y55.776 E.49383
G1 X162.241 Y55.776 E.00915
G1 X167.82 Y61.355 E.22599
M73 P35 R40
G1 X167.82 Y57.675 E.10541
G1 X149.73 Y75.765 E.73276
G1 X149.73 Y74.454 E.03754
G1 X167.82 Y92.544 E.73276
G1 X167.82 Y88.864 E.10541
G1 X149.73 Y106.954 E.73276
G1 X149.73 Y105.644 E.03754
G1 X167.82 Y123.734 E.73276
G1 X167.82 Y120.054 E.10541
G1 X149.73 Y138.144 E.73276
G1 X149.73 Y136.833 E.03754
G1 X167.82 Y154.923 E.73276
G1 X167.82 Y151.243 E.10541
G1 X149.73 Y169.333 E.73276
G1 X149.73 Y168.023 E.03754
G1 X167.82 Y186.113 E.73276
G1 X167.82 Y187.767 E.04738
G1 X168.17 Y55.363 F30000
G1 F16200
G1 X168.214 Y55.374 E.00132
G3 X168.233 Y55.439 I-.076 J.058 E.00197
G1 X168.233 Y188.351 E3.80687
G3 X168.15 Y188.432 I-.081 J0 E.00371
G1 X149.316 Y188.432 E.53944
G1 X149.316 Y183.311 E.14666
G3 X149.425 Y183.178 I.216 J.064 E.00506
G1 X149.425 Y181.61 E.0449
G3 X149.316 Y181.476 I.107 J-.198 E.00506
G1 X149.316 Y62.311 E3.41313
G3 X149.425 Y62.178 I.216 J.064 E.00506
G1 X149.425 Y60.61 E.04489
G3 X149.316 Y60.476 I.107 J-.199 E.00507
G1 X149.316 Y55.362 E.1465
G1 X168.11 Y55.363 E.53829
G1 X70.158 Y55.607 F30000
G1 F16200
G1 X70.158 Y57.261 E.04738
G1 X148.903 Y136.006 E3.18963
G1 X148.903 Y138.971 E.08492
G1 X108.467 Y179.407 E1.63789
G1 X108.865 Y181.739 E.06778
G1 X115.557 Y188.432 E.27107
G1 X115.037 Y188.432 E.0149
G1 X148.903 Y154.566 E1.37177
G1 X148.903 Y151.601 E.08492
G1 X70.158 Y72.856 E3.18963
G1 X70.158 Y69.566 E.09424
G1 X84.367 Y55.357 E.57554
G1 X83.848 Y55.357 E.01485
G1 X148.903 Y120.411 E2.63509
G1 X148.903 Y123.376 E.08492
G1 X106.192 Y166.086 E1.73001
G1 X105.654 Y162.934 E.09159
G1 X131.152 Y188.432 E1.0328
G1 X130.631 Y188.432 E.0149
G1 X148.903 Y170.16 E.74009
G1 X148.903 Y167.196 E.08491
G1 X70.158 Y88.451 E3.18963
G1 X70.158 Y85.16 E.09424
G1 X99.96 Y55.358 E1.20717
G1 X99.444 Y55.358 E.01479
G1 X148.903 Y104.817 E2.00337
G1 X148.903 Y107.781 E.08492
G1 X103.918 Y152.766 E1.82213
G1 X104.049 Y153.531 E.02225
G1 X138.949 Y188.432 E1.41366
G1 X138.429 Y188.432 E.0149
G1 X148.903 Y177.958 E.42425
G1 X148.903 Y174.993 E.08491
G1 X70.158 Y96.248 E3.18963
G1 X70.158 Y92.958 E.09424
G1 X107.757 Y55.359 E1.52299
G1 X107.242 Y55.359 E.01476
G1 X148.903 Y97.019 E1.6875
G1 X148.903 Y99.984 E.08492
G1 X101.45 Y147.437 E1.92211
G1 X97.949 Y147.432 E.10028
G1 X70.158 Y119.64 E1.12571
G1 X70.158 Y116.35 E.09424
G1 X131.147 Y55.36 E2.47044
G1 X130.636 Y55.36 E.01466
G1 X148.903 Y73.627 E.73992
G1 X148.903 Y76.592 E.08492
G1 X78.063 Y147.432 E2.86942
G1 X74.557 Y147.432 E.10042
G1 X70.158 Y143.032 E.17819
G1 X70.158 Y139.742 E.09424
G1 X149.011 Y60.889 E3.19403
G3 X148.902 Y59.389 I3.606 J-1.016 E.04337
G1 X148.902 Y58.032 E.03885
G1 X146.231 Y55.361 E.10819
G1 X146.741 Y55.361 E.0146
G1 X70.158 Y131.945 E3.10208
G1 X70.158 Y135.235 E.09424
G1 X82.354 Y147.432 E.49403
G1 X85.86 Y147.432 E.10042
G1 X148.903 Y84.389 E2.55358
G1 X148.903 Y81.425 E.08492
G1 X122.838 Y55.36 E1.05578
G1 X123.351 Y55.36 E.01469
G1 X70.158 Y108.553 E2.15462
G1 X70.158 Y111.843 E.09424
G1 X146.746 Y188.432 E3.10229
G1 X146.226 Y188.432 E.0149
G1 X148.902 Y185.755 E.10841
G1 X148.902 Y183.229 E.07236
G2 X149.011 Y182.899 I-.46 J-.335 E.01011
G1 X70.158 Y104.046 E3.19403
G1 X70.158 Y100.755 E.09424
G1 X115.554 Y55.359 E1.83881
G1 X115.04 Y55.359 E.01472
G1 X148.903 Y89.222 E1.37164
G1 X148.903 Y92.187 E.08492
G1 X93.658 Y147.432 E2.23774
G1 X90.152 Y147.432 E.10042
G1 X70.158 Y127.438 E.80987
G1 X70.158 Y124.147 E.09424
G1 X138.944 Y55.361 E2.78626
G1 X138.433 Y55.361 E.01463
G1 X148.903 Y65.83 E.42406
G1 X148.903 Y68.795 E.08492
G1 X70.246 Y147.432 E3.18566
G3 X70.158 Y147.349 I-.008 J-.08 E.00392
G1 X70.158 Y145.856 E.04277
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X70.158 Y147.349 E-.56748
G1 X70.246 Y147.432 E-.04591
G1 X70.519 Y147.159 E-.14661
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 20/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z3.63 I-.057 J1.216 P1  F30000
G1 X102.781 Y148.661 Z3.63
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X102.763 Y148.627 E.00111
G2 X101.385 Y147.785 I-1.424 J.782 E.0484
G1 X70.228 Y147.785 E.8924
G3 X69.804 Y147.378 I-.003 J-.421 E.01863
G1 X69.804 Y55.41 E2.63415
G3 X70.228 Y55.002 I.42 J.013 E.01863
G1 X168.22 Y55.008 E2.80669
G3 X168.587 Y55.41 I-.048 J.413 E.017
G1 X168.587 Y188.378 E3.80847
G3 X168.168 Y188.785 I-.398 J.01 E.0188
G1 X110.072 Y188.785 E1.66398
G3 X109.651 Y188.443 I-.016 J-.411 E.01698
G1 X102.935 Y149.107 E1.14298
G2 X102.895 Y148.943 I-1.596 J.302 E.00484
G1 X102.804 Y148.717 E.00697
G1 X102.414 Y148.814 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.267 Y148.608 E.00671
G2 X101.363 Y148.184 I-.928 J.801 E.02731
G1 X70.207 Y148.184 E.82765
G3 X69.406 Y147.388 I-.005 J-.796 E.03333
G1 X69.406 Y55.399 E2.4436
G3 X70.207 Y54.604 I.796 J.001 E.03333
G1 X168.261 Y54.612 E2.60473
G1 X168.261 Y54.612 E0
G3 X168.986 Y55.399 I-.066 J.787 E.03122
G1 X168.986 Y188.388 E3.53273
G3 X168.186 Y189.184 I-.809 J-.013 E.03315
G1 X110.051 Y189.184 E1.54431
G3 X109.26 Y188.521 I-.008 J-.794 E.02983
G1 X102.544 Y149.185 E1.06006
G2 X102.438 Y148.868 I-1.205 J.225 E.00889
M204 S10000
; WIPE_START
G1 F24000
G1 X102.267 Y148.608 E-.11826
G1 X102.082 Y148.427 E-.09827
G1 X101.858 Y148.293 E-.09906
G1 X101.611 Y148.211 E-.09907
G1 X101.363 Y148.184 E-.09472
G1 X100.704 Y148.184 E-.25062
; WIPE_END
G1 E-.04 F1800
G1 X93.237 Y146.6 Z3.8 F30000
G1 X70.572 Y141.793 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X70.572 Y143.447 E.04738
G1 X74.143 Y147.018 E.14466
G1 X70.679 Y147.018 E.09922
G1 X161.922 Y55.775 E3.69588
G1 X162.24 Y55.775 E.0091
G1 X167.82 Y61.355 E.22603
G1 X167.82 Y57.675 E.10542
G1 X78.477 Y147.018 E3.61893
G1 X81.941 Y147.018 E.09922
G1 X70.572 Y135.649 E.4605
G1 X70.572 Y139.328 E.10535
G1 X154.125 Y55.775 E3.38439
G1 X154.442 Y55.775 E.00907
G1 X167.82 Y69.153 E.54189
G1 X167.82 Y65.472 E.10542
G1 X86.274 Y147.018 E3.3031
G1 X89.738 Y147.018 E.09922
G1 X70.572 Y127.852 E.77633
G1 X70.572 Y131.53 E.10535
G1 X146.328 Y55.774 E3.06857
G1 X146.644 Y55.774 E.00905
G1 X167.82 Y76.95 E.85774
G1 X167.82 Y73.269 E.10542
G1 X94.071 Y147.018 E2.98726
G1 X97.536 Y147.018 E.09922
G1 X70.572 Y120.055 E1.09217
G1 X70.572 Y123.733 E.10535
G1 X138.531 Y55.774 E2.75275
G1 X138.846 Y55.774 E.00902
G1 X167.82 Y84.747 E1.1736
G1 X167.82 Y81.067 E.10542
G1 X101.825 Y147.061 E2.67316
G3 X103.207 Y147.907 I-.555 J2.457 E.04723
G1 X110.241 Y187.338 F30000
G1 F16200
G1 X109.963 Y185.708 E.04738
G1 X167.82 Y127.851 E2.34355
G1 X167.82 Y131.531 E.10542
G1 X92.059 Y55.771 E3.06875
G1 X91.75 Y55.771 E.00886
G1 X70.572 Y76.949 E.85783
G1 X70.572 Y73.27 E.10535
G1 X167.82 Y170.518 E3.93911
G1 X167.82 Y166.838 E.10542
G1 X146.64 Y188.018 E.85793
G1 X146.333 Y188.018 E.00878
G1 X70.572 Y112.257 E3.06875
G1 X70.572 Y115.936 E.10535
G1 X130.735 Y55.773 E2.43693
G1 X131.049 Y55.773 E.00899
G1 X167.82 Y92.545 E1.48946
G1 X167.82 Y88.864 E.10542
G1 X104.277 Y152.407 E2.57385
G1 X104.556 Y154.038 E.04741
G1 X138.536 Y188.018 E1.37638
G1 X138.842 Y188.018 E.00878
G1 X167.82 Y159.04 E1.17377
G1 X167.82 Y162.721 E.10542
G1 X70.572 Y65.473 E3.93911
G1 X70.572 Y69.151 E.10535
G1 X83.953 Y55.77 E.54201
G1 X84.262 Y55.77 E.00883
G1 X167.82 Y139.329 E3.38461
G1 X167.82 Y135.648 E.10542
G1 X115.45 Y188.018 E2.12129
G1 X115.143 Y188.018 E.00878
G1 X109.372 Y182.246 E.23378
G1 X108.826 Y179.048 E.09294
G1 X167.82 Y120.053 E2.38961
G1 X167.82 Y123.734 E.10542
G1 X99.857 Y55.771 E2.75289
G1 X99.547 Y55.771 E.00889
G1 X70.572 Y84.746 E1.17365
G1 X70.572 Y81.068 E.10535
M73 P36 R40
G1 X167.82 Y178.316 E3.93911
G1 X167.82 Y174.635 E.10542
G1 X154.437 Y188.018 E.54209
G1 X154.13 Y188.018 E.00879
G1 X70.572 Y104.46 E3.38459
G1 X70.572 Y108.138 E.10535
G1 X122.938 Y55.773 E2.12111
G1 X123.251 Y55.773 E.00897
G1 X167.82 Y100.342 E1.80532
G1 X167.82 Y96.661 E.10542
G1 X105.414 Y159.067 E2.52779
G1 X105.136 Y157.436 E.04738
G1 X167.82 Y187.767 F30000
G1 F16200
G1 X167.82 Y186.113 E.04738
G1 X70.572 Y88.865 E3.93911
G1 X70.572 Y92.543 E.10535
G1 X107.344 Y55.772 E1.48947
G1 X107.655 Y55.772 E.00891
G1 X167.82 Y115.937 E2.43703
G1 X167.82 Y112.256 E.10542
G1 X107.689 Y172.387 E2.43567
G1 X107.767 Y172.844 E.01326
G1 X122.941 Y188.018 E.61465
G1 X123.248 Y188.018 E.00878
G1 X167.82 Y143.446 E1.80545
G1 X167.82 Y147.126 E.10542
G1 X76.464 Y55.77 E3.70046
G1 X76.156 Y55.77 E.00881
G1 X70.572 Y61.354 E.22619
G1 X70.572 Y57.676 E.10535
G1 X167.82 Y154.924 E3.93911
G1 X167.82 Y151.243 E.10542
G1 X131.045 Y188.018 E1.48961
G1 X130.738 Y188.018 E.00878
G1 X106.161 Y163.441 E.99551
G1 X106.552 Y165.727 E.06643
G1 X167.82 Y104.459 E2.48173
G1 X167.82 Y108.139 E.10542
G1 X115.453 Y55.772 E2.12118
G1 X115.141 Y55.772 E.00894
G1 X70.572 Y100.341 E1.80529
G1 X70.572 Y96.663 E.10535
G1 X161.928 Y188.018 E3.70043
G1 X162.234 Y188.018 E.00879
G1 X167.82 Y182.432 E.22625
G1 X167.82 Y180.778 E.04738
G1 X149.174 Y55.361 F30000
G1 F16200
G1 X168.214 Y55.374 E.54535
G3 X168.233 Y55.439 I-.076 J.057 E.00196
G1 X168.233 Y188.349 E3.80681
G3 X168.149 Y188.432 I-.08 J.003 E.0038
G1 X110.108 Y188.432 E1.66242
G3 X109.995 Y188.351 I-.026 J-.083 E.00462
G1 X103.283 Y149.038 E1.1423
G2 X101.405 Y147.432 I-1.984 J.419 E.07611
G1 X70.247 Y147.432 E.89242
G3 X70.159 Y147.349 I-.008 J-.08 E.00392
G1 X70.159 Y55.438 E2.6325
G3 X70.247 Y55.356 I.08 J-.003 E.00392
G1 X149.114 Y55.361 E2.25892
; CHANGE_LAYER
; Z_HEIGHT: 3.57
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X147.114 Y55.361 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 21/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z3.8 I-1.099 J-.522 P1  F30000
G1 X102.781 Y148.661 Z3.8
G1 Z3.57
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X102.763 Y148.627 E.00111
G2 X101.385 Y147.785 I-1.425 J.783 E.0484
G1 X70.228 Y147.785 E.8924
G3 X69.804 Y147.378 I-.003 J-.421 E.01863
G1 X69.804 Y55.41 E2.63415
G3 X70.228 Y55.002 I.42 J.013 E.01863
G1 X168.211 Y55.007 E2.80644
G3 X168.587 Y55.41 I-.039 J.414 E.01725
G1 X168.587 Y188.378 E3.80847
G3 X168.168 Y188.785 I-.418 J-.011 E.01855
G1 X110.072 Y188.785 E1.66396
G3 X109.651 Y188.443 I-.016 J-.411 E.01698
G1 X102.935 Y149.107 E1.14298
G2 X102.895 Y148.942 I-1.597 J.303 E.00486
G1 X102.804 Y148.717 E.00696
G1 X102.412 Y148.812 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.267 Y148.609 E.00663
G2 X101.363 Y148.184 I-.929 J.802 E.02731
G1 X70.207 Y148.184 E.82765
G3 X69.406 Y147.388 I-.005 J-.796 E.03333
G1 X69.406 Y55.399 E2.4436
G3 X70.207 Y54.604 I.796 J.001 E.03333
G1 X168.253 Y54.611 E2.60449
G3 X168.986 Y55.399 I-.057 J.788 E.03146
G1 X168.986 Y188.388 E3.53273
G3 X168.186 Y189.184 I-.808 J-.012 E.03317
G1 X110.051 Y189.184 E1.54431
G3 X109.26 Y188.521 I-.003 J-.8 E.02979
G1 X102.544 Y149.185 E1.06006
G2 X102.437 Y148.866 I-1.206 J.226 E.00896
M204 S10000
; WIPE_START
G1 F24000
G1 X102.267 Y148.609 E-.11721
G1 X102.082 Y148.427 E-.09834
G1 X101.858 Y148.293 E-.09906
G1 X101.611 Y148.211 E-.09907
G1 X101.363 Y148.184 E-.09472
G1 X100.701 Y148.184 E-.2516
; WIPE_END
G1 E-.04 F1800
G1 X103.207 Y147.907 Z3.97 F30000
G1 Z3.57
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G2 X101.825 Y147.061 I-1.936 J1.611 E.04723
G1 X167.82 Y81.067 E2.67317
G1 X167.82 Y84.747 E.10543
G1 X138.846 Y55.773 E1.17363
G1 X138.532 Y55.773 E.00898
G1 X70.572 Y123.733 E2.75278
G1 X70.572 Y120.055 E.10535
G1 X97.536 Y147.018 E1.09217
G1 X94.071 Y147.018 E.09922
G1 X167.82 Y73.269 E2.98726
G1 X167.82 Y76.95 E.10543
G1 X146.643 Y55.773 E.85778
G1 X146.329 Y55.773 E.009
G1 X70.572 Y131.53 E3.0686
G1 X70.572 Y127.852 E.10535
G1 X89.738 Y147.018 E.77633
G1 X86.274 Y147.018 E.09922
G1 X167.82 Y65.472 E3.3031
G1 X167.82 Y69.153 E.10543
G1 X154.441 Y55.774 E.54192
G1 X154.126 Y55.774 E.00903
G1 X70.572 Y139.328 E3.38442
G1 X70.572 Y135.649 E.10535
G1 X81.941 Y147.018 E.4605
G1 X78.477 Y147.018 E.09922
G1 X167.82 Y57.674 E3.61894
G1 X167.82 Y61.355 E.10543
G1 X162.239 Y55.774 E.22607
G1 X161.923 Y55.774 E.00905
G1 X70.679 Y147.018 E3.69591
G1 X74.143 Y147.018 E.09922
G1 X70.572 Y143.447 E.14466
G1 X70.572 Y141.793 E.04738
; WIPE_START
G1 F24000
G1 X70.572 Y143.447 E-.62855
G1 X70.817 Y143.691 E-.13145
; WIPE_END
G1 E-.04 F1800
G1 X77.902 Y146.529 Z3.97 F30000
G1 X105.136 Y157.436 Z3.97
G1 Z3.57
G1 E.8 F1800
G1 F16200
G1 X105.414 Y159.067 E.04738
G1 X167.82 Y96.661 E2.5278
G1 X167.82 Y100.342 E.10543
G1 X123.25 Y55.772 E1.80534
G1 X122.938 Y55.772 E.00894
G1 X70.572 Y108.138 E2.12113
G1 X70.572 Y104.46 E.10535
G1 X154.13 Y188.018 E3.38459
G1 X154.437 Y188.018 E.00879
G1 X167.82 Y174.635 E.5421
G1 X167.82 Y178.316 E.10543
G1 X70.572 Y81.068 E3.93911
G1 X70.572 Y84.746 E.10535
G1 X99.547 Y55.771 E1.17366
G1 X99.857 Y55.771 E.00887
G1 X167.82 Y123.734 E2.75291
G1 X167.82 Y120.053 E.10543
G1 X108.826 Y179.048 E2.38962
G1 X109.372 Y182.246 E.09294
G1 X115.143 Y188.018 E.23378
G1 X115.45 Y188.018 E.00878
G1 X167.82 Y135.648 E2.12129
G1 X167.82 Y139.329 E.10543
G1 X84.261 Y55.77 E3.38462
G1 X83.953 Y55.77 E.00883
G1 X70.572 Y69.151 E.54201
G1 X70.572 Y65.473 E.10535
G1 X167.82 Y162.721 E3.93911
G1 X167.82 Y159.04 E.10543
G1 X138.842 Y188.018 E1.17377
G1 X138.536 Y188.018 E.00878
G1 X104.556 Y154.038 E1.37638
G1 X104.277 Y152.407 E.04741
G1 X167.82 Y88.864 E2.57386
G1 X167.82 Y92.545 E.10543
G1 X131.048 Y55.773 E1.48949
G1 X130.735 Y55.773 E.00896
G1 X70.572 Y115.936 E2.43695
G1 X70.572 Y112.257 E.10535
G1 X146.333 Y188.018 E3.06875
G1 X146.64 Y188.018 E.00878
G1 X167.82 Y166.838 E.85793
G1 X167.82 Y170.518 E.10543
G1 X70.572 Y73.27 E3.93911
G1 X70.572 Y76.949 E.10535
G1 X91.75 Y55.771 E.85784
G1 X92.059 Y55.771 E.00885
G1 X167.82 Y131.532 E3.06876
G1 X167.82 Y127.851 E.10543
G1 X109.963 Y185.708 E2.34356
G1 X110.241 Y187.338 E.04738
G1 X167.82 Y180.778 F30000
G1 F16200
G1 X167.82 Y182.432 E.04738
G1 X162.234 Y188.018 E.22626
G1 X161.928 Y188.018 E.00879
G1 X70.572 Y96.663 E3.70043
G1 X70.572 Y100.341 E.10535
G1 X115.141 Y55.772 E1.80531
G1 X115.452 Y55.772 E.00892
G1 X167.82 Y108.139 E2.1212
G1 X167.82 Y104.459 E.10543
G1 X106.552 Y165.727 E2.48174
G1 X106.161 Y163.441 E.06643
G1 X130.738 Y188.018 E.99551
G1 X131.045 Y188.018 E.00878
G1 X167.82 Y151.243 E1.48961
G1 X167.82 Y154.924 E.10543
G1 X70.572 Y57.676 E3.93911
G1 X70.572 Y61.354 E.10535
G1 X76.156 Y55.77 E.22619
G1 X76.464 Y55.77 E.0088
G1 X167.82 Y147.126 E3.70047
G1 X167.82 Y143.445 E.10543
G1 X123.248 Y188.018 E1.80545
G1 X122.941 Y188.018 E.00878
G1 X107.767 Y172.844 E.61465
G1 X107.689 Y172.387 E.01326
G1 X167.82 Y112.256 E2.43568
G1 X167.82 Y115.937 E.10543
G1 X107.655 Y55.771 E2.43705
G1 X107.344 Y55.771 E.00889
G1 X70.572 Y92.543 E1.48948
G1 X70.572 Y88.865 E.10535
G1 X167.82 Y186.113 E3.93911
G1 X167.82 Y187.767 E.04738
G1 X149.175 Y55.36 F30000
G1 F16200
M73 P36 R39
G1 X168.215 Y55.375 E.54534
G3 X168.234 Y55.439 I-.075 J.057 E.00195
G1 X168.234 Y188.349 E3.80681
G3 X168.15 Y188.432 I-.082 J.001 E.00377
G1 X110.108 Y188.432 E1.66242
G3 X109.995 Y188.351 I-.027 J-.083 E.00462
G1 X103.283 Y149.038 E1.1423
G2 X101.405 Y147.432 I-1.983 J.417 E.07612
G1 X70.247 Y147.432 E.89242
G3 X70.159 Y147.349 I-.008 J-.08 E.00392
G1 X70.159 Y55.438 E2.6325
G3 X70.247 Y55.356 I.08 J-.003 E.00392
G1 X149.115 Y55.36 E2.25894
; CHANGE_LAYER
; Z_HEIGHT: 3.74
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X147.115 Y55.36 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 22/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z3.97 I-1.099 J-.523 P1  F30000
G1 X102.73 Y148.568 Z3.97
G1 Z3.74
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X102.721 Y148.552 E.00053
G2 X101.385 Y147.785 I-1.376 J.85 E.04597
G1 X70.228 Y147.785 E.8924
G3 X69.805 Y147.378 I-.003 J-.421 E.01863
G1 X69.805 Y55.41 E2.63415
G3 X70.228 Y55.002 I.42 J.013 E.01863
G1 X168.202 Y55.006 E2.80618
G3 X168.588 Y55.41 I-.031 J.415 E.01751
G1 X168.588 Y188.378 E3.80847
G3 X168.167 Y188.785 I-.418 J-.011 E.01856
M73 P37 R39
G1 X110.073 Y188.785 E1.66395
G3 X109.651 Y188.443 I-.016 J-.411 E.01698
G1 X102.935 Y149.107 E1.14298
G2 X102.795 Y148.687 I-1.59 J.295 E.01273
G1 X102.759 Y148.621 E.00216
G1 X102.403 Y148.808 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.384 Y148.766 E.00123
G2 X101.364 Y148.184 I-1.04 J.638 E.03256
G1 X70.207 Y148.184 E.82765
G3 X69.406 Y147.388 I-.005 J-.796 E.03333
G1 X69.406 Y55.399 E2.4436
G3 X70.207 Y54.604 I.796 J.001 E.03333
G1 X168.244 Y54.61 E2.60426
G1 X168.244 Y54.61 E0
G3 X168.986 Y55.399 I-.049 J.789 E.0317
G1 X168.986 Y188.388 E3.53273
G3 X168.186 Y189.184 I-.807 J-.012 E.03318
G1 X110.051 Y189.184 E1.5443
G3 X109.26 Y188.521 I-.003 J-.8 E.02979
G1 X102.544 Y149.185 E1.06006
G2 X102.514 Y149.059 I-1.2 J.219 E.00344
G1 X102.427 Y148.863 E.0057
M204 S10000
; WIPE_START
G1 F24000
G1 X102.384 Y148.766 E-.04035
G1 X102.271 Y148.605 E-.07454
G1 X102.082 Y148.427 E-.09861
G1 X101.859 Y148.293 E-.09907
G1 X101.611 Y148.211 E-.09906
G1 X101.364 Y148.184 E-.09473
G1 X100.696 Y148.184 E-.25365
; WIPE_END
G1 E-.04 F1800
G1 X93.23 Y146.6 Z4.14 F30000
G1 X70.572 Y141.793 Z4.14
G1 Z3.74
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X70.572 Y143.447 E.04738
G1 X74.143 Y147.018 E.14466
G1 X70.679 Y147.018 E.09922
G1 X161.924 Y55.773 E3.69595
G1 X162.238 Y55.773 E.009
G1 X167.82 Y61.355 E.22611
G1 X167.82 Y57.674 E.10544
G1 X78.477 Y147.018 E3.61895
G1 X81.941 Y147.018 E.09922
G1 X70.572 Y135.649 E.4605
G1 X70.572 Y139.328 E.10535
G1 X154.127 Y55.773 E3.38445
G1 X154.44 Y55.773 E.00898
G1 X167.82 Y69.153 E.54196
G1 X167.82 Y65.472 E.10544
G1 X86.274 Y147.018 E3.30311
G1 X89.738 Y147.018 E.09922
G1 X70.572 Y127.852 E.77633
G1 X70.572 Y131.53 E.10535
G1 X146.33 Y55.773 E3.06863
G1 X146.643 Y55.773 E.00896
G1 X167.82 Y76.95 E.85781
G1 X167.82 Y73.269 E.10544
G1 X94.071 Y147.018 E2.98727
G1 X97.536 Y147.018 E.09922
G1 X70.572 Y120.055 E1.09217
G1 X70.572 Y123.733 E.10535
G1 X138.533 Y55.772 E2.7528
G1 X138.845 Y55.772 E.00895
G1 X167.82 Y84.748 E1.17367
G1 X167.82 Y81.066 E.10544
G1 X101.825 Y147.061 E2.67318
G3 X103.207 Y147.907 I-.464 J2.308 E.04736
G1 X110.241 Y187.338 F30000
G1 F16200
G1 X109.963 Y185.708 E.04738
G1 X167.82 Y127.851 E2.34357
G1 X167.82 Y131.532 E.10544
G1 X92.059 Y55.77 E3.06878
G1 X91.75 Y55.77 E.00884
G1 X70.572 Y76.949 E.85784
G1 X70.572 Y73.27 E.10535
G1 X167.82 Y170.519 E3.93912
G1 X167.82 Y166.837 E.10544
G1 X146.64 Y188.018 E.85794
G1 X146.333 Y188.018 E.00878
G1 X70.572 Y112.257 E3.06875
G1 X70.572 Y115.936 E.10535
G1 X130.736 Y55.772 E2.43698
G1 X131.047 Y55.772 E.00893
G1 X167.82 Y92.545 E1.48952
G1 X167.82 Y88.864 E.10544
G1 X104.277 Y152.407 E2.57386
G1 X104.556 Y154.038 E.04741
G1 X138.536 Y188.018 E1.37638
G1 X138.842 Y188.018 E.00878
G1 X167.82 Y159.04 E1.17378
G1 X167.82 Y162.721 E.10544
G1 X70.572 Y65.473 E3.93912
G1 X70.572 Y69.151 E.10535
G1 X83.953 Y55.77 E.54202
G1 X84.261 Y55.77 E.00882
G1 X167.82 Y139.329 E3.38463
G1 X167.82 Y135.648 E.10544
G1 X115.45 Y188.018 E2.1213
G1 X115.143 Y188.018 E.00878
G1 X109.372 Y182.246 E.23378
G1 X108.826 Y179.048 E.09294
G1 X167.82 Y120.053 E2.38962
G1 X167.82 Y123.734 E.10544
G1 X99.857 Y55.771 E2.75293
G1 X99.548 Y55.771 E.00885
G1 X70.572 Y84.746 E1.17367
G1 X70.572 Y81.068 E.10535
G1 X167.82 Y178.316 E3.93912
G1 X167.82 Y174.635 E.10544
G1 X154.437 Y188.018 E.5421
G1 X154.13 Y188.018 E.00879
G1 X70.572 Y104.46 E3.38459
G1 X70.572 Y108.138 E.10535
G1 X122.939 Y55.772 E2.12115
G1 X123.25 Y55.772 E.00891
G1 X167.82 Y100.342 E1.80537
G1 X167.82 Y96.661 E.10544
G1 X105.414 Y159.067 E2.5278
G1 X105.136 Y157.436 E.04738
G1 X167.82 Y187.767 F30000
G1 F16200
G1 X167.82 Y186.113 E.04738
G1 X70.572 Y88.865 E3.93912
G1 X70.572 Y92.543 E.10535
G1 X107.345 Y55.771 E1.4895
G1 X107.654 Y55.771 E.00887
G1 X167.82 Y115.937 E2.43707
G1 X167.82 Y112.256 E.10544
G1 X107.689 Y172.387 E2.43568
G1 X107.767 Y172.844 E.01326
G1 X122.941 Y188.018 E.61465
G1 X123.248 Y188.018 E.00878
G1 X167.82 Y143.445 E1.80546
G1 X167.82 Y147.126 E.10544
G1 X76.464 Y55.77 E3.70048
G1 X76.156 Y55.77 E.0088
G1 X70.572 Y61.354 E.22619
G1 X70.572 Y57.676 E.10535
G1 X167.82 Y154.924 E3.93912
G1 X167.82 Y151.243 E.10544
G1 X131.045 Y188.018 E1.48962
G1 X130.738 Y188.018 E.00878
G1 X106.161 Y163.441 E.99551
G1 X106.552 Y165.727 E.06643
G1 X167.82 Y104.458 E2.48174
G1 X167.82 Y108.14 E.10544
G1 X115.452 Y55.771 E2.12122
G1 X115.142 Y55.771 E.00889
G1 X70.572 Y100.341 E1.80532
G1 X70.572 Y96.663 E.10535
G1 X161.928 Y188.018 E3.70043
G1 X162.234 Y188.018 E.00879
G1 X167.82 Y182.432 E.22626
G1 X167.82 Y180.778 E.04738
G1 X149.176 Y55.359 F30000
G1 F16200
G1 X168.157 Y55.36 E.54365
G3 X168.234 Y55.439 I.01 J.067 E.00368
G1 X168.234 Y188.348 E3.80678
G3 X168.15 Y188.432 I-.067 J.017 E.00411
G1 X110.108 Y188.432 E1.66242
G3 X109.995 Y188.351 I-.027 J-.083 E.00462
G1 X103.283 Y149.038 E1.1423
G2 X101.405 Y147.432 I-1.924 J.349 E.07662
G1 X70.247 Y147.432 E.89242
G3 X70.159 Y147.349 I-.008 J-.08 E.00392
G1 X70.159 Y55.438 E2.6325
G3 X70.247 Y55.356 I.08 J-.003 E.00392
G1 X149.116 Y55.359 E2.25896
; CHANGE_LAYER
; Z_HEIGHT: 3.91
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X147.116 Y55.359 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 23/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z4.14 I-1.099 J-.523 P1  F30000
G1 X102.734 Y148.573 Z4.14
G1 Z3.91
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X102.724 Y148.558 E.00052
G2 X101.385 Y147.785 I-1.379 J.844 E.04617
G1 X70.228 Y147.785 E.8924
G3 X69.805 Y147.378 I-.003 J-.421 E.01863
G1 X69.805 Y55.41 E2.63415
G3 X70.228 Y55.002 I.42 J.013 E.01863
G1 X168.194 Y55.005 E2.80593
G3 X168.588 Y55.41 I-.022 J.416 E.01777
G1 X168.588 Y188.371 E3.80827
G3 X168.167 Y188.785 I-.419 J-.004 E.01878
G1 X110.073 Y188.785 E1.66394
G3 X109.651 Y188.443 I-.016 J-.411 E.01698
G1 X102.935 Y149.107 E1.14298
G2 X102.794 Y148.683 I-1.59 J.295 E.01285
G1 X102.762 Y148.626 E.00185
G1 X102.403 Y148.805 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.387 Y148.771 E.001
G2 X101.364 Y148.184 I-1.043 J.632 E.03272
G1 X70.207 Y148.184 E.82765
G3 X69.406 Y147.388 I-.005 J-.796 E.03333
G1 X69.406 Y55.399 E2.4436
G3 X70.207 Y54.604 I.796 J.001 E.03333
G1 X168.235 Y54.609 E2.60403
G3 X168.986 Y55.399 I-.04 J.79 E.03194
G1 X168.986 Y188.386 E3.53266
G3 X168.186 Y189.184 I-.794 J.004 E.0334
G1 X110.051 Y189.184 E1.5443
G3 X109.26 Y188.521 I-.004 J-.799 E.0298
G1 X102.544 Y149.185 E1.06006
G2 X102.514 Y149.059 I-1.199 J.218 E.00344
G1 X102.427 Y148.86 E.00576
M204 S10000
; WIPE_START
G1 F24000
G1 X102.387 Y148.771 E-.03711
G1 X102.272 Y148.605 E-.07686
G1 X102.082 Y148.427 E-.09868
G1 X101.859 Y148.293 E-.09907
G1 X101.612 Y148.211 E-.09906
G1 X101.364 Y148.184 E-.09472
G1 X100.694 Y148.184 E-.2545
; WIPE_END
G1 E-.04 F1800
G1 X103.207 Y147.907 Z4.31 F30000
G1 Z3.91
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G2 X101.825 Y147.061 I-2.047 J1.792 E.0471
G1 X167.82 Y81.066 E2.67318
G1 X167.82 Y84.748 E.10544
G1 X138.844 Y55.772 E1.1737
G1 X138.533 Y55.772 E.00891
G1 X70.572 Y123.733 E2.75283
G1 X70.572 Y120.055 E.10535
G1 X97.536 Y147.018 E1.09217
G1 X94.071 Y147.018 E.09922
G1 X167.82 Y73.269 E2.98727
G1 X167.82 Y76.95 E.10544
G1 X146.642 Y55.772 E.85785
G1 X146.331 Y55.772 E.00892
G1 X70.572 Y131.53 E3.06866
G1 X70.572 Y127.852 E.10535
G1 X89.738 Y147.018 E.77633
G1 X86.274 Y147.018 E.09922
G1 X167.82 Y65.472 E3.30311
G1 X167.82 Y69.153 E.10544
G1 X154.44 Y55.772 E.542
G1 X154.128 Y55.772 E.00894
G1 X70.572 Y139.328 E3.38449
G1 X70.572 Y135.649 E.10535
G1 X81.941 Y147.018 E.4605
G1 X78.477 Y147.018 E.09922
G1 X167.82 Y57.674 E3.61895
G1 X167.82 Y61.356 E.10544
G1 X162.237 Y55.772 E.22615
G1 X161.925 Y55.772 E.00895
G1 X70.679 Y147.018 E3.69598
G1 X74.143 Y147.018 E.09922
G1 X70.572 Y143.447 E.14466
G1 X70.572 Y141.793 E.04738
; WIPE_START
G1 F24000
G1 X70.572 Y143.447 E-.62855
G1 X70.817 Y143.691 E-.13145
; WIPE_END
G1 E-.04 F1800
G1 X77.902 Y146.529 Z4.31 F30000
G1 X105.136 Y157.436 Z4.31
G1 Z3.91
G1 E.8 F1800
G1 F16200
G1 X105.414 Y159.067 E.04738
G1 X167.82 Y96.661 E2.52781
G1 X167.82 Y100.342 E.10544
G1 X123.249 Y55.771 E1.8054
G1 X122.939 Y55.771 E.00888
G1 X70.572 Y108.138 E2.12117
G1 X70.572 Y104.46 E.10535
G1 X154.13 Y188.018 E3.38459
G1 X154.437 Y188.018 E.00879
G1 X167.82 Y174.635 E.54211
G1 X167.82 Y178.316 E.10544
G1 X70.572 Y81.068 E3.93912
G1 X70.572 Y84.746 E.10535
G1 X99.548 Y55.77 E1.17368
G1 X99.856 Y55.77 E.00884
G1 X167.82 Y123.735 E2.75294
G1 X167.82 Y120.053 E.10544
G1 X108.826 Y179.048 E2.38963
G1 X109.372 Y182.246 E.09294
G1 X115.143 Y188.018 E.23378
G1 X115.45 Y188.018 E.00878
G1 X167.82 Y135.648 E2.1213
G1 X167.82 Y139.329 E.10544
G1 X84.261 Y55.77 E3.38464
M73 P38 R39
G1 X83.954 Y55.77 E.00881
G1 X70.572 Y69.151 E.54202
G1 X70.572 Y65.473 E.10535
G1 X167.82 Y162.721 E3.93912
G1 X167.82 Y159.04 E.10544
G1 X138.842 Y188.018 E1.17379
G1 X138.536 Y188.018 E.00878
G1 X104.556 Y154.038 E1.37638
G1 X104.277 Y152.407 E.04741
G1 X167.82 Y88.864 E2.57387
G1 X167.82 Y92.545 E.10544
G1 X131.047 Y55.771 E1.48955
G1 X130.736 Y55.771 E.00889
G1 X70.572 Y115.936 E2.437
G1 X70.572 Y112.257 E.10535
G1 X146.333 Y188.018 E3.06875
G1 X146.64 Y188.018 E.00878
G1 X167.82 Y166.837 E.85795
G1 X167.82 Y170.519 E.10544
G1 X70.572 Y73.27 E3.93912
G1 X70.572 Y76.949 E.10535
G1 X91.751 Y55.77 E.85785
G1 X92.059 Y55.77 E.00882
G1 X167.82 Y131.532 E3.06879
G1 X167.82 Y127.85 E.10544
G1 X109.963 Y185.708 E2.34357
G1 X110.241 Y187.338 E.04738
G1 X167.82 Y180.778 F30000
G1 F16200
G1 X167.82 Y182.432 E.04738
G1 X162.234 Y188.018 E.22627
G1 X161.928 Y188.018 E.00879
G1 X70.572 Y96.663 E3.70043
G1 X70.572 Y100.341 E.10535
G1 X115.142 Y55.771 E1.80534
G1 X115.452 Y55.771 E.00887
G1 X167.82 Y108.14 E2.12124
G1 X167.82 Y104.458 E.10544
G1 X106.552 Y165.727 E2.48175
G1 X106.161 Y163.441 E.06643
G1 X130.738 Y188.018 E.99551
G1 X131.045 Y188.018 E.00878
G1 X167.82 Y151.242 E1.48962
G1 X167.82 Y154.924 E.10544
G1 X70.572 Y57.676 E3.93912
G1 X70.572 Y61.354 E.10535
G1 X76.156 Y55.77 E.22619
G1 X76.464 Y55.77 E.0088
G1 X167.82 Y147.127 E3.70049
G1 X167.82 Y143.445 E.10544
G1 X123.248 Y188.018 E1.80546
G1 X122.941 Y188.018 E.00878
G1 X107.767 Y172.844 E.61465
G1 X107.689 Y172.387 E.01326
G1 X167.82 Y112.256 E2.43569
G1 X167.82 Y115.937 E.10544
G1 X107.654 Y55.771 E2.43709
G1 X107.345 Y55.771 E.00885
G1 X70.572 Y92.543 E1.48951
G1 X70.572 Y88.865 E.10535
G1 X167.82 Y186.113 E3.93912
G1 X167.82 Y187.767 E.04738
G1 X70.288 Y55.356 F30000
G1 F16200
G1 X168.152 Y55.359 E2.80301
G3 X168.234 Y55.439 I.013 J.069 E.00382
G1 X168.234 Y188.345 E3.80671
G3 X168.15 Y188.432 I-.068 J.018 E.00416
G1 X110.108 Y188.432 E1.66242
G3 X109.995 Y188.351 I-.027 J-.083 E.00462
G1 X103.283 Y149.038 E1.1423
G2 X101.405 Y147.432 I-1.968 J.4 E.07624
G1 X70.247 Y147.432 E.89242
G3 X70.159 Y147.349 I-.008 J-.08 E.00392
G1 X70.159 Y55.438 E2.6325
G3 X70.228 Y55.358 I.076 J-.005 E.00338
; CHANGE_LAYER
; Z_HEIGHT: 4.08
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X70.159 Y55.438 E-.0405
G1 X70.159 Y57.332 E-.7195
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 24/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
M106 S127.5
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z4.31 I-1.146 J.409 P1  F30000
G1 X102.737 Y148.579 Z4.31
G1 Z4.08
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X102.728 Y148.563 E.00052
G2 X101.385 Y147.785 I-1.382 J.838 E.04636
G1 X70.228 Y147.785 E.8924
G3 X69.805 Y147.378 I-.003 J-.421 E.01863
G1 X69.805 Y55.41 E2.63415
G3 X70.228 Y55.002 I.42 J.013 E.01863
G1 X168.185 Y55.004 E2.80568
G3 X168.588 Y55.41 I-.015 J.417 E.01802
G1 X168.588 Y188.371 E3.80829
G3 X168.167 Y188.785 I-.419 J-.005 E.01876
G1 X110.073 Y188.785 E1.66392
G3 X109.65 Y188.437 I-.016 J-.411 E.01716
G1 X102.935 Y149.107 E1.1428
G2 X102.792 Y148.679 I-1.59 J.295 E.01297
G1 X102.766 Y148.631 E.00155
G1 X102.403 Y148.803 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.391 Y148.776 E.00078
G2 X101.364 Y148.184 I-1.046 J.626 E.03289
G1 X70.207 Y148.184 E.82765
G3 X69.406 Y147.388 I-.005 J-.796 E.03333
G1 X69.406 Y55.399 E2.4436
G3 X70.207 Y54.604 I.796 J.001 E.03333
G1 X168.227 Y54.608 E2.60379
G1 X168.227 Y54.608 E0
G3 X168.986 Y55.399 I-.032 J.791 E.03219
G1 X168.986 Y188.386 E3.53267
G3 X168.186 Y189.184 I-.793 J.004 E.0334
G1 X110.051 Y189.184 E1.54429
G3 X109.26 Y188.519 I.005 J-.809 E.02978
G1 X102.544 Y149.185 E1.06
G2 X102.514 Y149.058 I-1.199 J.218 E.00344
M73 P38 R38
G1 X102.427 Y148.858 E.00581
M204 S10000
; WIPE_START
G1 F24000
G1 X102.391 Y148.776 E-.0339
G1 X102.272 Y148.605 E-.07918
G1 X102.083 Y148.427 E-.09875
G1 X101.859 Y148.294 E-.09897
G1 X101.614 Y148.211 E-.09825
G1 X101.364 Y148.184 E-.09565
G1 X100.692 Y148.184 E-.25531
; WIPE_END
G1 E-.04 F1800
G1 X103.207 Y147.907 Z4.48 F30000
G1 Z4.08
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G2 X101.825 Y147.061 I-2.257 J2.135 E.04693
G1 X148.489 Y100.398 E1.89015
G1 X148.489 Y96.606 E.1086
G1 X107.654 Y55.77 E1.65407
G1 X107.345 Y55.77 E.00883
G1 X70.572 Y92.543 E1.48953
G1 X70.572 Y88.865 E.10535
G1 X148.489 Y166.782 E3.15609
G1 X148.489 Y170.574 E.1086
G1 X131.045 Y188.018 E.70659
G1 X130.738 Y188.018 E.00878
G1 X106.161 Y163.441 E.99551
G1 X106.552 Y165.727 E.06643
G1 X148.489 Y123.79 E1.69872
G1 X148.489 Y119.998 E.1086
G1 X84.261 Y55.77 E2.60161
G1 X83.954 Y55.77 E.0088
G1 X70.572 Y69.151 E.54203
G1 X70.572 Y65.473 E.10535
G1 X148.489 Y143.39 E3.15609
G1 X148.489 Y147.182 E.1086
G1 X109.963 Y185.708 E1.56054
G1 X110.241 Y187.338 E.04738
G1 X149.339 Y188.616 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.41028
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X149.339 Y55.376 E7.17703
G1 X149.799 Y55.376 E.02479
G1 X149.799 Y188.413 E7.16612
G1 X150.26 Y188.413 E.02479
G1 X150.26 Y55.376 E7.16612
G1 X150.72 Y55.376 E.02479
G1 X150.72 Y188.413 E7.16612
G1 X151.18 Y188.413 E.02479
G1 X151.18 Y55.376 E7.16612
G1 X151.641 Y55.376 E.02479
G1 X151.641 Y188.413 E7.16612
G1 X152.101 Y188.413 E.02479
G1 X152.101 Y55.376 E7.16611
G1 X152.561 Y55.376 E.02479
G1 X152.561 Y188.413 E7.16611
G1 X153.021 Y188.413 E.02479
G1 X153.021 Y55.376 E7.16611
G1 X153.482 Y55.376 E.02479
G1 X153.482 Y188.413 E7.16611
G1 X153.942 Y188.413 E.02479
G1 X153.942 Y55.376 E7.16611
G1 X154.402 Y55.376 E.02479
G1 X154.402 Y188.413 E7.16611
G1 X154.863 Y188.413 E.02479
G1 X154.863 Y55.376 E7.16611
G1 X155.323 Y55.376 E.02479
G1 X155.323 Y188.413 E7.16611
G1 X155.783 Y188.413 E.02479
G1 X155.783 Y55.376 E7.16611
G1 X156.243 Y55.376 E.02479
G1 X156.243 Y188.413 E7.16611
G1 X156.704 Y188.413 E.02479
G1 X156.704 Y55.376 E7.16611
G1 X157.164 Y55.376 E.02479
G1 X157.164 Y188.413 E7.16611
G1 X157.624 Y188.413 E.02479
G1 X157.624 Y55.376 E7.16611
G1 X158.084 Y55.376 E.02479
G1 X158.084 Y188.413 E7.16611
G1 X158.545 Y188.413 E.02479
G1 X158.545 Y55.376 E7.16611
G1 X159.005 Y55.376 E.02479
G1 X159.005 Y188.413 E7.16611
G1 X159.465 Y188.413 E.02479
G1 X159.465 Y55.376 E7.16611
G1 X159.926 Y55.376 E.02479
G1 X159.926 Y188.413 E7.16611
G1 X160.386 Y188.413 E.02479
G1 X160.386 Y55.376 E7.1661
G1 X160.846 Y55.376 E.02479
G1 X160.846 Y188.413 E7.1661
G1 X161.306 Y188.413 E.02479
G1 X161.306 Y55.376 E7.1661
G1 X161.767 Y55.376 E.02479
G1 X161.767 Y188.413 E7.1661
G1 X162.227 Y188.413 E.02479
G1 X162.227 Y55.376 E7.1661
G1 X162.687 Y55.376 E.02479
G1 X162.687 Y188.413 E7.1661
M73 P39 R38
G1 X163.148 Y188.413 E.02479
G1 X163.148 Y55.376 E7.1661
G1 X163.608 Y55.376 E.02479
G1 X163.608 Y188.413 E7.1661
G1 X164.068 Y188.413 E.02479
G1 X164.068 Y55.376 E7.1661
G1 X164.528 Y55.376 E.02479
G1 X164.528 Y188.413 E7.1661
G1 X164.989 Y188.413 E.02479
G1 X164.989 Y55.376 E7.1661
G1 X165.449 Y55.376 E.02479
G1 X165.449 Y188.413 E7.1661
G1 X165.909 Y188.413 E.02479
G1 X165.909 Y55.376 E7.1661
G1 X166.37 Y55.376 E.02479
G1 X166.37 Y188.413 E7.1661
G1 X166.83 Y188.413 E.02479
G1 X166.83 Y55.376 E7.1661
G1 X167.29 Y55.376 E.02479
G1 X167.29 Y188.413 E7.1661
G1 X167.75 Y188.413 E.02479
G1 X167.75 Y55.376 E7.1661
G1 X168.146 Y55.376 E.02131
G1 X168.202 Y55.388 E.00309
G1 X168.211 Y55.408 E.00117
G1 X168.211 Y188.611 E7.17501
M106 S127.5
G1 X149.115 Y182.654 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.376482
; LAYER_HEIGHT: 0.17
G1 F15000
M73 P40 R37
G1 X149.115 Y182.194 E.01084
; WIPE_START
G1 F24000
G1 X149.115 Y182.654 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.344 Y179.131 Z4.48 F30000
G1 X70.572 Y141.793 Z4.48
G1 Z4.08
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X70.572 Y143.447 E.04738
G1 X74.143 Y147.018 E.14466
G1 X70.679 Y147.018 E.09922
G1 X148.489 Y69.208 E3.15176
G1 X148.489 Y65.416 E.10861
G1 X138.844 Y55.771 E.39069
G1 X138.534 Y55.771 E.00887
G1 X70.572 Y123.733 E2.75285
G1 X70.572 Y120.055 E.10535
G1 X97.536 Y147.018 E1.09217
G1 X94.071 Y147.018 E.09922
G1 X148.489 Y92.6 E2.20424
G1 X148.489 Y88.808 E.1086
G1 X115.451 Y55.771 E1.33823
G1 X115.142 Y55.771 E.00884
G1 X70.572 Y100.341 E1.80536
G1 X70.572 Y96.663 E.10535
G1 X148.489 Y174.579 E3.15609
G1 X148.489 Y178.371 E.1086
M73 P41 R37
G1 X138.842 Y188.018 E.39075
G1 X138.536 Y188.018 E.00878
G1 X104.556 Y154.038 E1.37638
G1 X104.277 Y152.407 E.04741
G1 X148.489 Y108.195 E1.79084
G1 X148.489 Y104.403 E.1086
G1 X99.856 Y55.77 E1.96992
G1 X99.548 Y55.77 E.00882
G1 X70.572 Y84.746 E1.17369
G1 X70.572 Y81.068 E.10535
G1 X148.489 Y158.985 E3.15609
G1 X148.489 Y162.776 E.1086
G1 X123.248 Y188.018 E1.02243
G1 X122.941 Y188.018 E.00878
G1 X107.767 Y172.844 E.61465
G1 X107.689 Y172.387 E.01326
G1 X148.489 Y131.587 E1.65266
G1 X148.489 Y127.795 E.1086
G1 X76.463 Y55.77 E2.91746
G1 X76.156 Y55.77 E.00879
M73 P41 R36
G1 X70.572 Y61.354 E.2262
G1 X70.572 Y57.676 E.10535
G1 X148.489 Y135.593 E3.15609
G1 X148.489 Y139.384 E.1086
G1 X108.826 Y179.048 E1.6066
G1 X109.372 Y182.246 E.09294
G1 X115.143 Y188.018 E.23378
G1 X115.45 Y188.018 E.00878
G1 X148.489 Y154.979 E1.33827
G1 X148.489 Y151.187 E.1086
G1 X70.572 Y73.27 E3.15609
G1 X70.572 Y76.949 E.10535
G1 X91.751 Y55.77 E.85786
G1 X92.059 Y55.77 E.00881
G1 X148.489 Y112.201 E2.28577
G1 X148.489 Y115.992 E.1086
G1 X105.414 Y159.067 E1.74478
G1 X105.136 Y157.436 E.04738
G1 X148.489 Y63.106 F30000
G1 F16200
G1 X148.516 Y62.082 E.02935
G1 X148.391 Y61.956 E.00507
G1 X148.391 Y61.509 E.01281
G1 X70.572 Y139.328 E3.15211
G1 X70.572 Y135.649 E.10535
G1 X81.941 Y147.018 E.4605
G1 X78.477 Y147.018 E.09922
G1 X148.489 Y77.006 E2.83592
G1 X148.489 Y73.214 E.10861
G1 X131.046 Y55.771 E.70654
G1 X130.737 Y55.771 E.00886
G1 X70.572 Y115.936 E2.43702
G1 X70.572 Y112.257 E.10535
G1 X146.333 Y188.018 E3.06875
G1 X146.64 Y188.018 E.00878
G1 X148.489 Y186.169 E.0749
G1 X148.516 Y183.081 E.08843
G1 X148.391 Y182.956 E.00506
G1 X148.391 Y182.279 E.01941
G1 X70.572 Y104.46 E3.15212
G1 X70.572 Y108.138 E.10535
G1 X122.94 Y55.771 E2.12119
G1 X123.249 Y55.771 E.00885
G1 X148.489 Y81.011 E1.02238
G1 X148.489 Y84.803 E.10861
G1 X86.274 Y147.018 E2.52008
G1 X89.738 Y147.018 E.09922
G1 X70.572 Y127.852 E.77633
G1 X70.572 Y131.53 E.10535
G1 X146.331 Y55.771 E3.06869
G1 X146.641 Y55.771 E.00888
G1 X148.489 Y57.619 E.07484
G1 X148.489 Y59.273 E.04738
G1 X149.115 Y61.654 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.376482
G1 F15000
G1 X149.115 Y61.194 E.01083
G1 X70.341 Y55.356 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X148.902 Y55.358 E2.25014
G1 X148.902 Y60.559 E.14896
G3 X148.804 Y61.002 I-.158 J.198 E.01616
G1 X148.804 Y61.785 E.02242
G1 X149.011 Y61.992 E.00839
G2 X148.903 Y62.229 I3.02 J1.531 E.00746
G1 X148.903 Y181.559 E3.41785
G3 X148.805 Y182.002 I-.158 J.198 E.01616
G1 X148.805 Y182.785 E.02242
G1 X149.011 Y182.992 E.00837
G2 X148.902 Y183.229 I3.647 J1.816 E.00747
G1 X148.902 Y188.432 E.14902
G1 X110.108 Y188.432 E1.11114
G3 X109.995 Y188.351 I-.027 J-.083 E.00462
G1 X103.283 Y149.038 E1.1423
G2 X101.405 Y147.432 I-1.927 J.352 E.07659
G1 X70.247 Y147.432 E.89242
G3 X70.159 Y147.349 I-.008 J-.08 E.00392
G1 X70.159 Y55.438 E2.6325
G3 X70.281 Y55.356 I.088 J-.001 E.00502
; CHANGE_LAYER
; Z_HEIGHT: 4.25
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X70.181 Y55.372 E-.03869
G1 X70.159 Y55.438 E-.02651
G1 X70.159 Y57.267 E-.6948
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 25/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z4.48 I-1.146 J.409 P1  F30000
G1 X102.741 Y148.584 Z4.48
G1 Z4.25
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X102.732 Y148.569 E.00051
G2 X101.386 Y147.785 I-1.385 J.832 E.04655
G1 X70.228 Y147.785 E.8924
G3 X69.805 Y147.378 I-.003 J-.421 E.01863
G1 X69.805 Y55.41 E2.63415
G3 X70.228 Y55.002 I.42 J.013 E.01863
G1 X168.176 Y55.004 E2.80542
G3 X168.588 Y55.41 I-.007 J.419 E.01828
G1 X168.588 Y188.372 E3.80832
G3 X168.166 Y188.785 I-.419 J-.006 E.01875
G1 X110.073 Y188.785 E1.66391
G3 X109.651 Y188.438 I-.016 J-.411 E.01714
G1 X102.936 Y149.107 E1.14282
G2 X102.79 Y148.675 I-1.589 J.294 E.01309
G1 X102.769 Y148.637 E.00125
G1 X102.403 Y148.801 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.394 Y148.782 E.00055
G2 X101.364 Y148.184 I-1.048 J.62 E.03307
G1 X70.207 Y148.184 E.82765
G3 X69.406 Y147.388 I-.005 J-.796 E.03333
G1 X69.406 Y55.399 E2.4436
G3 X70.207 Y54.604 I.796 J.001 E.03333
G1 X168.218 Y54.607 E2.60356
G3 X168.986 Y55.399 I-.024 J.792 E.03243
G1 X168.986 Y188.386 E3.53268
G3 X168.186 Y189.184 I-.793 J.005 E.0334
M73 P42 R36
G1 X110.052 Y189.184 E1.54429
G3 X109.26 Y188.519 I.005 J-.809 E.02977
G1 X102.545 Y149.185 E1.06001
G2 X102.515 Y149.058 I-1.198 J.217 E.00345
G1 X102.427 Y148.856 E.00586
M204 S10000
; WIPE_START
G1 F24000
G1 X102.394 Y148.782 E-.03074
G1 X102.272 Y148.605 E-.0815
G1 X102.083 Y148.427 E-.0988
G1 X101.859 Y148.294 E-.09899
G1 X101.614 Y148.211 E-.09838
G1 X101.364 Y148.184 E-.0955
G1 X100.69 Y148.184 E-.2561
; WIPE_END
G1 E-.04 F1800
G1 X93.059 Y148.04 Z4.65 F30000
G1 X70.178 Y147.61 Z4.65
G1 Z4.25
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40203
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X70.178 Y55.433 E4.76744
G3 X70.213 Y55.378 I.043 J-.012 E.00383
G3 X70.63 Y55.374 I.226 J1.981 E.0216
G1 X70.63 Y147.413 E4.76035
G1 X71.082 Y147.413 E.02338
G1 X71.082 Y55.374 E4.76035
G1 X71.534 Y55.374 E.02338
G1 X71.534 Y147.413 E4.76035
G1 X71.986 Y147.413 E.02338
G1 X71.986 Y55.374 E4.76035
G1 X72.438 Y55.374 E.02338
G1 X72.438 Y147.413 E4.76035
G1 X72.89 Y147.413 E.02338
G1 X72.89 Y55.374 E4.76035
G1 X73.342 Y55.374 E.02338
G1 X73.342 Y147.413 E4.76035
G1 X73.794 Y147.413 E.02338
G1 X73.794 Y55.374 E4.76035
G1 X74.246 Y55.374 E.02338
G1 X74.246 Y147.413 E4.76035
G1 X74.698 Y147.413 E.02338
G1 X74.698 Y55.374 E4.76035
G1 X75.15 Y55.374 E.02338
G1 X75.15 Y147.413 E4.76035
G1 X75.602 Y147.413 E.02338
G1 X75.602 Y55.374 E4.76035
G1 X76.054 Y55.374 E.02338
G1 X76.054 Y147.413 E4.76035
G1 X76.506 Y147.413 E.02338
G1 X76.506 Y55.374 E4.76035
G1 X76.958 Y55.374 E.02338
G1 X76.958 Y147.413 E4.76034
G1 X77.41 Y147.413 E.02338
G1 X77.41 Y55.374 E4.76034
G1 X77.863 Y55.374 E.02338
G1 X77.863 Y147.413 E4.76034
G1 X78.315 Y147.413 E.02338
G1 X78.315 Y55.374 E4.76034
G1 X78.767 Y55.374 E.02338
G1 X78.767 Y147.413 E4.76034
G1 X79.219 Y147.413 E.02338
G1 X79.219 Y55.374 E4.76034
G1 X79.671 Y55.374 E.02338
G1 X79.671 Y147.413 E4.76034
G1 X80.123 Y147.413 E.02338
G1 X80.123 Y55.374 E4.76034
G1 X80.575 Y55.374 E.02338
G1 X80.575 Y147.413 E4.76034
G1 X81.027 Y147.413 E.02338
G1 X81.027 Y55.374 E4.76034
G1 X81.479 Y55.374 E.02338
G1 X81.479 Y147.413 E4.76034
G1 X81.931 Y147.413 E.02338
G1 X81.931 Y55.374 E4.76034
G1 X82.383 Y55.374 E.02338
G1 X82.383 Y147.413 E4.76034
G1 X82.835 Y147.413 E.02338
G1 X82.835 Y55.374 E4.76034
G1 X83.287 Y55.374 E.02338
G1 X83.287 Y147.413 E4.76034
G1 X83.739 Y147.413 E.02338
G1 X83.739 Y55.374 E4.76034
G1 X84.191 Y55.374 E.02338
G1 X84.191 Y147.413 E4.76034
G1 X84.643 Y147.413 E.02338
G1 X84.643 Y55.374 E4.76034
G1 X85.095 Y55.374 E.02338
G1 X85.095 Y147.413 E4.76034
G1 X85.547 Y147.413 E.02338
G1 X85.547 Y55.374 E4.76034
G1 X85.999 Y55.374 E.02338
G1 X85.999 Y147.413 E4.76034
G1 X86.451 Y147.413 E.02338
G1 X86.451 Y55.374 E4.76034
G1 X86.903 Y55.374 E.02338
G1 X86.903 Y147.413 E4.76034
G1 X87.355 Y147.413 E.02338
G1 X87.355 Y55.374 E4.76034
G1 X87.807 Y55.374 E.02338
G1 X87.807 Y147.413 E4.76034
G1 X88.259 Y147.413 E.02338
G1 X88.259 Y55.374 E4.76034
G1 X88.711 Y55.375 E.02338
G1 X88.711 Y147.413 E4.76034
G1 X89.163 Y147.413 E.02338
G1 X89.163 Y55.375 E4.76034
M73 P43 R36
G1 X89.615 Y55.375 E.02338
G1 X89.615 Y147.413 E4.76034
G1 X90.067 Y147.413 E.02338
G1 X90.067 Y55.375 E4.76034
G1 X90.519 Y55.375 E.02338
G1 X90.519 Y147.413 E4.76034
M73 P43 R35
G1 X90.971 Y147.413 E.02338
G1 X90.971 Y55.375 E4.76034
G1 X91.423 Y55.375 E.02338
G1 X91.423 Y147.413 E4.76034
G1 X91.875 Y147.413 E.02338
G1 X91.875 Y55.375 E4.76034
G1 X92.327 Y55.375 E.02338
G1 X92.327 Y147.413 E4.76034
G1 X92.78 Y147.413 E.02338
G1 X92.78 Y55.375 E4.76033
G1 X93.232 Y55.375 E.02338
G1 X93.232 Y147.413 E4.76033
G1 X93.684 Y147.413 E.02338
G1 X93.684 Y55.375 E4.76033
G1 X94.136 Y55.375 E.02338
G1 X94.136 Y147.413 E4.76033
G1 X94.588 Y147.413 E.02338
G1 X94.588 Y55.375 E4.76033
G1 X95.04 Y55.375 E.02338
G1 X95.04 Y147.413 E4.76033
G1 X95.492 Y147.413 E.02338
G1 X95.492 Y55.375 E4.76033
G1 X95.944 Y55.375 E.02338
G1 X95.944 Y147.413 E4.76033
G1 X96.396 Y147.413 E.02338
G1 X96.396 Y55.375 E4.76033
G1 X96.848 Y55.375 E.02338
G1 X96.848 Y147.413 E4.76033
G1 X97.3 Y147.413 E.02338
G1 X97.3 Y55.375 E4.76033
G1 X97.752 Y55.375 E.02338
G1 X97.752 Y147.413 E4.76033
G1 X98.204 Y147.413 E.02338
G1 X98.204 Y55.375 E4.76033
M73 P44 R35
G1 X98.656 Y55.375 E.02338
G1 X98.656 Y147.413 E4.76033
G1 X99.108 Y147.413 E.02338
G1 X99.108 Y55.375 E4.76033
G1 X99.56 Y55.375 E.02338
G1 X99.56 Y147.413 E4.76033
G1 X100.012 Y147.413 E.02338
G1 X100.012 Y55.375 E4.76033
G1 X100.464 Y55.375 E.02338
G1 X100.464 Y147.413 E4.76033
G1 X100.916 Y147.413 E.02338
G1 X100.916 Y55.375 E4.76033
G1 X101.368 Y55.375 E.02338
G1 X101.368 Y147.413 E4.76033
G3 X101.78 Y147.454 I.019 J1.925 E.02147
G1 X101.82 Y147.467 E.00217
G1 X101.82 Y55.375 E4.76312
G1 X102.272 Y55.375 E.02338
G1 X102.272 Y147.643 E4.7722
G3 X102.724 Y147.973 I-.527 J1.197 E.02918
G1 X102.724 Y55.375 E4.78927
G1 X103.176 Y55.375 E.02338
G1 X103.176 Y148.634 E4.82344
G3 X103.301 Y149.034 I-1.22 J.598 E.02179
G1 X103.628 Y150.954 E.10072
G1 X103.628 Y55.375 E4.94345
G1 X104.08 Y55.375 E.02338
G1 X104.08 Y153.601 E5.08039
G1 X104.532 Y156.249 E.13892
G1 X104.532 Y55.375 E5.21732
G1 X104.984 Y55.375 E.02338
G1 X104.984 Y158.897 E5.35426
M73 P44 R34
G1 X105.436 Y161.544 E.13892
G1 X105.436 Y55.375 E5.4912
G1 X105.888 Y55.375 E.02338
G1 X105.888 Y164.192 E5.62814
G1 X106.34 Y166.84 E.13892
G1 X106.34 Y55.375 E5.76507
G1 X106.792 Y55.375 E.02338
G1 X106.792 Y169.487 E5.90201
G1 X107.244 Y172.135 E.13892
G1 X107.244 Y55.375 E6.03895
M73 P45 R34
G1 X107.696 Y55.375 E.02338
G1 X107.697 Y174.782 E6.17588
G1 X108.149 Y177.43 E.13892
G1 X108.149 Y55.375 E6.31282
G1 X108.601 Y55.375 E.02338
G1 X108.601 Y180.078 E6.44976
G1 X109.053 Y182.725 E.13892
G1 X109.053 Y55.375 E6.5867
G1 X109.505 Y55.375 E.02338
G1 X109.505 Y185.373 E6.72363
G1 X109.957 Y188.02 E.13892
G1 X109.957 Y55.375 E6.86057
G1 X110.409 Y55.375 E.02338
G1 X110.409 Y188.413 E6.88088
G1 X110.861 Y188.413 E.02338
G1 X110.861 Y55.375 E6.88088
G1 X111.313 Y55.375 E.02338
G1 X111.313 Y188.413 E6.88088
G1 X111.765 Y188.413 E.02338
G1 X111.765 Y55.375 E6.88088
G1 X112.217 Y55.375 E.02338
G1 X112.217 Y188.413 E6.88088
G1 X112.669 Y188.413 E.02338
G1 X112.669 Y55.375 E6.88088
G1 X113.121 Y55.375 E.02338
G1 X113.121 Y188.413 E6.88088
G1 X113.573 Y188.413 E.02338
G1 X113.573 Y55.375 E6.88088
G1 X114.025 Y55.375 E.02338
G1 X114.025 Y188.413 E6.88088
G1 X114.477 Y188.413 E.02338
G1 X114.477 Y55.375 E6.88088
G1 X114.929 Y55.375 E.02338
G1 X114.929 Y188.413 E6.88088
G1 X115.381 Y188.413 E.02338
G1 X115.381 Y55.375 E6.88088
G1 X115.833 Y55.375 E.02338
G1 X115.833 Y188.413 E6.88088
G1 X116.285 Y188.413 E.02338
G1 X116.285 Y55.375 E6.88088
G1 X116.737 Y55.375 E.02338
G1 X116.737 Y188.413 E6.88088
M73 P46 R34
G1 X117.189 Y188.413 E.02338
G1 X117.189 Y55.375 E6.88088
G1 X117.641 Y55.375 E.02338
G1 X117.641 Y188.413 E6.88088
G1 X118.093 Y188.413 E.02338
G1 X118.093 Y55.375 E6.88088
G1 X118.545 Y55.375 E.02338
G1 X118.545 Y188.413 E6.88088
G1 X118.997 Y188.413 E.02338
G1 X118.997 Y55.375 E6.88088
M73 P46 R33
G1 X119.449 Y55.375 E.02338
G1 X119.449 Y188.413 E6.88088
G1 X119.901 Y188.413 E.02338
G1 X119.901 Y55.375 E6.88088
G1 X120.353 Y55.375 E.02338
G1 X120.353 Y188.413 E6.88088
G1 X120.805 Y188.413 E.02338
G1 X120.805 Y55.375 E6.88088
G1 X121.257 Y55.375 E.02338
G1 X121.257 Y188.413 E6.88088
G1 X121.709 Y188.413 E.02338
G1 X121.709 Y55.375 E6.88088
G1 X122.161 Y55.375 E.02338
G1 X122.161 Y188.413 E6.88088
G1 X122.613 Y188.413 E.02338
G1 X122.613 Y55.375 E6.88088
G1 X123.066 Y55.375 E.02338
G1 X123.066 Y188.413 E6.88088
G1 X123.518 Y188.413 E.02338
G1 X123.518 Y55.375 E6.88088
M73 P47 R33
G1 X123.97 Y55.375 E.02338
G1 X123.97 Y188.413 E6.88088
G1 X124.422 Y188.413 E.02338
G1 X124.422 Y55.375 E6.88087
G1 X124.874 Y55.375 E.02338
G1 X124.874 Y188.413 E6.88087
G1 X125.326 Y188.413 E.02338
G1 X125.326 Y55.375 E6.88087
G1 X125.778 Y55.375 E.02338
G1 X125.778 Y188.413 E6.88087
G1 X126.23 Y188.413 E.02338
G1 X126.23 Y55.375 E6.88087
G1 X126.682 Y55.375 E.02338
G1 X126.682 Y188.413 E6.88087
G1 X127.134 Y188.413 E.02338
G1 X127.134 Y55.375 E6.88087
G1 X127.586 Y55.375 E.02338
G1 X127.586 Y188.413 E6.88087
G1 X128.038 Y188.413 E.02338
G1 X128.038 Y55.375 E6.88087
G1 X128.49 Y55.375 E.02338
G1 X128.49 Y188.413 E6.88087
G1 X128.942 Y188.413 E.02338
G1 X128.942 Y55.375 E6.88087
G1 X129.394 Y55.375 E.02338
G1 X129.394 Y188.413 E6.88087
M73 P47 R32
G1 X129.846 Y188.413 E.02338
G1 X129.846 Y55.375 E6.88087
M73 P48 R32
G1 X130.298 Y55.375 E.02338
G1 X130.298 Y188.413 E6.88087
G1 X130.75 Y188.413 E.02338
G1 X130.75 Y55.375 E6.88087
G1 X131.202 Y55.375 E.02338
G1 X131.202 Y188.413 E6.88087
G1 X131.654 Y188.413 E.02338
G1 X131.654 Y55.375 E6.88087
G1 X132.106 Y55.375 E.02338
G1 X132.106 Y188.413 E6.88087
G1 X132.558 Y188.413 E.02338
G1 X132.558 Y55.375 E6.88087
G1 X133.01 Y55.375 E.02338
G1 X133.01 Y188.413 E6.88087
G1 X133.462 Y188.413 E.02338
G1 X133.462 Y55.375 E6.88087
G1 X133.914 Y55.375 E.02338
G1 X133.914 Y188.413 E6.88087
G1 X134.366 Y188.413 E.02338
G1 X134.366 Y55.375 E6.88087
G1 X134.818 Y55.375 E.02338
G1 X134.818 Y188.413 E6.88087
G1 X135.27 Y188.413 E.02338
G1 X135.27 Y55.375 E6.88087
G1 X135.722 Y55.375 E.02338
G1 X135.722 Y188.413 E6.88087
G1 X136.174 Y188.413 E.02338
G1 X136.174 Y55.375 E6.88087
M73 P49 R32
G1 X136.626 Y55.375 E.02338
G1 X136.626 Y188.413 E6.88087
G1 X137.078 Y188.413 E.02338
G1 X137.078 Y55.375 E6.88087
G1 X137.53 Y55.375 E.02338
G1 X137.53 Y188.413 E6.88087
G1 X137.983 Y188.413 E.02338
G1 X137.983 Y55.375 E6.88087
G1 X138.435 Y55.375 E.02338
G1 X138.435 Y188.413 E6.88087
G1 X138.887 Y188.413 E.02338
G1 X138.887 Y55.375 E6.88087
G1 X139.339 Y55.375 E.02338
G1 X139.339 Y188.413 E6.88087
M73 P49 R31
G1 X139.791 Y188.413 E.02338
G1 X139.791 Y55.375 E6.88086
G1 X140.243 Y55.375 E.02338
G1 X140.243 Y188.413 E6.88086
G1 X140.695 Y188.413 E.02338
G1 X140.695 Y55.375 E6.88086
G1 X141.147 Y55.375 E.02338
G1 X141.147 Y188.413 E6.88086
G1 X141.599 Y188.413 E.02338
G1 X141.599 Y55.375 E6.88086
G1 X142.051 Y55.375 E.02338
G1 X142.051 Y188.413 E6.88086
G1 X142.503 Y188.413 E.02338
G1 X142.503 Y55.375 E6.88086
M73 P50 R31
G1 X142.955 Y55.375 E.02338
G1 X142.955 Y188.413 E6.88086
G1 X143.407 Y188.413 E.02338
G1 X143.407 Y55.375 E6.88086
G1 X143.859 Y55.375 E.02338
G1 X143.859 Y188.413 E6.88086
G1 X144.311 Y188.413 E.02338
G1 X144.311 Y55.375 E6.88086
G1 X144.763 Y55.375 E.02338
G1 X144.763 Y188.413 E6.88086
G1 X145.215 Y188.413 E.02338
G1 X145.215 Y55.375 E6.88086
G1 X145.667 Y55.375 E.02338
G1 X145.667 Y188.413 E6.88086
G1 X146.119 Y188.413 E.02338
G1 X146.119 Y55.375 E6.88086
G1 X146.571 Y55.375 E.02338
G1 X146.571 Y188.413 E6.88086
G1 X147.023 Y188.413 E.02338
G1 X147.023 Y55.375 E6.88086
G1 X147.475 Y55.375 E.02338
G1 X147.475 Y188.413 E6.88086
G1 X147.927 Y188.413 E.02338
G1 X147.927 Y55.375 E6.88086
G1 X148.379 Y55.375 E.02338
G1 X148.379 Y188.413 E6.88086
G1 X148.831 Y188.413 E.02338
G1 X148.831 Y55.375 E6.88086
G1 X149.283 Y55.375 E.02338
G1 X149.283 Y188.616 E6.89133
M106 S127.5
M73 P51 R31
G1 X150.306 Y188.619 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421016
; LAYER_HEIGHT: 0.17
G1 F15000
M73 P51 R30
G1 X149.701 Y188.014 E.02279
G1 X149.701 Y187.47 E.01448
G1 X150.677 Y188.447 E.03677
G1 X151.221 Y188.447 E.01448
G1 X149.701 Y186.927 E.05725
G1 X149.701 Y186.383 E.01448
G1 X151.765 Y188.447 E.07774
G1 X152.308 Y188.447 E.01448
G1 X149.701 Y185.839 E.09822
G1 X149.701 Y185.295 E.01448
G1 X152.852 Y188.447 E.1187
G1 X153.396 Y188.447 E.01448
G1 X149.701 Y184.751 E.13919
G1 X149.701 Y184.208 E.01448
G1 X153.94 Y188.447 E.15967
G1 X154.484 Y188.447 E.01448
G1 X149.701 Y183.664 E.18015
G1 X149.701 Y183.12 E.01448
G1 X155.028 Y188.447 E.20064
G1 X155.571 Y188.447 E.01448
G1 X149.701 Y182.576 E.22112
G1 X149.701 Y182.032 E.01448
G1 X156.115 Y188.447 E.2416
G1 X156.659 Y188.447 E.01448
G1 X149.701 Y181.489 E.26208
G1 X149.701 Y180.945 E.01448
M73 P52 R30
G1 X157.203 Y188.447 E.28256
G1 X157.747 Y188.447 E.01448
G1 X149.701 Y180.401 E.30305
G1 X149.701 Y179.857 E.01448
G1 X158.29 Y188.447 E.32353
G1 X158.834 Y188.447 E.01448
G1 X149.701 Y179.313 E.34402
G1 X149.701 Y178.77 E.01448
G1 X159.378 Y188.447 E.3645
G1 X159.922 Y188.447 E.01448
G1 X149.701 Y178.226 E.38498
G1 X149.701 Y177.682 E.01448
G1 X160.466 Y188.447 E.40547
G1 X161.009 Y188.447 E.01448
G1 X149.701 Y177.138 E.42595
G1 X149.701 Y176.594 E.01448
G1 X161.553 Y188.447 E.44643
G1 X162.097 Y188.447 E.01448
M73 P52 R29
G1 X149.701 Y176.051 E.46692
G1 X149.701 Y175.507 E.01448
G1 X162.641 Y188.447 E.4874
G1 X163.185 Y188.447 E.01448
G1 X149.701 Y174.963 E.50789
G1 X149.701 Y174.419 E.01448
G1 X163.729 Y188.447 E.52837
G1 X164.272 Y188.447 E.01448
G1 X149.701 Y173.875 E.54885
G1 X149.701 Y173.331 E.01448
G1 X164.816 Y188.447 E.56934
G1 X165.36 Y188.447 E.01448
G1 X149.701 Y172.788 E.58982
G1 X149.701 Y172.244 E.01448
G1 X165.904 Y188.447 E.6103
G1 X166.448 Y188.447 E.01448
G1 X149.701 Y171.7 E.63079
G1 X149.701 Y171.156 E.01448
G1 X166.991 Y188.447 E.65127
G1 X167.535 Y188.447 E.01448
G1 X149.701 Y170.612 E.67176
G1 X149.701 Y170.069 E.01448
G1 X168.079 Y188.447 E.69224
G2 X168.241 Y188.399 I.039 J-.17 E.0047
G2 X168.249 Y188.073 I-1.089 J-.189 E.00873
G1 X149.701 Y169.525 E.69865
G1 X149.701 Y168.981 E.01448
G1 X168.249 Y187.529 E.69865
G1 X168.249 Y186.985 E.01448
G1 X149.701 Y168.437 E.69865
G1 X149.701 Y167.893 E.01448
G1 X168.249 Y186.441 E.69865
G1 X168.249 Y185.898 E.01448
G1 X149.701 Y167.349 E.69865
G1 X149.701 Y166.806 E.01448
G1 X168.249 Y185.354 E.69865
G1 X168.249 Y184.81 E.01448
G1 X149.701 Y166.262 E.69865
G1 X149.701 Y165.718 E.01448
G1 X168.249 Y184.266 E.69865
G1 X168.249 Y183.722 E.01448
G1 X149.701 Y165.174 E.69865
G1 X149.701 Y164.63 E.01448
G1 X168.249 Y183.179 E.69865
G1 X168.249 Y182.635 E.01448
G1 X149.701 Y164.087 E.69865
G1 X149.701 Y163.543 E.01448
G1 X168.249 Y182.091 E.69865
G1 X168.249 Y181.547 E.01448
G1 X149.701 Y162.999 E.69865
G1 X149.701 Y162.455 E.01448
G1 X168.249 Y181.003 E.69865
G1 X168.249 Y180.459 E.01448
G1 X149.701 Y161.911 E.69865
G1 X149.701 Y161.368 E.01448
G1 X168.249 Y179.916 E.69865
G1 X168.249 Y179.372 E.01448
G1 X149.701 Y160.824 E.69865
G1 X149.701 Y160.28 E.01448
G1 X168.249 Y178.828 E.69865
G1 X168.249 Y178.284 E.01448
G1 X149.701 Y159.736 E.69865
G1 X149.701 Y159.192 E.01448
G1 X168.249 Y177.74 E.69865
G1 X168.249 Y177.197 E.01448
G1 X149.701 Y158.648 E.69865
G1 X149.701 Y158.105 E.01448
G1 X168.249 Y176.653 E.69865
G1 X168.249 Y176.109 E.01448
G1 X149.701 Y157.561 E.69865
G1 X149.701 Y157.017 E.01448
G1 X168.249 Y175.565 E.69865
G1 X168.249 Y175.021 E.01448
G1 X149.701 Y156.473 E.69865
G1 X149.701 Y155.929 E.01448
G1 X168.249 Y174.478 E.69865
G1 X168.249 Y173.934 E.01448
G1 X149.701 Y155.386 E.69865
G1 X149.701 Y154.842 E.01448
G1 X168.249 Y173.39 E.69865
G1 X168.249 Y172.846 E.01448
G1 X149.701 Y154.298 E.69865
G1 X149.701 Y153.754 E.01448
G1 X168.249 Y172.302 E.69865
G1 X168.249 Y171.758 E.01448
G1 X149.701 Y153.21 E.69865
G1 X149.701 Y152.667 E.01448
G1 X168.249 Y171.215 E.69865
G1 X168.249 Y170.671 E.01448
G1 X149.701 Y152.123 E.69865
G1 X149.701 Y151.579 E.01448
G1 X168.249 Y170.127 E.69865
G1 X168.249 Y169.583 E.01448
G1 X149.701 Y151.035 E.69865
G1 X149.701 Y150.491 E.01448
G1 X168.249 Y169.039 E.69865
G1 X168.249 Y168.496 E.01448
G1 X149.701 Y149.947 E.69865
G1 X149.701 Y149.404 E.01448
G1 X168.249 Y167.952 E.69865
G1 X168.249 Y167.408 E.01448
G1 X149.701 Y148.86 E.69865
G1 X149.701 Y148.316 E.01448
G1 X168.249 Y166.864 E.69865
G1 X168.249 Y166.32 E.01448
G1 X149.701 Y147.772 E.69865
G1 X149.701 Y147.228 E.01448
G1 X168.249 Y165.776 E.69865
G1 X168.249 Y165.233 E.01448
G1 X149.701 Y146.685 E.69865
G1 X149.701 Y146.141 E.01448
G1 X168.249 Y164.689 E.69865
G1 X168.249 Y164.145 E.01448
G1 X149.701 Y145.597 E.69865
G1 X149.701 Y145.053 E.01448
G1 X168.249 Y163.601 E.69865
G1 X168.249 Y163.057 E.01448
G1 X149.701 Y144.509 E.69865
G1 X149.701 Y143.966 E.01448
G1 X168.249 Y162.514 E.69865
G1 X168.249 Y161.97 E.01448
G1 X149.701 Y143.422 E.69865
G1 X149.701 Y142.878 E.01448
G1 X168.249 Y161.426 E.69865
G1 X168.249 Y160.882 E.01448
G1 X149.701 Y142.334 E.69865
G1 X149.701 Y141.79 E.01448
G1 X168.249 Y160.338 E.69865
M73 P53 R29
G1 X168.249 Y159.795 E.01448
G1 X149.701 Y141.246 E.69865
G1 X149.701 Y140.703 E.01448
G1 X168.249 Y159.251 E.69865
G1 X168.249 Y158.707 E.01448
G1 X149.701 Y140.159 E.69865
G1 X149.701 Y139.615 E.01448
G1 X168.249 Y158.163 E.69865
G1 X168.249 Y157.619 E.01448
G1 X149.701 Y139.071 E.69865
G1 X149.701 Y138.527 E.01448
G1 X168.249 Y157.075 E.69865
G1 X168.249 Y156.532 E.01448
G1 X149.701 Y137.984 E.69865
G1 X149.701 Y137.44 E.01448
G1 X168.249 Y155.988 E.69865
G1 X168.249 Y155.444 E.01448
G1 X149.701 Y136.896 E.69865
G1 X149.701 Y136.352 E.01448
G1 X168.249 Y154.9 E.69865
G1 X168.249 Y154.356 E.01448
G1 X149.701 Y135.808 E.69865
G1 X149.701 Y135.265 E.01448
G1 X168.249 Y153.813 E.69865
G1 X168.249 Y153.269 E.01448
G1 X149.701 Y134.721 E.69865
G1 X149.701 Y134.177 E.01448
G1 X168.249 Y152.725 E.69865
G1 X168.249 Y152.181 E.01448
G1 X149.701 Y133.633 E.69865
G1 X149.701 Y133.089 E.01448
G1 X168.249 Y151.637 E.69865
G1 X168.249 Y151.094 E.01448
G1 X149.701 Y132.545 E.69865
G1 X149.701 Y132.002 E.01448
G1 X168.249 Y150.55 E.69865
G1 X168.249 Y150.006 E.01448
G1 X149.701 Y131.458 E.69865
G1 X149.701 Y130.914 E.01448
G1 X168.249 Y149.462 E.69865
G1 X168.249 Y148.918 E.01448
G1 X149.701 Y130.37 E.69865
G1 X149.701 Y129.826 E.01448
G1 X168.249 Y148.374 E.69865
G1 X168.249 Y147.831 E.01448
G1 X149.701 Y129.283 E.69865
G1 X149.701 Y128.739 E.01448
G1 X168.249 Y147.287 E.69865
G1 X168.249 Y146.743 E.01448
G1 X149.701 Y128.195 E.69865
G1 X149.701 Y127.651 E.01448
G1 X168.249 Y146.199 E.69865
G1 X168.249 Y145.655 E.01448
G1 X149.701 Y127.107 E.69865
G1 X149.701 Y126.563 E.01448
G1 X168.249 Y145.112 E.69865
G1 X168.249 Y144.568 E.01448
G1 X149.701 Y126.02 E.69865
G1 X149.701 Y125.476 E.01448
G1 X168.249 Y144.024 E.69865
G1 X168.249 Y143.48 E.01448
G1 X149.701 Y124.932 E.69865
G1 X149.701 Y124.388 E.01448
G1 X168.249 Y142.936 E.69865
G1 X168.249 Y142.393 E.01448
G1 X149.701 Y123.844 E.69865
G1 X149.701 Y123.301 E.01448
G1 X168.249 Y141.849 E.69865
G1 X168.249 Y141.305 E.01448
G1 X149.701 Y122.757 E.69865
G1 X149.701 Y122.213 E.01448
G1 X168.249 Y140.761 E.69865
G1 X168.249 Y140.217 E.01448
G1 X149.701 Y121.669 E.69865
G1 X149.701 Y121.125 E.01448
G1 X168.249 Y139.673 E.69865
G1 X168.249 Y139.13 E.01448
G1 X149.701 Y120.582 E.69865
G1 X149.701 Y120.038 E.01448
G1 X168.249 Y138.586 E.69865
G1 X168.249 Y138.042 E.01448
G1 X149.701 Y119.494 E.69865
G1 X149.701 Y118.95 E.01448
G1 X168.249 Y137.498 E.69865
G1 X168.249 Y136.954 E.01448
G1 X149.701 Y118.406 E.69865
G1 X149.701 Y117.862 E.01448
G1 X168.249 Y136.411 E.69865
G1 X168.249 Y135.867 E.01448
G1 X149.701 Y117.319 E.69865
G1 X149.701 Y116.775 E.01448
G1 X168.249 Y135.323 E.69865
G1 X168.249 Y134.779 E.01448
G1 X149.701 Y116.231 E.69865
G1 X149.701 Y115.687 E.01448
G1 X168.249 Y134.235 E.69865
G1 X168.249 Y133.692 E.01448
G1 X149.701 Y115.143 E.69865
G1 X149.701 Y114.6 E.01448
G1 X168.249 Y133.148 E.69865
G1 X168.249 Y132.604 E.01448
G1 X149.701 Y114.056 E.69865
G1 X149.701 Y113.512 E.01448
G1 X168.249 Y132.06 E.69865
G1 X168.249 Y131.516 E.01448
G1 X149.701 Y112.968 E.69865
G1 X149.701 Y112.424 E.01448
G1 X168.249 Y130.972 E.69865
G1 X168.249 Y130.429 E.01448
G1 X149.701 Y111.881 E.69865
G1 X149.701 Y111.337 E.01448
G1 X168.249 Y129.885 E.69865
G1 X168.249 Y129.341 E.01448
G1 X149.701 Y110.793 E.69865
G1 X149.701 Y110.249 E.01448
G1 X168.249 Y128.797 E.69865
G1 X168.249 Y128.253 E.01448
G1 X149.701 Y109.705 E.69865
G1 X149.701 Y109.161 E.01448
G1 X168.249 Y127.71 E.69865
G1 X168.249 Y127.166 E.01448
G1 X149.701 Y108.618 E.69865
G1 X149.701 Y108.074 E.01448
G1 X168.249 Y126.622 E.69865
G1 X168.249 Y126.078 E.01448
G1 X149.701 Y107.53 E.69865
G1 X149.701 Y106.986 E.01448
G1 X168.249 Y125.534 E.69865
G1 X168.249 Y124.991 E.01448
G1 X149.701 Y106.442 E.69865
G1 X149.701 Y105.899 E.01448
G1 X168.249 Y124.447 E.69865
G1 X168.249 Y123.903 E.01448
G1 X149.701 Y105.355 E.69865
G1 X149.701 Y104.811 E.01448
G1 X168.249 Y123.359 E.69865
G1 X168.249 Y122.815 E.01448
G1 X149.701 Y104.267 E.69865
G1 X149.701 Y103.723 E.01448
G1 X168.249 Y122.271 E.69865
G1 X168.249 Y121.728 E.01448
G1 X149.701 Y103.18 E.69865
G1 X149.701 Y102.636 E.01448
G1 X168.249 Y121.184 E.69865
G1 X168.249 Y120.64 E.01448
G1 X149.701 Y102.092 E.69865
G1 X149.701 Y101.548 E.01448
G1 X168.249 Y120.096 E.69865
G1 X168.249 Y119.552 E.01448
G1 X149.701 Y101.004 E.69865
G1 X149.701 Y100.46 E.01448
G1 X168.249 Y119.009 E.69865
G1 X168.249 Y118.465 E.01448
G1 X149.701 Y99.917 E.69865
G1 X149.701 Y99.373 E.01448
G1 X168.249 Y117.921 E.69865
G1 X168.249 Y117.377 E.01448
G1 X149.701 Y98.829 E.69865
G1 X149.701 Y98.285 E.01448
G1 X168.249 Y116.833 E.69865
G1 X168.249 Y116.289 E.01448
G1 X149.701 Y97.741 E.69865
G1 X149.701 Y97.198 E.01448
G1 X168.249 Y115.746 E.69865
G1 X168.249 Y115.202 E.01448
G1 X149.701 Y96.654 E.69865
G1 X149.701 Y96.11 E.01448
G1 X168.249 Y114.658 E.69865
G1 X168.249 Y114.114 E.01448
G1 X149.701 Y95.566 E.69865
G1 X149.701 Y95.022 E.01448
G1 X168.249 Y113.57 E.69865
G1 X168.249 Y113.027 E.01448
G1 X149.701 Y94.479 E.69865
G1 X149.701 Y93.935 E.01448
G1 X168.249 Y112.483 E.69865
G1 X168.249 Y111.939 E.01448
G1 X149.701 Y93.391 E.69865
G1 X149.701 Y92.847 E.01448
G1 X168.249 Y111.395 E.69865
G1 X168.249 Y110.851 E.01448
G1 X149.701 Y92.303 E.69865
G1 X149.701 Y91.759 E.01448
G1 X168.249 Y110.308 E.69865
G1 X168.249 Y109.764 E.01448
G1 X149.701 Y91.216 E.69865
G1 X149.701 Y90.672 E.01448
G1 X168.249 Y109.22 E.69865
G1 X168.249 Y108.676 E.01448
G1 X149.701 Y90.128 E.69865
G1 X149.701 Y89.584 E.01448
G1 X168.249 Y108.132 E.69865
G1 X168.249 Y107.588 E.01448
G1 X149.701 Y89.04 E.69865
G1 X149.701 Y88.497 E.01448
G1 X168.249 Y107.045 E.69865
G1 X168.249 Y106.501 E.01448
G1 X149.701 Y87.953 E.69865
G1 X149.701 Y87.409 E.01448
G1 X168.249 Y105.957 E.69865
G1 X168.249 Y105.413 E.01448
G1 X149.701 Y86.865 E.69865
G1 X149.701 Y86.321 E.01448
G1 X168.249 Y104.869 E.69865
G1 X168.249 Y104.326 E.01448
G1 X149.701 Y85.777 E.69865
G1 X149.701 Y85.234 E.01448
G1 X168.249 Y103.782 E.69865
G1 X168.249 Y103.238 E.01448
G1 X149.701 Y84.69 E.69865
G1 X149.701 Y84.146 E.01448
G1 X168.249 Y102.694 E.69865
G1 X168.249 Y102.15 E.01448
G1 X149.701 Y83.602 E.69865
G1 X149.701 Y83.058 E.01448
G1 X168.249 Y101.607 E.69865
G1 X168.249 Y101.063 E.01448
G1 X149.701 Y82.515 E.69865
G1 X149.701 Y81.971 E.01448
G1 X168.249 Y100.519 E.69865
G1 X168.249 Y99.975 E.01448
G1 X149.701 Y81.427 E.69865
G1 X149.701 Y80.883 E.01448
G1 X168.249 Y99.431 E.69865
G1 X168.249 Y98.887 E.01448
G1 X149.701 Y80.339 E.69865
G1 X149.701 Y79.796 E.01448
G1 X168.249 Y98.344 E.69865
G1 X168.249 Y97.8 E.01448
G1 X149.701 Y79.252 E.69865
G1 X149.701 Y78.708 E.01448
G1 X168.249 Y97.256 E.69865
G1 X168.249 Y96.712 E.01448
G1 X149.701 Y78.164 E.69865
G1 X149.701 Y77.62 E.01448
G1 X168.249 Y96.168 E.69865
G1 X168.249 Y95.625 E.01448
G1 X149.701 Y77.076 E.69865
G1 X149.701 Y76.533 E.01448
G1 X168.249 Y95.081 E.69865
G1 X168.249 Y94.537 E.01448
G1 X149.701 Y75.989 E.69865
G1 X149.701 Y75.445 E.01448
G1 X168.249 Y93.993 E.69865
G1 X168.249 Y93.449 E.01448
G1 X149.701 Y74.901 E.69865
G1 X149.701 Y74.357 E.01448
G1 X168.249 Y92.906 E.69865
G1 X168.249 Y92.362 E.01448
G1 X149.701 Y73.814 E.69865
G1 X149.701 Y73.27 E.01448
G1 X168.249 Y91.818 E.69865
G1 X168.249 Y91.274 E.01448
G1 X149.701 Y72.726 E.69865
G1 X149.701 Y72.182 E.01448
G1 X168.249 Y90.73 E.69865
G1 X168.249 Y90.186 E.01448
G1 X149.701 Y71.638 E.69865
G1 X149.701 Y71.095 E.01448
G1 X168.249 Y89.643 E.69865
G1 X168.249 Y89.099 E.01448
G1 X149.701 Y70.551 E.69865
G1 X149.701 Y70.007 E.01448
G1 X168.249 Y88.555 E.69865
G1 X168.249 Y88.011 E.01448
G1 X149.701 Y69.463 E.69865
G1 X149.701 Y68.919 E.01448
G1 X168.249 Y87.467 E.69865
G1 X168.249 Y86.924 E.01448
G1 X149.701 Y68.375 E.69865
G1 X149.701 Y67.832 E.01448
G1 X168.249 Y86.38 E.69865
G1 X168.249 Y85.836 E.01448
G1 X149.701 Y67.288 E.69865
G1 X149.701 Y66.744 E.01448
G1 X168.249 Y85.292 E.69865
G1 X168.249 Y84.748 E.01448
G1 X149.701 Y66.2 E.69865
G1 X149.701 Y65.656 E.01448
G1 X168.249 Y84.205 E.69865
G1 X168.249 Y83.661 E.01448
G1 X149.701 Y65.113 E.69865
G1 X149.701 Y64.569 E.01448
G1 X168.249 Y83.117 E.69865
G1 X168.249 Y82.573 E.01448
G1 X149.701 Y64.025 E.69865
G1 X149.701 Y63.481 E.01448
G1 X168.249 Y82.029 E.69865
G1 X168.249 Y81.485 E.01448
G1 X149.701 Y62.937 E.69865
G1 X149.701 Y62.394 E.01448
G1 X168.249 Y80.942 E.69865
G1 X168.249 Y80.398 E.01448
G1 X149.701 Y61.85 E.69865
G1 X149.701 Y61.306 E.01448
G1 X168.249 Y79.854 E.69865
G1 X168.249 Y79.31 E.01448
G1 X149.701 Y60.762 E.69866
G1 X149.701 Y60.218 E.01448
G1 X168.249 Y78.766 E.69866
G1 X168.249 Y78.223 E.01448
G1 X149.701 Y59.674 E.69866
G1 X149.701 Y59.13 E.01448
G1 X168.249 Y77.679 E.69866
G1 X168.249 Y77.135 E.01448
G1 X149.701 Y58.587 E.69866
G1 X149.701 Y58.043 E.01448
G1 X168.249 Y76.591 E.69866
G1 X168.249 Y76.047 E.01448
G1 X149.701 Y57.499 E.69866
G1 X149.701 Y56.955 E.01448
G1 X168.249 Y75.504 E.69866
G1 X168.249 Y74.96 E.01448
G1 X149.701 Y56.411 E.69866
G1 X149.701 Y55.868 E.01448
G1 X168.249 Y74.416 E.69865
G1 X168.249 Y73.872 E.01448
G1 X149.719 Y55.342 E.69797
G1 X150.263 Y55.342 E.01448
G1 X168.249 Y73.328 E.67748
G1 X168.249 Y72.784 E.01448
G1 X150.807 Y55.342 E.657
G1 X151.351 Y55.342 E.01448
G1 X168.249 Y72.241 E.63652
G1 X168.249 Y71.697 E.01448
G1 X151.894 Y55.342 E.61603
G1 X152.438 Y55.342 E.01448
G1 X168.249 Y71.153 E.59555
G1 X168.249 Y70.609 E.01448
G1 X152.982 Y55.342 E.57506
G1 X153.526 Y55.342 E.01448
G1 X168.249 Y70.065 E.55458
G1 X168.249 Y69.522 E.01448
G1 X154.07 Y55.342 E.5341
G1 X154.614 Y55.342 E.01448
G1 X168.249 Y68.978 E.51361
G1 X168.249 Y68.434 E.01448
G1 X155.157 Y55.342 E.49313
G1 X155.701 Y55.342 E.01448
G1 X168.249 Y67.89 E.47264
G1 X168.249 Y67.346 E.01448
G1 X156.245 Y55.342 E.45216
G1 X156.789 Y55.342 E.01448
G1 X168.249 Y66.802 E.43168
G1 X168.249 Y66.259 E.01448
G1 X157.333 Y55.342 E.41119
G1 X157.876 Y55.342 E.01448
G1 X168.249 Y65.715 E.39071
G1 X168.249 Y65.171 E.01448
G1 X158.42 Y55.342 E.37022
G1 X158.964 Y55.342 E.01448
G1 X168.249 Y64.627 E.34974
G1 X168.249 Y64.083 E.01448
G1 X159.508 Y55.342 E.32926
G1 X160.052 Y55.342 E.01448
G1 X168.249 Y63.54 E.30877
G1 X168.249 Y62.996 E.01448
G1 X160.596 Y55.342 E.28829
G1 X161.139 Y55.342 E.01448
G1 X168.249 Y62.452 E.2678
G1 X168.249 Y61.908 E.01448
G1 X161.683 Y55.342 E.24732
G1 X162.227 Y55.342 E.01448
G1 X168.249 Y61.364 E.22684
G1 X168.249 Y60.821 E.01448
G1 X162.771 Y55.342 E.20635
G1 X163.315 Y55.342 E.01448
G1 X168.249 Y60.277 E.18587
G1 X168.249 Y59.733 E.01448
G1 X163.858 Y55.342 E.16538
G1 X164.402 Y55.342 E.01448
G1 X168.249 Y59.189 E.1449
G1 X168.249 Y58.645 E.01448
G1 X164.946 Y55.342 E.12442
G1 X165.49 Y55.342 E.01448
G1 X168.249 Y58.101 E.10393
G1 X168.249 Y57.558 E.01448
G1 X166.034 Y55.342 E.08345
G1 X166.578 Y55.342 E.01448
G1 X168.249 Y57.014 E.06296
G1 X168.249 Y56.47 E.01448
G1 X167.121 Y55.342 E.04248
G1 X167.665 Y55.342 E.01448
G1 X168.422 Y56.099 E.0285
; CHANGE_LAYER
; Z_HEIGHT: 4.42
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X167.665 Y55.342 E-.40658
G1 X167.121 Y55.342 E-.20665
G1 X167.395 Y55.615 E-.14677
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 26/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z4.65 I-.999 J-.695 P1  F30000
G1 X102.757 Y148.622 Z4.65
G1 Z4.42
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X102.735 Y148.574 E.0015
G2 X101.386 Y147.785 I-1.388 J.826 E.04674
G1 X70.228 Y147.785 E.8924
G3 X69.805 Y147.378 I-.003 J-.421 E.01863
G1 X69.805 Y55.41 E2.63415
G3 X70.228 Y55.002 I.42 J.013 E.01863
G1 X168.277 Y55.014 E2.80831
G3 X168.588 Y55.41 I-.093 J.393 E.01555
G1 X168.588 Y188.373 E3.80834
G3 X168.166 Y188.785 I-.419 J-.008 E.01873
G1 X110.073 Y188.785 E1.6639
G3 X109.651 Y188.439 I-.016 J-.411 E.01711
G1 X102.936 Y149.107 E1.14285
G2 X102.896 Y148.94 I-1.589 J.293 E.00492
G1 X102.781 Y148.677 E.00822
G1 X102.403 Y148.799 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.398 Y148.787 E.00034
G2 X101.364 Y148.184 I-1.051 J.614 E.03324
G1 X70.208 Y148.184 E.82765
G3 X69.407 Y147.388 I-.005 J-.796 E.03333
G1 X69.407 Y55.399 E2.4436
G3 X70.208 Y54.604 I.796 J.001 E.03333
G1 X168.209 Y54.606 E2.60332
G1 X168.209 Y54.606 E0
G3 X168.987 Y55.399 I-.016 J.793 E.03268
G1 X168.987 Y188.387 E3.53269
G3 X168.186 Y189.184 I-.792 J.005 E.03341
G1 X110.052 Y189.184 E1.54429
G3 X109.26 Y188.52 I.005 J-.809 E.02977
G1 X102.545 Y149.185 E1.06002
G2 X102.515 Y149.058 I-1.198 J.216 E.00345
G1 X102.427 Y148.854 E.00592
M204 S10000
; WIPE_START
G1 F24000
G1 X102.398 Y148.787 E-.02761
G1 X102.272 Y148.606 E-.08382
G1 X102.083 Y148.427 E-.09886
G1 X101.859 Y148.294 E-.09901
G1 X101.614 Y148.211 E-.09851
G1 X101.364 Y148.184 E-.09535
G1 X100.688 Y148.184 E-.25685
; WIPE_END
G1 E-.04 F1800
G1 X107.218 Y152.135 Z4.82 F30000
G1 X167.503 Y188.619 Z4.82
G1 Z4.42
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420138
G1 F15000
G1 X168.249 Y187.873 E.02804
G1 X168.249 Y187.331 E.01442
G1 X167.133 Y188.447 E.04194
G1 X166.591 Y188.447 E.01442
G1 X168.249 Y186.788 E.06233
G1 X168.249 Y186.245 E.01442
G1 X166.048 Y188.447 E.08272
G1 X165.506 Y188.447 E.01442
G1 X168.249 Y185.703 E.10311
G1 X168.249 Y185.16 E.01442
G1 X164.963 Y188.447 E.1235
G1 X164.42 Y188.447 E.01442
G1 X168.249 Y184.618 E.14389
G1 X168.249 Y184.075 E.01442
G1 X163.878 Y188.447 E.16428
G1 X163.335 Y188.447 E.01442
G1 X168.249 Y183.533 E.18467
G1 X168.249 Y182.99 E.01442
G1 X162.793 Y188.447 E.20506
G1 X162.25 Y188.447 E.01442
G1 X168.249 Y182.447 E.22545
G1 X168.249 Y181.905 E.01442
G1 X161.708 Y188.447 E.24584
G1 X161.165 Y188.447 E.01442
G1 X168.249 Y181.362 E.26623
G1 X168.249 Y180.82 E.01442
G1 X160.622 Y188.447 E.28662
G1 X160.08 Y188.447 E.01442
G1 X168.249 Y180.277 E.30701
G1 X168.249 Y179.735 E.01442
G1 X159.537 Y188.447 E.3274
G1 X158.995 Y188.447 E.01442
G1 X168.249 Y179.192 E.34779
G1 X168.249 Y178.649 E.01442
G1 X158.452 Y188.447 E.36818
G1 X157.91 Y188.447 E.01442
G1 X168.249 Y178.107 E.38857
G1 X168.249 Y177.564 E.01442
G1 X157.367 Y188.447 E.40896
G1 X156.824 Y188.447 E.01442
G1 X168.249 Y177.022 E.42936
G1 X168.249 Y176.479 E.01442
G1 X156.282 Y188.447 E.44975
G1 X155.739 Y188.447 E.01442
G1 X168.249 Y175.937 E.47014
G1 X168.249 Y175.394 E.01442
G1 X155.197 Y188.447 E.49053
G1 X154.654 Y188.447 E.01442
G1 X168.249 Y174.851 E.51092
G1 X168.249 Y174.309 E.01442
G1 X154.112 Y188.447 E.53131
G1 X153.569 Y188.447 E.01442
G1 X168.249 Y173.766 E.5517
G1 X168.249 Y173.224 E.01442
G1 X153.026 Y188.447 E.57209
G1 X152.484 Y188.447 E.01442
G1 X168.249 Y172.681 E.59248
G1 X168.249 Y172.139 E.01442
G1 X151.941 Y188.447 E.61287
G1 X151.399 Y188.447 E.01442
G1 X168.249 Y171.596 E.63326
G1 X168.249 Y171.053 E.01442
G1 X150.856 Y188.447 E.65365
G1 X150.314 Y188.447 E.01442
G1 X168.249 Y170.511 E.67404
G1 X168.249 Y169.968 E.01442
G1 X149.771 Y188.447 E.69443
G1 X149.228 Y188.447 E.01442
G1 X168.249 Y169.426 E.71482
G1 X168.249 Y168.883 E.01442
G1 X148.686 Y188.447 E.73521
G1 X148.143 Y188.447 E.01442
G1 X168.249 Y168.341 E.7556
G1 X168.249 Y167.798 E.01442
G1 X147.601 Y188.447 E.77599
G1 X147.058 Y188.447 E.01442
G1 X168.249 Y167.255 E.79638
G1 X168.249 Y166.713 E.01442
G1 X146.516 Y188.447 E.81677
G1 X145.973 Y188.447 E.01442
G1 X168.249 Y166.17 E.83716
G1 X168.249 Y165.628 E.01442
G1 X145.43 Y188.447 E.85755
G1 X144.888 Y188.447 E.01442
G1 X168.249 Y165.085 E.87794
G1 X168.249 Y164.543 E.01442
G1 X144.345 Y188.447 E.89833
G1 X143.803 Y188.447 E.01442
G1 X168.249 Y164 E.91872
G1 X168.249 Y163.457 E.01442
G1 X143.26 Y188.447 E.93911
G1 X142.718 Y188.447 E.01442
G1 X168.249 Y162.915 E.9595
G1 X168.249 Y162.372 E.01442
G1 X142.175 Y188.447 E.97989
G1 X141.632 Y188.447 E.01442
G1 X168.249 Y161.83 E1.00028
G1 X168.249 Y161.287 E.01442
G1 X141.09 Y188.447 E1.02067
G1 X140.547 Y188.447 E.01442
G1 X168.249 Y160.745 E1.04106
G1 X168.249 Y160.202 E.01442
G1 X140.005 Y188.447 E1.06145
G1 X139.462 Y188.447 E.01442
G1 X168.249 Y159.659 E1.08184
G1 X168.249 Y159.117 E.01442
G1 X138.92 Y188.447 E1.10223
G1 X138.377 Y188.447 E.01442
G1 X168.249 Y158.574 E1.12262
G1 X168.249 Y158.032 E.01442
G1 X137.834 Y188.447 E1.14301
G1 X137.292 Y188.447 E.01442
G1 X168.249 Y157.489 E1.1634
G1 X168.249 Y156.947 E.01442
G1 X136.749 Y188.447 E1.1838
G1 X136.207 Y188.447 E.01442
G1 X168.249 Y156.404 E1.20419
G1 X168.249 Y155.861 E.01442
G1 X135.664 Y188.447 E1.22458
G1 X135.122 Y188.447 E.01442
G1 X168.249 Y155.319 E1.24497
G1 X168.249 Y154.776 E.01442
G1 X134.579 Y188.447 E1.26536
G1 X134.036 Y188.447 E.01442
G1 X168.249 Y154.234 E1.28575
G1 X168.249 Y153.691 E.01442
G1 X133.494 Y188.447 E1.30614
G1 X132.951 Y188.447 E.01442
G1 X168.249 Y153.149 E1.32653
G1 X168.249 Y152.606 E.01442
G1 X132.409 Y188.447 E1.34692
M73 P54 R29
G1 X131.866 Y188.447 E.01442
G1 X168.249 Y152.063 E1.36731
G1 X168.249 Y151.521 E.01442
G1 X131.324 Y188.447 E1.3877
G1 X130.781 Y188.447 E.01442
G1 X168.249 Y150.978 E1.40809
G1 X168.249 Y150.436 E.01442
G1 X130.238 Y188.447 E1.42848
G1 X129.696 Y188.447 E.01442
G1 X168.249 Y149.893 E1.44887
G1 X168.249 Y149.351 E.01442
G1 X129.153 Y188.447 E1.46926
G1 X128.611 Y188.447 E.01442
G1 X168.249 Y148.808 E1.48965
G1 X168.249 Y148.265 E.01442
G1 X128.068 Y188.447 E1.51004
G1 X127.526 Y188.447 E.01442
G1 X168.249 Y147.723 E1.53043
G1 X168.249 Y147.18 E.01442
G1 X126.983 Y188.447 E1.55082
G1 X126.44 Y188.447 E.01442
G1 X168.249 Y146.638 E1.57121
G1 X168.249 Y146.095 E.01442
G1 X125.898 Y188.447 E1.5916
G1 X125.355 Y188.447 E.01442
G1 X168.249 Y145.553 E1.61199
G1 X168.249 Y145.01 E.01442
G1 X124.813 Y188.447 E1.63238
G1 X124.27 Y188.447 E.01442
G1 X168.249 Y144.467 E1.65277
G1 X168.249 Y143.925 E.01442
G1 X123.728 Y188.447 E1.67316
G1 X123.185 Y188.447 E.01442
G1 X168.249 Y143.382 E1.69355
G1 X168.249 Y142.84 E.01442
G1 X122.642 Y188.447 E1.71394
G1 X122.1 Y188.447 E.01442
G1 X168.249 Y142.297 E1.73433
G1 X168.249 Y141.755 E.01442
G1 X121.557 Y188.447 E1.75472
G1 X121.015 Y188.447 E.01442
G1 X168.249 Y141.212 E1.77511
G1 X168.249 Y140.669 E.01442
G1 X120.472 Y188.447 E1.7955
G1 X119.93 Y188.447 E.01442
G1 X168.249 Y140.127 E1.81589
G1 X168.249 Y139.584 E.01442
G1 X119.387 Y188.447 E1.83628
G1 X118.844 Y188.447 E.01442
G1 X168.249 Y139.042 E1.85667
G1 X168.249 Y138.499 E.01442
G1 X118.302 Y188.447 E1.87706
G1 X117.759 Y188.447 E.01442
G1 X168.249 Y137.957 E1.89745
G1 X168.249 Y137.414 E.01442
G1 X117.217 Y188.447 E1.91784
G1 X116.674 Y188.447 E.01442
G1 X168.249 Y136.871 E1.93824
G1 X168.249 Y136.329 E.01442
G1 X116.132 Y188.447 E1.95863
G1 X115.589 Y188.447 E.01442
G1 X168.249 Y135.786 E1.97902
G1 X168.249 Y135.244 E.01442
G1 X115.046 Y188.447 E1.99941
G1 X114.504 Y188.447 E.01442
G1 X168.249 Y134.701 E2.0198
G1 X168.249 Y134.159 E.01442
G1 X113.961 Y188.447 E2.04019
G1 X113.419 Y188.447 E.01442
G1 X168.249 Y133.616 E2.06058
G1 X168.249 Y133.073 E.01442
G1 X112.876 Y188.447 E2.08097
G1 X112.334 Y188.447 E.01442
G1 X168.249 Y132.531 E2.10136
G1 X168.249 Y131.988 E.01442
G1 X111.791 Y188.447 E2.12175
G1 X111.248 Y188.447 E.01442
G1 X168.249 Y131.446 E2.14214
G1 X168.249 Y130.903 E.01442
G1 X110.706 Y188.447 E2.16253
G1 X110.163 Y188.447 E.01442
G1 X168.249 Y130.361 E2.18292
M73 P54 R28
G1 X168.249 Y129.818 E.01442
G1 X109.941 Y188.126 E2.19127
G1 X109.862 Y187.663 E.01249
G1 X168.249 Y129.275 E2.19424
G1 X168.249 Y128.733 E.01442
G1 X109.783 Y187.199 E2.19722
G1 X109.704 Y186.736 E.01249
G1 X168.249 Y128.19 E2.20019
G1 X168.249 Y127.648 E.01442
G1 X109.625 Y186.272 E2.20316
G1 X109.545 Y185.809 E.01249
G1 X168.249 Y127.105 E2.20614
G1 X168.249 Y126.563 E.01442
G1 X109.466 Y185.345 E2.20911
G1 X109.387 Y184.882 E.01249
G1 X168.249 Y126.02 E2.21208
G1 X168.249 Y125.477 E.01442
G1 X109.308 Y184.419 E2.21506
G1 X109.229 Y183.955 E.01249
G1 X168.249 Y124.935 E2.21803
G1 X168.249 Y124.392 E.01442
G1 X109.15 Y183.492 E2.221
G1 X109.071 Y183.028 E.01249
G1 X168.249 Y123.85 E2.22398
G1 X168.249 Y123.307 E.01442
G1 X108.992 Y182.565 E2.22695
G1 X108.912 Y182.101 E.01249
G1 X168.249 Y122.765 E2.22993
G1 X168.249 Y122.222 E.01442
G1 X108.833 Y181.638 E2.2329
G1 X108.754 Y181.174 E.01249
G1 X168.249 Y121.679 E2.23587
G1 X168.249 Y121.137 E.01442
G1 X108.675 Y180.711 E2.23885
G1 X108.596 Y180.248 E.01249
G1 X168.249 Y120.594 E2.24182
G1 X168.249 Y120.052 E.01442
G1 X108.517 Y179.784 E2.24479
G1 X108.438 Y179.321 E.01249
G1 X168.249 Y119.509 E2.24777
G1 X168.249 Y118.967 E.01442
G1 X108.359 Y178.857 E2.25074
G1 X108.28 Y178.394 E.01249
G1 X168.249 Y118.424 E2.25371
G1 X168.249 Y117.881 E.01442
G1 X108.2 Y177.93 E2.25669
G1 X108.121 Y177.467 E.01249
G1 X168.249 Y117.339 E2.25966
G1 X168.249 Y116.796 E.01442
G1 X108.042 Y177.003 E2.26263
G1 X107.963 Y176.54 E.01249
G1 X168.249 Y116.254 E2.26561
G1 X168.249 Y115.711 E.01442
G1 X107.884 Y176.077 E2.26858
G1 X107.805 Y175.613 E.01249
G1 X168.249 Y115.169 E2.27156
G1 X168.249 Y114.626 E.01442
G1 X107.726 Y175.15 E2.27453
G1 X107.647 Y174.686 E.01249
G1 X168.249 Y114.083 E2.2775
G1 X168.249 Y113.541 E.01442
G1 X107.567 Y174.223 E2.28048
G1 X107.488 Y173.759 E.01249
G1 X168.249 Y112.998 E2.28345
G1 X168.249 Y112.456 E.01442
G1 X107.409 Y173.296 E2.28642
G1 X107.33 Y172.832 E.01249
G1 X168.249 Y111.913 E2.2894
G1 X168.249 Y111.371 E.01442
G1 X107.251 Y172.369 E2.29237
G1 X107.172 Y171.906 E.01249
G1 X168.249 Y110.828 E2.29534
G1 X168.249 Y110.285 E.01442
G1 X107.093 Y171.442 E2.29832
G1 X107.014 Y170.979 E.01249
G1 X168.249 Y109.743 E2.30129
G1 X168.249 Y109.2 E.01442
G1 X106.934 Y170.515 E2.30426
G1 X106.855 Y170.052 E.01249
G1 X168.249 Y108.658 E2.30724
G1 X168.249 Y108.115 E.01442
G1 X106.776 Y169.588 E2.31021
G1 X106.697 Y169.125 E.01249
G1 X168.249 Y107.573 E2.31319
G1 X168.249 Y107.03 E.01442
G1 X106.618 Y168.661 E2.31616
G1 X106.539 Y168.198 E.01249
G1 X168.249 Y106.487 E2.31913
G1 X168.249 Y105.945 E.01442
G1 X106.46 Y167.734 E2.32211
G1 X106.381 Y167.271 E.01249
G1 X168.249 Y105.402 E2.32508
G1 X168.249 Y104.86 E.01442
G1 X106.301 Y166.808 E2.32805
G1 X106.222 Y166.344 E.01249
G1 X168.249 Y104.317 E2.33103
G1 X168.249 Y103.775 E.01442
G1 X106.143 Y165.881 E2.334
G1 X106.064 Y165.417 E.01249
G1 X168.249 Y103.232 E2.33697
G1 X168.249 Y102.689 E.01442
G1 X105.985 Y164.954 E2.33995
G1 X105.906 Y164.49 E.01249
G1 X168.249 Y102.147 E2.34292
G1 X168.249 Y101.604 E.01442
G1 X105.827 Y164.027 E2.34589
G1 X105.748 Y163.563 E.01249
G1 X168.249 Y101.062 E2.34887
G1 X168.249 Y100.519 E.01442
G1 X105.668 Y163.1 E2.35184
G1 X105.589 Y162.637 E.01249
G1 X168.249 Y99.977 E2.35482
G1 X168.249 Y99.434 E.01442
G1 X105.51 Y162.173 E2.35779
G1 X105.431 Y161.71 E.01249
G1 X168.249 Y98.891 E2.36076
G1 X168.249 Y98.349 E.01442
G1 X105.352 Y161.246 E2.36374
G1 X105.273 Y160.783 E.01249
G1 X168.249 Y97.806 E2.36671
G1 X168.249 Y97.264 E.01442
G1 X105.194 Y160.319 E2.36968
G1 X105.115 Y159.856 E.01249
G1 X168.249 Y96.721 E2.37266
G1 X168.249 Y96.179 E.01442
G1 X105.035 Y159.392 E2.37563
G1 X104.956 Y158.929 E.01249
G1 X168.249 Y95.636 E2.3786
G1 X168.249 Y95.093 E.01442
G1 X104.877 Y158.466 E2.38158
G1 X104.798 Y158.002 E.01249
G1 X168.249 Y94.551 E2.38455
G1 X168.249 Y94.008 E.01442
G1 X104.719 Y157.539 E2.38752
G1 X104.64 Y157.075 E.01249
G1 X168.249 Y93.466 E2.3905
G1 X168.249 Y92.923 E.01442
G1 X104.561 Y156.612 E2.39347
G1 X104.482 Y156.148 E.01249
G1 X168.249 Y92.381 E2.39645
G1 X168.249 Y91.838 E.01442
G1 X104.402 Y155.685 E2.39942
G1 X104.323 Y155.221 E.01249
G1 X168.249 Y91.295 E2.40239
G1 X168.249 Y90.753 E.01442
G1 X104.244 Y154.758 E2.40537
G1 X104.165 Y154.295 E.01249
G1 X168.249 Y90.21 E2.40834
G1 X168.249 Y89.668 E.01442
G1 X104.086 Y153.831 E2.41131
G1 X104.007 Y153.368 E.01249
G1 X168.249 Y89.125 E2.41429
G1 X168.249 Y88.583 E.01442
G1 X103.928 Y152.904 E2.41726
G1 X103.849 Y152.441 E.01249
G1 X168.249 Y88.04 E2.42023
G1 X168.249 Y87.497 E.01442
G1 X103.769 Y151.977 E2.42321
G1 X103.69 Y151.514 E.01249
G1 X168.249 Y86.955 E2.42618
M73 P55 R28
G1 X168.249 Y86.412 E.01442
G1 X103.611 Y151.05 E2.42915
G1 X103.532 Y150.587 E.01249
G1 X168.249 Y85.87 E2.43213
G1 X168.249 Y85.327 E.01442
G1 X103.453 Y150.124 E2.4351
G1 X103.374 Y149.66 E.01249
G1 X168.249 Y84.785 E2.43808
G1 X168.249 Y84.242 E.01442
G1 X103.295 Y149.197 E2.44105
G2 X103.19 Y148.758 I-2.162 J.284 E.01199
G1 X168.249 Y83.699 E2.44497
G1 X168.249 Y83.157 E.01442
G1 X103.013 Y148.393 E2.45162
G1 X102.837 Y148.125 E.00852
G1 X102.787 Y148.077 E.00185
G1 X168.249 Y82.614 E2.46014
G1 X168.249 Y82.072 E.01442
G1 X102.502 Y147.819 E2.47084
G1 X102.161 Y147.617 E.01053
G1 X168.249 Y81.529 E2.48365
G1 X168.249 Y80.987 E.01442
G1 X101.752 Y147.484 E2.49903
G2 X101.247 Y147.447 I-.426 J2.314 E.01348
G1 X168.249 Y80.444 E2.51801
G1 X168.249 Y79.901 E.01442
G1 X100.704 Y147.447 E2.5384
G1 X100.162 Y147.447 E.01442
G1 X168.249 Y79.359 E2.55879
G1 X168.249 Y78.816 E.01442
G1 X99.619 Y147.447 E2.57918
G1 X99.076 Y147.447 E.01442
G1 X168.249 Y78.274 E2.59957
G1 X168.249 Y77.731 E.01442
G1 X98.534 Y147.447 E2.61996
G1 X97.991 Y147.447 E.01442
G1 X168.249 Y77.189 E2.64035
G1 X168.249 Y76.646 E.01442
G1 X97.449 Y147.447 E2.66074
G1 X96.906 Y147.447 E.01442
G1 X168.249 Y76.103 E2.68113
G1 X168.249 Y75.561 E.01442
G1 X96.364 Y147.447 E2.70152
G1 X95.821 Y147.447 E.01442
G1 X168.249 Y75.018 E2.72191
G1 X168.249 Y74.476 E.01442
G1 X95.278 Y147.447 E2.7423
G1 X94.736 Y147.447 E.01442
G1 X168.249 Y73.933 E2.76269
G1 X168.249 Y73.391 E.01442
G1 X94.193 Y147.447 E2.78308
G1 X93.651 Y147.447 E.01442
G1 X168.249 Y72.848 E2.80347
G1 X168.249 Y72.305 E.01442
G1 X93.108 Y147.447 E2.82386
G1 X92.566 Y147.447 E.01442
G1 X168.249 Y71.763 E2.84425
G1 X168.249 Y71.22 E.01442
G1 X92.023 Y147.447 E2.86465
G1 X91.48 Y147.447 E.01442
G1 X168.249 Y70.678 E2.88504
G1 X168.249 Y70.135 E.01442
G1 X90.938 Y147.447 E2.90543
G1 X90.395 Y147.447 E.01442
G1 X168.249 Y69.593 E2.92582
G1 X168.249 Y69.05 E.01442
G1 X89.853 Y147.447 E2.94621
G1 X89.31 Y147.447 E.01442
G1 X168.249 Y68.507 E2.9666
G1 X168.249 Y67.965 E.01442
G1 X88.768 Y147.447 E2.98699
G1 X88.225 Y147.447 E.01442
G1 X168.249 Y67.422 E3.00738
G1 X168.249 Y66.88 E.01442
G1 X87.682 Y147.447 E3.02777
G1 X87.14 Y147.447 E.01442
G1 X168.249 Y66.337 E3.04816
G1 X168.249 Y65.795 E.01442
G1 X86.597 Y147.447 E3.06855
G1 X86.055 Y147.447 E.01442
G1 X168.249 Y65.252 E3.08894
G1 X168.249 Y64.709 E.01442
G1 X85.512 Y147.447 E3.10933
G1 X84.97 Y147.447 E.01442
G1 X168.249 Y64.167 E3.12972
G1 X168.249 Y63.624 E.01442
G1 X84.427 Y147.447 E3.15011
G1 X83.884 Y147.447 E.01442
G1 X168.249 Y63.082 E3.1705
G1 X168.249 Y62.539 E.01442
G1 X83.342 Y147.447 E3.19089
G1 X82.799 Y147.447 E.01442
G1 X168.249 Y61.997 E3.21128
G1 X168.249 Y61.454 E.01442
G1 X82.257 Y147.447 E3.23167
G1 X81.714 Y147.447 E.01442
G1 X168.249 Y60.911 E3.25206
G1 X168.249 Y60.369 E.01442
G1 X81.172 Y147.447 E3.27245
G1 X80.629 Y147.447 E.01442
G1 X168.249 Y59.826 E3.29284
G1 X168.249 Y59.284 E.01442
G1 X80.086 Y147.447 E3.31323
G1 X79.544 Y147.447 E.01442
G1 X168.249 Y58.741 E3.33362
G1 X168.249 Y58.199 E.01442
G1 X79.001 Y147.447 E3.35401
G1 X78.459 Y147.447 E.01442
G1 X168.249 Y57.656 E3.3744
G1 X168.249 Y57.113 E.01442
G1 X77.916 Y147.447 E3.39479
G1 X77.374 Y147.447 E.01442
G1 X168.249 Y56.571 E3.41518
G1 X168.249 Y56.028 E.01442
G1 X76.831 Y147.447 E3.43557
G1 X76.288 Y147.447 E.01442
G1 X168.249 Y55.486 E3.45596
G2 X168.21 Y55.353 I-.175 J-.02 E.00378
G1 X167.84 Y55.353 E.00984
G1 X75.746 Y147.447 E3.46096
G1 X75.203 Y147.447 E.01442
G1 X167.297 Y55.353 E3.46096
G1 X166.755 Y55.353 E.01442
G1 X74.661 Y147.447 E3.46096
G1 X74.118 Y147.447 E.01442
G1 X166.212 Y55.353 E3.46096
G1 X165.67 Y55.353 E.01442
G1 X73.576 Y147.447 E3.46097
G1 X73.033 Y147.447 E.01442
G1 X165.127 Y55.352 E3.46097
G1 X164.585 Y55.352 E.01442
G1 X72.49 Y147.447 E3.46097
G1 X71.948 Y147.447 E.01442
G1 X164.042 Y55.352 E3.46097
G1 X163.5 Y55.352 E.01442
G1 X71.405 Y147.447 E3.46098
G1 X70.863 Y147.447 E.01442
G1 X162.957 Y55.352 E3.46098
G1 X162.415 Y55.352 E.01442
G1 X70.32 Y147.447 E3.46098
G3 X70.153 Y147.407 I-.038 J-.211 E.0047
G3 X70.144 Y147.08 I.987 J-.191 E.00871
G1 X161.872 Y55.352 E3.44722
G1 X161.33 Y55.352 E.01442
G1 X70.144 Y146.538 E3.42683
M73 P55 R27
G1 X70.144 Y145.995 E.01442
G1 X160.787 Y55.352 E3.40644
G1 X160.245 Y55.352 E.01442
G1 X70.144 Y145.453 E3.38606
G1 X70.144 Y144.91 E.01442
G1 X159.702 Y55.352 E3.36567
G1 X159.16 Y55.352 E.01442
G1 X70.144 Y144.367 E3.34528
G1 X70.144 Y143.825 E.01442
G1 X158.617 Y55.352 E3.32489
G1 X158.075 Y55.352 E.01442
G1 X70.144 Y143.282 E3.30451
G1 X70.144 Y142.74 E.01442
G1 X157.532 Y55.352 E3.28412
G1 X156.99 Y55.351 E.01442
G1 X70.144 Y142.197 E3.26373
G1 X70.144 Y141.655 E.01442
G1 X156.447 Y55.351 E3.24334
G1 X155.904 Y55.351 E.01442
G1 X70.144 Y141.112 E3.22295
G1 X70.144 Y140.569 E.01442
G1 X155.362 Y55.351 E3.20257
G1 X154.819 Y55.351 E.01442
G1 X70.144 Y140.027 E3.18218
G1 X70.144 Y139.484 E.01442
G1 X154.277 Y55.351 E3.16179
G1 X153.734 Y55.351 E.01442
M73 P56 R27
G1 X70.144 Y138.942 E3.1414
G1 X70.144 Y138.399 E.01442
G1 X153.192 Y55.351 E3.12101
G1 X152.649 Y55.351 E.01442
G1 X70.144 Y137.857 E3.10063
G1 X70.144 Y137.314 E.01442
G1 X152.107 Y55.351 E3.08024
G1 X151.564 Y55.351 E.01442
G1 X70.144 Y136.771 E3.05985
G1 X70.144 Y136.229 E.01442
G1 X151.022 Y55.351 E3.03946
G1 X150.479 Y55.351 E.01442
G1 X70.144 Y135.686 E3.01908
G1 X70.144 Y135.144 E.01442
G1 X149.937 Y55.351 E2.99869
G1 X149.394 Y55.351 E.01442
G1 X70.144 Y134.601 E2.9783
G1 X70.144 Y134.059 E.01442
G1 X148.852 Y55.351 E2.95791
G1 X148.309 Y55.35 E.01442
G1 X70.144 Y133.516 E2.93752
G1 X70.144 Y132.973 E.01442
G1 X147.767 Y55.35 E2.91714
G1 X147.224 Y55.35 E.01442
G1 X70.144 Y132.431 E2.89675
G1 X70.144 Y131.888 E.01442
G1 X146.682 Y55.35 E2.87636
G1 X146.139 Y55.35 E.01442
G1 X70.144 Y131.346 E2.85597
G1 X70.144 Y130.803 E.01442
G1 X145.597 Y55.35 E2.83559
G1 X145.054 Y55.35 E.01442
G1 X70.144 Y130.261 E2.8152
G1 X70.144 Y129.718 E.01442
G1 X144.512 Y55.35 E2.79481
G1 X143.969 Y55.35 E.01442
G1 X70.144 Y129.175 E2.77442
G1 X70.144 Y128.633 E.01442
G1 X143.427 Y55.35 E2.75403
G1 X142.884 Y55.35 E.01442
G1 X70.144 Y128.09 E2.73365
G1 X70.144 Y127.548 E.01442
G1 X142.342 Y55.35 E2.71326
G1 X141.799 Y55.35 E.01442
G1 X70.144 Y127.005 E2.69287
G1 X70.144 Y126.463 E.01442
G1 X141.257 Y55.35 E2.67248
G1 X140.714 Y55.35 E.01442
G1 X70.144 Y125.92 E2.6521
G1 X70.144 Y125.377 E.01442
G1 X140.172 Y55.349 E2.63171
G1 X139.629 Y55.349 E.01442
G1 X70.144 Y124.835 E2.61132
G1 X70.144 Y124.292 E.01442
G1 X139.087 Y55.349 E2.59093
G1 X138.544 Y55.349 E.01442
G1 X70.144 Y123.75 E2.57054
G1 X70.144 Y123.207 E.01442
G1 X138.002 Y55.349 E2.55016
G1 X137.459 Y55.349 E.01442
G1 X70.144 Y122.665 E2.52977
G1 X70.144 Y122.122 E.01442
G1 X136.917 Y55.349 E2.50938
G1 X136.374 Y55.349 E.01442
G1 X70.144 Y121.579 E2.48899
G1 X70.144 Y121.037 E.01442
G1 X135.832 Y55.349 E2.46861
G1 X135.289 Y55.349 E.01442
G1 X70.144 Y120.494 E2.44822
G1 X70.144 Y119.952 E.01442
G1 X134.747 Y55.349 E2.42783
G1 X134.204 Y55.349 E.01442
G1 X70.144 Y119.409 E2.40744
G1 X70.144 Y118.867 E.01442
G1 X133.662 Y55.349 E2.38705
G1 X133.119 Y55.349 E.01442
G1 X70.144 Y118.324 E2.36667
G1 X70.144 Y117.781 E.01442
G1 X132.577 Y55.349 E2.34628
G1 X132.034 Y55.348 E.01442
G1 X70.144 Y117.239 E2.32589
G1 X70.144 Y116.696 E.01442
G1 X131.492 Y55.348 E2.3055
G1 X130.949 Y55.348 E.01442
G1 X70.144 Y116.154 E2.28511
G1 X70.144 Y115.611 E.01442
G1 X130.407 Y55.348 E2.26473
G1 X129.864 Y55.348 E.01442
G1 X70.144 Y115.069 E2.24434
G1 X70.144 Y114.526 E.01442
G1 X129.322 Y55.348 E2.22395
G1 X128.779 Y55.348 E.01442
G1 X70.144 Y113.983 E2.20356
G1 X70.144 Y113.441 E.01442
G1 X128.237 Y55.348 E2.18318
G1 X127.694 Y55.348 E.01442
G1 X70.144 Y112.898 E2.16279
G1 X70.144 Y112.356 E.01442
G1 X127.152 Y55.348 E2.1424
G1 X126.609 Y55.348 E.01442
G1 X70.144 Y111.813 E2.12201
G1 X70.144 Y111.271 E.01442
G1 X126.067 Y55.348 E2.10162
G1 X125.524 Y55.348 E.01442
G1 X70.144 Y110.728 E2.08124
G1 X70.144 Y110.185 E.01442
G1 X124.982 Y55.348 E2.06085
G1 X124.439 Y55.348 E.01442
G1 X70.144 Y109.643 E2.04046
G1 X70.144 Y109.1 E.01442
G1 X123.897 Y55.348 E2.02007
G1 X123.354 Y55.347 E.01442
G1 X70.144 Y108.558 E1.99969
G1 X70.144 Y108.015 E.01442
G1 X122.812 Y55.347 E1.9793
G1 X122.269 Y55.347 E.01442
G1 X70.144 Y107.473 E1.95891
G1 X70.144 Y106.93 E.01442
G1 X121.727 Y55.347 E1.93852
G1 X121.184 Y55.347 E.01442
G1 X70.144 Y106.387 E1.91813
G1 X70.144 Y105.845 E.01442
G1 X120.642 Y55.347 E1.89775
G1 X120.099 Y55.347 E.01442
G1 X70.144 Y105.302 E1.87736
G1 X70.144 Y104.76 E.01442
G1 X119.557 Y55.347 E1.85697
G1 X119.014 Y55.347 E.01442
G1 X70.144 Y104.217 E1.83658
G1 X70.144 Y103.675 E.01442
G1 X118.472 Y55.347 E1.8162
G1 X117.929 Y55.347 E.01442
G1 X70.144 Y103.132 E1.79581
G1 X70.144 Y102.589 E.01442
G1 X117.387 Y55.347 E1.77542
G1 X116.844 Y55.347 E.01442
G1 X70.144 Y102.047 E1.75503
G1 X70.144 Y101.504 E.01442
G1 X116.302 Y55.347 E1.73464
G1 X115.759 Y55.347 E.01442
G1 X70.144 Y100.962 E1.71426
G1 X70.144 Y100.419 E.01442
G1 X115.217 Y55.346 E1.69387
G1 X114.674 Y55.346 E.01442
G1 X70.144 Y99.877 E1.67348
G1 X70.144 Y99.334 E.01442
G1 X114.132 Y55.346 E1.65309
G1 X113.589 Y55.346 E.01442
G1 X70.144 Y98.791 E1.6327
G1 X70.144 Y98.249 E.01442
G1 X113.047 Y55.346 E1.61232
G1 X112.504 Y55.346 E.01442
G1 X70.144 Y97.706 E1.59193
G1 X70.144 Y97.164 E.01442
G1 X111.961 Y55.346 E1.57154
G1 X111.419 Y55.346 E.01442
G1 X70.144 Y96.621 E1.55115
G1 X70.144 Y96.079 E.01442
G1 X110.876 Y55.346 E1.53077
G1 X110.334 Y55.346 E.01442
G1 X70.144 Y95.536 E1.51038
G1 X70.144 Y94.993 E.01442
G1 X109.791 Y55.346 E1.48999
G1 X109.249 Y55.346 E.01442
G1 X70.144 Y94.451 E1.4696
G1 X70.144 Y93.908 E.01442
G1 X108.706 Y55.346 E1.44921
M73 P57 R27
G1 X108.164 Y55.346 E.01442
G1 X70.144 Y93.366 E1.42883
G1 X70.144 Y92.823 E.01442
G1 X107.621 Y55.346 E1.40844
G1 X107.079 Y55.345 E.01442
G1 X70.144 Y92.281 E1.38805
G1 X70.144 Y91.738 E.01442
G1 X106.536 Y55.345 E1.36766
G1 X105.994 Y55.345 E.01442
G1 X70.144 Y91.195 E1.34728
G1 X70.144 Y90.653 E.01442
G1 X105.451 Y55.345 E1.32689
G1 X104.909 Y55.345 E.01442
G1 X70.144 Y90.11 E1.3065
G1 X70.144 Y89.568 E.01442
G1 X104.366 Y55.345 E1.28611
G1 X103.824 Y55.345 E.01442
G1 X70.144 Y89.025 E1.26572
G1 X70.144 Y88.483 E.01442
G1 X103.281 Y55.345 E1.24534
G1 X102.739 Y55.345 E.01442
G1 X70.144 Y87.94 E1.22495
G1 X70.144 Y87.397 E.01442
G1 X102.196 Y55.345 E1.20456
G1 X101.654 Y55.345 E.01442
G1 X70.144 Y86.855 E1.18417
G1 X70.144 Y86.312 E.01442
G1 X101.111 Y55.345 E1.16379
G1 X100.569 Y55.345 E.01442
G1 X70.144 Y85.77 E1.1434
G1 X70.144 Y85.227 E.01442
G1 X100.026 Y55.345 E1.12301
G1 X99.484 Y55.345 E.01442
G1 X70.144 Y84.685 E1.10262
G1 X70.144 Y84.142 E.01442
G1 X98.941 Y55.344 E1.08223
G1 X98.399 Y55.344 E.01442
G1 X70.144 Y83.599 E1.06185
G1 X70.144 Y83.057 E.01442
G1 X97.856 Y55.344 E1.04146
G1 X97.314 Y55.344 E.01442
G1 X70.144 Y82.514 E1.02107
G1 X70.144 Y81.972 E.01442
G1 X96.771 Y55.344 E1.00068
G1 X96.229 Y55.344 E.01442
G1 X70.144 Y81.429 E.98029
G1 X70.144 Y80.887 E.01442
G1 X95.686 Y55.344 E.95991
G1 X95.144 Y55.344 E.01442
G1 X70.144 Y80.344 E.93952
G1 X70.144 Y79.801 E.01442
G1 X94.601 Y55.344 E.91913
G1 X94.059 Y55.344 E.01442
G1 X70.144 Y79.259 E.89874
G1 X70.144 Y78.716 E.01442
G1 X93.516 Y55.344 E.87836
G1 X92.974 Y55.344 E.01442
G1 X70.144 Y78.174 E.85797
G1 X70.144 Y77.631 E.01442
G1 X92.431 Y55.344 E.83758
G1 X91.889 Y55.344 E.01442
G1 X70.144 Y77.089 E.81719
G1 X70.144 Y76.546 E.01442
G1 X91.346 Y55.344 E.7968
G1 X90.804 Y55.344 E.01442
G1 X70.144 Y76.003 E.77642
G1 X70.144 Y75.461 E.01442
G1 X90.261 Y55.343 E.75603
G1 X89.719 Y55.343 E.01442
G1 X70.144 Y74.918 E.73564
G1 X70.144 Y74.376 E.01442
G1 X89.176 Y55.343 E.71525
G1 X88.634 Y55.343 E.01442
G1 X70.144 Y73.833 E.69487
G1 X70.144 Y73.291 E.01442
G1 X88.091 Y55.343 E.67448
G1 X87.549 Y55.343 E.01442
G1 X70.144 Y72.748 E.65409
G1 X70.144 Y72.205 E.01442
G1 X87.006 Y55.343 E.6337
G1 X86.464 Y55.343 E.01442
G1 X70.144 Y71.663 E.61331
G1 X70.144 Y71.12 E.01442
G1 X85.921 Y55.343 E.59293
G1 X85.379 Y55.343 E.01442
G1 X70.144 Y70.578 E.57254
G1 X70.144 Y70.035 E.01442
G1 X84.836 Y55.343 E.55215
G1 X84.294 Y55.343 E.01442
G1 X70.144 Y69.493 E.53176
G1 X70.144 Y68.95 E.01442
G1 X83.751 Y55.343 E.51138
G1 X83.209 Y55.343 E.01442
G1 X70.144 Y68.407 E.49099
G1 X70.144 Y67.865 E.01442
G1 X82.666 Y55.343 E.4706
G1 X82.124 Y55.342 E.01442
G1 X70.144 Y67.322 E.45021
G1 X70.144 Y66.78 E.01442
G1 X81.581 Y55.342 E.42982
G1 X81.039 Y55.342 E.01442
G1 X70.144 Y66.237 E.40944
G1 X70.144 Y65.695 E.01442
G1 X80.496 Y55.342 E.38905
G1 X79.954 Y55.342 E.01442
G1 X70.144 Y65.152 E.36866
G1 X70.144 Y64.609 E.01442
G1 X79.411 Y55.342 E.34827
G1 X78.869 Y55.342 E.01442
G1 X70.144 Y64.067 E.32788
G1 X70.144 Y63.524 E.01442
G1 X78.326 Y55.342 E.3075
G1 X77.784 Y55.342 E.01442
G1 X70.144 Y62.982 E.28711
G1 X70.144 Y62.439 E.01442
G1 X77.241 Y55.342 E.26672
G1 X76.699 Y55.342 E.01442
G1 X70.144 Y61.897 E.24633
G1 X70.144 Y61.354 E.01442
G1 X76.156 Y55.342 E.22595
G1 X75.614 Y55.342 E.01442
G1 X70.144 Y60.811 E.20556
G1 X70.144 Y60.269 E.01442
G1 X75.071 Y55.342 E.18517
G1 X74.529 Y55.342 E.01442
G1 X70.144 Y59.726 E.16478
G1 X70.144 Y59.184 E.01442
G1 X73.986 Y55.341 E.14439
G1 X73.444 Y55.341 E.01442
G1 X70.144 Y58.641 E.12401
M73 P57 R26
G1 X70.144 Y58.099 E.01442
G1 X72.901 Y55.341 E.10362
G1 X72.359 Y55.341 E.01442
G1 X70.144 Y57.556 E.08323
G1 X70.144 Y57.013 E.01442
G1 X71.816 Y55.341 E.06284
G1 X71.274 Y55.341 E.01442
G1 X70.144 Y56.471 E.04246
G1 X70.144 Y55.928 E.01442
G1 X70.904 Y55.169 E.02855
; CHANGE_LAYER
; Z_HEIGHT: 4.59
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X70.144 Y55.928 E-.4083
G1 X70.144 Y56.471 E-.20618
G1 X70.415 Y56.2 E-.14552
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 27/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z4.82 I-1.149 J.402 P1  F30000
G1 X102.761 Y148.616 Z4.82
G1 Z4.59
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X102.572 Y148.353 E.00927
G2 X101.386 Y147.785 I-1.237 J1.061 E.03877
G1 X70.229 Y147.785 E.8924
G3 X69.805 Y147.378 I-.003 J-.421 E.01863
G1 X69.805 Y55.41 E2.63415
G3 X70.229 Y55.002 I.42 J.013 E.01863
G1 X168.277 Y55.014 E2.80831
G3 X168.588 Y55.41 I-.093 J.393 E.01555
G1 X168.588 Y188.374 E3.80837
G3 X168.162 Y188.785 I-.421 J-.01 E.0188
G1 X110.073 Y188.785 E1.66378
G3 X109.651 Y188.44 I-.016 J-.411 E.01708
G1 X102.936 Y149.107 E1.14288
G2 X102.786 Y148.671 I-1.601 J.308 E.01325
G1 X102.405 Y148.802 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.268 Y148.611 E.00623
G2 X101.364 Y148.184 I-.932 J.803 E.02735
G1 X70.208 Y148.184 E.82765
G3 X69.407 Y147.388 I-.005 J-.796 E.03333
G1 X69.407 Y55.399 E2.4436
G3 X70.208 Y54.604 I.796 J.001 E.03333
G1 X168.201 Y54.605 E2.60309
G3 X168.987 Y55.399 I-.008 J.794 E.03292
G1 X168.987 Y188.387 E3.5327
G3 X168.185 Y189.184 I-.801 J-.004 E.03334
G1 X110.052 Y189.184 E1.54425
G3 X109.261 Y188.52 I.005 J-.809 E.02976
G1 X102.545 Y149.185 E1.06003
G2 X102.432 Y148.855 I-1.209 J.229 E.00928
M204 S10000
; WIPE_START
G1 F24000
G1 X102.268 Y148.611 E-.11174
G1 X102.083 Y148.427 E-.09907
G1 X101.862 Y148.294 E-.0982
G1 X101.613 Y148.211 E-.09955
G1 X101.364 Y148.184 E-.0952
G1 X100.69 Y148.184 E-.25623
; WIPE_END
G1 E-.04 F1800
G1 X93.066 Y147.83 Z4.99 F30000
G1 X69.971 Y146.759 Z4.99
G1 Z4.59
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420759
G1 F15000
G1 X70.659 Y147.447 E.02589
G1 X71.203 Y147.447 E.01446
G1 X70.144 Y146.388 E.03985
G1 X70.144 Y145.844 E.01446
G1 X71.746 Y147.447 E.06031
G1 X72.29 Y147.447 E.01446
G1 X70.144 Y145.301 E.08076
G1 X70.144 Y144.757 E.01446
G1 X72.833 Y147.447 E.10122
G1 X73.376 Y147.447 E.01446
G1 X70.144 Y144.214 E.12168
G1 X70.144 Y143.671 E.01446
G1 X73.92 Y147.447 E.14213
G1 X74.463 Y147.447 E.01446
G1 X70.144 Y143.127 E.16259
G1 X70.144 Y142.584 E.01446
G1 X75.007 Y147.447 E.18305
G1 X75.55 Y147.447 E.01446
G1 X70.144 Y142.04 E.2035
G1 X70.144 Y141.497 E.01446
G1 X76.094 Y147.447 E.22396
G1 X76.637 Y147.447 E.01446
G1 X70.144 Y140.953 E.24442
G1 X70.144 Y140.41 E.01446
G1 X77.181 Y147.447 E.26487
G1 X77.724 Y147.447 E.01446
G1 X70.144 Y139.866 E.28533
G1 X70.144 Y139.323 E.01446
G1 X78.268 Y147.447 E.30578
G1 X78.811 Y147.447 E.01446
G1 X70.144 Y138.78 E.32624
G1 X70.144 Y138.236 E.01446
G1 X79.354 Y147.447 E.3467
G1 X79.898 Y147.447 E.01446
G1 X70.144 Y137.693 E.36715
G1 X70.144 Y137.149 E.01446
G1 X80.441 Y147.447 E.38761
G1 X80.985 Y147.447 E.01446
G1 X70.144 Y136.606 E.40807
G1 X70.144 Y136.062 E.01446
G1 X81.528 Y147.447 E.42852
G1 X82.072 Y147.447 E.01446
G1 X70.144 Y135.519 E.44898
G1 X70.144 Y134.975 E.01446
G1 X82.615 Y147.447 E.46943
G1 X83.159 Y147.447 E.01446
G1 X70.144 Y134.432 E.48989
G1 X70.144 Y133.888 E.01446
G1 X83.702 Y147.447 E.51035
G1 X84.245 Y147.447 E.01446
G1 X70.144 Y133.345 E.5308
G1 X70.144 Y132.802 E.01446
G1 X84.789 Y147.447 E.55126
G1 X85.332 Y147.447 E.01446
G1 X70.144 Y132.258 E.57172
G1 X70.144 Y131.715 E.01446
G1 X85.876 Y147.447 E.59217
G1 X86.419 Y147.447 E.01446
G1 X70.144 Y131.171 E.61263
G1 X70.144 Y130.628 E.01446
G1 X86.963 Y147.447 E.63309
G1 X87.506 Y147.447 E.01446
G1 X70.144 Y130.084 E.65354
G1 X70.144 Y129.541 E.01446
G1 X88.05 Y147.447 E.674
G1 X88.593 Y147.447 E.01446
G1 X70.144 Y128.997 E.69445
G1 X70.144 Y128.454 E.01446
G1 X89.137 Y147.447 E.71491
G1 X89.68 Y147.447 E.01446
G1 X70.144 Y127.911 E.73537
G1 X70.144 Y127.367 E.01446
G1 X90.223 Y147.447 E.75582
G1 X90.767 Y147.447 E.01446
G1 X70.144 Y126.824 E.77628
G1 X70.144 Y126.28 E.01446
G1 X91.31 Y147.447 E.79674
G1 X91.854 Y147.447 E.01446
G1 X70.144 Y125.737 E.81719
G1 X70.144 Y125.193 E.01446
G1 X92.397 Y147.447 E.83765
G1 X92.941 Y147.447 E.01446
G1 X70.144 Y124.65 E.85811
G1 X70.144 Y124.106 E.01446
G1 X93.484 Y147.447 E.87856
G1 X94.028 Y147.447 E.01446
G1 X70.144 Y123.563 E.89902
G1 X70.144 Y123.019 E.01446
G1 X94.571 Y147.447 E.91947
G1 X95.114 Y147.447 E.01446
G1 X70.144 Y122.476 E.93993
G1 X70.144 Y121.933 E.01446
G1 X95.658 Y147.447 E.96039
G1 X96.201 Y147.447 E.01446
G1 X70.144 Y121.389 E.98084
G1 X70.144 Y120.846 E.01446
G1 X96.745 Y147.447 E1.0013
G1 X97.288 Y147.447 E.01446
G1 X70.144 Y120.302 E1.02176
G1 X70.144 Y119.759 E.01446
G1 X97.832 Y147.447 E1.04221
G1 X98.375 Y147.447 E.01446
G1 X70.144 Y119.215 E1.06267
G1 X70.144 Y118.672 E.01446
G1 X98.919 Y147.447 E1.08312
G1 X99.462 Y147.447 E.01446
G1 X70.144 Y118.128 E1.10358
G1 X70.144 Y117.585 E.01446
G1 X100.006 Y147.447 E1.12404
G1 X100.549 Y147.447 E.01446
G1 X70.144 Y117.042 E1.14449
G1 X70.144 Y116.498 E.01446
G1 X101.092 Y147.447 E1.16495
G3 X101.664 Y147.475 I.156 J2.655 E.01526
G1 X70.144 Y115.955 E1.18647
G1 X70.144 Y115.411 E.01446
G1 X143.179 Y188.447 E2.74917
G1 X143.723 Y188.447 E.01446
G1 X70.144 Y114.868 E2.76963
G1 X70.144 Y114.324 E.01446
G1 X144.266 Y188.447 E2.79008
G1 X144.81 Y188.447 E.01446
G1 X70.144 Y113.781 E2.81054
G1 X70.144 Y113.237 E.01446
G1 X145.353 Y188.447 E2.83099
G1 X145.897 Y188.447 E.01446
G1 X70.144 Y112.694 E2.85145
G1 X70.144 Y112.15 E.01446
G1 X146.44 Y188.447 E2.87191
G1 X146.983 Y188.447 E.01446
G1 X70.144 Y111.607 E2.89236
G1 X70.144 Y111.064 E.01446
G1 X147.527 Y188.447 E2.91282
G1 X148.07 Y188.447 E.01446
G1 X70.144 Y110.52 E2.93328
G1 X70.144 Y109.977 E.01446
G1 X148.614 Y188.447 E2.95373
G1 X149.157 Y188.447 E.01446
G1 X70.144 Y109.433 E2.97419
G1 X70.144 Y108.89 E.01446
G1 X149.701 Y188.447 E2.99465
G1 X150.244 Y188.447 E.01446
G1 X70.144 Y108.346 E3.0151
G1 X70.144 Y107.803 E.01446
G1 X150.788 Y188.447 E3.03556
G1 X151.331 Y188.447 E.01446
G1 X70.144 Y107.259 E3.05601
G1 X70.144 Y106.716 E.01446
G1 X151.875 Y188.447 E3.07647
G1 X152.418 Y188.447 E.01446
G1 X70.144 Y106.173 E3.09693
G1 X70.144 Y105.629 E.01446
G1 X152.961 Y188.447 E3.11738
G1 X153.505 Y188.447 E.01446
G1 X70.144 Y105.086 E3.13784
G1 X70.144 Y104.542 E.01446
G1 X154.048 Y188.447 E3.1583
G1 X154.592 Y188.447 E.01446
G1 X70.144 Y103.999 E3.17875
G1 X70.144 Y103.455 E.01446
G1 X155.135 Y188.447 E3.19921
G1 X155.679 Y188.447 E.01446
G1 X70.144 Y102.912 E3.21966
G1 X70.144 Y102.368 E.01446
G1 X156.222 Y188.447 E3.24012
G1 X156.766 Y188.447 E.01446
G1 X70.144 Y101.825 E3.26058
G1 X70.144 Y101.281 E.01446
G1 X157.309 Y188.447 E3.28103
G1 X157.852 Y188.447 E.01446
G1 X70.144 Y100.738 E3.30149
G1 X70.144 Y100.195 E.01446
G1 X158.396 Y188.447 E3.32195
G1 X158.939 Y188.447 E.01446
G1 X70.144 Y99.651 E3.3424
G1 X70.144 Y99.108 E.01446
G1 X159.483 Y188.447 E3.36286
G1 X160.026 Y188.447 E.01446
G1 X70.144 Y98.564 E3.38332
G1 X70.144 Y98.021 E.01446
G1 X160.57 Y188.447 E3.40377
G1 X161.113 Y188.447 E.01446
G1 X70.144 Y97.477 E3.42423
G1 X70.144 Y96.934 E.01446
G1 X161.657 Y188.447 E3.44468
G1 X162.2 Y188.447 E.01446
G1 X70.144 Y96.39 E3.46514
G1 X70.144 Y95.847 E.01446
G1 X162.744 Y188.447 E3.4856
G1 X163.287 Y188.447 E.01446
G1 X70.144 Y95.304 E3.50605
G1 X70.144 Y94.76 E.01446
G1 X163.83 Y188.447 E3.52651
G1 X164.374 Y188.447 E.01446
G1 X70.144 Y94.217 E3.54697
G1 X70.144 Y93.673 E.01446
G1 X164.917 Y188.447 E3.56742
G1 X165.461 Y188.447 E.01446
G1 X70.144 Y93.13 E3.58788
G1 X70.144 Y92.586 E.01446
G1 X166.004 Y188.447 E3.60834
M73 P58 R26
G1 X166.548 Y188.447 E.01446
G1 X70.144 Y92.043 E3.62879
G1 X70.144 Y91.499 E.01446
G1 X167.091 Y188.447 E3.64925
G1 X167.635 Y188.447 E.01446
G1 X70.144 Y90.956 E3.6697
G1 X70.144 Y90.412 E.01446
G1 X168.174 Y188.443 E3.69002
G2 X168.249 Y188.346 I-.017 J-.091 E.00358
G1 X168.249 Y187.975 E.00988
G1 X70.144 Y89.869 E3.69285
G1 X70.144 Y89.326 E.01446
G1 X168.249 Y187.431 E3.69285
G1 X168.249 Y186.888 E.01446
G1 X70.144 Y88.782 E3.69285
G1 X70.144 Y88.239 E.01446
G1 X168.249 Y186.344 E3.69285
G1 X168.249 Y185.801 E.01446
G1 X70.144 Y87.695 E3.69285
G1 X70.144 Y87.152 E.01446
G1 X168.249 Y185.257 E3.69285
G1 X168.249 Y184.714 E.01446
G1 X70.144 Y86.608 E3.69285
G1 X70.144 Y86.065 E.01446
G1 X168.249 Y184.17 E3.69285
G1 X168.249 Y183.627 E.01446
G1 X70.144 Y85.521 E3.69285
G1 X70.144 Y84.978 E.01446
G1 X168.249 Y183.084 E3.69285
G1 X168.249 Y182.54 E.01446
G1 X70.144 Y84.435 E3.69285
G1 X70.144 Y83.891 E.01446
G1 X168.249 Y181.997 E3.69285
G1 X168.249 Y181.453 E.01446
G1 X70.144 Y83.348 E3.69285
G1 X70.144 Y82.804 E.01446
G1 X168.249 Y180.91 E3.69285
G1 X168.249 Y180.366 E.01446
G1 X70.144 Y82.261 E3.69285
G1 X70.144 Y81.717 E.01446
G1 X168.249 Y179.823 E3.69285
G1 X168.249 Y179.279 E.01446
G1 X70.144 Y81.174 E3.69285
G1 X70.144 Y80.63 E.01446
G1 X168.249 Y178.736 E3.69285
G1 X168.249 Y178.192 E.01446
G1 X70.144 Y80.087 E3.69285
G1 X70.144 Y79.543 E.01446
G1 X168.249 Y177.649 E3.69285
G1 X168.249 Y177.106 E.01446
G1 X70.144 Y79 E3.69285
G1 X70.144 Y78.457 E.01446
G1 X168.249 Y176.562 E3.69285
G1 X168.249 Y176.019 E.01446
G1 X70.144 Y77.913 E3.69285
G1 X70.144 Y77.37 E.01446
G1 X168.249 Y175.475 E3.69285
G1 X168.249 Y174.932 E.01446
G1 X70.144 Y76.826 E3.69285
G1 X70.144 Y76.283 E.01446
G1 X168.249 Y174.388 E3.69285
G1 X168.249 Y173.845 E.01446
G1 X70.144 Y75.739 E3.69285
G1 X70.144 Y75.196 E.01446
G1 X168.249 Y173.301 E3.69285
G1 X168.249 Y172.758 E.01446
G1 X70.144 Y74.652 E3.69285
G1 X70.144 Y74.109 E.01446
G1 X168.249 Y172.215 E3.69285
G1 X168.249 Y171.671 E.01446
G1 X70.144 Y73.566 E3.69285
G1 X70.144 Y73.022 E.01446
G1 X168.249 Y171.128 E3.69285
G1 X168.249 Y170.584 E.01446
G1 X70.144 Y72.479 E3.69285
G1 X70.144 Y71.935 E.01446
G1 X168.249 Y170.041 E3.69285
G1 X168.249 Y169.497 E.01446
G1 X70.144 Y71.392 E3.69285
G1 X70.144 Y70.848 E.01446
G1 X168.249 Y168.954 E3.69285
G1 X168.249 Y168.41 E.01446
G1 X70.144 Y70.305 E3.69285
G1 X70.144 Y69.761 E.01446
G1 X168.249 Y167.867 E3.69285
G1 X168.249 Y167.323 E.01446
G1 X70.144 Y69.218 E3.69285
G1 X70.144 Y68.674 E.01446
G1 X168.249 Y166.78 E3.69285
G1 X168.249 Y166.237 E.01446
G1 X70.144 Y68.131 E3.69285
G1 X70.144 Y67.588 E.01446
G1 X168.249 Y165.693 E3.69285
G1 X168.249 Y165.15 E.01446
G1 X70.144 Y67.044 E3.69285
G1 X70.144 Y66.501 E.01446
G1 X168.249 Y164.606 E3.69285
G1 X168.249 Y164.063 E.01446
G1 X70.144 Y65.957 E3.69285
G1 X70.144 Y65.414 E.01446
G1 X168.249 Y163.519 E3.69285
G1 X168.249 Y162.976 E.01446
G1 X70.144 Y64.87 E3.69285
G1 X70.144 Y64.327 E.01446
G1 X168.249 Y162.432 E3.69285
G1 X168.249 Y161.889 E.01446
G1 X70.144 Y63.783 E3.69285
G1 X70.144 Y63.24 E.01446
G1 X168.249 Y161.346 E3.69285
G1 X168.249 Y160.802 E.01446
G1 X70.144 Y62.697 E3.69285
G1 X70.144 Y62.153 E.01446
G1 X168.249 Y160.259 E3.69285
G1 X168.249 Y159.715 E.01446
G1 X70.144 Y61.61 E3.69285
G1 X70.144 Y61.066 E.01446
G1 X168.249 Y159.172 E3.69285
G1 X168.249 Y158.628 E.01446
G1 X70.144 Y60.523 E3.69285
G1 X70.144 Y59.979 E.01446
G1 X168.249 Y158.085 E3.69285
G1 X168.249 Y157.541 E.01446
G1 X70.144 Y59.436 E3.69285
G1 X70.144 Y58.892 E.01446
G1 X168.249 Y156.998 E3.69285
G1 X168.249 Y156.454 E.01446
G1 X70.144 Y58.349 E3.69285
G1 X70.144 Y57.805 E.01446
G1 X168.249 Y155.911 E3.69285
G1 X168.249 Y155.368 E.01446
G1 X70.144 Y57.262 E3.69285
M73 P58 R25
G1 X70.144 Y56.719 E.01446
G1 X168.249 Y154.824 E3.69285
M73 P59 R25
G1 X168.249 Y154.281 E.01446
G1 X70.144 Y56.175 E3.69285
G1 X70.144 Y55.632 E.01446
G1 X168.249 Y153.737 E3.69285
G1 X168.249 Y153.194 E.01446
G1 X70.397 Y55.341 E3.68334
G1 X70.94 Y55.341 E.01447
G1 X168.249 Y152.65 E3.66288
G1 X168.249 Y152.107 E.01446
G1 X71.484 Y55.341 E3.64242
G1 X72.027 Y55.341 E.01447
G1 X168.249 Y151.563 E3.62196
G1 X168.249 Y151.02 E.01446
G1 X72.571 Y55.341 E3.6015
G1 X73.114 Y55.341 E.01447
G1 X168.249 Y150.477 E3.58104
G1 X168.249 Y149.933 E.01446
G1 X73.658 Y55.341 E3.56058
G1 X74.201 Y55.342 E.01447
G1 X168.249 Y149.39 E3.54012
G1 X168.249 Y148.846 E.01446
G1 X74.745 Y55.342 E3.51967
G1 X75.288 Y55.342 E.01447
G1 X168.249 Y148.303 E3.49921
G1 X168.249 Y147.759 E.01446
G1 X75.832 Y55.342 E3.47875
G1 X76.375 Y55.342 E.01447
G1 X168.249 Y147.216 E3.45829
G1 X168.249 Y146.672 E.01446
G1 X76.919 Y55.342 E3.43783
G1 X77.462 Y55.342 E.01447
G1 X168.249 Y146.129 E3.41737
G1 X168.249 Y145.585 E.01446
G1 X78.006 Y55.342 E3.39691
G1 X78.549 Y55.342 E.01447
G1 X168.249 Y145.042 E3.37645
G1 X168.249 Y144.499 E.01446
G1 X79.093 Y55.342 E3.35599
G1 X79.637 Y55.342 E.01447
G1 X168.249 Y143.955 E3.33554
G1 X168.249 Y143.412 E.01446
G1 X80.18 Y55.342 E3.31508
G1 X80.724 Y55.342 E.01447
G1 X168.249 Y142.868 E3.29462
G1 X168.249 Y142.325 E.01446
G1 X81.267 Y55.342 E3.27416
G1 X81.811 Y55.342 E.01447
G1 X168.249 Y141.781 E3.2537
G1 X168.249 Y141.238 E.01446
G1 X82.354 Y55.342 E3.23324
G1 X82.898 Y55.343 E.01447
G1 X168.249 Y140.694 E3.21278
G1 X168.249 Y140.151 E.01446
G1 X83.441 Y55.343 E3.19232
G1 X83.985 Y55.343 E.01447
G1 X168.249 Y139.608 E3.17187
G1 X168.249 Y139.064 E.01446
G1 X84.528 Y55.343 E3.15141
G1 X85.072 Y55.343 E.01447
G1 X168.249 Y138.521 E3.13095
G1 X168.249 Y137.977 E.01446
G1 X85.615 Y55.343 E3.11049
G1 X86.159 Y55.343 E.01447
G1 X168.249 Y137.434 E3.09003
G1 X168.249 Y136.89 E.01446
G1 X86.702 Y55.343 E3.06957
G1 X87.246 Y55.343 E.01447
G1 X168.249 Y136.347 E3.04911
G1 X168.249 Y135.803 E.01446
G1 X87.789 Y55.343 E3.02865
G1 X88.333 Y55.343 E.01447
G1 X168.249 Y135.26 E3.0082
G1 X168.249 Y134.716 E.01446
G1 X88.876 Y55.343 E2.98774
G1 X89.42 Y55.343 E.01447
G1 X168.249 Y134.173 E2.96728
G1 X168.249 Y133.63 E.01446
G1 X89.963 Y55.343 E2.94682
G1 X90.507 Y55.343 E.01447
G1 X168.249 Y133.086 E2.92636
G1 X168.249 Y132.543 E.01446
G1 X91.05 Y55.344 E2.9059
G1 X91.594 Y55.344 E.01447
G1 X168.249 Y131.999 E2.88544
G1 X168.249 Y131.456 E.01446
G1 X92.137 Y55.344 E2.86498
G1 X92.681 Y55.344 E.01447
G1 X168.249 Y130.912 E2.84452
G1 X168.249 Y130.369 E.01446
G1 X93.224 Y55.344 E2.82407
G1 X93.768 Y55.344 E.01447
G1 X168.249 Y129.825 E2.80361
G1 X168.249 Y129.282 E.01446
G1 X94.311 Y55.344 E2.78315
G1 X94.855 Y55.344 E.01447
G1 X168.249 Y128.739 E2.76269
G1 X168.249 Y128.195 E.01446
G1 X95.398 Y55.344 E2.74223
G1 X95.942 Y55.344 E.01447
G1 X168.249 Y127.652 E2.72177
G1 X168.249 Y127.108 E.01446
G1 X96.486 Y55.344 E2.70131
G1 X97.029 Y55.344 E.01447
G1 X168.249 Y126.565 E2.68085
G1 X168.249 Y126.021 E.01446
G1 X97.573 Y55.344 E2.6604
G1 X98.116 Y55.344 E.01447
G1 X168.249 Y125.478 E2.63994
G1 X168.249 Y124.934 E.01446
G1 X98.66 Y55.344 E2.61948
G1 X99.203 Y55.345 E.01447
G1 X168.249 Y124.391 E2.59902
G1 X168.249 Y123.847 E.01446
G1 X99.747 Y55.345 E2.57856
G1 X100.29 Y55.345 E.01447
G1 X168.249 Y123.304 E2.5581
G1 X168.249 Y122.761 E.01446
G1 X100.834 Y55.345 E2.53764
G1 X101.377 Y55.345 E.01447
G1 X168.249 Y122.217 E2.51718
G1 X168.249 Y121.674 E.01446
G1 X101.921 Y55.345 E2.49673
G1 X102.464 Y55.345 E.01447
G1 X168.249 Y121.13 E2.47627
G1 X168.249 Y120.587 E.01446
G1 X103.008 Y55.345 E2.45581
G1 X103.551 Y55.345 E.01447
G1 X168.249 Y120.043 E2.43535
G1 X168.249 Y119.5 E.01446
G1 X104.095 Y55.345 E2.41489
G1 X104.638 Y55.345 E.01447
G1 X168.249 Y118.956 E2.39443
G1 X168.249 Y118.413 E.01446
G1 X105.182 Y55.345 E2.37397
G1 X105.725 Y55.345 E.01447
G1 X168.249 Y117.87 E2.35351
G1 X168.249 Y117.326 E.01446
G1 X106.269 Y55.345 E2.33305
M73 P60 R25
G1 X106.812 Y55.345 E.01447
G1 X168.249 Y116.783 E2.3126
G1 X168.249 Y116.239 E.01446
G1 X107.356 Y55.346 E2.29214
G1 X107.899 Y55.346 E.01447
G1 X168.249 Y115.696 E2.27168
G1 X168.249 Y115.152 E.01446
G1 X108.443 Y55.346 E2.25122
G1 X108.986 Y55.346 E.01447
G1 X168.249 Y114.609 E2.23076
G1 X168.249 Y114.065 E.01446
G1 X109.53 Y55.346 E2.2103
G1 X110.073 Y55.346 E.01447
G1 X168.249 Y113.522 E2.18984
G1 X168.249 Y112.978 E.01446
G1 X110.617 Y55.346 E2.16938
G1 X111.16 Y55.346 E.01447
G1 X168.249 Y112.435 E2.14893
G1 X168.249 Y111.892 E.01446
G1 X111.704 Y55.346 E2.12847
G1 X112.247 Y55.346 E.01447
G1 X168.249 Y111.348 E2.10801
G1 X168.249 Y110.805 E.01446
G1 X112.791 Y55.346 E2.08755
G1 X113.334 Y55.346 E.01447
G1 X168.249 Y110.261 E2.06709
G1 X168.249 Y109.718 E.01446
G1 X113.878 Y55.346 E2.04663
G1 X114.422 Y55.346 E.01447
G1 X168.249 Y109.174 E2.02617
G1 X168.249 Y108.631 E.01446
G1 X114.965 Y55.346 E2.00571
G1 X115.509 Y55.346 E.01447
G1 X168.249 Y108.087 E1.98525
G1 X168.249 Y107.544 E.01446
G1 X116.052 Y55.347 E1.9648
G1 X116.596 Y55.347 E.01447
G1 X168.249 Y107.001 E1.94434
G1 X168.249 Y106.457 E.01446
G1 X117.139 Y55.347 E1.92388
G1 X117.683 Y55.347 E.01447
G1 X168.249 Y105.914 E1.90342
G1 X168.249 Y105.37 E.01446
G1 X118.226 Y55.347 E1.88296
G1 X118.77 Y55.347 E.01447
G1 X168.249 Y104.827 E1.8625
G1 X168.249 Y104.283 E.01446
G1 X119.313 Y55.347 E1.84204
G1 X119.857 Y55.347 E.01447
G1 X168.249 Y103.74 E1.82158
G1 X168.249 Y103.196 E.01446
G1 X120.4 Y55.347 E1.80113
G1 X120.944 Y55.347 E.01447
G1 X168.249 Y102.653 E1.78067
G1 X168.249 Y102.109 E.01446
G1 X121.487 Y55.347 E1.76021
G1 X122.031 Y55.347 E.01447
G1 X168.249 Y101.566 E1.73975
G1 X168.249 Y101.023 E.01446
G1 X122.574 Y55.347 E1.71929
G1 X123.118 Y55.347 E.01447
G1 X168.249 Y100.479 E1.69883
G1 X168.249 Y99.936 E.01446
G1 X123.661 Y55.347 E1.67837
G1 X124.205 Y55.348 E.01447
G1 X168.249 Y99.392 E1.65791
G1 X168.249 Y98.849 E.01446
G1 X124.748 Y55.348 E1.63746
G1 X125.292 Y55.348 E.01447
G1 X168.249 Y98.305 E1.617
G1 X168.249 Y97.762 E.01446
G1 X125.835 Y55.348 E1.59654
G1 X126.379 Y55.348 E.01447
G1 X168.249 Y97.218 E1.57608
G1 X168.249 Y96.675 E.01446
G1 X126.922 Y55.348 E1.55562
G1 X127.466 Y55.348 E.01447
G1 X168.249 Y96.132 E1.53516
G1 X168.249 Y95.588 E.01446
G1 X128.009 Y55.348 E1.5147
G1 X128.553 Y55.348 E.01447
G1 X168.249 Y95.045 E1.49424
G1 X168.249 Y94.501 E.01446
G1 X129.096 Y55.348 E1.47378
G1 X129.64 Y55.348 E.01447
G1 X168.249 Y93.958 E1.45333
G1 X168.249 Y93.414 E.01446
G1 X130.183 Y55.348 E1.43287
G1 X130.727 Y55.348 E.01447
G1 X168.249 Y92.871 E1.41241
G1 X168.249 Y92.327 E.01446
G1 X131.27 Y55.348 E1.39195
G1 X131.814 Y55.348 E.01447
G1 X168.249 Y91.784 E1.37149
G1 X168.249 Y91.24 E.01446
G1 X132.358 Y55.349 E1.35103
G1 X132.901 Y55.349 E.01447
G1 X168.249 Y90.697 E1.33057
G1 X168.249 Y90.154 E.01446
G1 X133.445 Y55.349 E1.31011
G1 X133.988 Y55.349 E.01447
G1 X168.249 Y89.61 E1.28966
G1 X168.249 Y89.067 E.01446
G1 X134.532 Y55.349 E1.2692
G1 X135.075 Y55.349 E.01447
G1 X168.249 Y88.523 E1.24874
G1 X168.249 Y87.98 E.01446
G1 X135.619 Y55.349 E1.22828
G1 X136.162 Y55.349 E.01447
G1 X168.249 Y87.436 E1.20782
G1 X168.249 Y86.893 E.01446
G1 X136.706 Y55.349 E1.18736
M73 P60 R24
G1 X137.249 Y55.349 E.01447
G1 X168.249 Y86.349 E1.1669
G1 X168.249 Y85.806 E.01446
G1 X137.793 Y55.349 E1.14644
G1 X138.336 Y55.349 E.01447
G1 X168.249 Y85.263 E1.12599
G1 X168.249 Y84.719 E.01446
G1 X138.88 Y55.349 E1.10553
G1 X139.423 Y55.349 E.01447
G1 X168.249 Y84.176 E1.08507
G1 X168.249 Y83.632 E.01446
G1 X139.967 Y55.349 E1.06461
G1 X140.51 Y55.35 E.01447
G1 X168.249 Y83.089 E1.04415
G1 X168.249 Y82.545 E.01446
G1 X141.054 Y55.35 E1.02369
G1 X141.597 Y55.35 E.01447
G1 X168.249 Y82.002 E1.00323
G1 X168.249 Y81.458 E.01446
G1 X142.141 Y55.35 E.98277
G1 X142.684 Y55.35 E.01447
G1 X168.249 Y80.915 E.96231
G1 X168.249 Y80.371 E.01446
G1 X143.228 Y55.35 E.94186
G1 X143.771 Y55.35 E.01447
G1 X168.249 Y79.828 E.9214
G1 X168.249 Y79.285 E.01446
G1 X144.315 Y55.35 E.90094
G1 X144.858 Y55.35 E.01447
G1 X168.249 Y78.741 E.88048
G1 X168.249 Y78.198 E.01446
G1 X145.402 Y55.35 E.86002
G1 X145.945 Y55.35 E.01447
G1 X168.249 Y77.654 E.83956
G1 X168.249 Y77.111 E.01446
G1 X146.489 Y55.35 E.8191
G1 X147.032 Y55.35 E.01447
G1 X168.249 Y76.567 E.79864
G1 X168.249 Y76.024 E.01446
G1 X147.576 Y55.35 E.77819
G1 X148.119 Y55.35 E.01447
G1 X168.249 Y75.48 E.75773
G1 X168.249 Y74.937 E.01446
G1 X148.663 Y55.35 E.73727
G1 X149.206 Y55.351 E.01447
G1 X168.249 Y74.394 E.71681
G1 X168.249 Y73.85 E.01446
G1 X149.75 Y55.351 E.69635
G1 X150.294 Y55.351 E.01447
G1 X168.249 Y73.307 E.67589
G1 X168.249 Y72.763 E.01446
G1 X150.837 Y55.351 E.65543
G1 X151.381 Y55.351 E.01447
G1 X168.249 Y72.22 E.63497
G1 X168.249 Y71.676 E.01446
G1 X151.924 Y55.351 E.61452
G1 X152.468 Y55.351 E.01447
G1 X168.249 Y71.133 E.59406
G1 X168.249 Y70.589 E.01446
G1 X153.011 Y55.351 E.5736
G1 X153.555 Y55.351 E.01447
G1 X168.249 Y70.046 E.55314
G1 X168.249 Y69.503 E.01446
G1 X154.098 Y55.351 E.53268
G1 X154.642 Y55.351 E.01447
G1 X168.249 Y68.959 E.51222
G1 X168.249 Y68.416 E.01446
G1 X155.185 Y55.351 E.49176
G1 X155.729 Y55.351 E.01447
G1 X168.249 Y67.872 E.4713
G1 X168.249 Y67.329 E.01446
G1 X156.272 Y55.351 E.45084
G1 X156.816 Y55.351 E.01447
G1 X168.249 Y66.785 E.43039
G1 X168.249 Y66.242 E.01446
G1 X157.359 Y55.352 E.40993
G1 X157.903 Y55.352 E.01447
G1 X168.249 Y65.698 E.38947
G1 X168.249 Y65.155 E.01446
G1 X158.446 Y55.352 E.36901
G1 X158.99 Y55.352 E.01447
G1 X168.249 Y64.611 E.34855
G1 X168.249 Y64.068 E.01446
G1 X159.533 Y55.352 E.32809
G1 X160.077 Y55.352 E.01447
G1 X168.249 Y63.525 E.30763
G1 X168.249 Y62.981 E.01446
G1 X160.62 Y55.352 E.28717
G1 X161.164 Y55.352 E.01447
G1 X168.249 Y62.438 E.26672
G1 X168.249 Y61.894 E.01446
G1 X161.707 Y55.352 E.24626
G1 X162.251 Y55.352 E.01447
G1 X168.249 Y61.351 E.2258
G1 X168.249 Y60.807 E.01446
G1 X162.794 Y55.352 E.20534
G1 X163.338 Y55.352 E.01447
G1 X168.249 Y60.264 E.18488
G1 X168.249 Y59.72 E.01446
G1 X163.881 Y55.352 E.16442
G1 X164.425 Y55.352 E.01447
G1 X168.249 Y59.177 E.14396
G1 X168.249 Y58.634 E.01446
G1 X164.968 Y55.352 E.1235
G1 X165.512 Y55.353 E.01447
G1 X168.249 Y58.09 E.10305
G1 X168.249 Y57.547 E.01446
G1 X166.055 Y55.353 E.08259
G1 X166.599 Y55.353 E.01447
G1 X168.249 Y57.003 E.06213
G1 X168.249 Y56.46 E.01446
G1 X167.142 Y55.353 E.04167
G1 X167.686 Y55.353 E.01447
G1 X168.422 Y56.089 E.02771
G1 X142.808 Y188.619 F30000
G1 F15000
G1 X103.276 Y149.087 E1.48807
G1 X103.388 Y149.742 E.0177
G1 X142.092 Y188.447 E1.4569
G1 X141.549 Y188.447 E.01446
G1 X103.5 Y150.397 E1.43223
G1 X103.612 Y151.053 E.0177
G1 X141.006 Y188.447 E1.40757
G1 X140.462 Y188.447 E.01446
G1 X103.724 Y151.708 E1.3829
G1 X103.835 Y152.363 E.0177
G1 X139.919 Y188.447 E1.35823
G1 X139.375 Y188.447 E.01446
G1 X103.947 Y153.019 E1.33356
G1 X104.059 Y153.674 E.0177
G1 X138.832 Y188.447 E1.30889
G1 X138.288 Y188.447 E.01446
G1 X104.171 Y154.329 E1.28423
G1 X104.283 Y154.985 E.0177
G1 X137.745 Y188.447 E1.25956
G1 X137.201 Y188.447 E.01446
G1 X104.395 Y155.64 E1.23489
G1 X104.507 Y156.295 E.0177
G1 X136.658 Y188.447 E1.21022
G1 X136.114 Y188.447 E.01446
G1 X104.619 Y156.951 E1.18555
G1 X104.731 Y157.606 E.0177
G1 X135.571 Y188.447 E1.16089
G1 X135.028 Y188.447 E.01446
G1 X104.842 Y158.261 E1.13622
G1 X104.954 Y158.917 E.0177
G1 X134.484 Y188.447 E1.11155
G1 X133.941 Y188.447 E.01446
G1 X105.066 Y159.572 E1.08688
G1 X105.178 Y160.227 E.0177
G1 X133.397 Y188.447 E1.06221
G1 X132.854 Y188.447 E.01446
G1 X105.29 Y160.883 E1.03755
G1 X105.402 Y161.538 E.0177
G1 X132.31 Y188.447 E1.01288
G1 X131.767 Y188.447 E.01446
G1 X105.514 Y162.193 E.98821
G1 X105.626 Y162.849 E.0177
G1 X131.223 Y188.447 E.96354
G1 X130.68 Y188.447 E.01446
G1 X105.738 Y163.504 E.93887
G1 X105.849 Y164.159 E.0177
G1 X130.137 Y188.447 E.91421
G1 X129.593 Y188.447 E.01446
G1 X105.961 Y164.815 E.88954
G1 X106.073 Y165.47 E.0177
G1 X129.05 Y188.447 E.86487
G1 X128.506 Y188.447 E.01446
G1 X106.185 Y166.125 E.8402
G1 X106.297 Y166.781 E.0177
G1 X127.963 Y188.447 E.81554
G1 X127.419 Y188.447 E.01446
G1 X106.409 Y167.436 E.79087
G1 X106.521 Y168.091 E.0177
G1 X126.876 Y188.447 E.7662
G1 X126.332 Y188.447 E.01446
G1 X106.633 Y168.747 E.74153
G1 X106.744 Y169.402 E.0177
G1 X125.789 Y188.447 E.71686
G1 X125.245 Y188.447 E.01446
G1 X106.856 Y170.057 E.6922
G1 X106.968 Y170.713 E.0177
G1 X124.702 Y188.447 E.66753
G1 X124.159 Y188.447 E.01446
G1 X107.08 Y171.368 E.64286
G1 X107.192 Y172.023 E.0177
G1 X123.615 Y188.447 E.61819
G1 X123.072 Y188.447 E.01446
G1 X107.304 Y172.679 E.59352
G1 X107.416 Y173.334 E.0177
G1 X122.528 Y188.447 E.56886
G1 X121.985 Y188.447 E.01446
G1 X107.528 Y173.989 E.54419
M73 P61 R24
G1 X107.64 Y174.645 E.0177
G1 X121.441 Y188.447 E.51952
G1 X120.898 Y188.447 E.01446
G1 X107.751 Y175.3 E.49485
G1 X107.863 Y175.955 E.0177
G1 X120.354 Y188.447 E.47018
G1 X119.811 Y188.447 E.01446
G1 X107.975 Y176.611 E.44552
G1 X108.087 Y177.266 E.0177
G1 X119.268 Y188.447 E.42085
G1 X118.724 Y188.447 E.01446
G1 X108.199 Y177.921 E.39618
G1 X108.311 Y178.577 E.0177
G1 X118.181 Y188.447 E.37151
G1 X117.637 Y188.447 E.01446
G1 X108.423 Y179.232 E.34685
G1 X108.535 Y179.887 E.0177
G1 X117.094 Y188.447 E.32218
G1 X116.55 Y188.447 E.01446
G1 X108.647 Y180.543 E.29751
G1 X108.758 Y181.198 E.0177
G1 X116.007 Y188.447 E.27284
G1 X115.463 Y188.447 E.01446
G1 X108.87 Y181.853 E.24817
G1 X108.982 Y182.509 E.0177
G1 X114.92 Y188.447 E.22351
G1 X114.376 Y188.447 E.01446
G1 X109.094 Y183.164 E.19884
G1 X109.206 Y183.819 E.0177
G1 X113.833 Y188.447 E.17417
G1 X113.29 Y188.447 E.01446
G1 X109.318 Y184.475 E.1495
G1 X109.43 Y185.13 E.0177
G1 X112.746 Y188.447 E.12483
G1 X112.203 Y188.447 E.01446
G1 X109.542 Y185.785 E.10017
G1 X109.654 Y186.441 E.0177
G1 X111.659 Y188.447 E.0755
G1 X111.116 Y188.447 E.01446
G1 X109.765 Y187.096 E.05083
G1 X109.877 Y187.751 E.0177
G1 X110.745 Y188.619 E.03266
; CHANGE_LAYER
; Z_HEIGHT: 4.76
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.877 Y187.751 E-.46626
G1 X109.765 Y187.096 E-.25263
G1 X109.842 Y187.173 E-.04111
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 28/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z4.99 I1.197 J-.22 P1  F30000
G1 X102.758 Y148.612 Z4.99
G1 Z4.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X102.572 Y148.352 E.00915
G2 X101.386 Y147.785 I-1.236 J1.062 E.03875
G1 X70.229 Y147.785 E.8924
G3 X69.805 Y147.378 I-.003 J-.421 E.01863
G1 X69.805 Y55.41 E2.63415
G3 X70.229 Y55.002 I.42 J.013 E.01863
G1 X168.182 Y55.004 E2.80557
G3 X168.588 Y55.41 I-.011 J.418 E.01813
G1 X168.588 Y188.376 E3.80841
G3 X168.163 Y188.785 I-.421 J-.011 E.01875
G1 X110.073 Y188.785 E1.6638
G3 X109.652 Y188.441 I-.016 J-.411 E.01705
G1 X102.936 Y149.107 E1.14291
G2 X102.783 Y148.666 I-1.601 J.308 E.01341
G1 X102.42 Y148.832 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G2 X101.364 Y148.184 I-1.084 J.582 E.03448
G1 X70.208 Y148.184 E.82765
G3 X69.407 Y147.388 I-.005 J-.796 E.03333
G1 X69.407 Y55.399 E2.4436
G3 X70.208 Y54.604 I.796 J.001 E.03333
G1 X168.203 Y54.606 E2.60314
G3 X168.987 Y55.399 I-.01 J.794 E.03286
G1 X168.987 Y188.387 E3.53271
G3 X168.185 Y189.184 I-.799 J-.003 E.03334
G1 X110.052 Y189.184 E1.54426
G3 X109.261 Y188.52 I.005 J-.809 E.02975
G1 X102.545 Y149.185 E1.06004
G2 X102.447 Y148.885 I-1.209 J.229 E.00838
M204 S10000
; WIPE_START
G1 F24000
G1 X102.274 Y148.606 E-.12489
G1 X102.083 Y148.427 E-.09924
G1 X101.861 Y148.294 E-.09847
G1 X101.613 Y148.211 E-.0994
G1 X101.364 Y148.184 E-.09506
G1 X100.725 Y148.184 E-.24295
; WIPE_END
G1 E-.04 F1800
G1 X107.254 Y152.137 Z5.16 F30000
G1 X167.496 Y188.619 Z5.16
G1 Z4.76
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420125
G1 F15000
G1 X168.25 Y187.865 E.02833
G1 X168.25 Y187.323 E.01442
G1 X167.126 Y188.447 E.04223
G1 X166.583 Y188.447 E.01442
G1 X168.25 Y186.78 E.06262
G1 X168.25 Y186.238 E.01442
G1 X166.041 Y188.447 E.08301
G1 X165.498 Y188.447 E.01442
G1 X168.25 Y185.695 E.1034
G1 X168.25 Y185.152 E.01442
G1 X164.956 Y188.447 E.12379
G1 X164.413 Y188.447 E.01442
G1 X168.25 Y184.61 E.14418
G1 X168.25 Y184.067 E.01442
G1 X163.87 Y188.447 E.16457
G1 X163.328 Y188.447 E.01442
G1 X168.25 Y183.525 E.18495
G1 X168.25 Y182.982 E.01442
G1 X162.785 Y188.447 E.20534
G1 X162.243 Y188.447 E.01442
G1 X168.25 Y182.44 E.22573
G1 X168.25 Y181.897 E.01442
G1 X161.7 Y188.447 E.24612
G1 X161.158 Y188.447 E.01442
G1 X168.25 Y181.355 E.26651
G1 X168.25 Y180.812 E.01442
G1 X160.615 Y188.447 E.2869
G1 X160.073 Y188.447 E.01442
G1 X168.25 Y180.27 E.30729
G1 X168.25 Y179.727 E.01442
G1 X159.53 Y188.447 E.32768
G1 X158.988 Y188.447 E.01442
G1 X168.25 Y179.184 E.34807
G1 X168.25 Y178.642 E.01442
G1 X158.445 Y188.447 E.36845
G1 X157.902 Y188.447 E.01442
G1 X168.25 Y178.099 E.38884
G1 X168.25 Y177.557 E.01442
G1 X157.36 Y188.447 E.40923
G1 X156.817 Y188.447 E.01442
G1 X168.25 Y177.014 E.42962
G1 X168.25 Y176.472 E.01442
G1 X156.275 Y188.447 E.45001
G1 X155.732 Y188.447 E.01442
G1 X168.25 Y175.929 E.4704
G1 X168.25 Y175.387 E.01442
G1 X155.19 Y188.447 E.49079
G1 X154.647 Y188.447 E.01442
G1 X168.25 Y174.844 E.51118
G1 X168.25 Y174.301 E.01442
G1 X154.105 Y188.447 E.53157
G1 X153.562 Y188.447 E.01442
G1 X168.25 Y173.759 E.55195
G1 X168.25 Y173.216 E.01442
G1 X153.019 Y188.447 E.57234
G1 X152.477 Y188.447 E.01442
G1 X168.25 Y172.674 E.59273
G1 X168.25 Y172.131 E.01442
G1 X151.934 Y188.447 E.61312
G1 X151.392 Y188.447 E.01442
G1 X168.25 Y171.589 E.63351
G1 X168.25 Y171.046 E.01442
G1 X150.849 Y188.447 E.6539
G1 X150.307 Y188.447 E.01442
G1 X168.25 Y170.504 E.67429
G1 X168.25 Y169.961 E.01442
G1 X149.764 Y188.447 E.69468
G1 X149.222 Y188.447 E.01442
G1 X168.25 Y169.418 E.71507
G1 X168.25 Y168.876 E.01442
G1 X148.679 Y188.447 E.73545
G1 X148.136 Y188.447 E.01442
G1 X168.25 Y168.333 E.75584
G1 X168.25 Y167.791 E.01442
G1 X147.594 Y188.447 E.77623
G1 X147.051 Y188.447 E.01442
G1 X168.25 Y167.248 E.79662
G1 X168.25 Y166.706 E.01442
G1 X146.509 Y188.447 E.81701
G1 X145.966 Y188.447 E.01442
G1 X168.25 Y166.163 E.8374
G1 X168.25 Y165.621 E.01442
G1 X145.424 Y188.447 E.85779
G1 X144.881 Y188.447 E.01442
G1 X168.25 Y165.078 E.87818
G1 X168.25 Y164.535 E.01442
G1 X144.339 Y188.447 E.89857
G1 X143.796 Y188.447 E.01442
G1 X168.25 Y163.993 E.91895
G1 X168.25 Y163.45 E.01442
G1 X143.253 Y188.447 E.93934
G1 X142.711 Y188.447 E.01442
G1 X168.25 Y162.908 E.95973
G1 X168.25 Y162.365 E.01442
G1 X142.168 Y188.447 E.98012
G1 X141.626 Y188.447 E.01442
G1 X168.25 Y161.823 E1.00051
G1 X168.25 Y161.28 E.01442
G1 X141.083 Y188.447 E1.0209
G1 X140.541 Y188.447 E.01442
G1 X168.25 Y160.738 E1.04129
G1 X168.25 Y160.195 E.01442
G1 X139.998 Y188.447 E1.06168
G1 X139.456 Y188.447 E.01442
G1 X168.25 Y159.652 E1.08207
G1 X168.25 Y159.11 E.01442
G1 X138.913 Y188.447 E1.10246
G1 X138.37 Y188.447 E.01442
G1 X168.25 Y158.567 E1.12284
G1 X168.25 Y158.025 E.01442
G1 X137.828 Y188.447 E1.14323
G1 X137.285 Y188.447 E.01442
G1 X168.25 Y157.482 E1.16362
G1 X168.25 Y156.94 E.01442
G1 X136.743 Y188.447 E1.18401
G1 X136.2 Y188.447 E.01442
G1 X168.25 Y156.397 E1.2044
G1 X168.25 Y155.855 E.01442
G1 X135.658 Y188.447 E1.22479
G1 X135.115 Y188.447 E.01442
G1 X168.25 Y155.312 E1.24518
G1 X168.25 Y154.77 E.01442
G1 X134.573 Y188.447 E1.26557
G1 X134.03 Y188.447 E.01442
G1 X168.25 Y154.227 E1.28596
G1 X168.25 Y153.684 E.01442
G1 X133.488 Y188.447 E1.30634
G1 X132.945 Y188.447 E.01442
G1 X168.25 Y153.142 E1.32673
G1 X168.25 Y152.599 E.01442
G1 X132.402 Y188.447 E1.34712
G1 X131.86 Y188.447 E.01442
G1 X168.25 Y152.057 E1.36751
G1 X168.25 Y151.514 E.01442
G1 X131.317 Y188.447 E1.3879
G1 X130.775 Y188.447 E.01442
G1 X168.25 Y150.972 E1.40829
G1 X168.25 Y150.429 E.01442
G1 X130.232 Y188.447 E1.42868
G1 X129.69 Y188.447 E.01442
G1 X168.25 Y149.887 E1.44907
G1 X168.25 Y149.344 E.01442
G1 X129.147 Y188.447 E1.46946
G1 X128.605 Y188.447 E.01442
G1 X168.25 Y148.801 E1.48984
G1 X168.25 Y148.259 E.01442
G1 X128.062 Y188.447 E1.51023
G1 X127.519 Y188.447 E.01442
G1 X168.25 Y147.716 E1.53062
G1 X168.25 Y147.174 E.01442
G1 X126.977 Y188.447 E1.55101
G1 X126.434 Y188.447 E.01442
G1 X168.25 Y146.631 E1.5714
G1 X168.25 Y146.089 E.01442
G1 X125.892 Y188.447 E1.59179
G1 X125.349 Y188.447 E.01442
G1 X168.25 Y145.546 E1.61218
G1 X168.25 Y145.004 E.01442
G1 X124.807 Y188.447 E1.63257
G1 X124.264 Y188.447 E.01442
G1 X168.25 Y144.461 E1.65296
G1 X168.25 Y143.918 E.01442
G1 X123.722 Y188.447 E1.67334
G1 X123.179 Y188.447 E.01442
G1 X168.25 Y143.376 E1.69373
G1 X168.25 Y142.833 E.01442
G1 X122.636 Y188.447 E1.71412
G1 X122.094 Y188.447 E.01442
G1 X168.25 Y142.291 E1.73451
G1 X168.25 Y141.748 E.01442
G1 X121.551 Y188.447 E1.7549
G1 X121.009 Y188.447 E.01442
G1 X168.25 Y141.206 E1.77529
G1 X168.25 Y140.663 E.01442
G1 X120.466 Y188.447 E1.79568
G1 X119.924 Y188.447 E.01442
G1 X168.25 Y140.121 E1.81607
G1 X168.25 Y139.578 E.01442
G1 X119.381 Y188.447 E1.83646
G1 X118.839 Y188.447 E.01442
G1 X168.25 Y139.035 E1.85684
G1 X168.25 Y138.493 E.01442
G1 X118.296 Y188.447 E1.87723
G1 X117.753 Y188.447 E.01442
G1 X168.25 Y137.95 E1.89762
G1 X168.25 Y137.408 E.01442
G1 X117.211 Y188.447 E1.91801
G1 X116.668 Y188.447 E.01442
G1 X168.25 Y136.865 E1.9384
G1 X168.25 Y136.323 E.01442
G1 X116.126 Y188.447 E1.95879
G1 X115.583 Y188.447 E.01442
G1 X168.25 Y135.78 E1.97918
G1 X168.25 Y135.238 E.01442
G1 X115.041 Y188.447 E1.99957
G1 X114.498 Y188.447 E.01442
G1 X168.25 Y134.695 E2.01996
G1 X168.25 Y134.152 E.01442
G1 X113.956 Y188.447 E2.04034
G1 X113.413 Y188.447 E.01442
G1 X168.25 Y133.61 E2.06073
G1 X168.25 Y133.067 E.01442
G1 X112.87 Y188.447 E2.08112
G1 X112.328 Y188.447 E.01442
G1 X168.25 Y132.525 E2.10151
G1 X168.25 Y131.982 E.01442
G1 X111.785 Y188.447 E2.1219
G1 X111.243 Y188.447 E.01442
G1 X168.25 Y131.44 E2.14229
G1 X168.25 Y130.897 E.01442
G1 X110.7 Y188.447 E2.16268
G1 X110.158 Y188.447 E.01442
G1 X168.25 Y130.355 E2.18307
G1 X168.25 Y129.812 E.01442
G1 X109.941 Y188.121 E2.19123
G1 X109.861 Y187.658 E.01249
G1 X168.25 Y129.27 E2.1942
G1 X168.25 Y128.727 E.01442
G1 X109.782 Y187.194 E2.19717
G1 X109.703 Y186.731 E.01249
G1 X168.25 Y128.184 E2.20015
G1 X168.25 Y127.642 E.01442
G1 X109.624 Y186.267 E2.20312
G1 X109.545 Y185.804 E.01249
G1 X168.25 Y127.099 E2.20609
G1 X168.25 Y126.557 E.01442
G1 X109.466 Y185.341 E2.20907
G1 X109.387 Y184.877 E.01249
G1 X168.25 Y126.014 E2.21204
G1 X168.25 Y125.472 E.01442
G1 X109.308 Y184.414 E2.21501
G1 X109.228 Y183.95 E.01249
G1 X168.25 Y124.929 E2.21799
G1 X168.25 Y124.387 E.01442
G1 X109.149 Y183.487 E2.22096
G1 X109.07 Y183.023 E.01249
G1 X168.25 Y123.844 E2.22393
G1 X168.25 Y123.301 E.01442
G1 X108.991 Y182.56 E2.22691
G1 X108.912 Y182.097 E.01249
G1 X168.25 Y122.759 E2.22988
G1 X168.25 Y122.216 E.01442
G1 X108.833 Y181.633 E2.23285
G1 X108.754 Y181.17 E.01249
G1 X168.25 Y121.674 E2.23583
G1 X168.25 Y121.131 E.01442
G1 X108.675 Y180.706 E2.2388
G1 X108.595 Y180.243 E.01249
G1 X168.25 Y120.589 E2.24177
G1 X168.25 Y120.046 E.01442
G1 X108.516 Y179.779 E2.24475
G1 X108.437 Y179.316 E.01249
G1 X168.25 Y119.504 E2.24772
G1 X168.25 Y118.961 E.01442
G1 X108.358 Y178.853 E2.25069
G1 X108.279 Y178.389 E.01249
G1 X168.25 Y118.418 E2.25367
G1 X168.25 Y117.876 E.01442
G1 X108.2 Y177.926 E2.25664
G1 X108.121 Y177.462 E.01249
G1 X168.25 Y117.333 E2.25961
G1 X168.25 Y116.791 E.01442
G1 X108.042 Y176.999 E2.26259
G1 X107.963 Y176.535 E.01249
G1 X168.25 Y116.248 E2.26556
G1 X168.25 Y115.706 E.01442
G1 X107.883 Y176.072 E2.26853
G1 X107.804 Y175.608 E.01249
G1 X168.25 Y115.163 E2.27151
G1 X168.25 Y114.621 E.01442
G1 X107.725 Y175.145 E2.27448
G1 X107.646 Y174.682 E.01249
G1 X168.25 Y114.078 E2.27745
G1 X168.25 Y113.535 E.01442
G1 X107.567 Y174.218 E2.28043
G1 X107.488 Y173.755 E.01249
G1 X168.25 Y112.993 E2.2834
G1 X168.25 Y112.45 E.01442
G1 X107.409 Y173.291 E2.28638
G1 X107.33 Y172.828 E.01249
G1 X168.25 Y111.908 E2.28935
G1 X168.25 Y111.365 E.01442
G1 X107.25 Y172.364 E2.29232
G1 X107.171 Y171.901 E.01249
G1 X168.25 Y110.823 E2.2953
G1 X168.25 Y110.28 E.01442
G1 X107.092 Y171.438 E2.29827
G1 X107.013 Y170.974 E.01249
G1 X168.25 Y109.738 E2.30124
G1 X168.25 Y109.195 E.01442
G1 X106.934 Y170.511 E2.30422
G1 X106.855 Y170.047 E.01249
G1 X168.25 Y108.652 E2.30719
G1 X168.25 Y108.11 E.01442
G1 X106.776 Y169.584 E2.31016
M73 P62 R24
G1 X106.697 Y169.12 E.01249
G1 X168.25 Y107.567 E2.31314
G1 X168.25 Y107.025 E.01442
G1 X106.617 Y168.657 E2.31611
G1 X106.538 Y168.194 E.01249
G1 X168.25 Y106.482 E2.31908
G1 X168.25 Y105.94 E.01442
G1 X106.459 Y167.73 E2.32206
G1 X106.38 Y167.267 E.01249
G1 X168.25 Y105.397 E2.32503
G1 X168.25 Y104.855 E.01442
G1 X106.301 Y166.803 E2.328
G1 X106.222 Y166.34 E.01249
G1 X168.25 Y104.312 E2.33098
G1 X168.25 Y103.77 E.01442
G1 X106.143 Y165.876 E2.33395
G1 X106.064 Y165.413 E.01249
G1 X168.25 Y103.227 E2.33692
G1 X168.25 Y102.684 E.01442
G1 X105.984 Y164.95 E2.3399
G1 X105.905 Y164.486 E.01249
G1 X168.25 Y102.142 E2.34287
G1 X168.25 Y101.599 E.01442
G1 X105.826 Y164.023 E2.34584
G1 X105.747 Y163.559 E.01249
G1 X168.25 Y101.057 E2.34882
M73 P62 R23
G1 X168.25 Y100.514 E.01442
G1 X105.668 Y163.096 E2.35179
G1 X105.589 Y162.632 E.01249
G1 X168.25 Y99.972 E2.35476
G1 X168.25 Y99.429 E.01442
G1 X105.51 Y162.169 E2.35774
G1 X105.431 Y161.706 E.01249
G1 X168.25 Y98.887 E2.36071
G1 X168.25 Y98.344 E.01442
G1 X105.351 Y161.242 E2.36368
G1 X105.272 Y160.779 E.01249
G1 X168.25 Y97.801 E2.36666
G1 X168.25 Y97.259 E.01442
G1 X105.193 Y160.315 E2.36963
G1 X105.114 Y159.852 E.01249
G1 X168.25 Y96.716 E2.3726
G1 X168.25 Y96.174 E.01442
G1 X105.035 Y159.388 E2.37558
G1 X104.956 Y158.925 E.01249
G1 X168.25 Y95.631 E2.37855
G1 X168.25 Y95.089 E.01442
G1 X104.877 Y158.462 E2.38152
G1 X104.798 Y157.998 E.01249
G1 X168.25 Y94.546 E2.3845
G1 X168.25 Y94.004 E.01442
G1 X104.718 Y157.535 E2.38747
G1 X104.639 Y157.071 E.01249
G1 X168.25 Y93.461 E2.39044
G1 X168.25 Y92.918 E.01442
G1 X104.56 Y156.608 E2.39342
G1 X104.481 Y156.144 E.01249
G1 X168.25 Y92.376 E2.39639
G1 X168.25 Y91.833 E.01442
G1 X104.402 Y155.681 E2.39936
G1 X104.323 Y155.218 E.01249
G1 X168.25 Y91.291 E2.40234
G1 X168.25 Y90.748 E.01442
G1 X104.244 Y154.754 E2.40531
G1 X104.165 Y154.291 E.01249
G1 X168.25 Y90.206 E2.40828
G1 X168.25 Y89.663 E.01442
G1 X104.086 Y153.827 E2.41126
G1 X104.006 Y153.364 E.01249
G1 X168.25 Y89.121 E2.41423
G1 X168.25 Y88.578 E.01442
G1 X103.927 Y152.9 E2.4172
G1 X103.848 Y152.437 E.01249
G1 X168.25 Y88.035 E2.42018
G1 X168.25 Y87.493 E.01442
G1 X103.769 Y151.974 E2.42315
G1 X103.69 Y151.51 E.01249
G1 X168.25 Y86.95 E2.42612
G1 X168.25 Y86.408 E.01442
G1 X103.611 Y151.047 E2.4291
G1 X103.532 Y150.583 E.01249
G1 X168.25 Y85.865 E2.43207
G1 X168.25 Y85.323 E.01442
G1 X103.453 Y150.12 E2.43504
G1 X103.373 Y149.656 E.01249
G1 X168.25 Y84.78 E2.43802
G1 X168.25 Y84.238 E.01442
G1 X103.294 Y149.193 E2.44099
G2 X103.189 Y148.755 I-2.129 J.28 E.01198
G1 X168.25 Y83.695 E2.44494
G1 X168.25 Y83.153 E.01442
G1 X103.015 Y148.387 E2.45148
G1 X102.838 Y148.125 E.00839
G1 X102.785 Y148.075 E.00196
G1 X168.25 Y82.61 E2.46014
G1 X168.25 Y82.067 E.01442
G1 X102.5 Y147.817 E2.47085
G1 X102.158 Y147.616 E.01053
G1 X168.25 Y81.525 E2.48368
G1 X168.25 Y80.982 E.01442
G1 X101.748 Y147.484 E2.49909
G2 X101.243 Y147.447 I-.425 J2.316 E.01349
G1 X168.25 Y80.44 E2.51808
G1 X168.25 Y79.897 E.01442
G1 X100.7 Y147.447 E2.53847
G1 X100.158 Y147.447 E.01442
G1 X168.25 Y79.355 E2.55886
G1 X168.25 Y78.812 E.01442
G1 X99.615 Y147.447 E2.57925
G1 X99.073 Y147.447 E.01442
G1 X168.25 Y78.27 E2.59964
G1 X168.25 Y77.727 E.01442
G1 X98.53 Y147.447 E2.62003
G1 X97.988 Y147.447 E.01442
G1 X168.25 Y77.184 E2.64042
G1 X168.25 Y76.642 E.01442
G1 X97.445 Y147.447 E2.66081
G1 X96.902 Y147.447 E.01442
G1 X168.25 Y76.099 E2.68119
G1 X168.25 Y75.557 E.01442
G1 X96.36 Y147.447 E2.70158
G1 X95.817 Y147.447 E.01442
G1 X168.25 Y75.014 E2.72197
G1 X168.25 Y74.472 E.01442
G1 X95.275 Y147.447 E2.74236
G1 X94.732 Y147.447 E.01442
G1 X168.25 Y73.929 E2.76275
G1 X168.25 Y73.387 E.01442
G1 X94.19 Y147.447 E2.78314
G1 X93.647 Y147.447 E.01442
G1 X168.25 Y72.844 E2.80353
G1 X168.25 Y72.301 E.01442
G1 X93.105 Y147.447 E2.82392
G1 X92.562 Y147.447 E.01442
G1 X168.25 Y71.759 E2.84431
G1 X168.25 Y71.216 E.01442
G1 X92.019 Y147.447 E2.86469
G1 X91.477 Y147.447 E.01442
G1 X168.25 Y70.674 E2.88508
G1 X168.25 Y70.131 E.01442
G1 X90.934 Y147.447 E2.90547
G1 X90.392 Y147.447 E.01442
G1 X168.25 Y69.589 E2.92586
G1 X168.25 Y69.046 E.01442
G1 X89.849 Y147.447 E2.94625
G1 X89.307 Y147.447 E.01442
G1 X168.25 Y68.504 E2.96664
G1 X168.25 Y67.961 E.01442
G1 X88.764 Y147.447 E2.98703
G1 X88.222 Y147.447 E.01442
G1 X168.25 Y67.418 E3.00742
G1 X168.25 Y66.876 E.01442
G1 X87.679 Y147.447 E3.02781
G1 X87.136 Y147.447 E.01442
G1 X168.25 Y66.333 E3.04819
G1 X168.25 Y65.791 E.01442
G1 X86.594 Y147.447 E3.06858
G1 X86.051 Y147.447 E.01442
G1 X168.25 Y65.248 E3.08897
G1 X168.25 Y64.706 E.01442
G1 X85.509 Y147.447 E3.10936
G1 X84.966 Y147.447 E.01442
G1 X168.25 Y64.163 E3.12975
G1 X168.25 Y63.621 E.01442
G1 X84.424 Y147.447 E3.15014
G1 X83.881 Y147.447 E.01442
G1 X168.25 Y63.078 E3.17053
G1 X168.25 Y62.535 E.01442
G1 X83.339 Y147.447 E3.19092
G1 X82.796 Y147.447 E.01442
G1 X168.25 Y61.993 E3.21131
G1 X168.25 Y61.45 E.01442
G1 X82.253 Y147.447 E3.23169
G1 X81.711 Y147.447 E.01442
G1 X168.25 Y60.908 E3.25208
G1 X168.25 Y60.365 E.01442
G1 X81.168 Y147.447 E3.27247
G1 X80.626 Y147.447 E.01442
G1 X168.25 Y59.823 E3.29286
G1 X168.25 Y59.28 E.01442
G1 X80.083 Y147.447 E3.31325
G1 X79.541 Y147.447 E.01442
G1 X168.25 Y58.738 E3.33364
G1 X168.25 Y58.195 E.01442
G1 X78.998 Y147.447 E3.35403
G1 X78.456 Y147.447 E.01442
G1 X168.25 Y57.653 E3.37442
G1 X168.25 Y57.11 E.01442
G1 X77.913 Y147.447 E3.39481
G1 X77.37 Y147.447 E.01442
G1 X168.25 Y56.567 E3.41519
M73 P63 R23
G1 X168.25 Y56.025 E.01442
G1 X76.828 Y147.447 E3.43558
G1 X76.285 Y147.447 E.01442
G1 X168.25 Y55.482 E3.45597
G2 X168.148 Y55.343 I-.091 J-.04 E.00555
G1 X167.847 Y55.343 E.008
G1 X75.743 Y147.447 E3.46122
G1 X75.2 Y147.447 E.01442
G1 X167.304 Y55.343 E3.46122
G1 X166.761 Y55.343 E.01442
G1 X74.658 Y147.447 E3.46122
G1 X74.115 Y147.447 E.01442
G1 X166.219 Y55.343 E3.46122
G1 X165.676 Y55.343 E.01442
G1 X73.573 Y147.447 E3.46122
G1 X73.03 Y147.447 E.01442
G1 X165.134 Y55.343 E3.46122
G1 X164.591 Y55.343 E.01442
G1 X72.488 Y147.447 E3.46122
G1 X71.945 Y147.447 E.01442
G1 X164.049 Y55.343 E3.46122
G1 X163.506 Y55.343 E.01442
G1 X71.402 Y147.447 E3.46122
G1 X70.86 Y147.447 E.01442
G1 X162.964 Y55.343 E3.46122
G1 X162.421 Y55.343 E.01442
G1 X70.317 Y147.447 E3.46122
G3 X70.144 Y147.35 I-.052 J-.11 E.00614
G1 X70.144 Y147.077 E.00726
G1 X161.879 Y55.343 E3.44734
G1 X161.336 Y55.343 E.01442
G1 X70.144 Y146.535 E3.42695
G1 X70.144 Y145.992 E.01442
G1 X160.794 Y55.343 E3.40656
G1 X160.251 Y55.343 E.01442
G1 X70.144 Y145.449 E3.38617
G1 X70.144 Y144.907 E.01442
G1 X159.708 Y55.343 E3.36578
G1 X159.166 Y55.343 E.01442
G1 X70.144 Y144.364 E3.3454
G1 X70.144 Y143.822 E.01442
G1 X158.623 Y55.343 E3.32501
G1 X158.081 Y55.343 E.01442
G1 X70.144 Y143.279 E3.30462
G1 X70.144 Y142.737 E.01442
G1 X157.538 Y55.343 E3.28423
G1 X156.996 Y55.343 E.01442
G1 X70.144 Y142.194 E3.26384
G1 X70.144 Y141.652 E.01442
G1 X156.453 Y55.343 E3.24345
G1 X155.911 Y55.343 E.01442
G1 X70.144 Y141.109 E3.22306
G1 X70.144 Y140.567 E.01442
G1 X155.368 Y55.343 E3.20268
G1 X154.826 Y55.343 E.01442
G1 X70.144 Y140.024 E3.18229
G1 X70.144 Y139.481 E.01442
G1 X154.283 Y55.343 E3.1619
G1 X153.74 Y55.343 E.01442
G1 X70.144 Y138.939 E3.14151
G1 X70.144 Y138.396 E.01442
G1 X153.198 Y55.343 E3.12112
G1 X152.655 Y55.343 E.01442
G1 X70.144 Y137.854 E3.10073
G1 X70.144 Y137.311 E.01442
G1 X152.113 Y55.343 E3.08035
G1 X151.57 Y55.342 E.01442
G1 X70.144 Y136.769 E3.05996
G1 X70.144 Y136.226 E.01442
G1 X151.028 Y55.342 E3.03957
G1 X150.485 Y55.342 E.01442
G1 X70.144 Y135.684 E3.01918
G1 X70.144 Y135.141 E.01442
G1 X149.943 Y55.342 E2.99879
G1 X149.4 Y55.342 E.01442
G1 X70.144 Y134.598 E2.9784
G1 X70.144 Y134.056 E.01442
G1 X148.858 Y55.342 E2.95801
G1 X148.315 Y55.342 E.01442
G1 X70.144 Y133.513 E2.93763
G1 X70.144 Y132.971 E.01442
G1 X147.772 Y55.342 E2.91724
G1 X147.23 Y55.342 E.01442
G1 X70.144 Y132.428 E2.89685
G1 X70.144 Y131.886 E.01442
G1 X146.687 Y55.342 E2.87646
G1 X146.145 Y55.342 E.01442
G1 X70.144 Y131.343 E2.85607
G1 X70.144 Y130.801 E.01442
G1 X145.602 Y55.342 E2.83568
G1 X145.06 Y55.342 E.01442
G1 X70.144 Y130.258 E2.81529
G1 X70.144 Y129.715 E.01442
G1 X144.517 Y55.342 E2.79491
G1 X143.975 Y55.342 E.01442
G1 X70.144 Y129.173 E2.77452
G1 X70.144 Y128.63 E.01442
G1 X143.432 Y55.342 E2.75413
G1 X142.89 Y55.342 E.01442
G1 X70.144 Y128.088 E2.73374
G1 X70.144 Y127.545 E.01442
G1 X142.347 Y55.342 E2.71335
G1 X141.805 Y55.342 E.01442
G1 X70.144 Y127.003 E2.69296
M73 P63 R22
G1 X70.144 Y126.46 E.01442
G1 X141.262 Y55.342 E2.67257
G1 X140.719 Y55.342 E.01442
G1 X70.144 Y125.918 E2.65219
G1 X70.144 Y125.375 E.01442
G1 X140.177 Y55.342 E2.6318
G1 X139.634 Y55.342 E.01442
G1 X70.144 Y124.832 E2.61141
G1 X70.144 Y124.29 E.01442
G1 X139.092 Y55.342 E2.59102
G1 X138.549 Y55.342 E.01442
G1 X70.144 Y123.747 E2.57063
G1 X70.144 Y123.205 E.01442
G1 X138.007 Y55.342 E2.55024
G1 X137.464 Y55.342 E.01442
G1 X70.144 Y122.662 E2.52986
G1 X70.144 Y122.12 E.01442
G1 X136.922 Y55.342 E2.50947
G1 X136.379 Y55.342 E.01442
G1 X70.144 Y121.577 E2.48908
G1 X70.144 Y121.035 E.01442
G1 X135.837 Y55.342 E2.46869
G1 X135.294 Y55.342 E.01442
G1 X70.144 Y120.492 E2.4483
G1 X70.144 Y119.95 E.01442
G1 X134.751 Y55.342 E2.42791
G1 X134.209 Y55.342 E.01442
G1 X70.144 Y119.407 E2.40752
G1 X70.144 Y118.864 E.01442
G1 X133.666 Y55.342 E2.38714
G1 X133.124 Y55.342 E.01442
G1 X70.144 Y118.322 E2.36675
G1 X70.144 Y117.779 E.01442
G1 X132.581 Y55.342 E2.34636
G1 X132.039 Y55.342 E.01442
G1 X70.144 Y117.237 E2.32597
G1 X70.144 Y116.694 E.01442
G1 X131.496 Y55.342 E2.30558
G1 X130.954 Y55.342 E.01442
G1 X70.144 Y116.152 E2.28519
G1 X70.144 Y115.609 E.01442
G1 X130.411 Y55.342 E2.2648
G1 X129.869 Y55.342 E.01442
G1 X70.144 Y115.067 E2.24442
G1 X70.144 Y114.524 E.01442
G1 X129.326 Y55.342 E2.22403
M73 P64 R22
G1 X128.783 Y55.342 E.01442
G1 X70.144 Y113.981 E2.20364
G1 X70.144 Y113.439 E.01442
G1 X128.241 Y55.342 E2.18325
G1 X127.698 Y55.342 E.01442
G1 X70.144 Y112.896 E2.16286
G1 X70.144 Y112.354 E.01442
G1 X127.156 Y55.342 E2.14247
G1 X126.613 Y55.342 E.01442
G1 X70.144 Y111.811 E2.12208
G1 X70.144 Y111.269 E.01442
G1 X126.071 Y55.342 E2.1017
G1 X125.528 Y55.342 E.01442
G1 X70.144 Y110.726 E2.08131
G1 X70.144 Y110.184 E.01442
G1 X124.986 Y55.342 E2.06092
G1 X124.443 Y55.342 E.01442
G1 X70.144 Y109.641 E2.04053
G1 X70.144 Y109.098 E.01442
G1 X123.901 Y55.342 E2.02014
G1 X123.358 Y55.342 E.01442
G1 X70.144 Y108.556 E1.99975
G1 X70.144 Y108.013 E.01442
G1 X122.815 Y55.342 E1.97936
G1 X122.273 Y55.342 E.01442
G1 X70.144 Y107.471 E1.95898
G1 X70.144 Y106.928 E.01442
G1 X121.73 Y55.342 E1.93859
G1 X121.188 Y55.342 E.01442
G1 X70.144 Y106.386 E1.9182
G1 X70.144 Y105.843 E.01442
G1 X120.645 Y55.342 E1.89781
G1 X120.103 Y55.342 E.01442
G1 X70.144 Y105.301 E1.87742
G1 X70.144 Y104.758 E.01442
G1 X119.56 Y55.342 E1.85703
G1 X119.018 Y55.342 E.01442
G1 X70.144 Y104.215 E1.83665
G1 X70.144 Y103.673 E.01442
G1 X118.475 Y55.342 E1.81626
G1 X117.933 Y55.342 E.01442
G1 X70.144 Y103.13 E1.79587
G1 X70.144 Y102.588 E.01442
G1 X117.39 Y55.342 E1.77548
G1 X116.848 Y55.342 E.01442
G1 X70.144 Y102.045 E1.75509
G1 X70.144 Y101.503 E.01442
G1 X116.305 Y55.342 E1.7347
G1 X115.762 Y55.342 E.01442
G1 X70.144 Y100.96 E1.71431
G1 X70.144 Y100.418 E.01442
G1 X115.22 Y55.342 E1.69393
G1 X114.677 Y55.342 E.01442
G1 X70.144 Y99.875 E1.67354
G1 X70.144 Y99.332 E.01442
G1 X114.135 Y55.342 E1.65315
G1 X113.592 Y55.342 E.01442
G1 X70.144 Y98.79 E1.63276
G1 X70.144 Y98.247 E.01442
G1 X113.05 Y55.342 E1.61237
G1 X112.507 Y55.342 E.01442
G1 X70.144 Y97.705 E1.59198
G1 X70.144 Y97.162 E.01442
G1 X111.965 Y55.342 E1.57159
G1 X111.422 Y55.342 E.01442
G1 X70.144 Y96.62 E1.55121
G1 X70.144 Y96.077 E.01442
G1 X110.88 Y55.342 E1.53082
G1 X110.337 Y55.342 E.01442
G1 X70.144 Y95.535 E1.51043
G1 X70.144 Y94.992 E.01442
G1 X109.794 Y55.342 E1.49004
G1 X109.252 Y55.342 E.01442
G1 X70.144 Y94.45 E1.46965
G1 X70.144 Y93.907 E.01442
G1 X108.709 Y55.342 E1.44926
G1 X108.167 Y55.342 E.01442
G1 X70.144 Y93.364 E1.42887
G1 X70.144 Y92.822 E.01442
G1 X107.624 Y55.342 E1.40849
G1 X107.082 Y55.342 E.01442
G1 X70.144 Y92.279 E1.3881
G1 X70.144 Y91.737 E.01442
G1 X106.539 Y55.342 E1.36771
G1 X105.997 Y55.342 E.01442
G1 X70.144 Y91.194 E1.34732
G1 X70.144 Y90.652 E.01442
G1 X105.454 Y55.342 E1.32693
G1 X104.912 Y55.342 E.01442
G1 X70.144 Y90.109 E1.30654
G1 X70.144 Y89.567 E.01442
G1 X104.369 Y55.342 E1.28616
G1 X103.826 Y55.342 E.01442
G1 X70.144 Y89.024 E1.26577
G1 X70.144 Y88.481 E.01442
G1 X103.284 Y55.342 E1.24538
G1 X102.741 Y55.342 E.01442
G1 X70.144 Y87.939 E1.22499
G1 X70.144 Y87.396 E.01442
G1 X102.199 Y55.342 E1.2046
G1 X101.656 Y55.342 E.01442
G1 X70.144 Y86.854 E1.18421
G1 X70.144 Y86.311 E.01442
G1 X101.114 Y55.342 E1.16382
G1 X100.571 Y55.342 E.01442
G1 X70.144 Y85.769 E1.14344
G1 X70.144 Y85.226 E.01442
G1 X100.029 Y55.342 E1.12305
G1 X99.486 Y55.342 E.01442
G1 X70.144 Y84.684 E1.10266
G1 X70.144 Y84.141 E.01442
G1 X98.944 Y55.342 E1.08227
G1 X98.401 Y55.342 E.01442
G1 X70.144 Y83.598 E1.06188
G1 X70.144 Y83.056 E.01442
G1 X97.858 Y55.342 E1.04149
G1 X97.316 Y55.342 E.01442
G1 X70.144 Y82.513 E1.0211
G1 X70.144 Y81.971 E.01442
G1 X96.773 Y55.342 E1.00072
G1 X96.231 Y55.341 E.01442
G1 X70.144 Y81.428 E.98033
G1 X70.144 Y80.886 E.01442
G1 X95.688 Y55.341 E.95994
G1 X95.146 Y55.341 E.01442
G1 X70.144 Y80.343 E.93955
G1 X70.144 Y79.801 E.01442
G1 X94.603 Y55.341 E.91916
G1 X94.061 Y55.341 E.01442
G1 X70.144 Y79.258 E.89877
G1 X70.144 Y78.715 E.01442
G1 X93.518 Y55.341 E.87838
G1 X92.976 Y55.341 E.01442
G1 X70.144 Y78.173 E.858
G1 X70.144 Y77.63 E.01442
G1 X92.433 Y55.341 E.83761
G1 X91.891 Y55.341 E.01442
G1 X70.144 Y77.088 E.81722
G1 X70.144 Y76.545 E.01442
G1 X91.348 Y55.341 E.79683
G1 X90.805 Y55.341 E.01442
G1 X70.144 Y76.003 E.77644
G1 X70.144 Y75.46 E.01442
G1 X90.263 Y55.341 E.75605
G1 X89.72 Y55.341 E.01442
G1 X70.144 Y74.918 E.73567
G1 X70.144 Y74.375 E.01442
G1 X89.178 Y55.341 E.71528
G1 X88.635 Y55.341 E.01442
G1 X70.144 Y73.832 E.69489
G1 X70.144 Y73.29 E.01442
G1 X88.093 Y55.341 E.6745
G1 X87.55 Y55.341 E.01442
G1 X70.144 Y72.747 E.65411
G1 X70.144 Y72.205 E.01442
G1 X87.008 Y55.341 E.63372
G1 X86.465 Y55.341 E.01442
G1 X70.144 Y71.662 E.61333
G1 X70.144 Y71.12 E.01442
G1 X85.923 Y55.341 E.59295
G1 X85.38 Y55.341 E.01442
G1 X70.144 Y70.577 E.57256
G1 X70.144 Y70.035 E.01442
G1 X84.837 Y55.341 E.55217
G1 X84.295 Y55.341 E.01442
G1 X70.144 Y69.492 E.53178
G1 X70.144 Y68.95 E.01442
G1 X83.752 Y55.341 E.51139
G1 X83.21 Y55.341 E.01442
G1 X70.144 Y68.407 E.491
G1 X70.144 Y67.864 E.01442
G1 X82.667 Y55.341 E.47061
G1 X82.125 Y55.341 E.01442
G1 X70.144 Y67.322 E.45023
G1 X70.144 Y66.779 E.01442
G1 X81.582 Y55.341 E.42984
G1 X81.04 Y55.341 E.01442
G1 X70.144 Y66.237 E.40945
G1 X70.144 Y65.694 E.01442
G1 X80.497 Y55.341 E.38906
G1 X79.955 Y55.341 E.01442
G1 X70.144 Y65.152 E.36867
G1 X70.144 Y64.609 E.01442
G1 X79.412 Y55.341 E.34828
G1 X78.869 Y55.341 E.01442
G1 X70.144 Y64.067 E.32789
G1 X70.144 Y63.524 E.01442
G1 X78.327 Y55.341 E.30751
G1 X77.784 Y55.341 E.01442
G1 X70.144 Y62.981 E.28712
G1 X70.144 Y62.439 E.01442
G1 X77.242 Y55.341 E.26673
G1 X76.699 Y55.341 E.01442
G1 X70.144 Y61.896 E.24634
G1 X70.144 Y61.354 E.01442
G1 X76.157 Y55.341 E.22595
G1 X75.614 Y55.341 E.01442
G1 X70.144 Y60.811 E.20556
G1 X70.144 Y60.269 E.01442
G1 X75.072 Y55.341 E.18518
G1 X74.529 Y55.341 E.01442
G1 X70.144 Y59.726 E.16479
G1 X70.144 Y59.184 E.01442
G1 X73.987 Y55.341 E.1444
G1 X73.444 Y55.341 E.01442
G1 X70.144 Y58.641 E.12401
G1 X70.144 Y58.098 E.01442
G1 X72.901 Y55.341 E.10362
G1 X72.359 Y55.341 E.01442
G1 X70.144 Y57.556 E.08323
G1 X70.144 Y57.013 E.01442
G1 X71.816 Y55.341 E.06284
G1 X71.274 Y55.341 E.01442
G1 X70.144 Y56.471 E.04246
G1 X70.144 Y55.928 E.01442
G1 X70.904 Y55.168 E.02855
; CHANGE_LAYER
; Z_HEIGHT: 4.93
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X70.144 Y55.928 E-.40831
G1 X70.144 Y56.471 E-.20617
G1 X70.415 Y56.2 E-.14552
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 29/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z5.16 I-.911 J.807 P1  F30000
G1 X149.486 Y145.381 Z5.16
G1 Z4.93
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X149.486 Y61.809 E2.39366
G1 X156.782 Y61.809 E.20898
G1 X156.782 Y181.979 E3.4419
G1 X149.486 Y181.979 E.20898
G1 X149.486 Y145.441 E1.04652
; WIPE_START
G1 F24000
G1 X149.486 Y143.441 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.901 Y144.29 Z5.33 F30000
G1 X102.79 Y148.67 Z5.33
G1 Z4.93
G1 E.8 F1800
G1 F17923.694
G1 X102.77 Y148.641 E.00102
G2 X101.386 Y147.785 I-1.434 J.773 E.0488
G1 X70.229 Y147.785 E.8924
G3 X69.806 Y147.378 I-.003 J-.421 E.01863
G1 X69.806 Y55.41 E2.63415
G3 X70.229 Y55.002 I.42 J.013 E.01863
G1 X149.486 Y55.003 E2.27007
G1 X149.486 Y60.979 E.17115
G1 X157.612 Y60.979 E.23277
G1 X157.612 Y182.809 E3.48946
G1 X149.486 Y182.809 E.23276
G1 X149.486 Y188.785 E.17117
G1 X110.074 Y188.785 E1.12884
G3 X109.652 Y188.442 I-.016 J-.411 E.01702
G1 X102.936 Y149.107 E1.14294
G2 X102.895 Y148.939 I-1.6 J.307 E.00495
G1 X102.812 Y148.726 E.00654
G1 X102.403 Y148.796 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.27 Y148.612 E.00605
G2 X101.365 Y148.184 I-.933 J.801 E.02739
G1 X70.208 Y148.184 E.82765
G3 X69.407 Y147.388 I-.005 J-.796 E.03333
G1 X69.407 Y55.399 E2.4436
G3 X70.208 Y54.604 I.796 J.001 E.03333
G1 X168.194 Y54.605 E2.60291
G3 X168.987 Y55.399 I-.002 J.795 E.03311
G1 X168.987 Y188.388 E3.53272
G3 X168.186 Y189.184 I-.797 J-.002 E.03334
G1 X110.052 Y189.184 E1.54426
G3 X109.261 Y188.521 I.005 J-.809 E.02974
G1 X102.545 Y149.185 E1.06005
G2 X102.43 Y148.85 I-1.208 J.229 E.00943
M204 S10000
; WIPE_START
G1 F24000
G1 X102.27 Y148.612 E-.10911
G1 X102.085 Y148.428 E-.09908
G1 X101.861 Y148.294 E-.09923
G1 X101.613 Y148.211 E-.09926
G1 X101.365 Y148.184 E-.09491
G1 X100.685 Y148.184 E-.25841
; WIPE_END
G1 E-.04 F1800
G1 X101.919 Y147.718 Z5.33 F30000
G1 Z4.93
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420894
G1 F15000
G1 X70.144 Y115.943 E1.19647
G1 X70.144 Y116.487 E.01447
G1 X101.104 Y147.447 E1.16579
G1 X100.56 Y147.447 E.01447
G1 X70.144 Y117.03 E1.14532
G1 X70.144 Y117.574 E.01447
G1 X100.017 Y147.447 E1.12485
G1 X99.473 Y147.447 E.01447
G1 X70.144 Y118.118 E1.10438
G1 X70.144 Y118.661 E.01447
G1 X98.93 Y147.447 E1.0839
G1 X98.386 Y147.447 E.01447
G1 X70.144 Y119.205 E1.06343
G1 X70.144 Y119.749 E.01447
G1 X97.842 Y147.447 E1.04296
G1 X97.299 Y147.447 E.01447
G1 X70.144 Y120.292 E1.02249
G1 X70.144 Y120.836 E.01447
G1 X96.755 Y147.447 E1.00202
G1 X96.211 Y147.447 E.01447
G1 X70.144 Y121.379 E.98155
G1 X70.144 Y121.923 E.01447
G1 X95.668 Y147.447 E.96108
G1 X95.124 Y147.447 E.01447
G1 X70.144 Y122.467 E.94061
G1 X70.144 Y123.01 E.01447
G1 X94.58 Y147.447 E.92014
G1 X94.037 Y147.447 E.01447
G1 X70.144 Y123.554 E.89967
G1 X70.144 Y124.098 E.01447
G1 X93.493 Y147.447 E.8792
G1 X92.949 Y147.447 E.01447
G1 X70.144 Y124.641 E.85873
G1 X70.144 Y125.185 E.01447
G1 X92.406 Y147.447 E.83826
M73 P65 R22
G1 X91.862 Y147.447 E.01447
G1 X70.144 Y125.729 E.81779
G1 X70.144 Y126.272 E.01447
G1 X91.319 Y147.447 E.79731
G1 X90.775 Y147.447 E.01447
G1 X70.144 Y126.816 E.77684
G1 X70.144 Y127.36 E.01447
G1 X90.231 Y147.447 E.75637
G1 X89.688 Y147.447 E.01447
G1 X70.144 Y127.903 E.7359
G1 X70.144 Y128.447 E.01447
G1 X89.144 Y147.447 E.71543
G1 X88.6 Y147.447 E.01447
G1 X70.144 Y128.99 E.69496
G1 X70.144 Y129.534 E.01447
G1 X88.057 Y147.447 E.67449
G1 X87.513 Y147.447 E.01447
G1 X70.144 Y130.078 E.65402
G1 X70.144 Y130.621 E.01447
G1 X86.969 Y147.447 E.63355
G1 X86.426 Y147.447 E.01447
G1 X70.144 Y131.165 E.61308
G1 X70.144 Y131.709 E.01447
G1 X85.882 Y147.447 E.59261
G1 X85.338 Y147.447 E.01447
G1 X70.144 Y132.252 E.57214
G1 X70.144 Y132.796 E.01447
G1 X84.795 Y147.447 E.55167
G1 X84.251 Y147.447 E.01447
G1 X70.144 Y133.34 E.5312
G1 X70.144 Y133.883 E.01447
G1 X83.708 Y147.447 E.51072
G1 X83.164 Y147.447 E.01447
G1 X70.144 Y134.427 E.49025
G1 X70.144 Y134.97 E.01447
G1 X82.62 Y147.447 E.46978
G1 X82.077 Y147.447 E.01447
G1 X70.144 Y135.514 E.44931
G1 X70.144 Y136.058 E.01447
G1 X81.533 Y147.447 E.42884
G1 X80.989 Y147.447 E.01447
G1 X70.144 Y136.601 E.40837
G1 X70.144 Y137.145 E.01447
G1 X80.446 Y147.447 E.3879
G1 X79.902 Y147.447 E.01447
G1 X70.144 Y137.689 E.36743
G1 X70.144 Y138.232 E.01447
G1 X79.358 Y147.447 E.34696
G1 X78.815 Y147.447 E.01447
G1 X70.144 Y138.776 E.32649
G1 X70.144 Y139.32 E.01447
G1 X78.271 Y147.447 E.30602
G1 X77.728 Y147.447 E.01448
G1 X70.144 Y139.863 E.28555
G1 X70.144 Y140.407 E.01447
G1 X77.184 Y147.447 E.26508
G1 X76.64 Y147.447 E.01447
G1 X70.144 Y140.951 E.24461
G1 X70.144 Y141.494 E.01447
G1 X76.097 Y147.447 E.22413
G1 X75.553 Y147.447 E.01447
G1 X70.144 Y142.038 E.20366
G1 X70.144 Y142.581 E.01447
G1 X75.009 Y147.447 E.18319
G1 X74.466 Y147.447 E.01447
G1 X70.144 Y143.125 E.16272
G1 X70.144 Y143.669 E.01447
G1 X73.922 Y147.447 E.14225
G1 X73.378 Y147.447 E.01447
G1 X70.144 Y144.212 E.12178
G1 X70.144 Y144.756 E.01447
G1 X72.835 Y147.447 E.10131
G1 X72.291 Y147.447 E.01447
G1 X70.144 Y145.3 E.08084
G1 X70.144 Y145.843 E.01447
G1 X71.747 Y147.447 E.06037
G1 X71.204 Y147.447 E.01447
G1 X70.144 Y146.387 E.0399
G1 X70.144 Y146.931 E.01447
G1 X70.833 Y147.619 E.02593
; WIPE_START
G1 F24000
G1 X70.144 Y146.931 E-.37001
G1 X70.144 Y146.387 E-.20658
G1 X70.486 Y146.728 E-.1834
; WIPE_END
G1 E-.04 F1800
G1 X75.774 Y152.231 Z5.33 F30000
G1 X110.745 Y188.619 Z5.33
G1 Z4.93
G1 E.8 F1800
G1 F15000
G1 X109.878 Y187.751 E.03268
G1 X109.766 Y187.096 E.01771
G1 X111.117 Y188.447 E.05087
G1 X111.66 Y188.447 E.01447
G1 X109.654 Y186.44 E.07556
G1 X109.542 Y185.784 E.01771
G1 X112.204 Y188.447 E.10024
G1 X112.747 Y188.447 E.01447
G1 X109.43 Y185.129 E.12493
G1 X109.318 Y184.473 E.01771
G1 X113.291 Y188.447 E.14961
G1 X113.835 Y188.447 E.01447
G1 X109.206 Y183.818 E.1743
G1 X109.094 Y183.162 E.01771
G1 X114.378 Y188.447 E.19898
G1 X114.922 Y188.447 E.01447
G1 X108.982 Y182.507 E.22367
G1 X108.87 Y181.851 E.01771
G1 X115.466 Y188.447 E.24835
G1 X116.009 Y188.447 E.01447
G1 X108.758 Y181.195 E.27304
G1 X108.646 Y180.54 E.01771
G1 X116.553 Y188.447 E.29772
G1 X117.097 Y188.447 E.01447
G1 X108.534 Y179.884 E.32241
G1 X108.422 Y179.229 E.01771
G1 X117.64 Y188.447 E.34709
G1 X118.184 Y188.447 E.01447
G1 X108.311 Y178.573 E.37178
G1 X108.199 Y177.918 E.01771
G1 X118.728 Y188.447 E.39646
G1 X119.271 Y188.447 E.01447
G1 X108.087 Y177.262 E.42115
G1 X107.975 Y176.607 E.01771
G1 X119.815 Y188.447 E.44583
G1 X120.358 Y188.447 E.01447
G1 X107.863 Y175.951 E.47052
G1 X107.751 Y175.295 E.01771
G1 X120.902 Y188.447 E.4952
G1 X121.446 Y188.447 E.01447
G1 X107.639 Y174.64 E.51989
G1 X107.527 Y173.984 E.01771
G1 X121.989 Y188.447 E.54457
G1 X122.533 Y188.447 E.01447
G1 X107.415 Y173.329 E.56926
G1 X107.303 Y172.673 E.01771
G1 X123.077 Y188.447 E.59395
G1 X123.62 Y188.447 E.01447
G1 X107.191 Y172.018 E.61863
G1 X107.079 Y171.362 E.01771
G1 X124.164 Y188.447 E.64332
G1 X124.708 Y188.447 E.01447
G1 X106.967 Y170.706 E.668
G1 X106.856 Y170.051 E.01771
G1 X125.251 Y188.447 E.69269
G1 X125.795 Y188.447 E.01447
G1 X106.744 Y169.395 E.71737
G1 X106.632 Y168.74 E.01771
G1 X126.338 Y188.447 E.74206
G1 X126.882 Y188.447 E.01447
G1 X106.52 Y168.084 E.76674
G1 X106.408 Y167.429 E.01771
G1 X127.426 Y188.447 E.79143
G1 X127.969 Y188.447 E.01447
G1 X106.296 Y166.773 E.81611
G1 X106.184 Y166.117 E.01771
G1 X128.513 Y188.447 E.8408
G1 X129.057 Y188.447 E.01447
G1 X106.072 Y165.462 E.86548
G1 X105.96 Y164.806 E.01771
G1 X129.6 Y188.447 E.89017
G1 X130.144 Y188.447 E.01447
G1 X105.848 Y164.151 E.91485
G1 X105.736 Y163.495 E.01771
G1 X130.688 Y188.447 E.93954
G1 X131.231 Y188.447 E.01447
G1 X105.624 Y162.84 E.96422
G1 X105.512 Y162.184 E.01771
G1 X131.775 Y188.447 E.98891
G1 X132.319 Y188.447 E.01447
G1 X105.401 Y161.528 E1.01359
G1 X105.289 Y160.873 E.01771
G1 X132.862 Y188.447 E1.03828
G1 X133.406 Y188.447 E.01447
G1 X105.177 Y160.217 E1.06296
G1 X105.065 Y159.562 E.01771
G1 X133.949 Y188.447 E1.08765
G1 X134.493 Y188.447 E.01447
G1 X104.953 Y158.906 E1.11234
G1 X104.841 Y158.251 E.01771
G1 X135.037 Y188.447 E1.13702
G1 X135.58 Y188.447 E.01447
G1 X104.729 Y157.595 E1.16171
G1 X104.617 Y156.94 E.01771
G1 X136.124 Y188.447 E1.18639
G1 X136.668 Y188.447 E.01447
G1 X104.505 Y156.284 E1.21108
G1 X104.393 Y155.628 E.01771
G1 X137.211 Y188.447 E1.23576
G1 X137.755 Y188.447 E.01447
G1 X104.281 Y154.973 E1.26045
G1 X104.169 Y154.317 E.01771
G1 X138.299 Y188.447 E1.28513
G1 X138.842 Y188.447 E.01447
G1 X104.057 Y153.662 E1.30982
G1 X103.945 Y153.006 E.01771
G1 X139.386 Y188.447 E1.3345
G1 X139.93 Y188.447 E.01447
G1 X103.834 Y152.351 E1.35919
M73 P65 R21
G1 X103.722 Y151.695 E.01771
G1 X140.473 Y188.447 E1.38387
G1 X141.017 Y188.447 E.01447
G1 X103.61 Y151.039 E1.40856
G1 X103.498 Y150.384 E.01771
G1 X141.56 Y188.447 E1.43324
G1 X142.104 Y188.447 E.01447
G1 X103.386 Y149.728 E1.45793
G1 X103.274 Y149.073 E.01771
G1 X142.648 Y188.447 E1.48261
G1 X143.191 Y188.447 E.01447
G1 X70.144 Y115.399 E2.75058
G1 X70.144 Y114.856 E.01447
G1 X143.735 Y188.447 E2.77105
G1 X144.279 Y188.447 E.01447
G1 X70.144 Y114.312 E2.79152
G1 X70.144 Y113.768 E.01447
G1 X144.822 Y188.447 E2.81199
G1 X145.366 Y188.447 E.01447
G1 X70.144 Y113.225 E2.83246
G1 X70.144 Y112.681 E.01447
G1 X145.91 Y188.447 E2.85293
G1 X146.453 Y188.447 E.01447
G1 X70.144 Y112.138 E2.8734
G1 X70.144 Y111.594 E.01447
G1 X146.997 Y188.447 E2.89387
G1 X147.54 Y188.447 E.01447
G1 X70.144 Y111.05 E2.91434
G1 X70.144 Y110.507 E.01447
G1 X148.084 Y188.447 E2.93481
G1 X148.628 Y188.447 E.01447
G1 X70.144 Y109.963 E2.95528
G1 X70.144 Y109.419 E.01447
G1 X149.147 Y188.422 E2.97483
G1 X149.147 Y187.878 E.01447
G1 X70.144 Y108.876 E2.97483
G1 X70.144 Y108.332 E.01447
G1 X149.147 Y187.335 E2.97483
G1 X149.147 Y186.791 E.01447
G1 X70.144 Y107.788 E2.97483
G1 X70.144 Y107.245 E.01447
G1 X149.147 Y186.247 E2.97483
G1 X149.147 Y185.704 E.01447
G1 X70.144 Y106.701 E2.97483
G1 X70.144 Y106.158 E.01447
G1 X149.147 Y185.16 E2.97483
G1 X149.147 Y184.617 E.01447
G1 X70.144 Y105.614 E2.97483
G1 X70.144 Y105.07 E.01447
G1 X149.147 Y184.073 E2.97483
G1 X149.147 Y183.529 E.01447
G1 X70.144 Y104.527 E2.97483
G1 X70.144 Y103.983 E.01447
G1 X149.32 Y183.158 E2.98133
G1 X149.279 Y182.394 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.45323
G1 F15000
G1 X156.989 Y182.394 E.22255
; LINE_WIDTH: 0.471104
G1 X157.075 Y182.376 E.00265
; LINE_WIDTH: 0.494937
G1 X157.161 Y182.358 E.0028
G1 X157.197 Y182.185 E.0056
; LINE_WIDTH: 0.453227
G1 X157.197 Y61.602 E3.4807
; LINE_WIDTH: 0.471104
G1 X157.179 Y61.516 E.00265
; LINE_WIDTH: 0.494939
G1 X157.161 Y61.43 E.0028
G1 X156.989 Y61.394 E.0056
; LINE_WIDTH: 0.453228
G1 X149.279 Y61.394 E.22256
G1 X149.319 Y55.946 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420894
G1 F15000
G1 X148.715 Y55.342 E.02277
G1 X148.171 Y55.342 E.01448
G1 X149.147 Y56.317 E.03674
G1 X149.147 Y56.861 E.01447
G1 X147.628 Y55.342 E.05721
G1 X147.084 Y55.342 E.01448
G1 X149.147 Y57.405 E.07768
G1 X149.147 Y57.948 E.01447
G1 X146.54 Y55.342 E.09815
G1 X145.997 Y55.342 E.01448
G1 X149.147 Y58.492 E.11862
G1 X149.147 Y59.035 E.01447
G1 X145.453 Y55.342 E.13909
G1 X144.909 Y55.342 E.01448
G1 X149.147 Y59.579 E.15956
G1 X149.147 Y60.123 E.01447
G1 X144.366 Y55.342 E.18003
G1 X143.822 Y55.342 E.01448
G1 X149.147 Y60.666 E.2005
G1 X149.147 Y60.828 E.00431
G1 X148.94 Y60.828 E.00551
G1 X148.94 Y61.003 E.00465
G1 X143.278 Y55.342 E.21319
G1 X142.735 Y55.342 E.01448
G1 X148.94 Y61.547 E.23366
G1 X148.94 Y61.959 E.01098
G1 X149.147 Y61.959 E.00551
G1 X149.147 Y62.298 E.00901
G1 X142.191 Y55.342 E.26192
G1 X141.648 Y55.342 E.01448
G1 X149.147 Y62.841 E.2824
G1 X149.147 Y63.385 E.01447
G1 X141.104 Y55.342 E.30287
G1 X140.56 Y55.342 E.01448
G1 X149.147 Y63.928 E.32334
G1 X149.147 Y64.472 E.01448
G1 X140.017 Y55.342 E.34381
G1 X139.473 Y55.342 E.01448
G1 X149.147 Y65.016 E.36428
G1 X149.147 Y65.559 E.01447
G1 X138.929 Y55.342 E.38475
G1 X138.386 Y55.342 E.01448
G1 X149.147 Y66.103 E.40522
G1 X149.147 Y66.647 E.01447
G1 X137.842 Y55.342 E.42569
G1 X137.298 Y55.342 E.01448
G1 X149.147 Y67.19 E.44616
G1 X149.147 Y67.734 E.01447
G1 X136.755 Y55.342 E.46663
G1 X136.211 Y55.342 E.01448
G1 X149.147 Y68.278 E.4871
G1 X149.147 Y68.821 E.01448
G1 X135.667 Y55.342 E.50758
G1 X135.124 Y55.342 E.01448
G1 X149.147 Y69.365 E.52805
G1 X149.147 Y69.909 E.01447
G1 X134.58 Y55.342 E.54852
G1 X134.036 Y55.342 E.01448
G1 X149.147 Y70.452 E.56899
G1 X149.147 Y70.996 E.01447
G1 X133.493 Y55.342 E.58946
G1 X132.949 Y55.342 E.01448
G1 X149.147 Y71.539 E.60993
G1 X149.147 Y72.083 E.01447
G1 X132.406 Y55.342 E.6304
G1 X131.862 Y55.342 E.01448
G1 X149.147 Y72.627 E.65087
G1 X149.147 Y73.17 E.01448
G1 X131.318 Y55.342 E.67134
G1 X130.775 Y55.342 E.01448
G1 X149.147 Y73.714 E.69181
G1 X149.147 Y74.258 E.01447
G1 X130.231 Y55.342 E.71228
G1 X129.687 Y55.342 E.01448
G1 X149.147 Y74.801 E.73275
G1 X149.147 Y75.345 E.01447
G1 X129.144 Y55.342 E.75323
G1 X128.6 Y55.342 E.01448
G1 X149.147 Y75.889 E.7737
G1 X149.147 Y76.432 E.01447
G1 X128.056 Y55.342 E.79417
G1 X127.513 Y55.342 E.01448
G1 X149.147 Y76.976 E.81464
G1 X149.147 Y77.52 E.01447
G1 X126.969 Y55.342 E.83511
G1 X126.425 Y55.342 E.01448
G1 X149.147 Y78.063 E.85558
G1 X149.147 Y78.607 E.01447
G1 X125.882 Y55.342 E.87605
G1 X125.338 Y55.342 E.01448
G1 X149.147 Y79.15 E.89652
G1 X149.147 Y79.694 E.01447
G1 X124.795 Y55.341 E.91699
G1 X124.251 Y55.341 E.01448
G1 X149.147 Y80.238 E.93746
G1 X149.147 Y80.781 E.01447
G1 X123.707 Y55.341 E.95793
G1 X123.164 Y55.341 E.01448
G1 X149.147 Y81.325 E.97841
G1 X149.147 Y81.869 E.01447
G1 X122.62 Y55.341 E.99888
G1 X122.076 Y55.341 E.01448
G1 X149.147 Y82.412 E1.01935
G1 X149.147 Y82.956 E.01447
G1 X121.533 Y55.341 E1.03982
G1 X120.989 Y55.341 E.01448
G1 X149.147 Y83.5 E1.06029
G1 X149.147 Y84.043 E.01447
G1 X120.445 Y55.341 E1.08076
G1 X119.902 Y55.341 E.01448
G1 X149.147 Y84.587 E1.10123
G1 X149.147 Y85.13 E.01447
G1 X119.358 Y55.341 E1.1217
G1 X118.814 Y55.341 E.01448
G1 X149.147 Y85.674 E1.14217
G1 X149.147 Y86.218 E.01447
G1 X118.271 Y55.341 E1.16264
G1 X117.727 Y55.341 E.01448
G1 X149.147 Y86.761 E1.18311
G1 X149.147 Y87.305 E.01447
G1 X117.183 Y55.341 E1.20359
G1 X116.64 Y55.341 E.01448
G1 X149.147 Y87.849 E1.22406
G1 X149.147 Y88.392 E.01447
G1 X116.096 Y55.341 E1.24453
G1 X115.553 Y55.341 E.01448
G1 X149.147 Y88.936 E1.265
G1 X149.147 Y89.48 E.01447
G1 X115.009 Y55.341 E1.28547
G1 X114.465 Y55.341 E.01448
G1 X149.147 Y90.023 E1.30594
G1 X149.147 Y90.567 E.01447
G1 X113.922 Y55.341 E1.32641
G1 X113.378 Y55.341 E.01448
G1 X149.147 Y91.111 E1.34688
G1 X149.147 Y91.654 E.01447
G1 X112.834 Y55.341 E1.36735
G1 X112.291 Y55.341 E.01448
G1 X149.147 Y92.198 E1.38782
G1 X149.147 Y92.741 E.01447
G1 X111.747 Y55.341 E1.40829
G1 X111.203 Y55.341 E.01448
G1 X149.147 Y93.285 E1.42877
G1 X149.147 Y93.829 E.01447
G1 X110.66 Y55.341 E1.44924
G1 X110.116 Y55.341 E.01448
G1 X149.147 Y94.372 E1.46971
G1 X149.147 Y94.916 E.01447
G1 X109.572 Y55.341 E1.49018
G1 X109.029 Y55.341 E.01448
G1 X149.147 Y95.46 E1.51065
G1 X149.147 Y96.003 E.01447
G1 X108.485 Y55.341 E1.53112
G1 X107.942 Y55.341 E.01448
G1 X149.147 Y96.547 E1.55159
G1 X149.147 Y97.091 E.01447
G1 X107.398 Y55.341 E1.57206
G1 X106.854 Y55.341 E.01448
G1 X149.147 Y97.634 E1.59253
G1 X149.147 Y98.178 E.01447
G1 X106.311 Y55.341 E1.613
G1 X105.767 Y55.341 E.01448
G1 X149.147 Y98.722 E1.63347
G1 X149.147 Y99.265 E.01447
G1 X105.223 Y55.341 E1.65394
G1 X104.68 Y55.341 E.01448
G1 X149.147 Y99.809 E1.67442
G1 X149.147 Y100.352 E.01447
G1 X104.136 Y55.341 E1.69489
G1 X103.592 Y55.341 E.01448
G1 X149.147 Y100.896 E1.71536
G1 X149.147 Y101.44 E.01447
G1 X103.049 Y55.341 E1.73583
G1 X102.505 Y55.341 E.01448
G1 X149.147 Y101.983 E1.7563
G1 X149.147 Y102.527 E.01447
G1 X101.961 Y55.341 E1.77677
G1 X101.418 Y55.341 E.01448
G1 X149.147 Y103.071 E1.79724
G1 X149.147 Y103.614 E.01447
G1 X100.874 Y55.341 E1.81771
G1 X100.33 Y55.341 E.01448
G1 X149.147 Y104.158 E1.83818
G1 X149.147 Y104.702 E.01447
G1 X99.787 Y55.341 E1.85865
G1 X99.243 Y55.341 E.01448
G1 X149.147 Y105.245 E1.87912
G1 X149.147 Y105.789 E.01447
G1 X98.7 Y55.341 E1.8996
G1 X98.156 Y55.341 E.01448
G1 X149.147 Y106.332 E1.92007
M73 P66 R21
G1 X149.147 Y106.876 E.01447
G1 X97.612 Y55.341 E1.94054
G1 X97.069 Y55.341 E.01448
G1 X149.147 Y107.42 E1.96101
G1 X149.147 Y107.963 E.01447
G1 X96.525 Y55.341 E1.98148
G1 X95.981 Y55.341 E.01448
G1 X149.147 Y108.507 E2.00195
G1 X149.147 Y109.051 E.01447
G1 X95.438 Y55.341 E2.02242
G1 X94.894 Y55.341 E.01448
G1 X149.147 Y109.594 E2.04289
G1 X149.147 Y110.138 E.01447
G1 X94.35 Y55.341 E2.06336
G1 X93.807 Y55.341 E.01448
G1 X149.147 Y110.682 E2.08383
G1 X149.147 Y111.225 E.01447
G1 X93.263 Y55.341 E2.1043
G1 X92.719 Y55.341 E.01448
G1 X149.147 Y111.769 E2.12478
G1 X149.147 Y112.313 E.01447
G1 X92.176 Y55.341 E2.14525
G1 X91.632 Y55.341 E.01448
G1 X149.147 Y112.856 E2.16572
G1 X149.147 Y113.4 E.01447
G1 X91.089 Y55.341 E2.18619
G1 X90.545 Y55.341 E.01448
G1 X149.147 Y113.943 E2.20666
G1 X149.147 Y114.487 E.01447
G1 X90.001 Y55.341 E2.22713
G1 X89.458 Y55.341 E.01448
G1 X149.147 Y115.031 E2.2476
G1 X149.147 Y115.574 E.01447
G1 X88.914 Y55.341 E2.26807
G1 X88.37 Y55.341 E.01448
G1 X149.147 Y116.118 E2.28854
G1 X149.147 Y116.662 E.01447
G1 X87.827 Y55.341 E2.30901
G1 X87.283 Y55.341 E.01448
G1 X149.147 Y117.205 E2.32948
G1 X149.147 Y117.749 E.01447
G1 X86.739 Y55.341 E2.34996
G1 X86.196 Y55.341 E.01448
G1 X149.147 Y118.293 E2.37043
G1 X149.147 Y118.836 E.01447
G1 X85.652 Y55.341 E2.3909
G1 X85.108 Y55.341 E.01448
G1 X149.147 Y119.38 E2.41137
G1 X149.147 Y119.923 E.01447
G1 X84.565 Y55.341 E2.43184
G1 X84.021 Y55.341 E.01448
G1 X149.147 Y120.467 E2.45231
G1 X149.147 Y121.011 E.01447
G1 X83.477 Y55.341 E2.47278
G1 X82.934 Y55.341 E.01448
G1 X149.147 Y121.554 E2.49325
G1 X149.147 Y122.098 E.01447
G1 X82.39 Y55.341 E2.51372
G1 X81.847 Y55.341 E.01448
G1 X149.147 Y122.642 E2.53419
G1 X149.147 Y123.185 E.01447
G1 X81.303 Y55.341 E2.55466
G1 X80.759 Y55.341 E.01448
G1 X149.147 Y123.729 E2.57514
G1 X149.147 Y124.273 E.01447
G1 X80.216 Y55.341 E2.59561
G1 X79.672 Y55.341 E.01448
G1 X149.147 Y124.816 E2.61608
G1 X149.147 Y125.36 E.01447
G1 X79.128 Y55.341 E2.63655
G1 X78.585 Y55.341 E.01448
G1 X149.147 Y125.904 E2.65702
G1 X149.147 Y126.447 E.01447
G1 X78.041 Y55.341 E2.67749
G1 X77.497 Y55.341 E.01448
G1 X149.147 Y126.991 E2.69796
G1 X149.147 Y127.534 E.01447
G1 X76.954 Y55.341 E2.71843
G1 X76.41 Y55.341 E.01448
G1 X149.147 Y128.078 E2.7389
G1 X149.147 Y128.622 E.01447
G1 X75.866 Y55.341 E2.75937
G1 X75.323 Y55.341 E.01448
G1 X149.147 Y129.165 E2.77984
G1 X149.147 Y129.709 E.01447
G1 X74.779 Y55.341 E2.80031
G1 X74.235 Y55.341 E.01448
G1 X149.147 Y130.253 E2.82079
G1 X149.147 Y130.796 E.01447
G1 X73.692 Y55.341 E2.84126
G1 X73.148 Y55.341 E.01448
G1 X149.147 Y131.34 E2.86173
G1 X149.147 Y131.884 E.01447
G1 X72.605 Y55.341 E2.8822
G1 X72.061 Y55.341 E.01448
G1 X149.147 Y132.427 E2.90267
G1 X149.147 Y132.971 E.01447
G1 X71.517 Y55.341 E2.92314
G1 X70.974 Y55.341 E.01448
G1 X149.147 Y133.515 E2.94361
G1 X149.147 Y134.058 E.01447
G1 X70.43 Y55.341 E2.96408
G2 X70.172 Y55.36 I-.097 J.437 E.00698
G2 X70.144 Y55.437 I.046 J.061 E.00232
G1 X70.144 Y55.599 E.0043
G1 X149.147 Y134.602 E2.97484
G1 X149.147 Y135.145 E.01447
G1 X70.144 Y56.143 E2.97484
G1 X70.144 Y56.686 E.01447
G1 X149.147 Y135.689 E2.97484
G1 X149.147 Y136.233 E.01447
G1 X70.144 Y57.23 E2.97484
G1 X70.144 Y57.774 E.01447
G1 X149.147 Y136.776 E2.97484
G1 X149.147 Y137.32 E.01447
G1 X70.144 Y58.317 E2.97484
G1 X70.144 Y58.861 E.01447
G1 X149.147 Y137.864 E2.97484
G1 X149.147 Y138.407 E.01447
G1 X70.144 Y59.404 E2.97484
G1 X70.144 Y59.948 E.01447
G1 X149.147 Y138.951 E2.97484
G1 X149.147 Y139.495 E.01447
G1 X70.144 Y60.492 E2.97484
G1 X70.144 Y61.035 E.01447
G1 X149.147 Y140.038 E2.97484
G1 X149.147 Y140.582 E.01447
G1 X70.144 Y61.579 E2.97484
G1 X70.144 Y62.123 E.01447
G1 X149.147 Y141.125 E2.97484
G1 X149.147 Y141.669 E.01447
G1 X70.144 Y62.666 E2.97484
G1 X70.144 Y63.21 E.01447
G1 X149.147 Y142.213 E2.97484
G1 X149.147 Y142.756 E.01447
G1 X70.144 Y63.754 E2.97484
G1 X70.144 Y64.297 E.01447
G1 X149.147 Y143.3 E2.97484
G1 X149.147 Y143.844 E.01447
G1 X70.144 Y64.841 E2.97484
G1 X70.144 Y65.384 E.01447
G1 X149.147 Y144.387 E2.97484
G1 X149.147 Y144.931 E.01447
G1 X70.144 Y65.928 E2.97484
G1 X70.144 Y66.472 E.01447
G1 X149.147 Y145.475 E2.97484
G1 X149.147 Y146.018 E.01447
G1 X70.144 Y67.015 E2.97484
G1 X70.144 Y67.559 E.01447
G1 X149.147 Y146.562 E2.97484
G1 X149.147 Y147.106 E.01447
G1 X70.144 Y68.103 E2.97484
G1 X70.144 Y68.646 E.01447
G1 X149.147 Y147.649 E2.97484
G1 X149.147 Y148.193 E.01447
G1 X70.144 Y69.19 E2.97484
G1 X70.144 Y69.734 E.01447
G1 X149.147 Y148.736 E2.97484
G1 X149.147 Y149.28 E.01447
G1 X70.144 Y70.277 E2.97484
G1 X70.144 Y70.821 E.01447
G1 X149.147 Y149.824 E2.97484
G1 X149.147 Y150.367 E.01447
G1 X70.144 Y71.365 E2.97484
G1 X70.144 Y71.908 E.01447
G1 X149.147 Y150.911 E2.97484
G1 X149.147 Y151.455 E.01447
G1 X70.144 Y72.452 E2.97484
G1 X70.144 Y72.995 E.01447
G1 X149.147 Y151.998 E2.97484
G1 X149.147 Y152.542 E.01447
G1 X70.144 Y73.539 E2.97484
G1 X70.144 Y74.083 E.01447
G1 X149.147 Y153.086 E2.97484
G1 X149.147 Y153.629 E.01447
G1 X70.144 Y74.626 E2.97484
M73 P66 R20
G1 X70.144 Y75.17 E.01447
G1 X149.147 Y154.173 E2.97484
G1 X149.147 Y154.717 E.01447
G1 X70.144 Y75.714 E2.97484
G1 X70.144 Y76.257 E.01447
G1 X149.147 Y155.26 E2.97484
G1 X149.147 Y155.804 E.01447
G1 X70.144 Y76.801 E2.97484
G1 X70.144 Y77.345 E.01447
G1 X149.147 Y156.347 E2.97484
G1 X149.147 Y156.891 E.01447
G1 X70.144 Y77.888 E2.97484
G1 X70.144 Y78.432 E.01447
G1 X149.147 Y157.435 E2.97484
G1 X149.147 Y157.978 E.01447
G1 X70.144 Y78.975 E2.97484
G1 X70.144 Y79.519 E.01447
G1 X149.147 Y158.522 E2.97484
G1 X149.147 Y159.066 E.01447
G1 X70.144 Y80.063 E2.97484
G1 X70.144 Y80.606 E.01447
G1 X149.147 Y159.609 E2.97484
M73 P67 R20
G1 X149.147 Y160.153 E.01447
G1 X70.144 Y81.15 E2.97484
G1 X70.144 Y81.694 E.01447
G1 X149.147 Y160.697 E2.97484
G1 X149.147 Y161.24 E.01447
G1 X70.144 Y82.237 E2.97484
G1 X70.144 Y82.781 E.01447
G1 X149.147 Y161.784 E2.97484
G1 X149.147 Y162.327 E.01447
G1 X70.144 Y83.325 E2.97484
G1 X70.144 Y83.868 E.01447
G1 X149.147 Y162.871 E2.97484
G1 X149.147 Y163.415 E.01447
G1 X70.144 Y84.412 E2.97484
G1 X70.144 Y84.956 E.01447
G1 X149.147 Y163.958 E2.97484
G1 X149.147 Y164.502 E.01447
G1 X70.144 Y85.499 E2.97484
G1 X70.144 Y86.043 E.01447
G1 X149.147 Y165.046 E2.97484
G1 X149.147 Y165.589 E.01447
G1 X70.144 Y86.586 E2.97484
G1 X70.144 Y87.13 E.01447
G1 X149.147 Y166.133 E2.97484
G1 X149.147 Y166.677 E.01447
G1 X70.144 Y87.674 E2.97484
G1 X70.144 Y88.217 E.01447
G1 X149.147 Y167.22 E2.97484
G1 X149.147 Y167.764 E.01447
G1 X70.144 Y88.761 E2.97484
G1 X70.144 Y89.305 E.01447
G1 X149.147 Y168.308 E2.97484
G1 X149.147 Y168.851 E.01447
G1 X70.144 Y89.848 E2.97484
G1 X70.144 Y90.392 E.01447
G1 X149.147 Y169.395 E2.97484
G1 X149.147 Y169.938 E.01447
G1 X70.144 Y90.936 E2.97484
G1 X70.144 Y91.479 E.01447
G1 X149.147 Y170.482 E2.97484
G1 X149.147 Y171.026 E.01447
G1 X70.144 Y92.023 E2.97484
G1 X70.144 Y92.567 E.01447
G1 X149.147 Y171.569 E2.97484
G1 X149.147 Y172.113 E.01447
G1 X70.144 Y93.11 E2.97484
G1 X70.144 Y93.654 E.01447
G1 X149.147 Y172.657 E2.97484
G1 X149.147 Y173.2 E.01447
G1 X70.144 Y94.197 E2.97484
G1 X70.144 Y94.741 E.01447
G1 X149.147 Y173.744 E2.97484
G1 X149.147 Y174.288 E.01447
G1 X70.144 Y95.285 E2.97484
G1 X70.144 Y95.828 E.01447
G1 X149.147 Y174.831 E2.97484
G1 X149.147 Y175.375 E.01447
G1 X70.144 Y96.372 E2.97484
G1 X70.144 Y96.916 E.01447
G1 X149.147 Y175.918 E2.97484
G1 X149.147 Y176.462 E.01447
G1 X70.144 Y97.459 E2.97484
G1 X70.144 Y98.003 E.01447
G1 X149.147 Y177.006 E2.97484
G1 X149.147 Y177.549 E.01447
G1 X70.144 Y98.547 E2.97484
G1 X70.144 Y99.09 E.01447
G1 X149.147 Y178.093 E2.97484
G1 X149.147 Y178.637 E.01447
G1 X70.144 Y99.634 E2.97484
G1 X70.144 Y100.177 E.01447
G1 X149.147 Y179.18 E2.97484
G1 X149.147 Y179.724 E.01447
G1 X70.144 Y100.721 E2.97484
G1 X70.144 Y101.265 E.01447
G1 X149.147 Y180.268 E2.97484
G1 X149.147 Y180.811 E.01447
G1 X70.144 Y101.808 E2.97484
G1 X70.144 Y102.352 E.01447
G1 X149.147 Y181.355 E2.97484
G1 X149.147 Y181.828 E.01261
G1 X149.077 Y181.828 E.00187
G1 X70.144 Y102.896 E2.9722
G1 X70.144 Y103.439 E.01447
G1 X149.113 Y182.408 E2.97355
; WIPE_START
G1 F24000
G1 X147.699 Y180.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.27 Y173.383 Z5.33 F30000
G1 X156.556 Y62.983 Z5.33
G1 Z4.93
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.608 Y62.035 E.03562
G1 X155.066 Y62.035
G1 X156.556 Y63.525 E.05599
G1 X156.556 Y64.068
G1 X154.523 Y62.035 E.07637
G1 X153.981 Y62.035
G1 X156.556 Y64.61 E.09674
G1 X156.556 Y65.152
G1 X153.439 Y62.035 E.11712
G1 X152.896 Y62.035
G1 X156.556 Y65.695 E.13749
G1 X156.556 Y66.237
G1 X152.354 Y62.035 E.15787
G1 X151.811 Y62.035
G1 X156.556 Y66.78 E.17824
G1 X156.556 Y67.322
G1 X151.269 Y62.035 E.19862
G1 X150.727 Y62.035
G1 X156.556 Y67.864 E.219
G1 X156.556 Y68.407
G1 X150.184 Y62.035 E.23937
G1 X149.842 Y62.235
G1 X156.556 Y68.949 E.25222
G1 X156.556 Y69.491
G1 X149.712 Y62.647 E.25712
G1 X149.712 Y63.189
G1 X156.556 Y70.034 E.25712
G1 X156.556 Y70.576
G1 X149.712 Y63.732 E.25712
G1 X149.712 Y64.274
G1 X156.556 Y71.119 E.25712
G1 X156.556 Y71.661
G1 X149.712 Y64.817 E.25712
G1 X149.712 Y65.359
G1 X156.556 Y72.203 E.25712
G1 X156.556 Y72.746
G1 X149.712 Y65.901 E.25712
G1 X149.712 Y66.444
G1 X156.556 Y73.288 E.25712
G1 X156.556 Y73.83
G1 X149.712 Y66.986 E.25712
G1 X149.712 Y67.528
G1 X156.556 Y74.373 E.25712
G1 X156.556 Y74.915
G1 X149.712 Y68.071 E.25712
G1 X149.712 Y68.613
G1 X156.556 Y75.458 E.25712
G1 X156.556 Y76
G1 X149.712 Y69.156 E.25712
G1 X149.712 Y69.698
G1 X156.556 Y76.542 E.25712
G1 X156.556 Y77.085
G1 X149.712 Y70.24 E.25712
G1 X149.712 Y70.783
G1 X156.556 Y77.627 E.25712
G1 X156.556 Y78.169
G1 X149.712 Y71.325 E.25712
G1 X149.712 Y71.867
G1 X156.556 Y78.712 E.25712
G1 X156.556 Y79.254
G1 X149.712 Y72.41 E.25712
G1 X149.712 Y72.952
G1 X156.556 Y79.797 E.25712
G1 X156.556 Y80.339
G1 X149.712 Y73.495 E.25712
G1 X149.712 Y74.037
G1 X156.556 Y80.881 E.25712
G1 X156.556 Y81.424
G1 X149.712 Y74.579 E.25712
G1 X149.712 Y75.122
G1 X156.556 Y81.966 E.25712
G1 X156.556 Y82.508
G1 X149.712 Y75.664 E.25712
G1 X149.712 Y76.206
G1 X156.556 Y83.051 E.25712
G1 X156.556 Y83.593
G1 X149.712 Y76.749 E.25712
G1 X149.712 Y77.291
G1 X156.556 Y84.136 E.25712
G1 X156.556 Y84.678
G1 X149.712 Y77.834 E.25712
G1 X149.712 Y78.376
G1 X156.556 Y85.22 E.25712
G1 X156.556 Y85.763
G1 X149.712 Y78.918 E.25712
G1 X149.712 Y79.461
G1 X156.556 Y86.305 E.25712
G1 X156.556 Y86.847
G1 X149.712 Y80.003 E.25712
G1 X149.712 Y80.545
G1 X156.556 Y87.39 E.25712
G1 X156.556 Y87.932
G1 X149.712 Y81.088 E.25712
G1 X149.712 Y81.63
G1 X156.556 Y88.475 E.25712
G1 X156.556 Y89.017
G1 X149.712 Y82.173 E.25712
G1 X149.712 Y82.715
G1 X156.556 Y89.559 E.25712
G1 X156.556 Y90.102
G1 X149.712 Y83.257 E.25712
G1 X149.712 Y83.8
G1 X156.556 Y90.644 E.25712
G1 X156.556 Y91.186
G1 X149.712 Y84.342 E.25712
G1 X149.712 Y84.884
G1 X156.556 Y91.729 E.25712
G1 X156.556 Y92.271
G1 X149.712 Y85.427 E.25712
G1 X149.712 Y85.969
G1 X156.556 Y92.814 E.25712
G1 X156.556 Y93.356
G1 X149.712 Y86.512 E.25712
G1 X149.712 Y87.054
G1 X156.556 Y93.898 E.25712
G1 X156.556 Y94.441
G1 X149.712 Y87.596 E.25712
G1 X149.712 Y88.139
G1 X156.556 Y94.983 E.25712
M73 P68 R20
G1 X156.556 Y95.525
G1 X149.712 Y88.681 E.25712
G1 X149.712 Y89.223
G1 X156.556 Y96.068 E.25712
G1 X156.556 Y96.61
G1 X149.712 Y89.766 E.25712
G1 X149.712 Y90.308
G1 X156.556 Y97.153 E.25712
G1 X156.556 Y97.695
G1 X149.712 Y90.851 E.25712
G1 X149.712 Y91.393
G1 X156.556 Y98.237 E.25712
G1 X156.556 Y98.78
G1 X149.712 Y91.935 E.25712
G1 X149.712 Y92.478
G1 X156.556 Y99.322 E.25712
G1 X156.556 Y99.864
G1 X149.712 Y93.02 E.25712
G1 X149.712 Y93.562
G1 X156.556 Y100.407 E.25712
G1 X156.556 Y100.949
G1 X149.712 Y94.105 E.25712
G1 X149.712 Y94.647
G1 X156.556 Y101.492 E.25712
G1 X156.556 Y102.034
G1 X149.712 Y95.19 E.25712
G1 X149.712 Y95.732
G1 X156.556 Y102.576 E.25712
G1 X156.556 Y103.119
G1 X149.712 Y96.274 E.25712
G1 X149.712 Y96.817
G1 X156.556 Y103.661 E.25712
G1 X156.556 Y104.203
G1 X149.712 Y97.359 E.25712
G1 X149.712 Y97.901
G1 X156.556 Y104.746 E.25712
G1 X156.556 Y105.288
G1 X149.712 Y98.444 E.25712
G1 X149.712 Y98.986
G1 X156.556 Y105.831 E.25712
G1 X156.556 Y106.373
G1 X149.712 Y99.529 E.25712
G1 X149.712 Y100.071
G1 X156.556 Y106.915 E.25712
G1 X156.556 Y107.458
G1 X149.712 Y100.613 E.25712
G1 X149.712 Y101.156
G1 X156.556 Y108 E.25712
G1 X156.556 Y108.542
G1 X149.712 Y101.698 E.25712
G1 X149.712 Y102.24
G1 X156.556 Y109.085 E.25712
G1 X156.556 Y109.627
G1 X149.712 Y102.783 E.25712
G1 X149.712 Y103.325
G1 X156.556 Y110.17 E.25712
G1 X156.556 Y110.712
G1 X149.712 Y103.868 E.25712
G1 X149.712 Y104.41
G1 X156.556 Y111.254 E.25712
G1 X156.556 Y111.797
G1 X149.712 Y104.952 E.25712
G1 X149.712 Y105.495
G1 X156.556 Y112.339 E.25712
G1 X156.556 Y112.881
G1 X149.712 Y106.037 E.25712
G1 X149.712 Y106.579
G1 X156.556 Y113.424 E.25712
G1 X156.556 Y113.966
G1 X149.712 Y107.122 E.25712
G1 X149.712 Y107.664
G1 X156.556 Y114.509 E.25712
G1 X156.556 Y115.051
G1 X149.712 Y108.207 E.25712
G1 X149.712 Y108.749
G1 X156.556 Y115.593 E.25712
G1 X156.556 Y116.136
G1 X149.712 Y109.291 E.25712
G1 X149.712 Y109.834
G1 X156.556 Y116.678 E.25712
G1 X156.556 Y117.22
G1 X149.712 Y110.376 E.25712
G1 X149.712 Y110.918
G1 X156.556 Y117.763 E.25712
G1 X156.556 Y118.305
G1 X149.712 Y111.461 E.25712
G1 X149.712 Y112.003
G1 X156.556 Y118.848 E.25712
G1 X156.556 Y119.39
G1 X149.712 Y112.546 E.25712
G1 X149.712 Y113.088
G1 X156.556 Y119.932 E.25712
G1 X156.556 Y120.475
G1 X149.712 Y113.63 E.25712
G1 X149.712 Y114.173
G1 X156.556 Y121.017 E.25712
G1 X156.556 Y121.559
G1 X149.712 Y114.715 E.25712
G1 X149.712 Y115.257
G1 X156.556 Y122.102 E.25712
G1 X156.556 Y122.644
G1 X149.712 Y115.8 E.25712
G1 X149.712 Y116.342
G1 X156.556 Y123.187 E.25712
G1 X156.556 Y123.729
G1 X149.712 Y116.885 E.25712
G1 X149.712 Y117.427
G1 X156.556 Y124.271 E.25712
G1 X156.556 Y124.814
G1 X149.712 Y117.969 E.25712
G1 X149.712 Y118.512
G1 X156.556 Y125.356 E.25712
G1 X156.556 Y125.898
G1 X149.712 Y119.054 E.25712
G1 X149.712 Y119.596
G1 X156.556 Y126.441 E.25712
G1 X156.556 Y126.983
G1 X149.712 Y120.139 E.25712
G1 X149.712 Y120.681
G1 X156.556 Y127.526 E.25712
G1 X156.556 Y128.068
G1 X149.712 Y121.224 E.25712
G1 X149.712 Y121.766
G1 X156.556 Y128.61 E.25712
G1 X156.556 Y129.153
G1 X149.712 Y122.308 E.25712
G1 X149.712 Y122.851
G1 X156.556 Y129.695 E.25712
G1 X156.556 Y130.237
G1 X149.712 Y123.393 E.25712
G1 X149.712 Y123.935
G1 X156.556 Y130.78 E.25712
G1 X156.556 Y131.322
G1 X149.712 Y124.478 E.25712
G1 X149.712 Y125.02
G1 X156.556 Y131.865 E.25712
G1 X156.556 Y132.407
G1 X149.712 Y125.563 E.25712
G1 X149.712 Y126.105
G1 X156.556 Y132.949 E.25712
G1 X156.556 Y133.492
G1 X149.712 Y126.647 E.25712
G1 X149.712 Y127.19
G1 X156.556 Y134.034 E.25712
G1 X156.556 Y134.576
G1 X149.712 Y127.732 E.25712
G1 X149.712 Y128.274
G1 X156.556 Y135.119 E.25712
G1 X156.556 Y135.661
G1 X149.712 Y128.817 E.25712
G1 X149.712 Y129.359
G1 X156.556 Y136.204 E.25712
G1 X156.556 Y136.746
G1 X149.712 Y129.902 E.25712
G1 X149.712 Y130.444
G1 X156.556 Y137.288 E.25712
G1 X156.556 Y137.831
G1 X149.712 Y130.986 E.25712
G1 X149.712 Y131.529
G1 X156.556 Y138.373 E.25712
G1 X156.556 Y138.915
G1 X149.712 Y132.071 E.25712
G1 X149.712 Y132.613
G1 X156.556 Y139.458 E.25712
G1 X156.556 Y140
G1 X149.712 Y133.156 E.25712
G1 X149.712 Y133.698
G1 X156.556 Y140.543 E.25712
G1 X156.556 Y141.085
G1 X149.712 Y134.241 E.25712
G1 X149.712 Y134.783
G1 X156.556 Y141.627 E.25712
G1 X156.556 Y142.17
G1 X149.712 Y135.325 E.25712
G1 X149.712 Y135.868
G1 X156.556 Y142.712 E.25712
G1 X156.556 Y143.254
G1 X149.712 Y136.41 E.25712
G1 X149.712 Y136.952
G1 X156.556 Y143.797 E.25712
G1 X156.556 Y144.339
G1 X149.712 Y137.495 E.25712
G1 X149.712 Y138.037
G1 X156.556 Y144.882 E.25712
G1 X156.556 Y145.424
G1 X149.712 Y138.58 E.25712
G1 X149.712 Y139.122
G1 X156.556 Y145.966 E.25712
G1 X156.556 Y146.509
G1 X149.712 Y139.664 E.25712
G1 X149.712 Y140.207
G1 X156.556 Y147.051 E.25712
G1 X156.556 Y147.593
G1 X149.712 Y140.749 E.25712
G1 X149.712 Y141.291
G1 X156.556 Y148.136 E.25712
G1 X156.556 Y148.678
G1 X149.712 Y141.834 E.25712
G1 X149.712 Y142.376
G1 X156.556 Y149.221 E.25712
G1 X156.556 Y149.763
G1 X149.712 Y142.919 E.25712
G1 X149.712 Y143.461
G1 X156.556 Y150.305 E.25712
G1 X156.556 Y150.848
G1 X149.712 Y144.003 E.25712
G1 X149.712 Y144.546
G1 X156.556 Y151.39 E.25712
G1 X156.556 Y151.932
G1 X149.712 Y145.088 E.25712
G1 X149.712 Y145.63
G1 X156.556 Y152.475 E.25712
G1 X156.556 Y153.017
G1 X149.712 Y146.173 E.25712
G1 X149.712 Y146.715
G1 X156.556 Y153.56 E.25712
G1 X156.556 Y154.102
G1 X149.712 Y147.258 E.25712
G1 X149.712 Y147.8
G1 X156.556 Y154.644 E.25712
G1 X156.556 Y155.187
G1 X149.712 Y148.342 E.25712
M73 P68 R19
G1 X149.712 Y148.885
G1 X156.556 Y155.729 E.25712
G1 X156.556 Y156.271
G1 X149.712 Y149.427 E.25712
G1 X149.712 Y149.969
G1 X156.556 Y156.814 E.25712
G1 X156.556 Y157.356
G1 X149.712 Y150.512 E.25712
G1 X149.712 Y151.054
G1 X156.556 Y157.899 E.25712
G1 X156.556 Y158.441
G1 X149.712 Y151.597 E.25712
G1 X149.712 Y152.139
G1 X156.556 Y158.983 E.25712
G1 X156.556 Y159.526
G1 X149.712 Y152.681 E.25712
G1 X149.712 Y153.224
G1 X156.556 Y160.068 E.25712
G1 X156.556 Y160.61
G1 X149.712 Y153.766 E.25712
G1 X149.712 Y154.308
G1 X156.556 Y161.153 E.25712
G1 X156.556 Y161.695
G1 X149.712 Y154.851 E.25712
G1 X149.712 Y155.393
G1 X156.556 Y162.238 E.25712
G1 X156.556 Y162.78
G1 X149.712 Y155.936 E.25712
G1 X149.712 Y156.478
G1 X156.556 Y163.322 E.25712
G1 X156.556 Y163.865
G1 X149.712 Y157.02 E.25712
G1 X149.712 Y157.563
G1 X156.556 Y164.407 E.25712
G1 X156.556 Y164.949
G1 X149.712 Y158.105 E.25712
G1 X149.712 Y158.647
G1 X156.556 Y165.492 E.25712
G1 X156.556 Y166.034
G1 X149.712 Y159.19 E.25712
G1 X149.712 Y159.732
G1 X156.556 Y166.577 E.25712
G1 X156.556 Y167.119
G1 X149.712 Y160.275 E.25712
G1 X149.712 Y160.817
G1 X156.556 Y167.661 E.25712
G1 X156.556 Y168.204
G1 X149.712 Y161.359 E.25712
G1 X149.712 Y161.902
G1 X156.556 Y168.746 E.25712
G1 X156.556 Y169.288
G1 X149.712 Y162.444 E.25712
G1 X149.712 Y162.986
G1 X156.556 Y169.831 E.25712
G1 X156.556 Y170.373
G1 X149.712 Y163.529 E.25712
G1 X149.712 Y164.071
G1 X156.556 Y170.916 E.25712
G1 X156.556 Y171.458
G1 X149.712 Y164.614 E.25712
G1 X149.712 Y165.156
G1 X156.556 Y172 E.25712
G1 X156.556 Y172.543
G1 X149.712 Y165.698 E.25712
G1 X149.712 Y166.241
G1 X156.556 Y173.085 E.25712
G1 X156.556 Y173.627
G1 X149.712 Y166.783 E.25712
G1 X149.712 Y167.325
G1 X156.556 Y174.17 E.25712
G1 X156.556 Y174.712
G1 X149.712 Y167.868 E.25712
G1 X149.712 Y168.41
G1 X156.556 Y175.255 E.25712
G1 X156.556 Y175.797
G1 X149.712 Y168.953 E.25712
G1 X149.712 Y169.495
G1 X156.556 Y176.339 E.25712
G1 X156.556 Y176.882
G1 X149.712 Y170.037 E.25712
G1 X149.712 Y170.58
G1 X156.556 Y177.424 E.25712
G1 X156.556 Y177.966
G1 X149.712 Y171.122 E.25712
G1 X149.712 Y171.664
G1 X156.556 Y178.509 E.25712
G1 X156.556 Y179.051
G1 X149.712 Y172.207 E.25712
G1 X149.712 Y172.749
G1 X156.556 Y179.594 E.25712
G1 X156.556 Y180.136
G1 X149.712 Y173.292 E.25712
G1 X149.712 Y173.834
G1 X156.556 Y180.678 E.25712
G1 X156.556 Y181.221
G1 X149.712 Y174.376 E.25712
G1 X149.712 Y174.919
G1 X156.386 Y181.592 E.25071
G1 X156.003 Y181.753
G1 X149.712 Y175.461 E.23636
G1 X149.712 Y176.003
G1 X155.461 Y181.753 E.21598
G1 X154.919 Y181.753
G1 X149.712 Y176.546 E.19561
G1 X149.712 Y177.088
G1 X154.376 Y181.753 E.17523
G1 X153.834 Y181.753
G1 X149.712 Y177.631 E.15486
G1 X149.712 Y178.173
G1 X153.292 Y181.753 E.13448
G1 X152.749 Y181.753
G1 X149.712 Y178.715 E.11411
G1 X149.712 Y179.258
G1 X152.207 Y181.753 E.09373
G1 X151.664 Y181.753
G1 X149.712 Y179.8 E.07335
G1 X149.712 Y180.342
G1 X151.122 Y181.753 E.05298
G1 X150.58 Y181.753
G1 X149.712 Y180.885 E.0326
M204 S10000
G1 X150.181 Y181.772 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.243665
G1 F15000
G1 X149.693 Y181.283 E.00991
; WIPE_START
G1 F24000
G1 X150.181 Y181.772 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.59 Y174.15 Z5.33 F30000
G1 X156.575 Y62.544 Z5.33
G1 Z4.93
G1 E.8 F1800
; LINE_WIDTH: 0.300376
G1 F15000
G1 X156.047 Y62.016 E.01366
; WIPE_START
G1 F24000
G1 X156.575 Y62.544 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X162.882 Y58.246 Z5.33 F30000
G1 X167.914 Y54.816 Z5.33
G1 Z4.93
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X168.776 Y55.677 E.03238
G1 X168.776 Y56.22
G1 X167.372 Y54.816 E.05275
G1 X166.829 Y54.816
G1 X168.776 Y56.762 E.07313
G1 X168.776 Y57.305
G1 X166.287 Y54.816 E.0935
G1 X165.745 Y54.816
G1 X168.776 Y57.847 E.11388
G1 X168.776 Y58.389
G1 X165.202 Y54.816 E.13426
G1 X164.66 Y54.816
G1 X168.776 Y58.932 E.15463
G1 X168.776 Y59.474
G1 X164.118 Y54.816 E.17501
G1 X163.575 Y54.816
G1 X168.776 Y60.016 E.19538
G1 X168.776 Y60.559
G1 X163.033 Y54.816 E.21576
G1 X162.49 Y54.816
G1 X168.776 Y61.101 E.23613
G1 X168.776 Y61.644
G1 X161.948 Y54.815 E.25651
G1 X161.406 Y54.815
G1 X168.776 Y62.186 E.27689
G1 X168.776 Y62.728
G1 X160.863 Y54.815 E.29726
G1 X160.321 Y54.815
G1 X168.776 Y63.271 E.31764
G1 X168.776 Y63.813
G1 X159.779 Y54.815 E.33801
G1 X159.236 Y54.815
G1 X168.776 Y64.355 E.35839
G1 X168.776 Y64.898
G1 X158.694 Y54.815 E.37876
G1 X158.151 Y54.815
G1 X168.776 Y65.44 E.39914
G1 X168.776 Y65.983
G1 X157.609 Y54.815 E.41952
G1 X157.067 Y54.815
G1 X168.776 Y66.525 E.43989
G1 X168.776 Y67.067
G1 X156.524 Y54.815 E.46027
G1 X155.982 Y54.815
G1 X168.776 Y67.61 E.48064
G1 X168.776 Y68.152
G1 X155.44 Y54.815 E.50102
G1 X154.897 Y54.815
G1 X168.776 Y68.694 E.52139
G1 X168.776 Y69.237
G1 X154.355 Y54.815 E.54177
G1 X153.812 Y54.815
G1 X168.776 Y69.779 E.56215
G1 X168.776 Y70.322
G1 X153.27 Y54.815 E.58252
G1 X152.728 Y54.815
G1 X168.776 Y70.864 E.6029
G1 X168.776 Y71.406
G1 X152.185 Y54.815 E.62327
G1 X151.643 Y54.815
G1 X157.58 Y60.753 E.22305
G1 X157.038 Y60.753
G1 X151.1 Y54.815 E.22305
G1 X150.558 Y54.815
G1 X156.495 Y60.753 E.22305
G1 X155.953 Y60.753
G1 X150.016 Y54.815 E.22305
G1 X149.712 Y55.054
G1 X155.411 Y60.753 E.2141
G1 X154.868 Y60.753
G1 X149.712 Y55.596 E.19372
G1 X149.712 Y56.138
G1 X154.326 Y60.753 E.17335
G1 X153.784 Y60.753
G1 X149.712 Y56.681 E.15297
G1 X149.712 Y57.223
G1 X153.241 Y60.753 E.1326
G1 X152.699 Y60.753
G1 X149.712 Y57.766 E.11222
G1 X149.712 Y58.308
G1 X152.156 Y60.753 E.09185
G1 X151.614 Y60.753
G1 X149.712 Y58.85 E.07147
G1 X149.712 Y59.393
G1 X151.072 Y60.753 E.05109
G1 X150.529 Y60.753
G1 X149.712 Y59.935 E.03072
M204 S10000
G1 X157.838 Y61.011 F30000
M204 S2000
G1 F12000
G1 X168.776 Y71.949 E.4109
G1 X168.776 Y72.491
G1 X157.838 Y61.553 E.4109
G1 X157.838 Y62.096
G1 X168.776 Y73.033 E.4109
G1 X168.776 Y73.576
G1 X157.838 Y62.638 E.4109
G1 X157.838 Y63.18
G1 X168.776 Y74.118 E.4109
G1 X168.776 Y74.661
G1 X157.838 Y63.723 E.4109
G1 X157.838 Y64.265
G1 X168.776 Y75.203 E.4109
G1 X168.776 Y75.745
G1 X157.838 Y64.807 E.4109
G1 X157.838 Y65.35
G1 X168.776 Y76.288 E.4109
G1 X168.776 Y76.83
G1 X157.838 Y65.892 E.4109
G1 X157.838 Y66.435
G1 X168.776 Y77.372 E.4109
G1 X168.776 Y77.915
G1 X157.838 Y66.977 E.4109
G1 X157.838 Y67.519
G1 X168.776 Y78.457 E.4109
G1 X168.776 Y79
G1 X157.838 Y68.062 E.4109
G1 X157.838 Y68.604
G1 X168.776 Y79.542 E.4109
G1 X168.776 Y80.084
G1 X157.838 Y69.146 E.4109
G1 X157.838 Y69.689
G1 X168.776 Y80.627 E.4109
G1 X168.776 Y81.169
G1 X157.838 Y70.231 E.4109
G1 X157.838 Y70.774
G1 X168.776 Y81.711 E.4109
G1 X168.776 Y82.254
G1 X157.838 Y71.316 E.4109
G1 X157.838 Y71.858
G1 X168.776 Y82.796 E.4109
G1 X168.776 Y83.339
G1 X157.838 Y72.401 E.4109
G1 X157.838 Y72.943
G1 X168.776 Y83.881 E.4109
G1 X168.776 Y84.423
G1 X157.838 Y73.485 E.4109
G1 X157.838 Y74.028
G1 X168.776 Y84.966 E.4109
G1 X168.776 Y85.508
G1 X157.838 Y74.57 E.4109
G1 X157.838 Y75.113
G1 X168.776 Y86.05 E.4109
G1 X168.776 Y86.593
G1 X157.838 Y75.655 E.4109
G1 X157.838 Y76.197
G1 X168.776 Y87.135 E.4109
G1 X168.776 Y87.678
G1 X157.838 Y76.74 E.4109
G1 X157.838 Y77.282
G1 X168.776 Y88.22 E.4109
G1 X168.776 Y88.762
G1 X157.838 Y77.824 E.4109
G1 X157.838 Y78.367
G1 X168.776 Y89.305 E.4109
M73 P69 R19
G1 X168.776 Y89.847
G1 X157.838 Y78.909 E.4109
G1 X157.838 Y79.452
G1 X168.776 Y90.389 E.4109
G1 X168.776 Y90.932
G1 X157.838 Y79.994 E.4109
G1 X157.838 Y80.536
G1 X168.776 Y91.474 E.4109
G1 X168.776 Y92.017
G1 X157.838 Y81.079 E.4109
G1 X157.838 Y81.621
G1 X168.776 Y92.559 E.4109
G1 X168.776 Y93.101
G1 X157.838 Y82.163 E.4109
G1 X157.838 Y82.706
G1 X168.776 Y93.644 E.4109
G1 X168.776 Y94.186
G1 X157.838 Y83.248 E.4109
G1 X157.838 Y83.791
G1 X168.776 Y94.728 E.4109
G1 X168.776 Y95.271
G1 X157.838 Y84.333 E.4109
G1 X157.838 Y84.875
G1 X168.776 Y95.813 E.4109
G1 X168.776 Y96.356
G1 X157.838 Y85.418 E.4109
G1 X157.838 Y85.96
G1 X168.776 Y96.898 E.4109
G1 X168.776 Y97.44
G1 X157.838 Y86.502 E.4109
G1 X157.838 Y87.045
G1 X168.776 Y97.983 E.4109
G1 X168.776 Y98.525
G1 X157.838 Y87.587 E.4109
G1 X157.838 Y88.13
G1 X168.776 Y99.067 E.4109
G1 X168.776 Y99.61
G1 X157.838 Y88.672 E.4109
G1 X157.838 Y89.214
G1 X168.776 Y100.152 E.4109
G1 X168.776 Y100.695
G1 X157.838 Y89.757 E.4109
G1 X157.838 Y90.299
G1 X168.776 Y101.237 E.4109
G1 X168.776 Y101.779
G1 X157.838 Y90.841 E.4109
G1 X157.838 Y91.384
G1 X168.776 Y102.322 E.4109
G1 X168.776 Y102.864
G1 X157.838 Y91.926 E.4109
G1 X157.838 Y92.469
G1 X168.776 Y103.406 E.4109
G1 X168.776 Y103.949
G1 X157.838 Y93.011 E.4109
G1 X157.838 Y93.553
G1 X168.776 Y104.491 E.4109
G1 X168.776 Y105.034
G1 X157.838 Y94.096 E.4109
G1 X157.838 Y94.638
G1 X168.776 Y105.576 E.4109
G1 X168.776 Y106.118
G1 X157.838 Y95.18 E.4109
G1 X157.838 Y95.723
G1 X168.776 Y106.661 E.4109
G1 X168.776 Y107.203
G1 X157.838 Y96.265 E.4109
G1 X157.838 Y96.808
G1 X168.776 Y107.745 E.4109
G1 X168.776 Y108.288
G1 X157.838 Y97.35 E.4109
G1 X157.838 Y97.892
G1 X168.776 Y108.83 E.4109
G1 X168.776 Y109.373
G1 X157.838 Y98.435 E.4109
G1 X157.838 Y98.977
G1 X168.776 Y109.915 E.4109
G1 X168.776 Y110.457
G1 X157.838 Y99.519 E.4109
G1 X157.838 Y100.062
G1 X168.776 Y111 E.4109
G1 X168.776 Y111.542
G1 X157.838 Y100.604 E.4109
G1 X157.838 Y101.147
G1 X168.776 Y112.084 E.4109
G1 X168.776 Y112.627
G1 X157.838 Y101.689 E.4109
G1 X157.838 Y102.231
G1 X168.776 Y113.169 E.4109
G1 X168.776 Y113.712
G1 X157.838 Y102.774 E.4109
G1 X157.838 Y103.316
G1 X168.776 Y114.254 E.4109
G1 X168.776 Y114.796
G1 X157.838 Y103.858 E.4109
G1 X157.838 Y104.401
G1 X168.776 Y115.339 E.4109
G1 X168.776 Y115.881
G1 X157.838 Y104.943 E.4109
G1 X157.838 Y105.486
G1 X168.776 Y116.423 E.4109
G1 X168.776 Y116.966
G1 X157.838 Y106.028 E.4109
G1 X157.838 Y106.57
G1 X168.776 Y117.508 E.4109
G1 X168.776 Y118.051
G1 X157.838 Y107.113 E.4109
G1 X157.838 Y107.655
G1 X168.776 Y118.593 E.4109
G1 X168.776 Y119.135
G1 X157.838 Y108.197 E.4109
G1 X157.838 Y108.74
G1 X168.776 Y119.678 E.4109
G1 X168.776 Y120.22
G1 X157.838 Y109.282 E.4109
G1 X157.838 Y109.825
G1 X168.776 Y120.762 E.4109
G1 X168.776 Y121.305
G1 X157.838 Y110.367 E.4109
G1 X157.838 Y110.909
G1 X168.776 Y121.847 E.4109
G1 X168.776 Y122.39
G1 X157.838 Y111.452 E.4109
G1 X157.838 Y111.994
G1 X168.776 Y122.932 E.4109
G1 X168.776 Y123.474
G1 X157.838 Y112.536 E.4109
G1 X157.838 Y113.079
G1 X168.776 Y124.017 E.4109
G1 X168.776 Y124.559
G1 X157.838 Y113.621 E.4109
G1 X157.838 Y114.164
G1 X168.776 Y125.101 E.4109
G1 X168.776 Y125.644
G1 X157.838 Y114.706 E.4109
G1 X157.838 Y115.248
G1 X168.776 Y126.186 E.4109
G1 X168.776 Y126.729
G1 X157.838 Y115.791 E.4109
G1 X157.838 Y116.333
G1 X168.776 Y127.271 E.4109
G1 X168.776 Y127.813
G1 X157.838 Y116.875 E.4109
G1 X157.838 Y117.418
G1 X168.776 Y128.356 E.4109
G1 X168.776 Y128.898
G1 X157.838 Y117.96 E.4109
G1 X157.838 Y118.503
G1 X168.776 Y129.44 E.4109
G1 X168.776 Y129.983
G1 X157.838 Y119.045 E.4109
G1 X157.838 Y119.587
G1 X168.776 Y130.525 E.4109
G1 X168.776 Y131.068
G1 X157.838 Y120.13 E.4109
G1 X157.838 Y120.672
G1 X168.776 Y131.61 E.4109
G1 X168.776 Y132.152
G1 X157.838 Y121.214 E.4109
G1 X157.838 Y121.757
G1 X168.776 Y132.695 E.4109
G1 X168.776 Y133.237
G1 X157.838 Y122.299 E.4109
G1 X157.838 Y122.842
G1 X168.776 Y133.779 E.4109
G1 X168.776 Y134.322
G1 X157.838 Y123.384 E.4109
G1 X157.838 Y123.926
G1 X168.776 Y134.864 E.4109
G1 X168.776 Y135.407
G1 X157.838 Y124.469 E.4109
G1 X157.838 Y125.011
G1 X168.776 Y135.949 E.4109
G1 X168.776 Y136.491
G1 X157.838 Y125.553 E.4109
G1 X157.838 Y126.096
G1 X168.776 Y137.034 E.4109
G1 X168.776 Y137.576
G1 X157.838 Y126.638 E.4109
G1 X157.838 Y127.181
G1 X168.776 Y138.118 E.4109
G1 X168.776 Y138.661
G1 X157.838 Y127.723 E.4109
G1 X157.838 Y128.265
G1 X168.776 Y139.203 E.4109
G1 X168.776 Y139.746
G1 X157.838 Y128.808 E.4109
G1 X157.838 Y129.35
G1 X168.776 Y140.288 E.4109
G1 X168.776 Y140.83
G1 X157.838 Y129.892 E.4109
G1 X157.838 Y130.435
G1 X168.776 Y141.373 E.4109
G1 X168.776 Y141.915
G1 X157.838 Y130.977 E.4109
G1 X157.838 Y131.52
G1 X168.776 Y142.457 E.4109
G1 X168.776 Y143
G1 X157.838 Y132.062 E.4109
G1 X157.838 Y132.604
G1 X168.776 Y143.542 E.4109
G1 X168.776 Y144.085
G1 X157.838 Y133.147 E.4109
G1 X157.838 Y133.689
G1 X168.776 Y144.627 E.4109
G1 X168.776 Y145.169
G1 X157.838 Y134.231 E.4109
G1 X157.838 Y134.774
G1 X168.776 Y145.712 E.4109
G1 X168.776 Y146.254
G1 X157.838 Y135.316 E.4109
G1 X157.838 Y135.859
G1 X168.776 Y146.796 E.4109
G1 X168.776 Y147.339
G1 X157.838 Y136.401 E.4109
G1 X157.838 Y136.943
G1 X168.776 Y147.881 E.4109
G1 X168.776 Y148.424
G1 X157.838 Y137.486 E.4109
G1 X157.838 Y138.028
G1 X168.776 Y148.966 E.4109
G1 X168.776 Y149.508
G1 X157.838 Y138.57 E.4109
G1 X157.838 Y139.113
G1 X168.776 Y150.051 E.4109
G1 X168.776 Y150.593
G1 X157.838 Y139.655 E.4109
G1 X157.838 Y140.198
G1 X168.776 Y151.135 E.4109
G1 X168.776 Y151.678
G1 X157.838 Y140.74 E.4109
G1 X157.838 Y141.282
G1 X168.776 Y152.22 E.4109
G1 X168.776 Y152.763
G1 X157.838 Y141.825 E.4109
G1 X157.838 Y142.367
G1 X168.776 Y153.305 E.4109
G1 X168.776 Y153.847
G1 X157.838 Y142.909 E.4109
G1 X157.838 Y143.452
G1 X168.776 Y154.39 E.4109
G1 X168.776 Y154.932
G1 X157.838 Y143.994 E.4109
G1 X157.838 Y144.537
G1 X168.776 Y155.474 E.4109
G1 X168.776 Y156.017
G1 X157.838 Y145.079 E.4109
G1 X157.838 Y145.621
G1 X168.776 Y156.559 E.4109
G1 X168.776 Y157.102
G1 X157.838 Y146.164 E.4109
G1 X157.838 Y146.706
G1 X168.776 Y157.644 E.4109
G1 X168.776 Y158.186
G1 X157.838 Y147.248 E.4109
G1 X157.838 Y147.791
G1 X168.776 Y158.729 E.4109
G1 X168.776 Y159.271
G1 X157.838 Y148.333 E.4109
G1 X157.838 Y148.876
G1 X168.776 Y159.813 E.4109
G1 X168.776 Y160.356
G1 X157.838 Y149.418 E.4109
G1 X157.838 Y149.96
G1 X168.776 Y160.898 E.4109
G1 X168.776 Y161.441
G1 X157.838 Y150.503 E.4109
G1 X157.838 Y151.045
G1 X168.776 Y161.983 E.4109
G1 X168.776 Y162.525
G1 X157.838 Y151.587 E.4109
G1 X157.838 Y152.13
G1 X168.776 Y163.068 E.4109
G1 X168.776 Y163.61
G1 X157.838 Y152.672 E.4109
G1 X157.838 Y153.215
G1 X168.776 Y164.152 E.4109
G1 X168.776 Y164.695
G1 X157.838 Y153.757 E.4109
G1 X157.838 Y154.299
G1 X168.776 Y165.237 E.4109
G1 X168.776 Y165.78
G1 X157.838 Y154.842 E.4109
G1 X157.838 Y155.384
G1 X168.776 Y166.322 E.4109
G1 X168.776 Y166.864
G1 X157.838 Y155.926 E.4109
G1 X157.838 Y156.469
G1 X168.776 Y167.407 E.4109
G1 X168.776 Y167.949
G1 X157.838 Y157.011 E.4109
G1 X157.838 Y157.554
G1 X168.776 Y168.491 E.4109
G1 X168.776 Y169.034
G1 X157.838 Y158.096 E.4109
G1 X157.838 Y158.638
G1 X168.776 Y169.576 E.4109
G1 X168.776 Y170.119
G1 X157.838 Y159.181 E.4109
G1 X157.838 Y159.723
G1 X168.776 Y170.661 E.4109
G1 X168.776 Y171.203
G1 X157.838 Y160.265 E.4109
G1 X157.838 Y160.808
G1 X168.776 Y171.746 E.4109
G1 X168.776 Y172.288
G1 X157.838 Y161.35 E.4109
G1 X157.838 Y161.893
G1 X168.776 Y172.83 E.4109
G1 X168.776 Y173.373
G1 X157.838 Y162.435 E.4109
G1 X157.838 Y162.977
G1 X168.776 Y173.915 E.4109
G1 X168.776 Y174.458
G1 X157.838 Y163.52 E.4109
G1 X157.838 Y164.062
G1 X168.776 Y175 E.4109
G1 X168.776 Y175.542
G1 X157.838 Y164.604 E.4109
G1 X157.838 Y165.147
G1 X168.776 Y176.085 E.4109
G1 X168.776 Y176.627
G1 X157.838 Y165.689 E.4109
G1 X157.838 Y166.232
G1 X168.776 Y177.169 E.4109
G1 X168.776 Y177.712
G1 X157.838 Y166.774 E.4109
G1 X157.838 Y167.316
G1 X168.776 Y178.254 E.4109
G1 X168.776 Y178.797
G1 X157.838 Y167.859 E.4109
G1 X157.838 Y168.401
G1 X168.776 Y179.339 E.4109
G1 X168.776 Y179.881
G1 X157.838 Y168.943 E.4109
G1 X157.838 Y169.486
G1 X168.776 Y180.424 E.4109
G1 X168.776 Y180.966
G1 X157.838 Y170.028 E.4109
G1 X157.838 Y170.571
G1 X168.776 Y181.508 E.4109
G1 X168.776 Y182.051
G1 X157.838 Y171.113 E.4109
G1 X157.838 Y171.655
G1 X168.776 Y182.593 E.4109
G1 X168.776 Y183.136
G1 X157.838 Y172.198 E.4109
G1 X157.838 Y172.74
G1 X168.776 Y183.678 E.4109
G1 X168.776 Y184.22
G1 X157.838 Y173.282 E.4109
G1 X157.838 Y173.825
G1 X168.776 Y184.763 E.4109
G1 X168.776 Y185.305
G1 X157.838 Y174.367 E.4109
G1 X157.838 Y174.91
G1 X168.776 Y185.847 E.4109
G1 X168.776 Y186.39
G1 X157.838 Y175.452 E.4109
G1 X157.838 Y175.994
G1 X168.776 Y186.932 E.4109
G1 X168.776 Y187.475
G1 X157.838 Y176.537 E.4109
G1 X157.838 Y177.079
G1 X168.776 Y188.017 E.4109
G1 X168.753 Y188.536
G1 X157.838 Y177.621 E.41003
G1 X157.838 Y178.164
G1 X168.535 Y188.861 E.40186
G1 X168.105 Y188.973
G1 X157.838 Y178.706 E.38569
G1 X157.838 Y179.249
G1 X167.563 Y188.973 E.36531
G1 X167.02 Y188.973
G1 X157.838 Y179.791 E.34494
G1 X157.838 Y180.333
G1 X166.478 Y188.973 E.32456
G1 X165.935 Y188.973
G1 X157.838 Y180.876 E.30419
G1 X157.838 Y181.418
G1 X165.393 Y188.973 E.28381
G1 X164.851 Y188.973
G1 X157.838 Y181.96 E.26344
G1 X157.838 Y182.503
G1 X164.308 Y188.973 E.24306
G1 X163.766 Y188.973
G1 X157.828 Y183.035 E.22307
G1 X157.286 Y183.035
G1 X163.224 Y188.973 E.22307
G1 X162.681 Y188.973
G1 X156.743 Y183.035 E.22307
G1 X156.201 Y183.035
G1 X162.139 Y188.973 E.22307
G1 X161.596 Y188.973
G1 X155.658 Y183.035 E.22307
G1 X155.116 Y183.035
G1 X161.054 Y188.973 E.22307
G1 X160.512 Y188.973
G1 X154.574 Y183.035 E.22307
G1 X154.031 Y183.035
G1 X159.969 Y188.973 E.22307
G1 X159.427 Y188.973
M73 P70 R19
G1 X153.489 Y183.035 E.22307
G1 X152.947 Y183.035
G1 X158.885 Y188.973 E.22307
G1 X158.342 Y188.973
G1 X152.404 Y183.035 E.22307
G1 X151.862 Y183.035
G1 X157.8 Y188.973 E.22307
G1 X157.257 Y188.973
G1 X151.319 Y183.035 E.22307
M73 P70 R18
G1 X150.777 Y183.035
G1 X156.715 Y188.973 E.22307
G1 X156.173 Y188.973
G1 X150.235 Y183.035 E.22307
G1 X149.867 Y183.21
G1 X155.63 Y188.973 E.2165
G1 X155.088 Y188.973
G1 X149.712 Y183.597 E.20197
G1 X149.712 Y184.139
G1 X154.546 Y188.973 E.1816
G1 X154.003 Y188.973
G1 X149.712 Y184.681 E.16122
G1 X149.712 Y185.224
G1 X153.461 Y188.973 E.14085
G1 X152.918 Y188.973
G1 X149.712 Y185.766 E.12047
G1 X149.712 Y186.308
G1 X152.376 Y188.973 E.1001
G1 X151.834 Y188.973
G1 X149.712 Y186.851 E.07972
G1 X149.712 Y187.393
G1 X151.291 Y188.973 E.05935
G1 X150.749 Y188.973
G1 X149.712 Y187.935 E.03897
G1 X149.712 Y188.478
G1 X150.207 Y188.973 E.0186
M204 S10000
; WIPE_START
G1 F24000
G1 X149.712 Y188.478 E-.26602
G1 X149.712 Y187.935 E-.2061
G1 X150.247 Y188.471 E-.28788
; WIPE_END
G1 E-.04 F1800
G1 X151.301 Y180.912 Z5.33 F30000
G1 X168.793 Y55.37 Z5.33
G1 Z4.93
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.194062
G1 F15000
G1 X168.636 Y55.14 E.00304
; LINE_WIDTH: 0.223984
G2 X168.251 Y54.803 I-1.241 J1.03 E.00668
; WIPE_START
G1 F24000
G1 X168.492 Y54.988 E-.44964
G1 X168.636 Y55.14 E-.31036
; WIPE_END
G1 E-.04 F1800
G1 X161.335 Y57.365 Z5.33 F30000
G1 X150.156 Y60.772 Z5.33
G1 Z4.93
G1 E.8 F1800
; LINE_WIDTH: 0.208236
G1 F15000
G1 X149.692 Y60.308 E.0078
G1 X157.87 Y60.772 F30000
; LINE_WIDTH: 0.0790743
G1 F15000
G1 X157.652 Y60.681 E.0007
G1 X157.924 Y182.938 F30000
; LINE_WIDTH: 0.100429
G1 F15000
G1 X157.847 Y182.823 E.00062
G1 X157.819 Y182.84 E.00015
; WIPE_START
G1 F24000
G1 X157.847 Y182.823 E-.14498
G1 X157.924 Y182.938 E-.61502
; WIPE_END
G1 E-.04 F1800
G1 X164.696 Y186.46 Z5.33 F30000
G1 X168.748 Y188.567 Z5.33
G1 Z4.93
G1 E.8 F1800
; LINE_WIDTH: 0.0919943
G1 F15000
G3 X168.649 Y188.703 I-.701 J-.406 E.00065
; CHANGE_LAYER
; Z_HEIGHT: 5.1
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X168.748 Y188.567 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 30/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z5.33 I.697 J-.997 P1  F30000
G1 X109.604 Y147.219 Z5.33
G1 Z5.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X108.439 Y140.394 E.19829
G1 X76.112 Y140.394 E.92591
G1 X76.112 Y61.809 E2.25085
G1 X151.896 Y61.809 E2.17058
G1 X151.896 Y62.285 E.01364
G1 X156.306 Y62.285 E.12631
G1 X156.306 Y181.502 E3.41461
G1 X151.896 Y181.502 E.12631
G1 X151.896 Y181.979 E.01364
G1 X115.539 Y181.979 E1.04132
G1 X109.615 Y147.278 E1.00828
; WIPE_START
G1 F24000
G1 X109.278 Y145.306 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.032 Y150.32 Z5.5 F30000
G1 X150.361 Y181.104 Z5.5
G1 Z5.1
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X150.361 Y62.684 E3.14572
G1 X155.907 Y62.684 E.14734
G1 X155.907 Y181.104 E3.14572
G1 X150.421 Y181.104 E.14574
M204 S10000
; WIPE_START
G1 F24000
G1 X150.42 Y179.104 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.348 Y174.479 Z5.5 F30000
G1 X108.793 Y147.4 Z5.5
G1 Z5.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.739 Y141.225 E.17942
G1 X75.282 Y141.225 E.92962
G1 X75.282 Y60.979 E2.29841
G1 X151.895 Y60.979 E2.19435
G1 X151.895 Y60.502 E.01364
G1 X158.089 Y60.502 E.17739
G1 X158.089 Y183.285 E3.51675
G1 X151.895 Y183.285 E.17739
G1 X151.895 Y182.809 E.01364
G1 X114.839 Y182.809 E1.06138
G1 X108.803 Y147.459 E1.02715
; WIPE_START
G1 F24000
G1 X108.467 Y145.487 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.402 Y148.794 Z5.5 F30000
G1 Z5.1
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.268 Y148.61 E.00603
G2 X101.365 Y148.184 I-.932 J.803 E.02733
G1 X70.208 Y148.184 E.82765
G3 X69.407 Y147.388 I-.005 J-.796 E.03333
G1 X69.407 Y55.399 E2.4436
G3 X70.208 Y54.604 I.796 J.001 E.03333
G1 X150.361 Y54.604 E2.12917
G1 X150.36 Y59.389 E.12711
G1 X150.36 Y60.104 E.01899
G1 X158.487 Y60.104 E.21588
G1 X158.487 Y183.684 E3.28279
G1 X150.361 Y183.684 E.21588
G1 X150.36 Y189.184 E.1461
G1 X110.052 Y189.184 E1.07075
G3 X109.261 Y188.521 I.005 J-.809 E.02973
G1 X102.545 Y149.185 E1.06006
G2 X102.429 Y148.847 I-1.208 J.229 E.00951
M204 S10000
; WIPE_START
G1 F24000
G1 X102.268 Y148.61 E-.10876
G1 X102.084 Y148.427 E-.09882
G1 X101.86 Y148.293 E-.09906
G1 X101.613 Y148.211 E-.09902
G1 X101.365 Y148.184 E-.09479
G1 X100.682 Y148.184 E-.25956
; WIPE_END
G1 E-.04 F1800
G1 X106.165 Y142.875 Z5.5 F30000
G1 X108.119 Y140.983 Z5.5
G1 Z5.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45322
G1 F15000
G1 X115.159 Y182.22 E1.20755
; LINE_WIDTH: 0.467128
G1 X115.186 Y182.293 E.00231
; LINE_WIDTH: 0.485698
G1 X115.212 Y182.366 E.00241
G1 X115.365 Y182.394 E.00482
; LINE_WIDTH: 0.453228
G1 X152.102 Y182.394 E1.06045
G1 X152.466 Y181.903 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X152.501 Y181.96 E.00179
G1 X152.501 Y182.827 E.02302
G1 X152.466 Y182.885 E.00179
G1 X157.612 Y182.885 E.13669
G1 X157.688 Y182.809 E.00287
G1 X157.688 Y61.033 E3.23485
G2 X157.558 Y60.903 I-.13 J0 E.00544
G1 X152.466 Y60.903 E.13525
G1 X152.501 Y60.96 E.00179
G1 X152.501 Y61.827 E.02302
G1 X152.466 Y61.885 E.00179
G1 X156.514 Y61.885 E.10753
G1 X156.65 Y61.941 E.0039
G1 X156.706 Y62.077 E.0039
G1 X156.706 Y181.711 E3.17796
G1 X156.65 Y181.846 E.0039
G1 X156.514 Y181.903 E.0039
G1 X152.526 Y181.903 E.10594
G1 X152.992 Y182.394 F30000
; LINE_WIDTH: 0.635352
G1 F12376.25
G1 X156.573 Y182.391 E.14855
G1 X157.192 Y181.83 F30000
; LINE_WIDTH: 0.621623
G1 F12666.647
G1 X157.127 Y181.905 E.00401
; LINE_WIDTH: 0.573471
G1 F13802.458
G1 X157.062 Y181.98 E.00368
; LINE_WIDTH: 0.52532
G1 F15000
G1 X156.998 Y182.054 E.00335
; LINE_WIDTH: 0.477168
G1 X156.933 Y182.129 E.00302
; LINE_WIDTH: 0.477169
G1 X156.858 Y182.194 E.00302
; LINE_WIDTH: 0.525321
G1 X156.783 Y182.259 E.00335
; LINE_WIDTH: 0.573474
G1 F13802.394
G1 X156.708 Y182.324 E.00368
; LINE_WIDTH: 0.621626
G1 F12666.57
G1 X156.633 Y182.389 E.00401
G1 X156.745 Y182.413 E.00463
; LINE_WIDTH: 0.573474
G1 F13802.394
G1 X156.857 Y182.437 E.00425
; LINE_WIDTH: 0.525321
G1 F15000
G1 X156.968 Y182.461 E.00387
; LINE_WIDTH: 0.458275
G2 X157.288 Y182.485 I.216 J-.73 E.00945
G1 X157.288 Y182.277 E.00609
; LINE_WIDTH: 0.477168
G1 X157.267 Y182.18 E.00303
; LINE_WIDTH: 0.52532
G1 X157.246 Y182.082 E.00336
; LINE_WIDTH: 0.573471
G1 F13802.458
G1 X157.226 Y181.985 E.00369
; LINE_WIDTH: 0.597547
G1 F13210.182
G1 X157.205 Y181.888 E.00386
G1 X157.192 Y181.83 F30000
; LINE_WIDTH: 0.635361
G1 F12376.077
G1 X157.197 Y62.137 E4.96497
G1 X157.197 Y62.077 F30000
; LINE_WIDTH: 0.612568
G1 F12865.731
G1 X157.22 Y61.935 E.00572
; LINE_WIDTH: 0.567004
G1 F13970.72
G1 X157.243 Y61.794 E.00526
; LINE_WIDTH: 0.521439
G1 F15000
G1 X157.266 Y61.652 E.00481
; LINE_WIDTH: 0.462376
G2 X157.288 Y61.303 I-1.074 J-.246 E.01038
; LINE_WIDTH: 0.475875
G1 X157.095 Y61.325 E.00593
; LINE_WIDTH: 0.52144
G1 X156.901 Y61.348 E.00655
; LINE_WIDTH: 0.567005
G1 F13970.688
G1 X156.708 Y61.371 E.00716
; LINE_WIDTH: 0.61257
G1 F12865.693
G1 X156.514 Y61.394 E.00778
G1 X156.619 Y61.46 E.00494
; LINE_WIDTH: 0.567005
G1 F13970.688
G1 X156.723 Y61.526 E.00455
; LINE_WIDTH: 0.52144
G1 F15000
G1 X156.828 Y61.592 E.00416
; LINE_WIDTH: 0.475875
G1 X156.933 Y61.658 E.00377
; LINE_WIDTH: 0.475875
G1 X156.991 Y61.75 E.00331
; LINE_WIDTH: 0.521439
G1 X157.049 Y61.842 E.00365
; LINE_WIDTH: 0.567004
G1 F13970.72
G1 X157.107 Y61.934 E.004
; LINE_WIDTH: 0.589786
G1 F13395.477
G1 X157.165 Y62.026 E.00417
G1 X152.992 Y61.394 F30000
; LINE_WIDTH: 0.635352
G1 F12376.25
G1 X156.454 Y61.394 E.14361
G1 X152.102 Y61.394 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.45323
G1 F15000
G1 X75.906 Y61.394 E2.19947
; LINE_WIDTH: 0.471105
G1 X75.819 Y61.412 E.00265
; LINE_WIDTH: 0.494941
G1 X75.733 Y61.43 E.0028
G1 X75.697 Y61.602 E.0056
; LINE_WIDTH: 0.453232
G1 X75.697 Y140.601 E2.28038
; LINE_WIDTH: 0.471108
G1 X75.715 Y140.688 E.00265
; LINE_WIDTH: 0.49494
G1 X75.733 Y140.774 E.0028
G1 X75.906 Y140.81 E.0056
; LINE_WIDTH: 0.453229
G1 X107.913 Y140.81 E.92392
; LINE_WIDTH: 0.467148
G1 X107.989 Y140.824 E.00231
; LINE_WIDTH: 0.485711
G1 X108.066 Y140.837 E.00241
G1 X108.119 Y140.983 E.00482
; WIPE_START
G1 F24000
G1 X108.066 Y140.837 E-.50666
G1 X107.989 Y140.824 E-.25334
; WIPE_END
G1 E-.04 F1800
G1 X113.468 Y146.138 Z5.5 F30000
G1 X150.184 Y181.753 Z5.5
G1 Z5.1
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X150.622 Y181.315 E.01645
G1 X150.15 Y181.245
G1 X149.642 Y181.753 E.01908
G1 X149.1 Y181.753
G1 X150.15 Y180.702 E.03945
G1 X150.15 Y180.16
G1 X148.557 Y181.753 E.05983
G1 X148.015 Y181.753
G1 X150.15 Y179.618 E.08021
G1 X150.15 Y179.075
G1 X147.472 Y181.753 E.10058
G1 X146.93 Y181.753
G1 X150.15 Y178.533 E.12096
G1 X150.15 Y177.991
G1 X146.388 Y181.753 E.14133
G1 X145.845 Y181.753
G1 X150.15 Y177.448 E.16171
G1 X150.15 Y176.906
G1 X145.303 Y181.753 E.18208
G1 X144.761 Y181.753
G1 X150.15 Y176.363 E.20246
G1 X150.15 Y175.821
G1 X144.218 Y181.753 E.22283
G1 X143.676 Y181.753
G1 X150.15 Y175.279 E.24321
G1 X150.15 Y174.736
G1 X143.133 Y181.753 E.26359
G1 X142.591 Y181.753
G1 X150.15 Y174.194 E.28396
G1 X150.15 Y173.652
G1 X142.049 Y181.753 E.30434
G1 X141.506 Y181.753
G1 X150.15 Y173.109 E.32471
G1 X150.15 Y172.567
G1 X140.964 Y181.753 E.34509
G1 X140.422 Y181.753
G1 X150.15 Y172.024 E.36546
G1 X150.15 Y171.482
G1 X139.879 Y181.753 E.38584
G1 X139.337 Y181.753
G1 X150.15 Y170.94 E.40621
G1 X150.15 Y170.397
G1 X138.794 Y181.753 E.42659
G1 X138.252 Y181.753
G1 X150.15 Y169.855 E.44697
G1 X150.15 Y169.313
G1 X137.71 Y181.753 E.46734
G1 X137.167 Y181.753
G1 X150.15 Y168.77 E.48772
G1 X150.15 Y168.228
G1 X136.625 Y181.753 E.50809
G1 X136.083 Y181.753
G1 X150.15 Y167.685 E.52847
G1 X150.15 Y167.143
G1 X135.54 Y181.753 E.54884
G1 X134.998 Y181.753
G1 X150.15 Y166.601 E.56922
G1 X150.15 Y166.058
G1 X134.455 Y181.753 E.58959
G1 X133.913 Y181.753
G1 X150.15 Y165.516 E.60997
G1 X150.15 Y164.974
G1 X133.371 Y181.753 E.63035
G1 X132.828 Y181.753
G1 X150.15 Y164.431 E.65072
G1 X150.15 Y163.889
G1 X132.286 Y181.753 E.6711
G1 X131.744 Y181.753
G1 X150.15 Y163.346 E.69147
G1 X150.15 Y162.804
G1 X131.201 Y181.753 E.71185
G1 X130.659 Y181.753
G1 X150.15 Y162.262 E.73222
G1 X150.15 Y161.719
G1 X130.116 Y181.753 E.7526
G1 X129.574 Y181.753
G1 X150.15 Y161.177 E.77297
G1 X150.15 Y160.635
G1 X129.032 Y181.753 E.79335
G1 X128.489 Y181.753
G1 X150.15 Y160.092 E.81373
G1 X150.15 Y159.55
G1 X127.947 Y181.753 E.8341
G1 X127.405 Y181.753
G1 X150.15 Y159.007 E.85448
G1 X150.15 Y158.465
G1 X126.862 Y181.753 E.87485
G1 X126.32 Y181.753
G1 X150.15 Y157.923 E.89523
G1 X150.15 Y157.38
G1 X125.777 Y181.753 E.9156
G1 X125.235 Y181.753
G1 X150.15 Y156.838 E.93598
G1 X150.15 Y156.296
G1 X124.693 Y181.753 E.95635
G1 X124.15 Y181.753
G1 X150.15 Y155.753 E.97673
G1 X150.15 Y155.211
G1 X123.608 Y181.753 E.9971
G1 X123.066 Y181.753
G1 X150.15 Y154.668 E1.01748
G1 X150.15 Y154.126
G1 X122.523 Y181.753 E1.03786
G1 X121.981 Y181.753
G1 X150.15 Y153.584 E1.05823
G1 X150.15 Y153.041
G1 X121.438 Y181.753 E1.07861
G1 X120.896 Y181.753
G1 X150.15 Y152.499 E1.09898
G1 X150.15 Y151.957
G1 X120.354 Y181.753 E1.11936
G1 X119.811 Y181.753
G1 X150.15 Y151.414 E1.13973
G1 X150.15 Y150.872
G1 X119.269 Y181.753 E1.16011
G1 X118.727 Y181.753
G1 X150.15 Y150.329 E1.18048
G1 X150.15 Y149.787
G1 X118.184 Y181.753 E1.20086
G1 X117.642 Y181.753
G1 X150.15 Y149.245 E1.22124
G1 X150.15 Y148.702
G1 X117.099 Y181.753 E1.24161
G1 X116.557 Y181.753
G1 X150.15 Y148.16 E1.26199
G1 X150.15 Y147.618
G1 X116.015 Y181.753 E1.28236
G1 X115.692 Y181.533
G1 X150.15 Y147.075 E1.29448
G1 X150.15 Y146.533
G1 X115.613 Y181.07 E1.29745
G1 X115.534 Y180.606
G1 X150.15 Y145.99 E1.30042
G1 X150.15 Y145.448
G1 X115.455 Y180.143 E1.30339
G1 X115.376 Y179.68
G1 X150.15 Y144.906 E1.30636
G1 X150.15 Y144.363
G1 X115.297 Y179.216 E1.30933
G1 X115.218 Y178.753
G1 X150.15 Y143.821 E1.31231
G1 X150.15 Y143.279
G1 X115.139 Y178.29 E1.31528
G1 X115.059 Y177.827
G1 X150.15 Y142.736 E1.31825
G1 X150.15 Y142.194
G1 X114.98 Y177.363 E1.32122
G1 X114.901 Y176.9
G1 X150.15 Y141.651 E1.32419
G1 X150.15 Y141.109
G1 X114.822 Y176.437 E1.32716
G1 X114.743 Y175.973
G1 X150.15 Y140.567 E1.33013
G1 X150.15 Y140.024
G1 X114.664 Y175.51 E1.33311
G1 X114.585 Y175.047
G1 X150.15 Y139.482 E1.33608
G1 X150.15 Y138.94
G1 X114.506 Y174.584 E1.33905
G1 X114.427 Y174.12
G1 X150.15 Y138.397 E1.34202
G1 X150.15 Y137.855
G1 X114.348 Y173.657 E1.34499
G1 X114.268 Y173.194
G1 X150.15 Y137.312 E1.34796
G1 X150.15 Y136.77
G1 X114.189 Y172.73 E1.35093
G1 X114.11 Y172.267
G1 X150.15 Y136.228 E1.35391
G1 X150.15 Y135.685
G1 X114.031 Y171.804 E1.35688
G1 X113.952 Y171.341
G1 X150.15 Y135.143 E1.35985
G1 X150.15 Y134.601
G1 X113.873 Y170.877 E1.36282
G1 X113.794 Y170.414
G1 X150.15 Y134.058 E1.36579
G1 X150.15 Y133.516
G1 X113.715 Y169.951 E1.36876
G1 X113.636 Y169.488
G1 X150.15 Y132.973 E1.37173
G1 X150.15 Y132.431
G1 X113.557 Y169.024 E1.37471
G1 X113.477 Y168.561
G1 X150.15 Y131.889 E1.37768
G1 X150.15 Y131.346
G1 X113.398 Y168.098 E1.38065
G1 X113.319 Y167.634
G1 X150.15 Y130.804 E1.38362
G1 X150.15 Y130.262
G1 X113.24 Y167.171 E1.38659
G1 X113.161 Y166.708
G1 X150.15 Y129.719 E1.38956
G1 X150.15 Y129.177
G1 X113.082 Y166.245 E1.39253
G1 X113.003 Y165.781
G1 X150.15 Y128.634 E1.39551
G1 X150.15 Y128.092
G1 X112.924 Y165.318 E1.39848
M73 P71 R18
G1 X112.845 Y164.855
G1 X150.15 Y127.55 E1.40145
G1 X150.15 Y127.007
G1 X112.766 Y164.391 E1.40442
G1 X112.687 Y163.928
G1 X150.15 Y126.465 E1.40739
G1 X150.15 Y125.923
G1 X112.607 Y163.465 E1.41036
G1 X112.528 Y163.002
G1 X150.15 Y125.38 E1.41333
G1 X150.15 Y124.838
G1 X112.449 Y162.538 E1.41631
G1 X112.37 Y162.075
G1 X150.15 Y124.295 E1.41928
G1 X150.15 Y123.753
G1 X112.291 Y161.612 E1.42225
G1 X112.212 Y161.149
G1 X150.15 Y123.211 E1.42522
G1 X150.15 Y122.668
G1 X112.133 Y160.685 E1.42819
G1 X112.054 Y160.222
G1 X150.15 Y122.126 E1.43116
G1 X150.15 Y121.584
G1 X111.975 Y159.759 E1.43413
G1 X111.896 Y159.295
G1 X150.15 Y121.041 E1.43711
G1 X150.15 Y120.499
G1 X111.816 Y158.832 E1.44008
G1 X111.737 Y158.369
G1 X150.15 Y119.956 E1.44305
G1 X150.15 Y119.414
G1 X111.658 Y157.906 E1.44602
G1 X111.579 Y157.442
G1 X150.15 Y118.872 E1.44899
G1 X150.15 Y118.329
G1 X111.5 Y156.979 E1.45196
G1 X111.421 Y156.516
G1 X150.15 Y117.787 E1.45493
G1 X150.15 Y117.245
G1 X111.342 Y156.052 E1.45791
G1 X111.263 Y155.589
G1 X150.15 Y116.702 E1.46088
G1 X150.15 Y116.16
G1 X111.184 Y155.126 E1.46385
G1 X111.105 Y154.663
G1 X150.15 Y115.617 E1.46682
G1 X150.15 Y115.075
G1 X111.026 Y154.199 E1.46979
G1 X110.946 Y153.736
G1 X150.15 Y114.533 E1.47276
G1 X150.15 Y113.99
G1 X110.867 Y153.273 E1.47573
G1 X110.788 Y152.81
G1 X150.15 Y113.448 E1.47871
G1 X150.15 Y112.906
G1 X110.709 Y152.346 E1.48168
G1 X110.63 Y151.883
G1 X150.15 Y112.363 E1.48465
G1 X150.15 Y111.821
G1 X110.551 Y151.42 E1.48762
G1 X110.472 Y150.956
G1 X150.15 Y111.278 E1.49059
G1 X150.15 Y110.736
G1 X110.393 Y150.493 E1.49356
G1 X110.314 Y150.03
G1 X150.15 Y110.194 E1.49653
G1 X150.15 Y109.651
G1 X110.235 Y149.567 E1.49951
G1 X110.155 Y149.103
G1 X150.15 Y109.109 E1.50248
G1 X150.15 Y108.567
G1 X110.076 Y148.64 E1.50545
G1 X109.997 Y148.177
G1 X150.15 Y108.024 E1.50842
G1 X150.15 Y107.482
G1 X109.918 Y147.713 E1.51139
G1 X109.839 Y147.25
G1 X150.15 Y106.939 E1.51436
G1 X150.15 Y106.397
G1 X109.76 Y146.787 E1.51733
G1 X109.681 Y146.324
G1 X150.15 Y105.855 E1.52031
G1 X150.15 Y105.312
G1 X109.602 Y145.86 E1.52328
G1 X109.523 Y145.397
G1 X150.15 Y104.77 E1.52625
G1 X150.15 Y104.228
G1 X109.444 Y144.934 E1.52922
G1 X109.364 Y144.471
G1 X150.15 Y103.685 E1.53219
G1 X150.15 Y103.143
G1 X109.285 Y144.007 E1.53516
G1 X109.206 Y143.544
G1 X150.15 Y102.6 E1.53813
G1 X150.15 Y102.058
G1 X109.127 Y143.081 E1.54111
G1 X109.048 Y142.617
G1 X150.15 Y101.516 E1.54408
G1 X150.15 Y100.973
G1 X108.969 Y142.154 E1.54705
G1 X108.89 Y141.691
G1 X150.15 Y100.431 E1.55002
G1 X150.15 Y99.889
G1 X108.811 Y141.228 E1.55299
G1 X108.732 Y140.764
G1 X150.15 Y99.346 E1.55596
G1 X150.15 Y98.804
G1 X108.653 Y140.301 E1.55893
G1 X108.243 Y140.169
G1 X150.15 Y98.261 E1.57433
G1 X150.15 Y97.719
G1 X107.7 Y140.169 E1.59471
G1 X107.158 Y140.169
G1 X150.15 Y97.177 E1.61508
G1 X150.15 Y96.634
G1 X106.616 Y140.169 E1.63546
G1 X106.073 Y140.169
G1 X150.15 Y96.092 E1.65584
G1 X150.15 Y95.55
G1 X105.531 Y140.169 E1.67621
G1 X104.988 Y140.169
M73 P71 R17
G1 X150.15 Y95.007 E1.69659
G1 X150.15 Y94.465
G1 X104.446 Y140.169 E1.71696
G1 X103.904 Y140.169
G1 X150.15 Y93.922 E1.73734
G1 X150.15 Y93.38
G1 X103.361 Y140.169 E1.75771
G1 X102.819 Y140.169
G1 X150.15 Y92.838 E1.77809
G1 X150.15 Y92.295
G1 X102.277 Y140.169 E1.79846
G1 X101.734 Y140.169
G1 X150.15 Y91.753 E1.81884
G1 X150.15 Y91.211
G1 X101.192 Y140.169 E1.83922
G1 X100.649 Y140.169
G1 X150.15 Y90.668 E1.85959
G1 X150.15 Y90.126
G1 X100.107 Y140.169 E1.87997
G1 X99.565 Y140.169
G1 X150.15 Y89.583 E1.90034
G1 X150.15 Y89.041
G1 X99.022 Y140.169 E1.92072
G1 X98.48 Y140.169
G1 X150.15 Y88.499 E1.94109
G1 X150.15 Y87.956
G1 X97.938 Y140.169 E1.96147
G1 X97.395 Y140.169
G1 X150.15 Y87.414 E1.98184
G1 X150.15 Y86.872
G1 X96.853 Y140.169 E2.00222
G1 X96.31 Y140.169
G1 X150.15 Y86.329 E2.0226
G1 X150.15 Y85.787
G1 X95.768 Y140.169 E2.04297
G1 X95.226 Y140.169
G1 X150.15 Y85.244 E2.06335
G1 X150.15 Y84.702
G1 X94.683 Y140.169 E2.08372
G1 X94.141 Y140.169
G1 X150.15 Y84.16 E2.1041
G1 X150.15 Y83.617
G1 X93.599 Y140.169 E2.12447
G1 X93.056 Y140.169
G1 X150.15 Y83.075 E2.14485
G1 X150.15 Y82.533
G1 X92.514 Y140.169 E2.16522
G1 X91.971 Y140.169
G1 X150.15 Y81.99 E2.1856
G1 X150.15 Y81.448
G1 X91.429 Y140.169 E2.20597
G1 X90.887 Y140.169
G1 X150.15 Y80.905 E2.22635
G1 X150.15 Y80.363
G1 X90.344 Y140.169 E2.24673
G1 X89.802 Y140.169
G1 X150.15 Y79.821 E2.2671
G1 X150.15 Y79.278
G1 X89.26 Y140.169 E2.28748
G1 X88.717 Y140.169
G1 X150.15 Y78.736 E2.30785
G1 X150.15 Y78.194
G1 X88.175 Y140.169 E2.32823
G1 X87.632 Y140.169
G1 X150.15 Y77.651 E2.3486
G1 X150.15 Y77.109
G1 X87.09 Y140.169 E2.36898
G1 X86.548 Y140.169
G1 X150.15 Y76.566 E2.38935
G1 X150.15 Y76.024
G1 X86.005 Y140.169 E2.40973
G1 X85.463 Y140.169
G1 X150.15 Y75.482 E2.43011
M73 P72 R17
G1 X150.15 Y74.939
G1 X84.921 Y140.169 E2.45048
G1 X84.378 Y140.169
G1 X150.15 Y74.397 E2.47086
G1 X150.15 Y73.855
G1 X83.836 Y140.169 E2.49123
G1 X83.293 Y140.169
G1 X150.15 Y73.312 E2.51161
G1 X150.15 Y72.77
G1 X82.751 Y140.169 E2.53198
G1 X82.209 Y140.169
G1 X150.15 Y72.227 E2.55236
G1 X150.15 Y71.685
G1 X81.666 Y140.169 E2.57273
G1 X81.124 Y140.169
G1 X150.15 Y71.143 E2.59311
G1 X150.15 Y70.6
G1 X80.582 Y140.169 E2.61349
G1 X80.039 Y140.169
G1 X150.15 Y70.058 E2.63386
G1 X150.15 Y69.516
G1 X79.497 Y140.169 E2.65424
G1 X78.954 Y140.169
G1 X150.15 Y68.973 E2.67461
G1 X150.15 Y68.431
G1 X78.412 Y140.169 E2.69499
G1 X77.87 Y140.169
G1 X150.15 Y67.888 E2.71536
G1 X150.15 Y67.346
G1 X77.327 Y140.169 E2.73574
G1 X76.785 Y140.169
G1 X150.15 Y66.804 E2.75611
G1 X150.15 Y66.261
G1 X76.456 Y139.955 E2.76848
G1 X76.338 Y139.53
G1 X150.15 Y65.719 E2.77289
G1 X150.15 Y65.177
G1 X76.338 Y138.988 E2.77289
G1 X76.338 Y138.446
G1 X150.15 Y64.634 E2.77289
G1 X150.15 Y64.092
G1 X76.338 Y137.903 E2.77289
G1 X76.338 Y137.361
G1 X150.15 Y63.549 E2.77289
G1 X150.15 Y63.007
G1 X76.338 Y136.818 E2.77289
G1 X76.338 Y136.276
G1 X150.58 Y62.035 E2.78904
G1 X150.037 Y62.035
G1 X76.338 Y135.734 E2.76867
G1 X76.338 Y135.191
G1 X149.495 Y62.035 E2.74829
G1 X148.953 Y62.035
G1 X76.338 Y134.649 E2.72791
G1 X76.338 Y134.107
G1 X148.41 Y62.035 E2.70754
G1 X147.868 Y62.035
G1 X76.338 Y133.564 E2.68716
G1 X76.338 Y133.022
G1 X147.325 Y62.035 E2.66679
G1 X146.783 Y62.035
G1 X76.338 Y132.479 E2.64641
G1 X76.338 Y131.937
G1 X146.241 Y62.035 E2.62604
G1 X145.698 Y62.035
G1 X76.338 Y131.395 E2.60566
G1 X76.338 Y130.852
G1 X145.156 Y62.035 E2.58529
G1 X144.614 Y62.035
G1 X76.338 Y130.31 E2.56491
G1 X76.338 Y129.768
G1 X144.071 Y62.035 E2.54453
G1 X143.529 Y62.035
G1 X76.338 Y129.225 E2.52416
G1 X76.338 Y128.683
G1 X142.986 Y62.035 E2.50378
G1 X142.444 Y62.035
G1 X76.338 Y128.14 E2.48341
G1 X76.338 Y127.598
G1 X141.902 Y62.035 E2.46303
G1 X141.359 Y62.035
G1 X76.338 Y127.056 E2.44266
G1 X76.338 Y126.513
G1 X140.817 Y62.035 E2.42228
G1 X140.275 Y62.035
G1 X76.338 Y125.971 E2.40191
G1 X76.338 Y125.429
G1 X139.732 Y62.035 E2.38153
G1 X139.19 Y62.035
G1 X76.338 Y124.886 E2.36115
G1 X76.338 Y124.344
G1 X138.647 Y62.035 E2.34078
G1 X138.105 Y62.035
G1 X76.338 Y123.801 E2.3204
G1 X76.338 Y123.259
G1 X137.563 Y62.035 E2.30003
G1 X137.02 Y62.035
G1 X76.338 Y122.717 E2.27965
G1 X76.338 Y122.174
G1 X136.478 Y62.035 E2.25928
G1 X135.936 Y62.035
G1 X76.338 Y121.632 E2.2389
G1 X76.338 Y121.09
G1 X135.393 Y62.035 E2.21853
G1 X134.851 Y62.035
G1 X76.338 Y120.547 E2.19815
G1 X76.338 Y120.005
G1 X134.308 Y62.035 E2.17777
G1 X133.766 Y62.035
G1 X76.338 Y119.463 E2.1574
G1 X76.338 Y118.92
G1 X133.224 Y62.035 E2.13702
G1 X132.681 Y62.035
G1 X76.338 Y118.378 E2.11665
G1 X76.338 Y117.835
G1 X132.139 Y62.035 E2.09627
G1 X131.597 Y62.035
G1 X76.338 Y117.293 E2.0759
G1 X76.338 Y116.751
G1 X131.054 Y62.035 E2.05552
G1 X130.512 Y62.035
G1 X76.338 Y116.208 E2.03515
G1 X76.338 Y115.666
G1 X129.969 Y62.035 E2.01477
G1 X129.427 Y62.035
G1 X76.338 Y115.124 E1.9944
G1 X76.338 Y114.581
G1 X128.885 Y62.035 E1.97402
G1 X128.342 Y62.035
G1 X76.338 Y114.039 E1.95364
G1 X76.338 Y113.496
G1 X127.8 Y62.035 E1.93327
M73 P73 R17
G1 X127.258 Y62.035
G1 X76.338 Y112.954 E1.91289
G1 X76.338 Y112.412
G1 X126.715 Y62.035 E1.89252
G1 X126.173 Y62.035
G1 X76.338 Y111.869 E1.87214
G1 X76.338 Y111.327
G1 X125.63 Y62.035 E1.85177
G1 X125.088 Y62.035
G1 X76.338 Y110.785 E1.83139
G1 X76.338 Y110.242
G1 X124.546 Y62.035 E1.81102
G1 X124.003 Y62.035
G1 X76.338 Y109.7 E1.79064
G1 X76.338 Y109.157
G1 X123.461 Y62.035 E1.77026
G1 X122.919 Y62.035
G1 X76.338 Y108.615 E1.74989
G1 X76.338 Y108.073
G1 X122.376 Y62.035 E1.72951
G1 X121.834 Y62.035
G1 X76.338 Y107.53 E1.70914
G1 X76.338 Y106.988
G1 X121.291 Y62.035 E1.68876
M73 P73 R16
G1 X120.749 Y62.035
G1 X76.338 Y106.446 E1.66839
G1 X76.338 Y105.903
G1 X120.207 Y62.035 E1.64801
G1 X119.664 Y62.035
G1 X76.338 Y105.361 E1.62764
G1 X76.338 Y104.818
G1 X119.122 Y62.035 E1.60726
G1 X118.58 Y62.035
G1 X76.338 Y104.276 E1.58688
G1 X76.338 Y103.734
G1 X118.037 Y62.035 E1.56651
G1 X117.495 Y62.035
G1 X76.338 Y103.191 E1.54613
G1 X76.338 Y102.649
G1 X116.952 Y62.035 E1.52576
G1 X116.41 Y62.035
G1 X76.338 Y102.107 E1.50538
G1 X76.338 Y101.564
G1 X115.868 Y62.035 E1.48501
G1 X115.325 Y62.035
G1 X76.338 Y101.022 E1.46463
G1 X76.338 Y100.479
G1 X114.783 Y62.035 E1.44426
G1 X114.241 Y62.035
G1 X76.338 Y99.937 E1.42388
G1 X76.338 Y99.395
G1 X113.698 Y62.035 E1.4035
G1 X113.156 Y62.035
G1 X76.338 Y98.852 E1.38313
G1 X76.338 Y98.31
G1 X112.613 Y62.035 E1.36275
G1 X112.071 Y62.035
G1 X76.338 Y97.768 E1.34238
G1 X76.338 Y97.225
G1 X111.529 Y62.035 E1.322
G1 X110.986 Y62.035
G1 X76.338 Y96.683 E1.30163
G1 X76.338 Y96.14
G1 X110.444 Y62.035 E1.28125
G1 X109.902 Y62.035
G1 X76.338 Y95.598 E1.26088
G1 X76.338 Y95.056
G1 X109.359 Y62.035 E1.2405
G1 X108.817 Y62.035
G1 X76.338 Y94.513 E1.22012
G1 X76.338 Y93.971
G1 X108.274 Y62.035 E1.19975
G1 X107.732 Y62.035
G1 X76.338 Y93.429 E1.17937
G1 X76.338 Y92.886
G1 X107.19 Y62.035 E1.159
G1 X106.647 Y62.035
G1 X76.338 Y92.344 E1.13862
G1 X76.338 Y91.801
G1 X106.105 Y62.035 E1.11825
G1 X105.563 Y62.035
G1 X76.338 Y91.259 E1.09787
G1 X76.338 Y90.717
G1 X105.02 Y62.035 E1.0775
G1 X104.478 Y62.035
G1 X76.338 Y90.174 E1.05712
G1 X76.338 Y89.632
G1 X103.935 Y62.035 E1.03674
G1 X103.393 Y62.035
G1 X76.338 Y89.09 E1.01637
G1 X76.338 Y88.547
G1 X102.851 Y62.035 E.99599
G1 X102.308 Y62.035
G1 X76.338 Y88.005 E.97562
G1 X76.338 Y87.462
G1 X101.766 Y62.035 E.95524
G1 X101.224 Y62.035
G1 X76.338 Y86.92 E.93487
G1 X76.338 Y86.378
G1 X100.681 Y62.035 E.91449
G1 X100.139 Y62.035
G1 X76.338 Y85.835 E.89412
G1 X76.338 Y85.293
G1 X99.596 Y62.035 E.87374
G1 X99.054 Y62.035
G1 X76.338 Y84.751 E.85337
G1 X76.338 Y84.208
G1 X98.512 Y62.035 E.83299
G1 X97.969 Y62.035
G1 X76.338 Y83.666 E.81261
G1 X76.338 Y83.123
G1 X97.427 Y62.035 E.79224
G1 X96.885 Y62.035
G1 X76.338 Y82.581 E.77186
G1 X76.338 Y82.039
G1 X96.342 Y62.035 E.75149
G1 X95.8 Y62.035
G1 X76.338 Y81.496 E.73111
G1 X76.338 Y80.954
G1 X95.257 Y62.035 E.71074
G1 X94.715 Y62.035
G1 X76.338 Y80.412 E.69036
G1 X76.338 Y79.869
G1 X94.173 Y62.035 E.66999
G1 X93.63 Y62.035
G1 X76.338 Y79.327 E.64961
G1 X76.338 Y78.784
G1 X93.088 Y62.035 E.62923
G1 X92.546 Y62.035
G1 X76.338 Y78.242 E.60886
G1 X76.338 Y77.7
G1 X92.003 Y62.035 E.58848
G1 X91.461 Y62.035
G1 X76.338 Y77.157 E.56811
G1 X76.338 Y76.615
G1 X90.918 Y62.035 E.54773
G1 X90.376 Y62.035
G1 X76.338 Y76.073 E.52736
G1 X76.338 Y75.53
G1 X89.834 Y62.035 E.50698
G1 X89.291 Y62.035
G1 X76.338 Y74.988 E.48661
G1 X76.338 Y74.445
G1 X88.749 Y62.035 E.46623
G1 X88.207 Y62.035
G1 X76.338 Y73.903 E.44585
G1 X76.338 Y73.361
G1 X87.664 Y62.035 E.42548
G1 X87.122 Y62.035
G1 X76.338 Y72.818 E.4051
G1 X76.338 Y72.276
G1 X86.579 Y62.035 E.38473
G1 X86.037 Y62.035
G1 X76.338 Y71.734 E.36435
G1 X76.338 Y71.191
G1 X85.495 Y62.035 E.34398
G1 X84.952 Y62.035
G1 X76.338 Y70.649 E.3236
G1 X76.338 Y70.106
G1 X84.41 Y62.035 E.30323
G1 X83.868 Y62.035
G1 X76.338 Y69.564 E.28285
G1 X76.338 Y69.022
G1 X83.325 Y62.035 E.26247
G1 X82.783 Y62.035
G1 X76.338 Y68.479 E.2421
G1 X76.338 Y67.937
G1 X82.24 Y62.035 E.22172
G1 X81.698 Y62.035
G1 X76.338 Y67.395 E.20135
G1 X76.338 Y66.852
G1 X81.156 Y62.035 E.18097
G1 X80.613 Y62.035
G1 X76.338 Y66.31 E.1606
G1 X76.338 Y65.767
G1 X80.071 Y62.035 E.14022
G1 X79.529 Y62.035
G1 X76.338 Y65.225 E.11985
G1 X76.338 Y64.683
G1 X78.986 Y62.035 E.09947
G1 X78.444 Y62.035
G1 X76.338 Y64.14 E.07909
G1 X76.338 Y63.598
G1 X77.901 Y62.035 E.05872
G1 X77.359 Y62.035
G1 X76.338 Y63.056 E.03834
M204 S10000
; WIPE_START
G1 F24000
G1 X77.359 Y62.035 E-.54851
G1 X77.901 Y62.035 E-.2061
G1 X77.891 Y62.045 E-.00539
; WIPE_END
G1 E-.04 F1800
G1 X81.868 Y68.559 Z5.5 F30000
G1 X150.685 Y181.296 Z5.5
G1 Z5.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.234836
G1 F15000
M73 P74 R16
G1 X150.756 Y181.343 E.00117
; LINE_WIDTH: 0.268881
G1 X150.828 Y181.39 E.00138
; LINE_WIDTH: 0.298073
G1 X150.899 Y181.437 E.00155
G1 X150.84 Y181.532 E.00203
; LINE_WIDTH: 0.268787
G1 X150.601 Y181.772 E.00545
; WIPE_START
G1 F24000
G1 X150.84 Y181.532 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X146.824 Y175.042 Z5.5 F30000
G1 X76.884 Y62.016 Z5.5
G1 Z5.1
G1 E.8 F1800
; LINE_WIDTH: 0.351722
G1 F15000
G1 X76.319 Y62.581 E.01744
G1 X151.328 Y62.25 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.501198
G1 F15000
G1 X151.391 Y62.251 E.00203
; WIPE_START
G1 F24000
G1 X151.328 Y62.25 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.328 Y69.882 Z5.5 F30000
G1 X151.327 Y183.25 Z5.5
G1 Z5.1
G1 E.8 F1800
; LINE_WIDTH: 0.501206
G1 F15000
G1 X151.39 Y183.251 E.00203
; WIPE_START
G1 F24000
G1 X151.327 Y183.25 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.15 Y188.296 Z5.5 F30000
G1 Z5.1
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X149.473 Y188.973 E.02543
G1 X148.93 Y188.973
G1 X150.15 Y187.754 E.0458
G1 X150.15 Y187.211
G1 X148.388 Y188.973 E.06618
G1 X147.846 Y188.973
G1 X150.15 Y186.669 E.08656
G1 X150.15 Y186.126
G1 X147.303 Y188.973 E.10693
G1 X146.761 Y188.973
G1 X150.15 Y185.584 E.12731
G1 X150.15 Y185.042
G1 X146.218 Y188.973 E.14768
G1 X145.676 Y188.973
G1 X150.15 Y184.499 E.16806
G1 X150.15 Y183.957
G1 X145.134 Y188.973 E.18844
G1 X144.591 Y188.973
G1 X150.529 Y183.035 E.22307
G1 X149.987 Y183.035
G1 X144.049 Y188.973 E.22307
G1 X143.507 Y188.973
G1 X149.445 Y183.035 E.22307
G1 X148.902 Y183.035
G1 X142.964 Y188.973 E.22307
G1 X142.422 Y188.973
G1 X148.36 Y183.035 E.22307
G1 X147.817 Y183.035
G1 X141.879 Y188.973 E.22307
G1 X141.337 Y188.973
G1 X147.275 Y183.035 E.22307
G1 X146.733 Y183.035
G1 X140.795 Y188.973 E.22307
G1 X140.252 Y188.973
G1 X146.19 Y183.035 E.22307
G1 X145.648 Y183.035
G1 X139.71 Y188.973 E.22307
G1 X139.168 Y188.973
G1 X145.106 Y183.035 E.22307
G1 X144.563 Y183.035
G1 X138.625 Y188.973 E.22307
G1 X138.083 Y188.973
G1 X144.021 Y183.035 E.22307
G1 X143.478 Y183.035
G1 X137.54 Y188.973 E.22307
G1 X136.998 Y188.973
G1 X142.936 Y183.035 E.22307
G1 X142.394 Y183.035
G1 X136.456 Y188.973 E.22307
G1 X135.913 Y188.973
G1 X141.851 Y183.035 E.22307
G1 X141.309 Y183.035
G1 X135.371 Y188.973 E.22307
G1 X134.829 Y188.973
G1 X140.767 Y183.035 E.22307
G1 X140.224 Y183.035
G1 X134.286 Y188.973 E.22307
G1 X133.744 Y188.973
G1 X139.682 Y183.035 E.22307
G1 X139.139 Y183.035
G1 X133.201 Y188.973 E.22307
G1 X132.659 Y188.973
G1 X138.597 Y183.035 E.22307
G1 X138.055 Y183.035
G1 X132.117 Y188.973 E.22307
G1 X131.574 Y188.973
G1 X137.512 Y183.035 E.22307
G1 X136.97 Y183.035
G1 X131.032 Y188.973 E.22307
G1 X130.49 Y188.973
G1 X136.428 Y183.035 E.22307
G1 X135.885 Y183.035
G1 X129.947 Y188.973 E.22307
G1 X129.405 Y188.973
G1 X135.343 Y183.035 E.22307
G1 X134.8 Y183.035
G1 X128.862 Y188.973 E.22307
G1 X128.32 Y188.973
G1 X134.258 Y183.035 E.22307
G1 X133.716 Y183.035
G1 X127.778 Y188.973 E.22307
G1 X127.235 Y188.973
G1 X133.173 Y183.035 E.22307
G1 X132.631 Y183.035
G1 X126.693 Y188.973 E.22307
G1 X126.151 Y188.973
G1 X132.089 Y183.035 E.22307
G1 X131.546 Y183.035
G1 X125.608 Y188.973 E.22307
G1 X125.066 Y188.973
G1 X131.004 Y183.035 E.22307
G1 X130.461 Y183.035
G1 X124.523 Y188.973 E.22307
G1 X123.981 Y188.973
G1 X129.919 Y183.035 E.22307
G1 X129.377 Y183.035
G1 X123.439 Y188.973 E.22307
G1 X122.896 Y188.973
G1 X128.834 Y183.035 E.22307
G1 X128.292 Y183.035
G1 X122.354 Y188.973 E.22307
G1 X121.812 Y188.973
G1 X127.75 Y183.035 E.22307
G1 X127.207 Y183.035
G1 X121.269 Y188.973 E.22307
G1 X120.727 Y188.973
G1 X126.665 Y183.035 E.22307
G1 X126.122 Y183.035
G1 X120.184 Y188.973 E.22307
G1 X119.642 Y188.973
G1 X125.58 Y183.035 E.22307
G1 X125.038 Y183.035
G1 X119.1 Y188.973 E.22307
G1 X118.557 Y188.973
G1 X124.495 Y183.035 E.22307
G1 X123.953 Y183.035
G1 X118.015 Y188.973 E.22307
G1 X117.473 Y188.973
G1 X123.411 Y183.035 E.22307
G1 X122.868 Y183.035
G1 X116.93 Y188.973 E.22307
G1 X116.388 Y188.973
G1 X122.326 Y183.035 E.22307
G1 X121.783 Y183.035
G1 X115.845 Y188.973 E.22307
G1 X115.303 Y188.973
G1 X121.241 Y183.035 E.22307
G1 X120.699 Y183.035
G1 X114.761 Y188.973 E.22307
G1 X114.218 Y188.973
G1 X120.156 Y183.035 E.22307
G1 X119.614 Y183.035
G1 X113.676 Y188.973 E.22307
G1 X113.134 Y188.973
G1 X119.072 Y183.035 E.22307
G1 X118.529 Y183.035
G1 X112.591 Y188.973 E.22307
G1 X112.049 Y188.973
G1 X117.987 Y183.035 E.22307
G1 X117.444 Y183.035
G1 X111.506 Y188.973 E.22307
G1 X110.964 Y188.973
G1 X116.902 Y183.035 E.22307
G1 X116.36 Y183.035
G1 X110.422 Y188.973 E.22307
G1 X109.901 Y188.951
G1 X115.817 Y183.035 E.22227
G1 X115.275 Y183.035
G1 X109.578 Y188.732 E.21402
G1 X109.442 Y188.326
G1 X114.733 Y183.035 E.19876
G1 X114.581 Y182.644
G1 X109.363 Y187.862 E.19604
G1 X109.284 Y187.399
G1 X114.502 Y182.181 E.19604
G1 X114.423 Y181.717
G1 X109.205 Y186.936 E.19604
G1 X109.125 Y186.472
G1 X114.344 Y181.254 E.19604
G1 X114.265 Y180.791
G1 X109.046 Y186.009 E.19604
G1 X108.967 Y185.546
G1 X114.186 Y180.327 E.19604
G1 X114.107 Y179.864
G1 X108.888 Y185.083 E.19604
G1 X108.809 Y184.619
G1 X114.028 Y179.401 E.19604
G1 X113.948 Y178.938
G1 X108.73 Y184.156 E.19604
G1 X108.651 Y183.693
G1 X113.869 Y178.474 E.19604
G1 X113.79 Y178.011
G1 X108.572 Y183.229 E.19604
G1 X108.493 Y182.766
G1 X113.711 Y177.548 E.19604
G1 X113.632 Y177.084
G1 X108.414 Y182.303 E.19604
G1 X108.334 Y181.84
G1 X113.553 Y176.621 E.19604
G1 X113.474 Y176.158
G1 X108.255 Y181.376 E.19604
G1 X108.176 Y180.913
G1 X113.395 Y175.695 E.19604
G1 X113.316 Y175.231
G1 X108.097 Y180.45 E.19604
G1 X108.018 Y179.987
G1 X113.237 Y174.768 E.19604
G1 X113.157 Y174.305
G1 X107.939 Y179.523 E.19604
G1 X107.86 Y179.06
G1 X113.078 Y173.841 E.19604
G1 X112.999 Y173.378
G1 X107.781 Y178.597 E.19604
G1 X107.702 Y178.133
G1 X112.92 Y172.915 E.19604
G1 X112.841 Y172.452
G1 X107.623 Y177.67 E.19604
G1 X107.543 Y177.207
G1 X112.762 Y171.988 E.19604
G1 X112.683 Y171.525
G1 X107.464 Y176.744 E.19604
G1 X107.385 Y176.28
G1 X112.604 Y171.062 E.19604
G1 X112.525 Y170.599
G1 X107.306 Y175.817 E.19604
G1 X107.227 Y175.354
G1 X112.446 Y170.135 E.19604
G1 X112.366 Y169.672
G1 X107.148 Y174.89 E.19604
G1 X107.069 Y174.427
G1 X112.287 Y169.209 E.19604
G1 X112.208 Y168.745
G1 X106.99 Y173.964 E.19604
G1 X106.911 Y173.501
G1 X112.129 Y168.282 E.19604
G1 X112.05 Y167.819
G1 X106.832 Y173.037 E.19604
G1 X106.753 Y172.574
G1 X111.971 Y167.356 E.19604
G1 X111.892 Y166.892
G1 X106.673 Y172.111 E.19604
G1 X106.594 Y171.648
G1 X111.813 Y166.429 E.19604
G1 X111.734 Y165.966
G1 X106.515 Y171.184 E.19604
G1 X106.436 Y170.721
G1 X111.655 Y165.502 E.19604
G1 X111.576 Y165.039
G1 X106.357 Y170.258 E.19604
G1 X106.278 Y169.794
G1 X111.496 Y164.576 E.19604
G1 X111.417 Y164.113
G1 X106.199 Y169.331 E.19604
G1 X106.12 Y168.868
G1 X111.338 Y163.649 E.19604
G1 X111.259 Y163.186
G1 X106.041 Y168.405 E.19604
G1 X105.962 Y167.941
G1 X111.18 Y162.723 E.19604
G1 X111.101 Y162.26
G1 X105.882 Y167.478 E.19604
G1 X105.803 Y167.015
G1 X111.022 Y161.796 E.19604
G1 X110.943 Y161.333
G1 X105.724 Y166.551 E.19604
G1 X105.645 Y166.088
G1 X110.864 Y160.87 E.19604
G1 X110.785 Y160.406
G1 X105.566 Y165.625 E.19604
G1 X105.487 Y165.162
G1 X110.705 Y159.943 E.19604
G1 X110.626 Y159.48
G1 X105.408 Y164.698 E.19604
G1 X105.329 Y164.235
G1 X110.547 Y159.017 E.19604
G1 X110.468 Y158.553
G1 X105.25 Y163.772 E.19604
G1 X105.171 Y163.308
G1 X110.389 Y158.09 E.19604
G1 X110.31 Y157.627
G1 X105.092 Y162.845 E.19604
G1 X105.012 Y162.382
G1 X110.231 Y157.163 E.19604
G1 X110.152 Y156.7
G1 X104.933 Y161.919 E.19604
G1 X104.854 Y161.455
G1 X110.073 Y156.237 E.19604
G1 X109.994 Y155.774
G1 X104.775 Y160.992 E.19604
G1 X104.696 Y160.529
G1 X109.914 Y155.31 E.19604
G1 X109.835 Y154.847
G1 X104.617 Y160.066 E.19604
G1 X104.538 Y159.602
G1 X109.756 Y154.384 E.19604
G1 X109.677 Y153.921
G1 X104.459 Y159.139 E.19604
G1 X104.38 Y158.676
G1 X109.598 Y153.457 E.19604
G1 X109.519 Y152.994
G1 X104.301 Y158.212 E.19604
G1 X104.221 Y157.749
G1 X109.44 Y152.531 E.19604
G1 X109.361 Y152.067
G1 X104.142 Y157.286 E.19604
G1 X104.063 Y156.823
G1 X109.282 Y151.604 E.19604
G1 X109.203 Y151.141
G1 X103.984 Y156.359 E.19604
G1 X103.905 Y155.896
G1 X109.124 Y150.678 E.19604
G1 X109.044 Y150.214
G1 X103.826 Y155.433 E.19604
G1 X103.747 Y154.969
G1 X108.965 Y149.751 E.19604
G1 X108.886 Y149.288
G1 X103.668 Y154.506 E.19604
G1 X103.589 Y154.043
G1 X108.807 Y148.824 E.19604
G1 X108.728 Y148.361
G1 X103.51 Y153.58 E.19604
G1 X103.431 Y153.116
G1 X108.649 Y147.898 E.19604
G1 X108.57 Y147.435
G1 X103.351 Y152.653 E.19604
G1 X103.272 Y152.19
G1 X108.491 Y146.971 E.19604
G1 X108.412 Y146.508
G1 X103.193 Y151.727 E.19604
G1 X103.114 Y151.263
G1 X108.333 Y146.045 E.19604
G1 X108.253 Y145.582
G1 X103.035 Y150.8 E.19604
G1 X102.956 Y150.337
G1 X108.174 Y145.118 E.19604
G1 X108.095 Y144.655
G1 X102.877 Y149.873 E.19604
G1 X102.798 Y149.41
G1 X108.016 Y144.192 E.19604
G1 X107.937 Y143.728
G1 X102.705 Y148.961 E.19656
G1 X102.524 Y148.599
G1 X107.858 Y143.265 E.20037
G1 X107.779 Y142.802
G1 X102.269 Y148.312 E.207
G1 X101.94 Y148.098
G1 X107.7 Y142.339 E.21637
G1 X107.621 Y141.875
G1 X101.509 Y147.987 E.22961
G1 X100.981 Y147.973
G1 X107.422 Y141.531 E.24199
G1 X106.961 Y141.451
G1 X100.438 Y147.973 E.24502
G1 X99.896 Y147.973
G1 X106.418 Y141.451 E.24502
G1 X105.876 Y141.451
G1 X99.354 Y147.973 E.24502
G1 X98.811 Y147.973
G1 X105.333 Y141.451 E.24502
G1 X104.791 Y141.451
G1 X98.269 Y147.973 E.24502
G1 X97.727 Y147.973
G1 X104.249 Y141.451 E.24502
G1 X103.706 Y141.451
G1 X97.184 Y147.973 E.24502
G1 X96.642 Y147.973
G1 X103.164 Y141.451 E.24502
G1 X102.622 Y141.451
G1 X96.099 Y147.973 E.24502
G1 X95.557 Y147.973
G1 X102.079 Y141.451 E.24502
G1 X101.537 Y141.451
G1 X95.015 Y147.973 E.24502
G1 X94.472 Y147.973
G1 X100.994 Y141.451 E.24502
G1 X100.452 Y141.451
G1 X93.93 Y147.973 E.24502
G1 X93.388 Y147.973
G1 X99.91 Y141.451 E.24502
G1 X99.367 Y141.451
G1 X92.845 Y147.973 E.24502
G1 X92.303 Y147.973
G1 X98.825 Y141.451 E.24502
G1 X98.283 Y141.451
G1 X91.76 Y147.973 E.24502
G1 X91.218 Y147.973
G1 X97.74 Y141.451 E.24502
G1 X97.198 Y141.451
G1 X90.676 Y147.973 E.24502
G1 X90.133 Y147.973
G1 X96.655 Y141.451 E.24502
G1 X96.113 Y141.451
G1 X89.591 Y147.973 E.24502
G1 X89.049 Y147.973
G1 X95.571 Y141.451 E.24502
G1 X95.028 Y141.451
G1 X88.506 Y147.973 E.24502
G1 X87.964 Y147.973
G1 X94.486 Y141.451 E.24502
G1 X93.944 Y141.451
G1 X87.421 Y147.973 E.24502
G1 X86.879 Y147.973
G1 X93.401 Y141.451 E.24502
G1 X92.859 Y141.451
G1 X86.337 Y147.973 E.24502
G1 X85.794 Y147.973
G1 X92.316 Y141.451 E.24502
G1 X91.774 Y141.451
G1 X85.252 Y147.973 E.24502
G1 X84.71 Y147.973
G1 X91.232 Y141.451 E.24502
G1 X90.689 Y141.451
G1 X84.167 Y147.973 E.24502
G1 X83.625 Y147.973
G1 X90.147 Y141.451 E.24502
G1 X89.605 Y141.451
G1 X83.082 Y147.973 E.24502
G1 X82.54 Y147.973
G1 X89.062 Y141.451 E.24502
G1 X88.52 Y141.451
G1 X81.998 Y147.973 E.24502
G1 X81.455 Y147.973
G1 X87.977 Y141.451 E.24502
G1 X87.435 Y141.451
M73 P74 R15
G1 X80.913 Y147.973 E.24502
G1 X80.371 Y147.973
G1 X86.893 Y141.451 E.24502
G1 X86.35 Y141.451
G1 X79.828 Y147.973 E.24502
G1 X79.286 Y147.973
G1 X85.808 Y141.451 E.24502
G1 X85.266 Y141.451
G1 X78.743 Y147.973 E.24502
G1 X78.201 Y147.973
G1 X84.723 Y141.451 E.24502
G1 X84.181 Y141.451
G1 X77.659 Y147.973 E.24502
G1 X77.116 Y147.973
G1 X83.638 Y141.451 E.24502
G1 X83.096 Y141.451
G1 X76.574 Y147.973 E.24502
G1 X76.032 Y147.973
G1 X82.554 Y141.451 E.24502
G1 X82.011 Y141.451
G1 X75.489 Y147.973 E.24502
G1 X74.947 Y147.973
G1 X81.469 Y141.451 E.24502
G1 X80.927 Y141.451
G1 X74.404 Y147.973 E.24502
G1 X73.862 Y147.973
G1 X80.384 Y141.451 E.24502
G1 X79.842 Y141.451
G1 X73.32 Y147.973 E.24502
G1 X72.777 Y147.973
G1 X79.299 Y141.451 E.24502
G1 X78.757 Y141.451
G1 X72.235 Y147.973 E.24502
G1 X71.693 Y147.973
G1 X78.215 Y141.451 E.24502
G1 X77.672 Y141.451
G1 X71.15 Y147.973 E.24502
G1 X70.608 Y147.973
G1 X77.13 Y141.451 E.24502
G1 X76.588 Y141.451
G1 X70.08 Y147.958 E.24447
G1 X69.746 Y147.749
G1 X76.045 Y141.451 E.23662
G1 X75.503 Y141.451
G1 X69.618 Y147.335 E.22107
G1 X69.618 Y146.793
G1 X75.056 Y141.355 E.2043
G1 X75.056 Y140.813
G1 X69.618 Y146.251 E.2043
G1 X69.618 Y145.708
G1 X75.056 Y140.27 E.2043
G1 X75.056 Y139.728
G1 X69.618 Y145.166 E.2043
G1 X69.618 Y144.624
G1 X75.056 Y139.185 E.2043
G1 X75.056 Y138.643
G1 X69.618 Y144.081 E.2043
G1 X69.618 Y143.539
G1 X75.056 Y138.101 E.2043
G1 X75.056 Y137.558
G1 X69.618 Y142.996 E.2043
G1 X69.618 Y142.454
G1 X75.056 Y137.016 E.2043
G1 X75.056 Y136.474
G1 X69.618 Y141.912 E.2043
G1 X69.618 Y141.369
G1 X75.056 Y135.931 E.2043
G1 X75.056 Y135.389
G1 X69.618 Y140.827 E.2043
G1 X69.618 Y140.285
G1 X75.056 Y134.846 E.2043
G1 X75.056 Y134.304
G1 X69.618 Y139.742 E.2043
G1 X69.618 Y139.2
G1 X75.056 Y133.762 E.2043
G1 X75.056 Y133.219
G1 X69.618 Y138.657 E.2043
G1 X69.618 Y138.115
G1 X75.056 Y132.677 E.2043
G1 X75.056 Y132.135
G1 X69.618 Y137.573 E.2043
G1 X69.618 Y137.03
G1 X75.056 Y131.592 E.2043
G1 X75.056 Y131.05
G1 X69.618 Y136.488 E.2043
G1 X69.618 Y135.946
G1 X75.056 Y130.507 E.2043
G1 X75.056 Y129.965
G1 X69.618 Y135.403 E.2043
G1 X69.618 Y134.861
G1 X75.056 Y129.423 E.2043
G1 X75.056 Y128.88
G1 X69.618 Y134.318 E.2043
G1 X69.618 Y133.776
G1 X75.056 Y128.338 E.2043
G1 X75.056 Y127.796
G1 X69.618 Y133.234 E.2043
G1 X69.618 Y132.691
G1 X75.056 Y127.253 E.2043
G1 X75.056 Y126.711
G1 X69.618 Y132.149 E.2043
G1 X69.618 Y131.607
G1 X75.056 Y126.168 E.2043
G1 X75.056 Y125.626
G1 X69.618 Y131.064 E.2043
G1 X69.618 Y130.522
G1 X75.056 Y125.084 E.2043
G1 X75.056 Y124.541
G1 X69.618 Y129.979 E.2043
G1 X69.618 Y129.437
G1 X75.056 Y123.999 E.2043
G1 X75.056 Y123.457
G1 X69.618 Y128.895 E.2043
G1 X69.618 Y128.352
G1 X75.056 Y122.914 E.2043
G1 X75.056 Y122.372
G1 X69.618 Y127.81 E.2043
G1 X69.618 Y127.268
G1 X75.056 Y121.829 E.2043
G1 X75.056 Y121.287
G1 X69.618 Y126.725 E.2043
G1 X69.618 Y126.183
G1 X75.056 Y120.745 E.2043
G1 X75.056 Y120.202
G1 X69.618 Y125.64 E.2043
M73 P75 R15
G1 X69.618 Y125.098
G1 X75.056 Y119.66 E.2043
G1 X75.056 Y119.118
G1 X69.618 Y124.556 E.2043
G1 X69.618 Y124.013
G1 X75.056 Y118.575 E.2043
G1 X75.056 Y118.033
G1 X69.618 Y123.471 E.2043
G1 X69.618 Y122.929
G1 X75.056 Y117.49 E.2043
G1 X75.056 Y116.948
G1 X69.618 Y122.386 E.2043
G1 X69.618 Y121.844
G1 X75.056 Y116.406 E.2043
G1 X75.056 Y115.863
G1 X69.618 Y121.301 E.2043
G1 X69.618 Y120.759
G1 X75.056 Y115.321 E.2043
G1 X75.056 Y114.779
G1 X69.618 Y120.217 E.2043
G1 X69.618 Y119.674
G1 X75.056 Y114.236 E.2043
G1 X75.056 Y113.694
G1 X69.618 Y119.132 E.2043
G1 X69.618 Y118.59
G1 X75.056 Y113.151 E.2043
G1 X75.056 Y112.609
G1 X69.618 Y118.047 E.2043
G1 X69.618 Y117.505
G1 X75.056 Y112.067 E.2043
G1 X75.056 Y111.524
G1 X69.618 Y116.962 E.2043
G1 X69.618 Y116.42
G1 X75.056 Y110.982 E.2043
G1 X75.056 Y110.44
G1 X69.618 Y115.878 E.2043
G1 X69.618 Y115.335
G1 X75.056 Y109.897 E.2043
G1 X75.056 Y109.355
G1 X69.618 Y114.793 E.2043
G1 X69.618 Y114.251
G1 X75.056 Y108.812 E.2043
G1 X75.056 Y108.27
G1 X69.618 Y113.708 E.2043
G1 X69.618 Y113.166
G1 X75.056 Y107.728 E.2043
G1 X75.056 Y107.185
G1 X69.618 Y112.623 E.2043
G1 X69.618 Y112.081
G1 X75.056 Y106.643 E.2043
G1 X75.056 Y106.101
G1 X69.618 Y111.539 E.2043
G1 X69.618 Y110.996
G1 X75.056 Y105.558 E.2043
G1 X75.056 Y105.016
G1 X69.618 Y110.454 E.2043
G1 X69.618 Y109.912
G1 X75.056 Y104.473 E.2043
G1 X75.056 Y103.931
G1 X69.618 Y109.369 E.2043
G1 X69.618 Y108.827
G1 X75.056 Y103.389 E.2043
G1 X75.056 Y102.846
G1 X69.618 Y108.284 E.2043
G1 X69.618 Y107.742
G1 X75.056 Y102.304 E.2043
G1 X75.056 Y101.762
G1 X69.618 Y107.2 E.2043
G1 X69.618 Y106.657
G1 X75.056 Y101.219 E.2043
G1 X75.056 Y100.677
G1 X69.618 Y106.115 E.2043
G1 X69.618 Y105.573
G1 X75.056 Y100.134 E.2043
G1 X75.056 Y99.592
G1 X69.618 Y105.03 E.2043
G1 X69.618 Y104.488
G1 X75.056 Y99.05 E.2043
G1 X75.056 Y98.507
G1 X69.618 Y103.945 E.2043
G1 X69.618 Y103.403
G1 X75.056 Y97.965 E.2043
G1 X75.056 Y97.423
G1 X69.618 Y102.861 E.2043
G1 X69.618 Y102.318
G1 X75.056 Y96.88 E.2043
G1 X75.056 Y96.338
G1 X69.618 Y101.776 E.2043
G1 X69.618 Y101.234
G1 X75.056 Y95.795 E.2043
G1 X75.056 Y95.253
G1 X69.618 Y100.691 E.2043
G1 X69.618 Y100.149
G1 X75.056 Y94.711 E.2043
G1 X75.056 Y94.168
G1 X69.618 Y99.606 E.2043
G1 X69.618 Y99.064
G1 X75.056 Y93.626 E.2043
G1 X75.056 Y93.084
G1 X69.618 Y98.522 E.2043
G1 X69.618 Y97.979
G1 X75.056 Y92.541 E.2043
G1 X75.056 Y91.999
G1 X69.618 Y97.437 E.2043
G1 X69.618 Y96.895
G1 X75.056 Y91.456 E.2043
G1 X75.056 Y90.914
G1 X69.618 Y96.352 E.2043
G1 X69.618 Y95.81
G1 X75.056 Y90.372 E.2043
G1 X75.056 Y89.829
G1 X69.618 Y95.267 E.2043
G1 X69.618 Y94.725
G1 X75.056 Y89.287 E.2043
G1 X75.056 Y88.745
G1 X69.618 Y94.183 E.2043
G1 X69.618 Y93.64
G1 X75.056 Y88.202 E.2043
G1 X75.056 Y87.66
G1 X69.618 Y93.098 E.2043
G1 X69.618 Y92.556
G1 X75.056 Y87.117 E.2043
G1 X75.056 Y86.575
G1 X69.618 Y92.013 E.2043
G1 X69.618 Y91.471
G1 X75.056 Y86.033 E.2043
G1 X75.056 Y85.49
G1 X69.618 Y90.928 E.2043
G1 X69.618 Y90.386
G1 X75.056 Y84.948 E.2043
G1 X75.056 Y84.406
G1 X69.618 Y89.844 E.2043
G1 X69.618 Y89.301
G1 X75.056 Y83.863 E.2043
G1 X75.056 Y83.321
G1 X69.618 Y88.759 E.2043
G1 X69.618 Y88.217
G1 X75.056 Y82.778 E.2043
G1 X75.056 Y82.236
G1 X69.618 Y87.674 E.2043
G1 X69.618 Y87.132
G1 X75.056 Y81.694 E.2043
G1 X75.056 Y81.151
G1 X69.618 Y86.589 E.2043
G1 X69.618 Y86.047
G1 X75.056 Y80.609 E.2043
G1 X75.056 Y80.067
G1 X69.618 Y85.505 E.2043
G1 X69.618 Y84.962
G1 X75.056 Y79.524 E.2043
G1 X75.056 Y78.982
G1 X69.618 Y84.42 E.2043
G1 X69.618 Y83.878
G1 X75.056 Y78.439 E.2043
G1 X75.056 Y77.897
G1 X69.618 Y83.335 E.2043
G1 X69.618 Y82.793
G1 X75.056 Y77.355 E.2043
G1 X75.056 Y76.812
G1 X69.618 Y82.25 E.2043
G1 X69.618 Y81.708
G1 X75.056 Y76.27 E.2043
G1 X75.056 Y75.728
G1 X69.618 Y81.166 E.2043
G1 X69.618 Y80.623
G1 X75.056 Y75.185 E.2043
G1 X75.056 Y74.643
G1 X69.618 Y80.081 E.2043
G1 X69.618 Y79.539
G1 X75.056 Y74.1 E.2043
G1 X75.056 Y73.558
G1 X69.618 Y78.996 E.2043
G1 X69.618 Y78.454
G1 X75.056 Y73.016 E.2043
G1 X75.056 Y72.473
G1 X69.618 Y77.911 E.2043
G1 X69.618 Y77.369
G1 X75.056 Y71.931 E.2043
G1 X75.056 Y71.389
G1 X69.618 Y76.827 E.2043
G1 X69.618 Y76.284
G1 X75.056 Y70.846 E.2043
G1 X75.056 Y70.304
G1 X69.618 Y75.742 E.2043
G1 X69.618 Y75.2
G1 X75.056 Y69.761 E.2043
G1 X75.056 Y69.219
G1 X69.618 Y74.657 E.2043
G1 X69.618 Y74.115
G1 X75.056 Y68.677 E.2043
G1 X75.056 Y68.134
G1 X69.618 Y73.572 E.2043
G1 X69.618 Y73.03
G1 X75.056 Y67.592 E.2043
G1 X75.056 Y67.05
G1 X69.618 Y72.488 E.2043
G1 X69.618 Y71.945
G1 X75.056 Y66.507 E.2043
G1 X75.056 Y65.965
G1 X69.618 Y71.403 E.2043
G1 X69.618 Y70.861
G1 X75.056 Y65.422 E.2043
G1 X75.056 Y64.88
G1 X69.618 Y70.318 E.2043
G1 X69.618 Y69.776
G1 X75.056 Y64.338 E.2043
G1 X75.056 Y63.795
G1 X69.618 Y69.233 E.2043
G1 X69.618 Y68.691
G1 X75.056 Y63.253 E.2043
G1 X75.056 Y62.711
G1 X69.618 Y68.149 E.2043
G1 X69.618 Y67.606
G1 X75.056 Y62.168 E.2043
G1 X75.056 Y61.626
G1 X69.618 Y67.064 E.2043
G1 X69.618 Y66.522
G1 X75.056 Y61.083 E.2043
M204 S10000
G1 X150.235 Y60.753 F30000
M204 S2000
G1 F12000
G1 X150.673 Y60.315 E.01645
G1 X150.149 Y60.296
G1 X149.692 Y60.753 E.01717
G1 X149.15 Y60.753
G1 X150.15 Y59.753 E.03755
G1 X150.15 Y59.211
G1 X148.608 Y60.753 E.05793
G1 X148.065 Y60.753
G1 X150.15 Y58.668 E.0783
G1 X150.15 Y58.126
G1 X147.523 Y60.753 E.09868
G1 X146.98 Y60.753
G1 X150.15 Y57.584 E.11906
G1 X150.15 Y57.041
G1 X146.438 Y60.753 E.13943
G1 X145.896 Y60.753
G1 X150.15 Y56.499 E.15981
G1 X150.15 Y55.956
G1 X145.353 Y60.753 E.18018
G1 X144.811 Y60.753
G1 X150.15 Y55.414 E.20056
G1 X150.15 Y54.872
G1 X144.269 Y60.753 E.22093
G1 X143.726 Y60.753
G1 X149.664 Y54.815 E.22307
G1 X149.122 Y54.815
G1 X143.184 Y60.753 E.22307
G1 X142.641 Y60.753
G1 X148.579 Y54.815 E.22307
G1 X148.037 Y54.815
G1 X142.099 Y60.753 E.22307
G1 X141.557 Y60.753
G1 X147.495 Y54.815 E.22307
G1 X146.952 Y54.815
G1 X141.014 Y60.753 E.22307
G1 X140.472 Y60.753
G1 X146.41 Y54.815 E.22307
G1 X145.868 Y54.815
G1 X139.93 Y60.753 E.22307
G1 X139.387 Y60.753
G1 X145.325 Y54.815 E.22307
G1 X144.783 Y54.815
G1 X138.845 Y60.753 E.22307
G1 X138.302 Y60.753
G1 X144.24 Y54.815 E.22307
G1 X143.698 Y54.815
G1 X137.76 Y60.753 E.22307
G1 X137.218 Y60.753
G1 X143.156 Y54.815 E.22307
G1 X142.613 Y54.815
G1 X136.675 Y60.753 E.22307
G1 X136.133 Y60.753
G1 X142.071 Y54.815 E.22307
G1 X141.529 Y54.815
G1 X135.591 Y60.753 E.22307
G1 X135.048 Y60.753
G1 X140.986 Y54.815 E.22307
G1 X140.444 Y54.815
G1 X134.506 Y60.753 E.22307
G1 X133.963 Y60.753
G1 X139.901 Y54.815 E.22307
G1 X139.359 Y54.815
G1 X133.421 Y60.753 E.22307
G1 X132.879 Y60.753
G1 X138.817 Y54.815 E.22307
G1 X138.274 Y54.815
G1 X132.336 Y60.753 E.22307
G1 X131.794 Y60.753
G1 X137.732 Y54.815 E.22307
G1 X137.19 Y54.815
G1 X131.252 Y60.753 E.22307
G1 X130.709 Y60.753
G1 X136.647 Y54.815 E.22307
G1 X136.105 Y54.815
G1 X130.167 Y60.753 E.22307
G1 X129.624 Y60.753
G1 X135.562 Y54.815 E.22307
G1 X135.02 Y54.815
G1 X129.082 Y60.753 E.22307
G1 X128.54 Y60.753
G1 X134.478 Y54.815 E.22307
G1 X133.935 Y54.815
G1 X127.997 Y60.753 E.22307
G1 X127.455 Y60.753
G1 X133.393 Y54.815 E.22307
G1 X132.851 Y54.815
G1 X126.913 Y60.753 E.22307
G1 X126.37 Y60.753
G1 X132.308 Y54.815 E.22307
G1 X131.766 Y54.815
G1 X125.828 Y60.753 E.22307
G1 X125.285 Y60.753
G1 X131.223 Y54.815 E.22307
G1 X130.681 Y54.815
G1 X124.743 Y60.753 E.22307
G1 X124.201 Y60.753
G1 X130.139 Y54.815 E.22307
G1 X129.596 Y54.815
G1 X123.658 Y60.753 E.22307
G1 X123.116 Y60.753
G1 X129.054 Y54.815 E.22307
G1 X128.512 Y54.815
G1 X122.574 Y60.753 E.22307
G1 X122.031 Y60.753
G1 X127.969 Y54.815 E.22307
G1 X127.427 Y54.815
G1 X121.489 Y60.753 E.22307
G1 X120.946 Y60.753
G1 X126.884 Y54.815 E.22307
G1 X126.342 Y54.815
G1 X120.404 Y60.753 E.22307
G1 X119.862 Y60.753
G1 X125.8 Y54.815 E.22307
G1 X125.257 Y54.815
G1 X119.319 Y60.753 E.22307
G1 X118.777 Y60.753
G1 X124.715 Y54.815 E.22307
G1 X124.173 Y54.815
G1 X118.235 Y60.753 E.22307
G1 X117.692 Y60.753
G1 X123.63 Y54.815 E.22307
G1 X123.088 Y54.815
G1 X117.15 Y60.753 E.22307
G1 X116.607 Y60.753
G1 X122.545 Y54.815 E.22307
G1 X122.003 Y54.815
G1 X116.065 Y60.753 E.22307
G1 X115.523 Y60.753
G1 X121.461 Y54.815 E.22307
G1 X120.918 Y54.815
G1 X114.98 Y60.753 E.22307
G1 X114.438 Y60.753
G1 X120.376 Y54.815 E.22307
G1 X119.834 Y54.815
G1 X113.896 Y60.753 E.22307
G1 X113.353 Y60.753
G1 X119.291 Y54.815 E.22307
G1 X118.749 Y54.815
G1 X112.811 Y60.753 E.22307
G1 X112.268 Y60.753
G1 X118.206 Y54.815 E.22307
G1 X117.664 Y54.815
G1 X111.726 Y60.753 E.22307
G1 X111.184 Y60.753
G1 X117.122 Y54.815 E.22307
G1 X116.579 Y54.815
G1 X110.641 Y60.753 E.22307
G1 X110.099 Y60.753
G1 X116.037 Y54.815 E.22307
G1 X115.495 Y54.815
G1 X109.557 Y60.753 E.22307
G1 X109.014 Y60.753
G1 X114.952 Y54.815 E.22307
G1 X114.41 Y54.815
G1 X108.472 Y60.753 E.22307
G1 X107.929 Y60.753
G1 X113.867 Y54.815 E.22307
G1 X113.325 Y54.815
G1 X107.387 Y60.753 E.22307
G1 X106.845 Y60.753
G1 X112.783 Y54.815 E.22307
G1 X112.24 Y54.815
G1 X106.302 Y60.753 E.22307
G1 X105.76 Y60.753
G1 X111.698 Y54.815 E.22307
G1 X111.156 Y54.815
G1 X105.218 Y60.753 E.22307
G1 X104.675 Y60.753
G1 X110.613 Y54.815 E.22307
G1 X110.071 Y54.815
G1 X104.133 Y60.753 E.22307
G1 X103.59 Y60.753
G1 X109.528 Y54.815 E.22307
G1 X108.986 Y54.815
G1 X103.048 Y60.753 E.22307
G1 X102.506 Y60.753
G1 X108.444 Y54.815 E.22307
G1 X107.901 Y54.815
G1 X101.963 Y60.753 E.22307
G1 X101.421 Y60.753
G1 X107.359 Y54.815 E.22307
G1 X106.817 Y54.815
G1 X100.879 Y60.753 E.22307
G1 X100.336 Y60.753
G1 X106.274 Y54.815 E.22307
G1 X105.732 Y54.815
G1 X99.794 Y60.753 E.22307
G1 X99.251 Y60.753
G1 X105.189 Y54.815 E.22307
G1 X104.647 Y54.815
G1 X98.709 Y60.753 E.22307
G1 X98.167 Y60.753
G1 X104.105 Y54.815 E.22307
G1 X103.562 Y54.815
G1 X97.624 Y60.753 E.22307
G1 X97.082 Y60.753
G1 X103.02 Y54.815 E.22307
G1 X102.478 Y54.815
G1 X96.54 Y60.753 E.22307
G1 X95.997 Y60.753
G1 X101.935 Y54.815 E.22307
G1 X101.393 Y54.815
G1 X95.455 Y60.753 E.22307
G1 X94.912 Y60.753
G1 X100.85 Y54.815 E.22307
G1 X100.308 Y54.815
G1 X94.37 Y60.753 E.22307
G1 X93.828 Y60.753
G1 X99.766 Y54.815 E.22307
G1 X99.223 Y54.815
G1 X93.285 Y60.753 E.22307
G1 X92.743 Y60.753
G1 X98.681 Y54.815 E.22307
G1 X98.139 Y54.815
G1 X92.201 Y60.753 E.22307
G1 X91.658 Y60.753
G1 X97.596 Y54.815 E.22307
G1 X97.054 Y54.815
G1 X91.116 Y60.753 E.22307
G1 X90.573 Y60.753
G1 X96.511 Y54.815 E.22307
G1 X95.969 Y54.815
G1 X90.031 Y60.753 E.22307
G1 X89.489 Y60.753
G1 X95.427 Y54.815 E.22307
G1 X94.884 Y54.815
G1 X88.946 Y60.753 E.22307
G1 X88.404 Y60.753
G1 X94.342 Y54.815 E.22307
G1 X93.8 Y54.815
G1 X87.862 Y60.753 E.22307
G1 X87.319 Y60.753
G1 X93.257 Y54.815 E.22307
G1 X92.715 Y54.815
G1 X86.777 Y60.753 E.22307
G1 X86.234 Y60.753
G1 X92.172 Y54.815 E.22307
G1 X91.63 Y54.815
G1 X85.692 Y60.753 E.22307
G1 X85.15 Y60.753
G1 X91.088 Y54.815 E.22307
G1 X90.545 Y54.815
G1 X84.607 Y60.753 E.22307
G1 X84.065 Y60.753
G1 X90.003 Y54.815 E.22307
G1 X89.461 Y54.815
G1 X83.523 Y60.753 E.22307
G1 X82.98 Y60.753
G1 X88.918 Y54.815 E.22307
G1 X88.376 Y54.815
G1 X82.438 Y60.753 E.22307
G1 X81.895 Y60.753
G1 X87.833 Y54.815 E.22307
G1 X87.291 Y54.815
G1 X81.353 Y60.753 E.22307
G1 X80.811 Y60.753
G1 X86.749 Y54.815 E.22307
G1 X86.206 Y54.815
G1 X80.268 Y60.753 E.22307
G1 X79.726 Y60.753
G1 X85.664 Y54.815 E.22307
G1 X85.122 Y54.815
G1 X79.184 Y60.753 E.22307
G1 X78.641 Y60.753
G1 X84.579 Y54.815 E.22307
G1 X84.037 Y54.815
G1 X78.099 Y60.753 E.22307
G1 X77.556 Y60.753
G1 X83.494 Y54.815 E.22307
G1 X82.952 Y54.815
G1 X77.014 Y60.753 E.22307
G1 X76.472 Y60.753
G1 X82.41 Y54.815 E.22307
G1 X81.867 Y54.815
G1 X75.929 Y60.753 E.22307
G1 X75.387 Y60.753
G1 X81.325 Y54.815 E.22307
G1 X80.783 Y54.815
G1 X69.618 Y65.979 E.41942
G1 X69.618 Y65.437
G1 X80.24 Y54.815 E.39904
G1 X79.698 Y54.815
G1 X69.618 Y64.894 E.37867
G1 X69.618 Y64.352
G1 X79.155 Y54.815 E.35829
G1 X78.613 Y54.815
G1 X69.618 Y63.81 E.33792
G1 X69.618 Y63.267
G1 X78.071 Y54.815 E.31754
G1 X77.528 Y54.815
G1 X69.618 Y62.725 E.29717
G1 X69.618 Y62.183
G1 X76.986 Y54.815 E.27679
G1 X76.444 Y54.815
G1 X69.618 Y61.64 E.25641
G1 X69.618 Y61.098
G1 X75.901 Y54.815 E.23604
G1 X75.359 Y54.815
G1 X69.618 Y60.555 E.21566
G1 X69.618 Y60.013
G1 X74.816 Y54.815 E.19529
G1 X74.274 Y54.815
G1 X69.618 Y59.471 E.17491
G1 X69.618 Y58.928
G1 X73.732 Y54.815 E.15454
G1 X73.189 Y54.815
G1 X69.618 Y58.386 E.13416
G1 X69.618 Y57.844
G1 X72.647 Y54.815 E.11379
G1 X72.105 Y54.815
G1 X69.618 Y57.301 E.09341
G1 X69.618 Y56.759
G1 X71.562 Y54.815 E.07303
G1 X71.02 Y54.815
G1 X69.618 Y56.216 E.05266
G1 X69.618 Y55.674
G1 X70.477 Y54.815 E.03228
M204 S10000
; WIPE_START
G1 F24000
G1 X69.618 Y55.674 E-.46182
G1 X69.618 Y56.216 E-.2061
G1 X69.789 Y56.045 E-.09208
; WIPE_END
G1 E-.04 F1800
G1 X71.993 Y63.353 Z5.5 F30000
G1 X109.861 Y188.947 Z5.5
G1 Z5.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.103867
G1 F15000
G1 X109.733 Y188.848 E.00076
; WIPE_START
M73 P76 R15
G1 F24000
G1 X109.861 Y188.947 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X108.529 Y181.432 Z5.5 F30000
G1 X102.788 Y149.044 Z5.5
G1 Z5.1
G1 E.8 F1800
; LINE_WIDTH: 0.0882581
G1 F15000
G1 X102.743 Y149.194 E.00056
; WIPE_START
G1 F24000
G1 X102.788 Y149.044 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X100.29 Y141.832 Z5.5 F30000
G1 X70.141 Y54.804 Z5.5
G1 Z5.1
G1 E.8 F1800
; LINE_WIDTH: 0.214506
G1 F15000
G2 X69.757 Y55.14 I.854 J1.363 E.00632
; LINE_WIDTH: 0.211691
G1 X69.601 Y55.367 E.00335
; WIPE_START
G1 F24000
G1 X69.757 Y55.14 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X77.375 Y55.61 Z5.5 F30000
G1 X150.169 Y60.1 Z5.5
G1 Z5.1
G1 E.8 F1800
; LINE_WIDTH: 0.0903021
G1 F15000
G1 X150.138 Y60.079 E.00014
G1 X150.052 Y60.198 E.00055
G1 X151.241 Y60.296 F30000
; LINE_WIDTH: 0.279802
G1 F15000
G1 X150.933 Y60.423 E.00562
; LINE_WIDTH: 0.273176
G1 X150.828 Y60.359 E.00201
; LINE_WIDTH: 0.254722
G1 X150.724 Y60.296 E.00185
; CHANGE_LAYER
; Z_HEIGHT: 5.27
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X150.828 Y60.359 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 31/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
M106 S242.25
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z5.5 I-.038 J-1.216 P1  F30000
G1 X76.589 Y62.684 Z5.5
G1 Z5.27
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X76.589 Y62.285 E.01141
G1 X156.306 Y62.285 E2.28325
G1 X156.306 Y181.502 E3.41461
G1 X115.941 Y181.502 E1.15613
G1 X108.841 Y139.918 E1.20829
G1 X76.589 Y139.918 E.92378
G1 X76.589 Y62.744 E2.21043
G1 X76.987 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.907 Y62.684 E2.09644
G1 X155.907 Y181.104 E3.14572
G1 X116.277 Y181.104 E1.05274
G1 X109.178 Y139.52 E1.12063
G1 X76.987 Y139.52 E.8551
G1 X76.987 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.987 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.564 Y69.927 Z5.67 F30000
G1 X107.307 Y141.701 Z5.67
G1 Z5.27
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.806 Y141.701 E.93091
G1 X74.806 Y60.502 E2.3257
G1 X158.089 Y60.502 E2.38539
G1 X158.089 Y183.285 E3.51675
G1 X114.437 Y183.285 E1.25028
G1 X107.342 Y141.731 E1.20742
G1 X107.001 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.407 Y142.1 E.86581
G1 X74.407 Y60.104 E2.17814
G1 X158.487 Y60.104 E2.23351
G1 X158.487 Y183.684 E3.28279
G1 X114.1 Y183.684 E1.1791
G1 X107.011 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.011 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X109.178 Y135.761 Z5.67 F30000
G1 X157.197 Y62.077 Z5.67
G1 Z5.27
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.63533
G1 F12376.704
G1 X157.195 Y181.77 E4.96472
G1 X157.197 Y62.077 F30000
; LINE_WIDTH: 0.612549
G1 F12866.153
G1 X157.22 Y61.935 E.00572
; LINE_WIDTH: 0.566987
G1 F13971.159
G1 X157.243 Y61.794 E.00526
; LINE_WIDTH: 0.521425
G1 F15000
G1 X157.266 Y61.652 E.00481
; LINE_WIDTH: 0.462365
G2 X157.288 Y61.303 I-1.074 J-.246 E.01038
; LINE_WIDTH: 0.475863
G1 X157.095 Y61.325 E.00593
; LINE_WIDTH: 0.521425
G1 X156.901 Y61.348 E.00654
; LINE_WIDTH: 0.566988
G1 F13971.125
G1 X156.708 Y61.371 E.00716
; LINE_WIDTH: 0.612551
G1 F12866.113
G1 X156.514 Y61.394 E.00777
G1 X156.619 Y61.46 E.00494
; LINE_WIDTH: 0.566988
G1 F13971.125
G1 X156.723 Y61.526 E.00455
; LINE_WIDTH: 0.521425
G1 F15000
G1 X156.828 Y61.592 E.00416
; LINE_WIDTH: 0.475863
G1 X156.933 Y61.658 E.00377
; LINE_WIDTH: 0.475862
G1 X156.991 Y61.75 E.00331
; LINE_WIDTH: 0.521425
G1 X157.049 Y61.842 E.00365
; LINE_WIDTH: 0.566987
G1 F13971.159
G1 X157.107 Y61.934 E.004
; LINE_WIDTH: 0.589768
G1 F13395.906
G1 X157.165 Y62.026 E.00417
G1 X76.261 Y61.399 F30000
; LINE_WIDTH: 0.635348
G1 F12376.345
G1 X156.454 Y61.394 E3.3264
G1 X75.697 Y62.077 F30000
; LINE_WIDTH: 0.612555
G1 F12866.032
G1 X75.763 Y61.972 E.00494
; LINE_WIDTH: 0.566991
G1 F13971.05
G1 X75.83 Y61.867 E.00455
; LINE_WIDTH: 0.521428
G1 F15000
G1 X75.896 Y61.763 E.00416
; LINE_WIDTH: 0.475864
G1 X75.962 Y61.658 E.00377
; LINE_WIDTH: 0.477157
G1 X76.037 Y61.593 E.00302
; LINE_WIDTH: 0.525307
G1 X76.112 Y61.529 E.00335
; LINE_WIDTH: 0.573457
G1 F13802.81
G1 X76.186 Y61.464 E.00368
; LINE_WIDTH: 0.621607
G1 F12666.977
G1 X76.261 Y61.399 E.00401
G1 X76.15 Y61.375 E.00463
; LINE_WIDTH: 0.573457
G1 F13802.81
G1 X76.038 Y61.351 E.00425
; LINE_WIDTH: 0.525307
G1 F15000
G1 X75.926 Y61.327 E.00387
; LINE_WIDTH: 0.461611
G2 X75.606 Y61.303 I-.216 J.73 E.00952
; LINE_WIDTH: 0.475864
G1 X75.627 Y61.481 E.00547
; LINE_WIDTH: 0.521428
M73 P76 R14
G1 X75.648 Y61.66 E.00604
; LINE_WIDTH: 0.566991
G1 F13971.05
G1 X75.669 Y61.839 E.00661
; LINE_WIDTH: 0.589773
G1 F13395.792
G1 X75.69 Y62.017 E.00689
G1 X75.702 Y140.246 F30000
; LINE_WIDTH: 0.635352
G1 F12376.254
G1 X75.697 Y62.137 E3.23998
G1 X76.38 Y140.81 F30000
; LINE_WIDTH: 0.612551
G1 F12866.111
G1 X76.276 Y140.744 E.00494
; LINE_WIDTH: 0.566989
G1 F13971.116
G1 X76.171 Y140.677 E.00455
; LINE_WIDTH: 0.521426
G1 F15000
G1 X76.066 Y140.611 E.00416
; LINE_WIDTH: 0.475864
G1 X75.962 Y140.545 E.00377
; LINE_WIDTH: 0.477158
G1 X75.897 Y140.47 E.00302
; LINE_WIDTH: 0.525309
G1 X75.832 Y140.395 E.00335
; LINE_WIDTH: 0.57346
G1 F13802.747
G1 X75.767 Y140.32 E.00368
; LINE_WIDTH: 0.621611
G1 F12666.901
G1 X75.702 Y140.246 E.00401
G1 X75.678 Y140.357 E.00463
; LINE_WIDTH: 0.57346
G1 F13802.747
G1 X75.654 Y140.469 E.00425
; LINE_WIDTH: 0.525309
G1 F15000
G1 X75.63 Y140.581 E.00387
; LINE_WIDTH: 0.461612
G2 X75.606 Y140.901 I.73 J.216 E.00952
; LINE_WIDTH: 0.475864
G1 X75.785 Y140.88 E.00547
; LINE_WIDTH: 0.521426
G1 X75.963 Y140.859 E.00604
; LINE_WIDTH: 0.566989
G1 F13971.116
G1 X76.142 Y140.838 E.00661
; LINE_WIDTH: 0.58977
G1 F13395.865
G1 X76.321 Y140.817 E.00689
G1 X107.637 Y141.346 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X107.702 Y141.46 E.0035
G1 X114.756 Y182.776 E1.11341
G1 X114.837 Y182.885 E.00359
G1 X157.612 Y182.885 E1.13628
G1 X157.688 Y182.809 E.00287
G1 X157.688 Y61.033 E3.23485
G2 X157.558 Y60.903 I-.13 J0 E.00544
G1 X75.282 Y60.903 E2.18557
G1 X75.206 Y60.979 E.00287
G1 X75.206 Y141.224 E2.13164
G1 X75.282 Y141.301 E.00287
G1 X107.513 Y141.301 E.85617
G1 X107.58 Y141.325 E.0019
G1 X107.513 Y140.81 F30000
; LINE_WIDTH: 0.635332
G1 F12376.662
G1 X76.44 Y140.81 E1.28886
G1 X108.177 Y140.706 F30000
; LINE_WIDTH: 0.427147
G1 F15000
G1 X108.012 Y140.706 E.00446
; LINE_WIDTH: 0.447966
G1 X107.912 Y140.726 E.00291
; LINE_WIDTH: 0.489603
G1 X107.812 Y140.747 E.0032
; LINE_WIDTH: 0.53124
G1 F14980.601
G1 X107.713 Y140.768 E.0035
; LINE_WIDTH: 0.572877
G1 F13817.749
G1 X107.613 Y140.789 E.00379
; LINE_WIDTH: 0.614514
G1 F12822.423
G1 X107.513 Y140.81 E.00408
G1 X107.588 Y140.858 E.00356
; LINE_WIDTH: 0.572877
G1 F13817.749
G1 X107.662 Y140.906 E.0033
; LINE_WIDTH: 0.53124
G1 F14980.601
G1 X107.737 Y140.954 E.00304
; LINE_WIDTH: 0.489603
G1 F15000
G1 X107.812 Y141.002 E.00279
; LINE_WIDTH: 0.447966
G1 X107.886 Y141.05 E.00253
; LINE_WIDTH: 0.447966
G1 X107.946 Y141.116 E.00253
; LINE_WIDTH: 0.489605
G1 X108.006 Y141.181 E.00279
; LINE_WIDTH: 0.531243
G1 F14980.509
G1 X108.066 Y141.247 E.00304
; LINE_WIDTH: 0.572881
G1 F13817.641
G1 X108.126 Y141.312 E.0033
; LINE_WIDTH: 0.614519
G1 F12822.305
G1 X108.186 Y141.378 E.00356
G1 X108.19 Y141.276 E.00408
; LINE_WIDTH: 0.572881
G1 F13817.641
G1 X108.194 Y141.174 E.00379
; LINE_WIDTH: 0.531243
G1 F14980.509
G1 X108.197 Y141.072 E.0035
; LINE_WIDTH: 0.489605
G1 F15000
G1 X108.201 Y140.97 E.0032
; LINE_WIDTH: 0.447683
G2 X108.187 Y140.765 I-.499 J-.069 E.0059
G1 X108.514 Y140.38 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X108.394 Y140.318 E.00359
G1 X76.38 Y140.318 E.8504
G1 X76.245 Y140.262 E.0039
G1 X76.188 Y140.127 E.0039
G1 X76.188 Y62.077 E2.07332
G1 X76.245 Y61.941 E.0039
G1 X76.38 Y61.885 E.0039
G1 X156.514 Y61.885 E2.12868
G1 X156.65 Y61.941 E.0039
G1 X156.706 Y62.077 E.0039
G1 X156.706 Y181.711 E3.17796
G1 X156.65 Y181.846 E.0039
G3 X156.514 Y181.903 I-.136 J-.136 E.004
G1 X115.765 Y181.903 E1.08246
G1 X115.622 Y181.838 E.00417
G1 X115.576 Y181.743 E.00281
G1 X108.524 Y140.439 E1.11308
G1 X115.092 Y181.826 F30000
; LINE_WIDTH: 0.614127
G1 F12831.008
G1 X115.084 Y181.892 E.00268
; LINE_WIDTH: 0.571769
G1 F13846.357
G1 X115.077 Y181.959 E.00249
; LINE_WIDTH: 0.52941
G1 F15000
G1 X115.069 Y182.026 E.00229
; LINE_WIDTH: 0.487052
G1 X115.062 Y182.092 E.00209
; LINE_WIDTH: 0.444693
G1 X115.054 Y182.159 E.0019
; LINE_WIDTH: 0.411344
G1 X115.047 Y182.225 E.00174
G1 X115.101 Y182.498 E.00721
G1 X115.266 Y182.498 E.00428
; LINE_WIDTH: 0.447958
G1 X115.366 Y182.477 E.00291
; LINE_WIDTH: 0.489596
G1 X115.466 Y182.456 E.0032
; LINE_WIDTH: 0.531235
G1 F14980.736
G1 X115.565 Y182.435 E.0035
; LINE_WIDTH: 0.572874
G1 F13817.818
G1 X115.665 Y182.415 E.00379
; LINE_WIDTH: 0.614513
G1 F12822.442
G1 X115.765 Y182.394 E.00408
G1 X115.69 Y182.346 E.00356
; LINE_WIDTH: 0.572874
G1 F13817.818
G1 X115.616 Y182.298 E.0033
; LINE_WIDTH: 0.531235
G1 F14980.736
G1 X115.541 Y182.249 E.00304
; LINE_WIDTH: 0.489596
G1 F15000
G1 X115.466 Y182.201 E.00279
; LINE_WIDTH: 0.447958
G1 X115.392 Y182.153 E.00253
; LINE_WIDTH: 0.447955
G1 X115.34 Y182.097 E.00219
; LINE_WIDTH: 0.489589
G1 X115.288 Y182.04 E.00241
; LINE_WIDTH: 0.531222
G1 F14981.13
G1 X115.236 Y181.983 E.00263
; LINE_WIDTH: 0.572856
G1 F13818.286
G1 X115.184 Y181.927 E.00285
; LINE_WIDTH: 0.593673
G1 F13302.032
G1 X115.132 Y181.87 E.00296
G1 X115.092 Y181.826 F30000
; LINE_WIDTH: 0.635306
G1 F12377.199
G1 X108.196 Y141.437 E1.69946
; WIPE_START
G1 F24000
G1 X108.533 Y143.408 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X114.463 Y148.214 Z5.67 F30000
G1 X156.633 Y182.389 Z5.67
G1 Z5.27
G1 E.8 F1800
; LINE_WIDTH: 0.635363
G1 F12376.039
G1 X115.825 Y182.394 E1.69276
G1 X157.192 Y181.83 F30000
; LINE_WIDTH: 0.621604
G1 F12667.054
G1 X157.127 Y181.905 E.00401
; LINE_WIDTH: 0.573454
G1 F13802.885
G1 X157.062 Y181.98 E.00368
; LINE_WIDTH: 0.525305
G1 F15000
G1 X156.998 Y182.054 E.00335
; LINE_WIDTH: 0.477156
G1 X156.933 Y182.129 E.00302
; LINE_WIDTH: 0.477156
G1 X156.858 Y182.194 E.00302
; LINE_WIDTH: 0.525307
G1 X156.783 Y182.259 E.00335
; LINE_WIDTH: 0.573457
G1 F13802.82
G1 X156.708 Y182.324 E.00368
; LINE_WIDTH: 0.621607
G1 F12666.98
G1 X156.633 Y182.389 E.00401
G1 X156.745 Y182.413 E.00463
; LINE_WIDTH: 0.573457
G1 F13802.82
G1 X156.857 Y182.437 E.00425
; LINE_WIDTH: 0.525307
G1 F15000
G1 X156.968 Y182.461 E.00387
; LINE_WIDTH: 0.458264
G2 X157.288 Y182.485 I.216 J-.73 E.00945
G1 X157.288 Y182.277 E.00609
; LINE_WIDTH: 0.477156
G1 X157.267 Y182.18 E.00303
; LINE_WIDTH: 0.525305
G1 X157.246 Y182.082 E.00336
; LINE_WIDTH: 0.573454
G1 F13802.885
G1 X157.226 Y181.985 E.00369
; LINE_WIDTH: 0.597529
G1 F13210.601
G1 X157.205 Y181.888 E.00386
; CHANGE_LAYER
; Z_HEIGHT: 5.44
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X157.226 Y181.985 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 32/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
M106 S244.8
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z5.67 I1.011 J-.678 P1  F30000
G1 X76.987 Y62.285 Z5.67
G1 Z5.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X156.306 Y62.285 E2.27184
G1 X156.306 Y181.502 E3.41461
G1 X115.941 Y181.502 E1.15613
G1 X108.841 Y139.918 E1.20829
G1 X76.589 Y139.918 E.92378
G1 X76.589 Y62.285 E2.22356
G1 X76.927 Y62.285 E.0097
G1 X76.987 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.907 Y62.684 E2.09644
G1 X155.907 Y181.104 E3.14572
G1 X116.277 Y181.104 E1.05274
G1 X109.178 Y139.52 E1.12063
G1 X76.987 Y139.52 E.8551
G1 X76.987 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.987 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.566 Y69.926 Z5.84 F30000
G1 X107.342 Y141.73 Z5.84
G1 Z5.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.337 Y141.701 E.00085
G1 X74.806 Y141.701 E.93176
G1 X74.806 Y60.502 E2.3257
G1 X158.089 Y60.502 E2.38539
G1 X158.089 Y183.285 E3.51675
G1 X114.437 Y183.285 E1.25028
G1 X107.352 Y141.789 E1.20572
G1 X107.001 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.407 Y142.1 E.86581
G1 X74.407 Y60.104 E2.17814
G1 X158.487 Y60.104 E2.23351
G1 X158.487 Y183.684 E3.28279
G1 X114.101 Y183.684 E1.1791
G1 X107.011 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.011 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X111.091 Y146.769 Z5.84 F30000
G1 X157.735 Y182.172 Z5.84
G1 Z5.44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X157.735 Y182.932 E.02177
G1 X156.841 Y182.932 E.02561
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X152.577 Y182.081 E.0091
G1 X152.577 Y182.785 E.02017
G1 X152.43 Y182.932 E.00593
G1 X153.173 Y182.932 E.02127
; WIPE_START
G1 F24000
G1 X152.43 Y182.932 E-.28223
G1 X152.577 Y182.785 E-.07868
G1 X152.577 Y182.081 E-.26764
G1 X152.802 Y181.856 E-.12079
G1 X152.83 Y181.856 E-.01066
; WIPE_END
G1 E-.04 F1800
G1 X153.078 Y174.228 Z5.84 F30000
G1 X156.66 Y64.136 Z5.84
G1 Z5.44
G1 E.8 F1800
G1 F16200
G1 X156.66 Y65.79 E.04738
G1 X157.735 Y66.865 E.04356
G1 X157.735 Y67.759 E.02561
G1 X156.66 Y68.835 E.04356
G1 X156.66 Y73.587 E.13611
G1 X157.735 Y74.663 E.04356
G1 X157.735 Y75.557 E.02561
G1 X156.66 Y76.632 E.04356
G1 X156.66 Y81.384 E.13611
G1 X157.735 Y82.46 E.04356
G1 X157.735 Y83.354 E.02561
G1 X156.66 Y84.43 E.04356
G1 X156.66 Y89.182 E.13611
G1 X157.735 Y90.257 E.04356
G1 X157.735 Y91.151 E.02561
G1 X156.66 Y92.227 E.04356
G1 X156.66 Y96.979 E.13611
G1 X157.735 Y98.055 E.04356
G1 X157.735 Y98.949 E.02561
G1 X156.66 Y100.024 E.04356
G1 X156.66 Y104.776 E.13611
G1 X157.735 Y105.852 E.04356
G1 X157.735 Y106.746 E.02561
G1 X156.66 Y107.822 E.04356
G1 X156.66 Y112.574 E.13611
G1 X157.735 Y113.649 E.04356
G1 X157.735 Y114.544 E.02561
G1 X156.66 Y115.619 E.04356
G1 X156.66 Y120.371 E.13611
G1 X157.735 Y121.447 E.04356
G1 X157.735 Y122.341 E.02561
G1 X156.66 Y123.416 E.04356
G1 X156.66 Y128.169 E.13611
G1 X157.735 Y129.244 E.04356
G1 X157.735 Y130.138 E.02561
G1 X156.66 Y131.214 E.04356
G1 X156.66 Y135.966 E.13611
G1 X157.735 Y137.041 E.04356
G1 X157.735 Y137.936 E.02561
G1 X156.66 Y139.011 E.04356
G1 X156.66 Y143.763 E.13611
G1 X157.735 Y144.839 E.04356
G1 X157.735 Y145.733 E.02561
G1 X156.66 Y146.808 E.04356
G1 X156.66 Y151.561 E.13611
G1 X157.735 Y152.636 E.04356
G1 X157.735 Y153.53 E.02561
G1 X156.66 Y154.606 E.04356
G1 X156.66 Y159.358 E.13611
G1 X157.735 Y160.433 E.04356
G1 X157.735 Y161.328 E.02561
G1 X156.66 Y162.403 E.04356
G1 X156.66 Y167.155 E.13611
G1 X157.735 Y168.231 E.04356
G1 X157.735 Y169.125 E.02561
G1 X156.66 Y170.201 E.04356
G1 X156.66 Y174.953 E.13611
G1 X157.735 Y176.028 E.04356
G1 X157.735 Y176.922 E.02561
G1 X156.66 Y177.998 E.04356
G1 X156.66 Y179.652 E.04738
; WIPE_START
G1 F24000
G1 X156.66 Y177.998 E-.62855
G1 X156.904 Y177.753 E-.13145
; WIPE_END
G1 E-.04 F1800
G1 X156.661 Y170.125 Z5.84 F30000
G1 X153.173 Y60.856 Z5.84
G1 Z5.44
G1 E.8 F1800
G1 F16200
G1 X152.43 Y60.856 E.02127
G1 X152.577 Y61.002 E.00593
G1 X152.577 Y61.707 E.02018
G1 X152.802 Y61.932 E.0091
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.735 Y60.856 E.02561
G1 X157.735 Y61.616 E.02177
G1 X76.261 Y61.399 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.635377
G1 F12375.746
G1 X151.625 Y61.394 E3.12625
G1 X75.697 Y62.077 F30000
; LINE_WIDTH: 0.612555
G1 F12866.021
G1 X75.763 Y61.972 E.00494
; LINE_WIDTH: 0.566993
G1 F13971.011
G1 X75.83 Y61.867 E.00455
; LINE_WIDTH: 0.52143
G1 F15000
G1 X75.896 Y61.763 E.00416
; LINE_WIDTH: 0.475868
G1 X75.962 Y61.658 E.00377
; LINE_WIDTH: 0.477165
G1 X76.037 Y61.593 E.00302
; LINE_WIDTH: 0.525321
G1 X76.112 Y61.529 E.00335
; LINE_WIDTH: 0.573478
G1 F13802.291
G1 X76.186 Y61.464 E.00368
; LINE_WIDTH: 0.621634
G1 F12666.397
G1 X76.261 Y61.399 E.00401
G1 X76.15 Y61.375 E.00463
; LINE_WIDTH: 0.573478
G1 F13802.291
G1 X76.038 Y61.351 E.00425
; LINE_WIDTH: 0.525321
G1 F15000
G1 X75.926 Y61.327 E.00387
; LINE_WIDTH: 0.461617
G2 X75.606 Y61.303 I-.216 J.73 E.00952
; LINE_WIDTH: 0.475868
G1 X75.627 Y61.481 E.00547
; LINE_WIDTH: 0.52143
G1 X75.648 Y61.66 E.00604
; LINE_WIDTH: 0.566993
G1 F13971.011
G1 X75.669 Y61.839 E.00661
; LINE_WIDTH: 0.589774
G1 F13395.768
G1 X75.69 Y62.017 E.00689
G1 X75.702 Y140.246 F30000
; LINE_WIDTH: 0.635352
G1 F12376.254
G1 X75.697 Y62.137 E3.23998
G1 X76.38 Y140.81 F30000
; LINE_WIDTH: 0.612551
G1 F12866.111
G1 X76.276 Y140.744 E.00494
; LINE_WIDTH: 0.566989
G1 F13971.116
G1 X76.171 Y140.677 E.00455
; LINE_WIDTH: 0.521426
G1 F15000
G1 X76.066 Y140.611 E.00416
; LINE_WIDTH: 0.475864
G1 X75.962 Y140.545 E.00377
; LINE_WIDTH: 0.477158
G1 X75.897 Y140.47 E.00302
; LINE_WIDTH: 0.525309
G1 X75.832 Y140.395 E.00335
; LINE_WIDTH: 0.57346
G1 F13802.747
G1 X75.767 Y140.32 E.00368
; LINE_WIDTH: 0.621611
G1 F12666.901
G1 X75.702 Y140.246 E.00401
G1 X75.678 Y140.357 E.00463
; LINE_WIDTH: 0.57346
G1 F13802.747
G1 X75.654 Y140.469 E.00425
; LINE_WIDTH: 0.525309
G1 F15000
G1 X75.63 Y140.581 E.00387
; LINE_WIDTH: 0.461612
G2 X75.606 Y140.901 I.73 J.216 E.00952
; LINE_WIDTH: 0.475864
G1 X75.785 Y140.88 E.00547
; LINE_WIDTH: 0.521426
G1 X75.963 Y140.859 E.00604
; LINE_WIDTH: 0.566989
G1 F13971.116
G1 X76.142 Y140.838 E.00661
; LINE_WIDTH: 0.58977
G1 F13395.865
G1 X76.321 Y140.817 E.00689
G1 X107.513 Y140.81 F30000
; LINE_WIDTH: 0.635332
G1 F12376.662
G1 X76.44 Y140.81 E1.28886
G1 X108.177 Y140.706 F30000
; LINE_WIDTH: 0.427147
G1 F15000
G1 X108.012 Y140.706 E.00446
; LINE_WIDTH: 0.447966
G1 X107.912 Y140.726 E.00291
; LINE_WIDTH: 0.489603
G1 X107.812 Y140.747 E.0032
; LINE_WIDTH: 0.53124
G1 F14980.601
G1 X107.713 Y140.768 E.0035
; LINE_WIDTH: 0.572877
G1 F13817.749
G1 X107.613 Y140.789 E.00379
; LINE_WIDTH: 0.614514
G1 F12822.423
G1 X107.513 Y140.81 E.00408
G1 X107.588 Y140.858 E.00356
; LINE_WIDTH: 0.572877
G1 F13817.749
G1 X107.662 Y140.906 E.0033
; LINE_WIDTH: 0.53124
G1 F14980.601
G1 X107.737 Y140.954 E.00304
; LINE_WIDTH: 0.489603
G1 F15000
G1 X107.812 Y141.002 E.00279
; LINE_WIDTH: 0.447966
G1 X107.886 Y141.05 E.00253
; LINE_WIDTH: 0.447966
G1 X107.946 Y141.116 E.00253
; LINE_WIDTH: 0.489605
G1 X108.006 Y141.181 E.00279
; LINE_WIDTH: 0.531243
G1 F14980.509
G1 X108.066 Y141.247 E.00304
; LINE_WIDTH: 0.572881
G1 F13817.641
G1 X108.126 Y141.312 E.0033
; LINE_WIDTH: 0.614519
G1 F12822.305
G1 X108.186 Y141.378 E.00356
G1 X108.19 Y141.276 E.00408
; LINE_WIDTH: 0.572881
G1 F13817.641
G1 X108.194 Y141.174 E.00379
; LINE_WIDTH: 0.531243
G1 F14980.509
G1 X108.197 Y141.072 E.0035
; LINE_WIDTH: 0.489605
G1 F15000
G1 X108.201 Y140.97 E.0032
; LINE_WIDTH: 0.447683
G2 X108.187 Y140.765 I-.499 J-.069 E.0059
G1 X108.514 Y140.38 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X108.394 Y140.318 E.00359
G1 X76.38 Y140.318 E.8504
G1 X76.245 Y140.262 E.0039
G1 X76.188 Y140.127 E.0039
G1 X76.188 Y62.077 E2.07332
G1 X76.245 Y61.941 E.0039
G1 X76.38 Y61.885 E.0039
G1 X151.885 Y61.887 E2.00571
G2 X152.034 Y61.747 I-.01 J-.16 E.0059
G1 X152.178 Y61.615 E.00519
G1 X152.178 Y61.167 E.01188
G1 X151.922 Y60.916 E.00954
G1 X151.685 Y60.901 E.00629
G1 X75.282 Y60.903 E2.02957
G1 X75.206 Y60.979 E.00287
G1 X75.206 Y141.224 E2.13164
G1 X75.282 Y141.301 E.00287
G1 X107.513 Y141.301 E.85617
G3 X107.702 Y141.46 I0 J.192 E.00714
G1 X114.756 Y182.776 E1.11341
G1 X114.837 Y182.885 E.00359
G1 X151.885 Y182.887 E.98415
G2 X152.034 Y182.747 I-.01 J-.16 E.0059
G1 X152.178 Y182.615 E.00519
G1 X152.178 Y182.167 E.01188
G1 X151.922 Y181.916 E.00954
G1 X151.685 Y181.901 E.0063
G1 X115.765 Y181.903 E.95419
G1 X115.622 Y181.838 E.00416
G1 X115.576 Y181.743 E.00281
G1 X108.524 Y140.439 E1.11308
G1 X115.092 Y181.826 F30000
; LINE_WIDTH: 0.635306
G1 F12377.199
G1 X108.196 Y141.437 E1.69946
G1 X115.092 Y181.826 F30000
; LINE_WIDTH: 0.614127
G1 F12831.013
G1 X115.084 Y181.892 E.00268
; LINE_WIDTH: 0.571768
G1 F13846.376
G1 X115.077 Y181.959 E.00248
; LINE_WIDTH: 0.529409
G1 F15000
G1 X115.069 Y182.026 E.00229
; LINE_WIDTH: 0.48705
G1 X115.062 Y182.092 E.00209
; LINE_WIDTH: 0.444691
G1 X115.055 Y182.159 E.0019
; LINE_WIDTH: 0.411347
G1 X115.047 Y182.225 E.00174
G1 X115.101 Y182.498 E.00721
G1 X115.266 Y182.498 E.00428
; LINE_WIDTH: 0.447969
G1 X115.366 Y182.477 E.00291
; LINE_WIDTH: 0.489616
G1 X115.466 Y182.456 E.0032
; LINE_WIDTH: 0.531264
G1 F14979.873
G1 X115.565 Y182.435 E.0035
; LINE_WIDTH: 0.572911
G1 F13816.863
G1 X115.665 Y182.415 E.00379
; LINE_WIDTH: 0.614559
G1 F12821.429
G1 X115.765 Y182.394 E.00408
G1 X115.69 Y182.346 E.00356
; LINE_WIDTH: 0.572911
G1 F13816.863
G1 X115.616 Y182.298 E.0033
; LINE_WIDTH: 0.531264
G1 F14979.873
G1 X115.541 Y182.249 E.00304
; LINE_WIDTH: 0.489616
G1 F15000
G1 X115.466 Y182.201 E.00279
; LINE_WIDTH: 0.447969
G1 X115.392 Y182.153 E.00253
; LINE_WIDTH: 0.447961
G1 X115.34 Y182.097 E.00219
; LINE_WIDTH: 0.489594
G1 X115.288 Y182.04 E.00241
; LINE_WIDTH: 0.531226
G1 F14981.025
G1 X115.236 Y181.983 E.00263
; LINE_WIDTH: 0.572858
G1 F13818.233
G1 X115.184 Y181.927 E.00285
; LINE_WIDTH: 0.593674
G1 F13301.999
G1 X115.132 Y181.87 E.00296
G1 X151.685 Y182.394 F30000
; LINE_WIDTH: 0.638876
G1 F12303.849
G1 X115.825 Y182.394 E1.49625
; CHANGE_LAYER
; Z_HEIGHT: 5.61
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X117.825 Y182.394 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 33/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
M106 S252.45
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z5.84 I1.152 J-.392 P1  F30000
G1 X76.988 Y62.285 Z5.84
G1 Z5.61
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X156.306 Y62.285 E2.27184
G1 X156.306 Y181.502 E3.41461
G1 X115.941 Y181.502 E1.15613
G1 X108.842 Y139.918 E1.20829
G1 X76.589 Y139.918 E.92378
G1 X76.589 Y62.285 E2.22356
G1 X76.928 Y62.285 E.0097
G1 X76.988 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.908 Y62.684 E2.09644
G1 X155.908 Y181.104 E3.14572
G1 X116.278 Y181.104 E1.05274
G1 X109.178 Y139.52 E1.12063
G1 X76.988 Y139.52 E.8551
G1 X76.988 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.988 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.566 Y69.926 Z6.01 F30000
G1 X107.342 Y141.73 Z6.01
G1 Z5.61
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.337 Y141.701 E.00085
G1 X74.806 Y141.701 E.93176
G1 X74.806 Y60.502 E2.3257
G1 X158.089 Y60.502 E2.38539
G1 X158.089 Y183.285 E3.51675
G1 X114.437 Y183.285 E1.25028
G1 X107.352 Y141.789 E1.20572
G1 X107.001 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.408 Y142.1 E.86581
G1 X74.408 Y60.104 E2.17814
G1 X158.488 Y60.104 E2.23351
G1 X158.488 Y183.684 E3.28279
G1 X114.101 Y183.684 E1.1791
G1 X107.011 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.011 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.642 Y149.32 Z6.01 F30000
G1 X110.174 Y156.216 Z6.01
G1 Z5.61
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.896 Y154.585 E.04738
G1 X110.828 Y153.654 E.03775
G1 X110.593 Y152.278 E.03997
G1 X109.277 Y150.962 E.05329
G1 X108.759 Y147.925 E.08825
G1 X109.691 Y146.993 E.03775
M73 P77 R14
G1 X109.969 Y148.624 E.04738
G1 X111.687 Y158.683 F30000
G1 F16200
G1 X111.965 Y160.314 E.04738
G1 X111.033 Y161.246 E.03775
G1 X110.883 Y160.365 E.02559
G1 X112.198 Y161.681 E.05329
G1 X113.102 Y166.974 E.1538
G1 X112.17 Y167.906 E.03775
G1 X112.488 Y169.768 E.0541
G1 X113.804 Y171.083 E.05329
G1 X114.239 Y173.634 E.07412
G1 X113.307 Y174.566 E.03775
G1 X114.093 Y179.17 E.13378
G1 X115.409 Y180.486 E.05329
G1 X115.376 Y180.295 E.00557
G1 X114.444 Y181.226 E.03775
G1 X114.723 Y182.857 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.735 Y182.932 E.02561
G1 X157.735 Y182.172 E.02176
G1 X156.66 Y179.652 F30000
G1 F16200
G1 X156.66 Y177.998 E.04738
G1 X157.735 Y176.922 E.04356
G1 X157.735 Y176.028 E.0256
G1 X156.66 Y174.953 E.04356
G1 X156.66 Y170.2 E.13612
G1 X157.735 Y169.125 E.04356
G1 X157.735 Y168.231 E.0256
G1 X156.66 Y167.156 E.04356
G1 X156.66 Y162.403 E.13612
G1 X157.735 Y161.328 E.04356
G1 X157.735 Y160.434 E.0256
G1 X156.66 Y159.358 E.04356
G1 X156.66 Y154.606 E.13612
G1 X157.735 Y153.53 E.04356
G1 X157.735 Y152.636 E.0256
G1 X156.66 Y151.561 E.04356
G1 X156.66 Y146.808 E.13612
G1 X157.735 Y145.733 E.04356
G1 X157.735 Y144.839 E.0256
G1 X156.66 Y143.763 E.04356
G1 X156.66 Y139.011 E.13612
G1 X157.735 Y137.935 E.04356
G1 X157.735 Y137.042 E.0256
G1 X156.66 Y135.966 E.04356
G1 X156.66 Y131.214 E.13612
G1 X157.735 Y130.138 E.04356
G1 X157.735 Y129.244 E.0256
G1 X156.66 Y128.169 E.04356
G1 X156.66 Y123.416 E.13612
G1 X157.735 Y122.341 E.04356
G1 X157.735 Y121.447 E.0256
G1 X156.66 Y120.371 E.04356
G1 X156.66 Y115.619 E.13612
G1 X157.735 Y114.543 E.04356
G1 X157.735 Y113.649 E.0256
G1 X156.66 Y112.574 E.04356
G1 X156.66 Y107.821 E.13612
G1 X157.735 Y106.746 E.04356
G1 X157.735 Y105.852 E.0256
G1 X156.66 Y104.777 E.04356
G1 X156.66 Y100.024 E.13612
G1 X157.735 Y98.949 E.04356
G1 X157.735 Y98.055 E.0256
G1 X156.66 Y96.979 E.04356
G1 X156.66 Y92.227 E.13612
G1 X157.735 Y91.151 E.04356
G1 X157.735 Y90.257 E.0256
G1 X156.66 Y89.182 E.04356
G1 X156.66 Y84.429 E.13612
G1 X157.735 Y83.354 E.04356
G1 X157.735 Y82.46 E.0256
G1 X156.66 Y81.385 E.04356
G1 X156.66 Y76.632 E.13612
G1 X157.735 Y75.557 E.04356
G1 X157.735 Y74.663 E.0256
G1 X156.66 Y73.587 E.04356
G1 X156.66 Y68.835 E.13612
G1 X157.735 Y67.759 E.04356
G1 X157.735 Y66.865 E.0256
G1 X156.66 Y65.79 E.04356
G1 X156.66 Y64.136 E.04738
G1 X157.735 Y61.616 F30000
G1 F16200
G1 X157.735 Y60.856 E.02176
G1 X156.841 Y60.856 E.02561
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.16 Y60.856 E.00707
G1 X75.16 Y62.263 E.04031
G1 X76.235 Y63.339 E.04356
G1 X76.235 Y63.488 E.00428
G1 X75.16 Y64.564 E.04356
G1 X75.16 Y70.061 E.15745
G1 X76.235 Y71.136 E.04356
G1 X76.235 Y71.286 E.00428
G1 X75.16 Y72.361 E.04356
G1 X75.16 Y77.858 E.15745
G1 X76.235 Y78.934 E.04356
G1 X76.235 Y79.083 E.00428
G1 X75.16 Y80.158 E.04356
G1 X75.16 Y85.655 E.15745
G1 X76.235 Y86.731 E.04356
G1 X76.235 Y86.88 E.00428
G1 X75.16 Y87.956 E.04356
G1 X75.16 Y93.453 E.15745
G1 X76.235 Y94.528 E.04356
G1 X76.235 Y94.678 E.00428
G1 X75.16 Y95.753 E.04356
G1 X75.16 Y101.25 E.15745
G1 X76.235 Y102.326 E.04356
G1 X76.235 Y102.475 E.00428
G1 X75.16 Y103.551 E.04356
G1 X75.16 Y109.048 E.15745
G1 X76.235 Y110.123 E.04356
G1 X76.235 Y110.272 E.00428
G1 X75.16 Y111.348 E.04356
G1 X75.16 Y116.845 E.15745
G1 X76.235 Y117.92 E.04356
G1 X76.235 Y118.07 E.00428
G1 X75.16 Y119.145 E.04356
G1 X75.16 Y124.642 E.15745
G1 X76.235 Y125.718 E.04356
G1 X76.235 Y125.867 E.00428
G1 X75.16 Y126.943 E.04356
G1 X75.16 Y132.44 E.15745
G1 X76.235 Y133.515 E.04356
G1 X76.235 Y133.664 E.00428
G1 X75.16 Y134.74 E.04356
G1 X75.16 Y140.237 E.15745
G1 X76.27 Y141.347 E.04498
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.554 Y140.333 E.04109
G1 X108.988 Y142.875 E.07387
G1 X107.672 Y141.56 E.05329
G1 X107.95 Y143.19 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 5.78
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.672 Y141.56 E-.62855
G1 X107.917 Y141.804 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 34/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z6.01 I1.134 J-.441 P1  F30000
G1 X76.988 Y62.285 Z6.01
G1 Z5.78
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.306 Y62.285 E2.27184
G1 X156.306 Y181.502 E3.41461
G1 X115.941 Y181.502 E1.15613
G1 X108.842 Y139.918 E1.20829
G1 X76.589 Y139.918 E.92378
G1 X76.589 Y62.285 E2.22356
G1 X76.928 Y62.285 E.0097
G1 X76.988 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.908 Y62.684 E2.09644
G1 X155.908 Y181.104 E3.14572
G1 X116.278 Y181.104 E1.05274
G1 X109.178 Y139.52 E1.12063
G1 X76.988 Y139.52 E.8551
G1 X76.988 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.988 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.566 Y69.926 Z6.18 F30000
G1 X107.342 Y141.73 Z6.18
G1 Z5.78
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.337 Y141.701 E.00085
G1 X74.806 Y141.701 E.93176
G1 X74.806 Y60.502 E2.3257
G1 X158.089 Y60.502 E2.38539
G1 X158.089 Y183.285 E3.51675
G1 X114.437 Y183.285 E1.25028
G1 X107.352 Y141.789 E1.20572
G1 X107.001 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.408 Y142.1 E.86581
G1 X74.408 Y60.104 E2.17814
G1 X158.488 Y60.104 E2.23351
G1 X158.488 Y183.684 E3.28279
G1 X114.101 Y183.684 E1.1791
G1 X107.011 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.011 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.95 Y143.19 Z6.18 F30000
G1 Z5.78
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.672 Y141.56 E.04738
G1 X108.988 Y142.876 E.05329
G1 X108.554 Y140.333 E.07388
G1 X107.539 Y141.347 E.04109
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.16 Y140.237 E.04497
G1 X75.16 Y134.74 E.15745
G1 X76.235 Y133.664 E.04356
G1 X76.235 Y133.515 E.00427
G1 X75.16 Y132.44 E.04356
G1 X75.16 Y126.942 E.15745
G1 X76.235 Y125.867 E.04356
G1 X76.235 Y125.718 E.00427
G1 X75.16 Y124.642 E.04356
G1 X75.16 Y119.145 E.15745
G1 X76.235 Y118.07 E.04356
G1 X76.235 Y117.921 E.00427
G1 X75.16 Y116.845 E.04356
G1 X75.16 Y111.348 E.15745
G1 X76.235 Y110.272 E.04356
G1 X76.235 Y110.123 E.00427
G1 X75.16 Y109.048 E.04356
G1 X75.16 Y103.55 E.15745
G1 X76.235 Y102.475 E.04356
G1 X76.235 Y102.326 E.00427
G1 X75.16 Y101.25 E.04356
G1 X75.16 Y95.753 E.15745
G1 X76.235 Y94.678 E.04356
G1 X76.235 Y94.528 E.00427
G1 X75.16 Y93.453 E.04356
G1 X75.16 Y87.956 E.15745
G1 X76.235 Y86.88 E.04356
G1 X76.235 Y86.731 E.00427
G1 X75.16 Y85.656 E.04356
G1 X75.16 Y80.158 E.15745
G1 X76.235 Y79.083 E.04356
G1 X76.235 Y78.934 E.00427
G1 X75.16 Y77.858 E.04356
G1 X75.16 Y72.361 E.15745
G1 X76.235 Y71.285 E.04356
G1 X76.235 Y71.136 E.00427
G1 X75.16 Y70.061 E.04356
G1 X75.16 Y64.564 E.15745
G1 X76.235 Y63.488 E.04356
G1 X76.235 Y63.339 E.00427
G1 X75.16 Y62.264 E.04356
G1 X75.16 Y60.856 E.04031
G1 X75.407 Y60.856 E.00706
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.735 Y60.856 E.02562
G1 X157.735 Y61.616 E.02176
G1 X156.66 Y64.136 F30000
G1 F16200
G1 X156.66 Y65.79 E.04738
G1 X157.735 Y66.865 E.04356
G1 X157.735 Y67.759 E.02559
G1 X156.66 Y68.835 E.04356
G1 X156.66 Y73.587 E.13613
G1 X157.735 Y74.663 E.04356
G1 X157.735 Y75.556 E.02559
G1 X156.66 Y76.632 E.04356
G1 X156.66 Y81.385 E.13613
G1 X157.735 Y82.46 E.04356
G1 X157.735 Y83.354 E.02559
G1 X156.66 Y84.429 E.04356
G1 X156.66 Y89.182 E.13613
G1 X157.735 Y90.258 E.04356
G1 X157.735 Y91.151 E.02559
G1 X156.66 Y92.227 E.04356
G1 X156.66 Y96.979 E.13613
G1 X157.735 Y98.055 E.04356
G1 X157.735 Y98.948 E.02559
G1 X156.66 Y100.024 E.04356
G1 X156.66 Y104.777 E.13613
G1 X157.735 Y105.852 E.04356
G1 X157.735 Y106.746 E.02559
G1 X156.66 Y107.821 E.04356
G1 X156.66 Y112.574 E.13613
G1 X157.735 Y113.65 E.04356
G1 X157.735 Y114.543 E.02559
G1 X156.66 Y115.619 E.04356
G1 X156.66 Y120.371 E.13613
G1 X157.735 Y121.447 E.04356
G1 X157.735 Y122.341 E.02559
G1 X156.66 Y123.416 E.04356
G1 X156.66 Y128.169 E.13613
G1 X157.735 Y129.244 E.04356
G1 X157.735 Y130.138 E.02559
G1 X156.66 Y131.213 E.04356
G1 X156.66 Y135.966 E.13613
G1 X157.735 Y137.042 E.04356
G1 X157.735 Y137.935 E.02559
G1 X156.66 Y139.011 E.04356
G1 X156.66 Y143.764 E.13613
G1 X157.735 Y144.839 E.04356
G1 X157.735 Y145.733 E.02559
G1 X156.66 Y146.808 E.04356
G1 X156.66 Y151.561 E.13613
G1 X157.735 Y152.636 E.04356
G1 X157.735 Y153.53 E.02559
G1 X156.66 Y154.606 E.04356
G1 X156.66 Y159.358 E.13613
G1 X157.735 Y160.434 E.04356
G1 X157.735 Y161.327 E.02559
G1 X156.66 Y162.403 E.04356
G1 X156.66 Y167.156 E.13613
G1 X157.735 Y168.231 E.04356
G1 X157.735 Y169.125 E.02559
G1 X156.66 Y170.2 E.04356
G1 X156.66 Y174.953 E.13613
G1 X157.735 Y176.029 E.04356
G1 X157.735 Y176.922 E.02559
G1 X156.66 Y177.998 E.04356
G1 X156.66 Y179.652 E.04738
G1 X157.735 Y182.172 F30000
G1 F16200
G1 X157.735 Y182.932 E.02176
G1 X156.841 Y182.932 E.02562
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.723 Y182.857 F30000
G1 F16200
G1 X114.444 Y181.226 E.04738
G1 X115.376 Y180.294 E.03775
G1 X115.409 Y180.486 E.00558
G1 X114.093 Y179.171 E.05329
G1 X113.307 Y174.566 E.13379
G1 X114.239 Y173.634 E.03775
G1 X113.804 Y171.084 E.07411
G1 X112.488 Y169.768 E.05329
G1 X112.17 Y167.906 E.05411
G1 X113.102 Y166.974 E.03775
G1 X112.198 Y161.681 E.1538
G1 X110.883 Y160.365 E.05329
G1 X111.033 Y161.246 E.02558
G1 X111.965 Y160.314 E.03775
G1 X111.687 Y158.683 E.04738
G1 X109.969 Y148.624 F30000
G1 F16200
G1 X109.691 Y146.993 E.04738
G1 X108.759 Y147.925 E.03775
G1 X109.277 Y150.963 E.08826
G1 X110.593 Y152.278 E.05329
G1 X110.828 Y153.653 E.03996
G1 X109.896 Y154.585 E.03775
G1 X110.174 Y156.216 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 5.95
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.896 Y154.585 E-.62855
G1 X110.141 Y154.341 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 35/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z6.18 I1.145 J-.412 P1  F30000
G1 X76.988 Y62.285 Z6.18
G1 Z5.95
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.306 Y62.285 E2.27184
G1 X156.306 Y181.502 E3.41461
G1 X115.942 Y181.502 E1.15613
G1 X108.842 Y139.918 E1.20829
G1 X76.589 Y139.918 E.92378
G1 X76.589 Y62.285 E2.22356
G1 X76.928 Y62.285 E.0097
G1 X76.988 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.908 Y62.684 E2.09644
G1 X155.908 Y181.104 E3.14572
G1 X116.278 Y181.104 E1.05274
G1 X109.178 Y139.52 E1.12063
G1 X76.988 Y139.52 E.8551
G1 X76.988 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.988 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.567 Y69.926 Z6.35 F30000
G1 X107.342 Y141.73 Z6.35
G1 Z5.95
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.337 Y141.701 E.00085
G1 X74.806 Y141.701 E.93176
G1 X74.806 Y60.502 E2.3257
G1 X158.089 Y60.502 E2.38539
G1 X158.089 Y183.285 E3.51675
G1 X114.437 Y183.285 E1.25028
G1 X107.353 Y141.789 E1.20572
G1 X107.001 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.408 Y142.1 E.86581
G1 X74.408 Y60.104 E2.17814
G1 X158.488 Y60.104 E2.23351
G1 X158.488 Y183.684 E3.28279
G1 X114.101 Y183.684 E1.1791
G1 X107.011 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.011 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.642 Y149.32 Z6.35 F30000
G1 X110.174 Y156.216 Z6.35
G1 Z5.95
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.896 Y154.585 E.04738
G1 X110.828 Y153.653 E.03775
G1 X110.593 Y152.278 E.03995
G1 X109.278 Y150.963 E.05329
G1 X108.759 Y147.925 E.08827
G1 X109.691 Y146.993 E.03775
G1 X109.969 Y148.624 E.04738
G1 X111.687 Y158.683 F30000
G1 F16200
G1 X111.965 Y160.314 E.04738
G1 X111.033 Y161.245 E.03775
G1 X110.883 Y160.365 E.02557
G1 X112.199 Y161.681 E.05329
G1 X113.102 Y166.974 E.15379
G1 X112.17 Y167.906 E.03775
G1 X112.488 Y169.768 E.05412
G1 X113.804 Y171.084 E.05329
G1 X114.239 Y173.634 E.0741
G1 X113.307 Y174.566 E.03775
G1 X114.094 Y179.171 E.1338
G1 X115.409 Y180.486 E.05329
G1 X115.376 Y180.294 E.00559
G1 X114.445 Y181.226 E.03775
G1 X114.723 Y182.857 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
M73 P77 R13
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.736 Y182.932 E.02562
G1 X157.736 Y182.172 E.02176
G1 X156.66 Y179.652 F30000
G1 F16200
G1 X156.66 Y177.997 E.04738
G1 X157.736 Y176.922 E.04356
G1 X157.736 Y176.029 E.02559
G1 X156.66 Y174.953 E.04356
G1 X156.66 Y170.2 E.13614
G1 X157.736 Y169.125 E.04356
G1 X157.736 Y168.231 E.02559
G1 X156.66 Y167.156 E.04356
G1 X156.66 Y162.403 E.13614
G1 X157.736 Y161.327 E.04356
G1 X157.736 Y160.434 E.02559
G1 X156.66 Y159.358 E.04356
G1 X156.66 Y154.605 E.13614
G1 X157.736 Y153.53 E.04356
G1 X157.736 Y152.637 E.02559
G1 X156.66 Y151.561 E.04356
G1 X156.66 Y146.808 E.13614
G1 X157.736 Y145.733 E.04356
G1 X157.736 Y144.839 E.02559
G1 X156.66 Y143.764 E.04356
G1 X156.66 Y139.011 E.13614
G1 X157.736 Y137.935 E.04356
G1 X157.736 Y137.042 E.02559
G1 X156.66 Y135.966 E.04356
G1 X156.66 Y131.213 E.13614
G1 X157.736 Y130.138 E.04356
G1 X157.736 Y129.244 E.02559
G1 X156.66 Y128.169 E.04356
G1 X156.66 Y123.416 E.13614
G1 X157.736 Y122.34 E.04356
G1 X157.736 Y121.447 E.02559
G1 X156.66 Y120.372 E.04356
G1 X156.66 Y115.619 E.13614
G1 X157.736 Y114.543 E.04356
G1 X157.736 Y113.65 E.02559
G1 X156.66 Y112.574 E.04356
G1 X156.66 Y107.821 E.13614
G1 X157.736 Y106.746 E.04356
G1 X157.736 Y105.852 E.02559
G1 X156.66 Y104.777 E.04356
G1 X156.66 Y100.024 E.13614
G1 X157.736 Y98.948 E.04356
G1 X157.736 Y98.055 E.02559
G1 X156.66 Y96.98 E.04356
G1 X156.66 Y92.226 E.13614
G1 X157.736 Y91.151 E.04356
G1 X157.736 Y90.258 E.02559
G1 X156.66 Y89.182 E.04356
G1 X156.66 Y84.429 E.13614
G1 X157.736 Y83.354 E.04356
G1 X157.736 Y82.46 E.02559
G1 X156.66 Y81.385 E.04356
G1 X156.66 Y76.632 E.13614
G1 X157.736 Y75.556 E.04356
G1 X157.736 Y74.663 E.02559
G1 X156.66 Y73.587 E.04356
G1 X156.66 Y68.834 E.13614
G1 X157.736 Y67.759 E.04356
G1 X157.736 Y66.866 E.02559
G1 X156.66 Y65.79 E.04356
G1 X156.66 Y64.136 E.04738
G1 X157.736 Y61.616 F30000
G1 F16200
G1 X157.736 Y60.856 E.02176
G1 X156.841 Y60.856 E.02562
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
M73 P78 R13
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.16 Y60.856 E.00706
G1 X75.16 Y62.264 E.04032
G1 X76.236 Y63.339 E.04356
G1 X76.236 Y63.488 E.00426
G1 X75.16 Y64.563 E.04356
G1 X75.16 Y70.061 E.15746
G1 X76.236 Y71.137 E.04356
G1 X76.236 Y71.285 E.00426
G1 X75.16 Y72.361 E.04356
G1 X75.16 Y77.858 E.15746
G1 X76.236 Y78.934 E.04356
G1 X76.236 Y79.083 E.00426
G1 X75.16 Y80.158 E.04356
G1 X75.16 Y85.656 E.15746
G1 X76.236 Y86.731 E.04356
G1 X76.236 Y86.88 E.00426
G1 X75.16 Y87.956 E.04356
G1 X75.16 Y93.453 E.15746
G1 X76.236 Y94.529 E.04356
G1 X76.236 Y94.677 E.00426
G1 X75.16 Y95.753 E.04356
G1 X75.16 Y101.25 E.15746
G1 X76.236 Y102.326 E.04356
G1 X76.236 Y102.475 E.00426
G1 X75.16 Y103.55 E.04356
G1 X75.16 Y109.048 E.15746
G1 X76.236 Y110.123 E.04356
G1 X76.236 Y110.272 E.00426
G1 X75.16 Y111.348 E.04356
G1 X75.16 Y116.845 E.15746
G1 X76.236 Y117.921 E.04356
G1 X76.236 Y118.069 E.00426
G1 X75.16 Y119.145 E.04356
G1 X75.16 Y124.643 E.15746
G1 X76.236 Y125.718 E.04356
G1 X76.236 Y125.867 E.00426
G1 X75.16 Y126.942 E.04356
G1 X75.16 Y132.44 E.15746
G1 X76.236 Y133.515 E.04356
G1 X76.236 Y133.664 E.00426
G1 X75.16 Y134.74 E.04356
G1 X75.16 Y140.237 E.15746
G1 X76.27 Y141.347 E.04496
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.554 Y140.333 E.0411
G1 X108.988 Y142.876 E.07389
G1 X107.672 Y141.56 E.05329
G1 X107.951 Y143.19 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 6.12
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.672 Y141.56 E-.62855
G1 X107.917 Y141.805 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 36/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z6.35 I1.134 J-.441 P1  F30000
G1 X76.988 Y62.285 Z6.35
G1 Z6.12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.307 Y62.285 E2.27184
G1 X156.307 Y181.502 E3.41461
G1 X115.942 Y181.502 E1.15613
G1 X108.842 Y139.918 E1.20829
G1 X76.589 Y139.918 E.92378
G1 X76.589 Y62.285 E2.22356
G1 X76.928 Y62.285 E.0097
G1 X76.988 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.908 Y62.684 E2.09644
G1 X155.908 Y181.104 E3.14572
G1 X116.278 Y181.104 E1.05274
G1 X109.178 Y139.52 E1.12063
G1 X76.988 Y139.52 E.8551
G1 X76.988 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.988 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.565 Y69.927 Z6.52 F30000
G1 X107.308 Y141.701 Z6.52
G1 Z6.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.807 Y141.701 E.93091
G1 X74.807 Y60.502 E2.3257
G1 X158.09 Y60.502 E2.38539
G1 X158.09 Y183.285 E3.51675
G1 X114.437 Y183.285 E1.25028
G1 X107.343 Y141.731 E1.20742
G1 X107.001 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.408 Y142.1 E.86581
G1 X74.408 Y60.104 E2.17814
G1 X158.488 Y60.104 E2.23351
G1 X158.488 Y183.684 E3.28279
G1 X114.101 Y183.684 E1.1791
G1 X107.011 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.012 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.951 Y143.191 Z6.52 F30000
G1 Z6.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.672 Y141.56 E.04738
G1 X108.988 Y142.876 E.05329
G1 X108.554 Y140.333 E.0739
G1 X107.539 Y141.347 E.0411
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.16 Y140.237 E.04496
G1 X75.16 Y134.74 E.15747
G1 X76.236 Y133.664 E.04356
G1 X76.236 Y133.516 E.00425
G1 X75.16 Y132.44 E.04356
G1 X75.16 Y126.942 E.15747
G1 X76.236 Y125.867 E.04356
G1 X76.236 Y125.718 E.00425
G1 X75.16 Y124.643 E.04356
G1 X75.16 Y119.145 E.15747
G1 X76.236 Y118.069 E.04356
G1 X76.236 Y117.921 E.00425
G1 X75.16 Y116.845 E.04356
G1 X75.16 Y111.347 E.15747
G1 X76.236 Y110.272 E.04356
G1 X76.236 Y110.123 E.00425
G1 X75.16 Y109.048 E.04356
G1 X75.16 Y103.55 E.15747
G1 X76.236 Y102.475 E.04356
G1 X76.236 Y102.326 E.00425
G1 X75.16 Y101.251 E.04356
G1 X75.16 Y95.753 E.15747
G1 X76.236 Y94.677 E.04356
G1 X76.236 Y94.529 E.00425
G1 X75.16 Y93.453 E.04356
G1 X75.16 Y87.955 E.15747
G1 X76.236 Y86.88 E.04356
G1 X76.236 Y86.731 E.00425
G1 X75.16 Y85.656 E.04356
G1 X75.16 Y80.158 E.15747
G1 X76.236 Y79.083 E.04356
G1 X76.236 Y78.934 E.00425
G1 X75.16 Y77.859 E.04356
G1 X75.16 Y72.361 E.15747
G1 X76.236 Y71.285 E.04356
G1 X76.236 Y71.137 E.00425
G1 X75.16 Y70.061 E.04356
G1 X75.16 Y64.563 E.15747
G1 X76.236 Y63.488 E.04356
G1 X76.236 Y63.339 E.00425
G1 X75.16 Y62.264 E.04356
G1 X75.16 Y60.856 E.04032
G1 X75.407 Y60.856 E.00705
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.736 Y60.856 E.02562
G1 X157.736 Y61.615 E.02175
G1 X156.66 Y64.136 F30000
G1 F16200
G1 X156.66 Y65.79 E.04738
G1 X157.736 Y66.866 E.04356
G1 X157.736 Y67.759 E.02558
G1 X156.66 Y68.834 E.04356
G1 X156.66 Y73.588 E.13615
G1 X157.736 Y74.663 E.04356
G1 X157.736 Y75.556 E.02558
G1 X156.66 Y76.632 E.04356
G1 X156.66 Y81.385 E.13615
G1 X157.736 Y82.46 E.04356
G1 X157.736 Y83.353 E.02558
G1 X156.66 Y84.429 E.04356
G1 X156.66 Y89.182 E.13615
G1 X157.736 Y90.258 E.04356
G1 X157.736 Y91.151 E.02558
G1 X156.66 Y92.226 E.04356
G1 X156.66 Y96.98 E.13615
G1 X157.736 Y98.055 E.04356
G1 X157.736 Y98.948 E.02558
G1 X156.66 Y100.024 E.04356
G1 X156.66 Y104.777 E.13615
G1 X157.736 Y105.853 E.04356
G1 X157.736 Y106.746 E.02558
G1 X156.66 Y107.821 E.04356
G1 X156.66 Y112.574 E.13615
G1 X157.736 Y113.65 E.04356
G1 X157.736 Y114.543 E.02558
G1 X156.66 Y115.618 E.04356
G1 X156.66 Y120.372 E.13615
G1 X157.736 Y121.447 E.04356
G1 X157.736 Y122.34 E.02558
G1 X156.66 Y123.416 E.04356
G1 X156.66 Y128.169 E.13615
G1 X157.736 Y129.245 E.04356
G1 X157.736 Y130.138 E.02558
G1 X156.66 Y131.213 E.04356
G1 X156.66 Y135.966 E.13615
G1 X157.736 Y137.042 E.04356
G1 X157.736 Y137.935 E.02558
G1 X156.66 Y139.01 E.04356
G1 X156.66 Y143.764 E.13615
G1 X157.736 Y144.839 E.04356
G1 X157.736 Y145.732 E.02558
G1 X156.66 Y146.808 E.04356
G1 X156.66 Y151.561 E.13615
G1 X157.736 Y152.637 E.04356
G1 X157.736 Y153.53 E.02558
G1 X156.66 Y154.605 E.04356
G1 X156.66 Y159.359 E.13615
G1 X157.736 Y160.434 E.04356
G1 X157.736 Y161.327 E.02558
G1 X156.66 Y162.403 E.04356
G1 X156.66 Y167.156 E.13615
G1 X157.736 Y168.231 E.04356
G1 X157.736 Y169.124 E.02558
G1 X156.66 Y170.2 E.04356
G1 X156.66 Y174.953 E.13615
G1 X157.736 Y176.029 E.04356
G1 X157.736 Y176.922 E.02558
G1 X156.66 Y177.997 E.04356
G1 X156.66 Y179.651 E.04738
G1 X157.736 Y182.172 F30000
G1 F16200
G1 X157.736 Y182.932 E.02175
G1 X156.841 Y182.932 E.02562
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.723 Y182.857 F30000
G1 F16200
G1 X114.445 Y181.226 E.04738
G1 X115.377 Y180.294 E.03775
G1 X115.409 Y180.487 E.00559
G1 X114.094 Y179.171 E.05329
G1 X113.308 Y174.566 E.13381
G1 X114.24 Y173.634 E.03775
G1 X113.804 Y171.084 E.07409
G1 X112.488 Y169.768 E.05329
G1 X112.17 Y167.906 E.05412
G1 X113.102 Y166.974 E.03775
G1 X112.199 Y161.681 E.15378
G1 X110.883 Y160.366 E.05329
G1 X111.033 Y161.245 E.02556
G1 X111.965 Y160.313 E.03775
G1 X111.687 Y158.683 E.04738
G1 X109.969 Y148.623 F30000
G1 F16200
G1 X109.691 Y146.993 E.04738
G1 X108.759 Y147.925 E.03775
G1 X109.278 Y150.963 E.08827
G1 X110.593 Y152.279 E.05329
G1 X110.828 Y153.653 E.03994
G1 X109.896 Y154.585 E.03775
G1 X110.175 Y156.216 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 6.29
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.896 Y154.585 E-.62855
G1 X110.141 Y154.341 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 37/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z6.52 I1.145 J-.412 P1  F30000
G1 X76.988 Y62.285 Z6.52
G1 Z6.29
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.307 Y62.285 E2.27184
G1 X156.307 Y181.502 E3.41461
G1 X115.942 Y181.502 E1.15613
G1 X108.842 Y139.918 E1.20829
G1 X76.59 Y139.918 E.92378
G1 X76.59 Y62.285 E2.22356
G1 X76.928 Y62.285 E.0097
G1 X76.988 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.908 Y62.684 E2.09644
G1 X155.908 Y181.104 E3.14572
G1 X116.278 Y181.104 E1.05274
G1 X109.178 Y139.52 E1.12063
G1 X76.988 Y139.52 E.8551
G1 X76.988 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.988 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.565 Y69.927 Z6.69 F30000
G1 X107.308 Y141.701 Z6.69
G1 Z6.29
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.807 Y141.701 E.93091
G1 X74.807 Y60.502 E2.3257
G1 X158.09 Y60.502 E2.38539
G1 X158.09 Y183.285 E3.51675
G1 X114.438 Y183.285 E1.25028
G1 X107.343 Y141.731 E1.20742
G1 X107.002 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.408 Y142.1 E.86581
G1 X74.408 Y60.104 E2.17814
G1 X158.488 Y60.104 E2.23351
G1 X158.488 Y183.684 E3.28279
G1 X114.101 Y183.684 E1.1791
G1 X107.012 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.012 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.643 Y149.32 Z6.69 F30000
G1 X110.175 Y156.215 Z6.69
G1 Z6.29
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.896 Y154.585 E.04738
G1 X110.828 Y153.653 E.03775
G1 X110.594 Y152.279 E.03993
G1 X109.278 Y150.963 E.05329
G1 X108.759 Y147.925 E.08828
G1 X109.691 Y146.993 E.03775
G1 X109.97 Y148.623 E.04738
G1 X111.687 Y158.683 F30000
G1 F16200
G1 X111.965 Y160.313 E.04738
G1 X111.033 Y161.245 E.03775
G1 X110.883 Y160.366 E.02555
G1 X112.199 Y161.681 E.05329
G1 X113.103 Y166.974 E.15377
G1 X112.171 Y167.905 E.03775
G1 X112.489 Y169.768 E.05413
G1 X113.804 Y171.084 E.05329
G1 X114.24 Y173.634 E.07408
G1 X113.308 Y174.566 E.03775
G1 X114.094 Y179.171 E.13382
G1 X115.41 Y180.487 E.05329
G1 X115.377 Y180.294 E.0056
G1 X114.445 Y181.226 E.03775
G1 X114.723 Y182.856 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.736 Y182.932 E.02563
G1 X157.736 Y182.172 E.02175
G1 X156.66 Y179.651 F30000
G1 F16200
G1 X156.66 Y177.997 E.04738
G1 X157.736 Y176.922 E.04356
G1 X157.736 Y176.029 E.02557
G1 X156.66 Y174.953 E.04356
G1 X156.66 Y170.2 E.13615
G1 X157.736 Y169.124 E.04356
G1 X157.736 Y168.232 E.02557
G1 X156.66 Y167.156 E.04356
G1 X156.66 Y162.402 E.13615
G1 X157.736 Y161.327 E.04356
G1 X157.736 Y160.434 E.02557
G1 X156.66 Y159.359 E.04356
G1 X156.66 Y154.605 E.13615
G1 X157.736 Y153.53 E.04356
G1 X157.736 Y152.637 E.02557
G1 X156.66 Y151.561 E.04356
G1 X156.66 Y146.808 E.13615
G1 X157.736 Y145.732 E.04356
G1 X157.736 Y144.839 E.02557
G1 X156.66 Y143.764 E.04356
G1 X156.66 Y139.01 E.13615
G1 X157.736 Y137.935 E.04356
G1 X157.736 Y137.042 E.02557
G1 X156.66 Y135.967 E.04356
G1 X156.66 Y131.213 E.13615
G1 X157.736 Y130.138 E.04356
G1 X157.736 Y129.245 E.02557
G1 X156.66 Y128.169 E.04356
G1 X156.66 Y123.416 E.13615
G1 X157.736 Y122.34 E.04356
G1 X157.736 Y121.447 E.02557
G1 X156.66 Y120.372 E.04356
G1 X156.66 Y115.618 E.13615
G1 X157.736 Y114.543 E.04356
G1 X157.736 Y113.65 E.02557
G1 X156.66 Y112.575 E.04356
G1 X156.66 Y107.821 E.13615
G1 X157.736 Y106.745 E.04356
G1 X157.736 Y105.853 E.02557
G1 X156.66 Y104.777 E.04356
G1 X156.66 Y100.024 E.13615
G1 X157.736 Y98.948 E.04356
G1 X157.736 Y98.055 E.02557
G1 X156.66 Y96.98 E.04356
G1 X156.66 Y92.226 E.13615
G1 X157.736 Y91.151 E.04356
G1 X157.736 Y90.258 E.02557
G1 X156.66 Y89.182 E.04356
G1 X156.66 Y84.429 E.13615
G1 X157.736 Y83.353 E.04356
G1 X157.736 Y82.461 E.02557
G1 X156.66 Y81.385 E.04356
G1 X156.66 Y76.631 E.13615
G1 X157.736 Y75.556 E.04356
G1 X157.736 Y74.663 E.02557
G1 X156.66 Y73.588 E.04356
G1 X156.66 Y68.834 E.13615
G1 X157.736 Y67.759 E.04356
G1 X157.736 Y66.866 E.02557
G1 X156.66 Y65.79 E.04356
G1 X156.66 Y64.136 E.04738
G1 X157.736 Y61.615 F30000
G1 F16200
G1 X157.736 Y60.856 E.02175
G1 X156.841 Y60.856 E.02563
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.16 Y60.856 E.00705
G1 X75.16 Y62.264 E.04033
G1 X76.236 Y63.339 E.04356
G1 X76.236 Y63.488 E.00424
G1 X75.16 Y64.563 E.04356
G1 X75.16 Y70.061 E.15748
G1 X76.236 Y71.137 E.04356
G1 X76.236 Y71.285 E.00424
G1 X75.16 Y72.36 E.04356
G1 X75.16 Y77.859 E.15748
G1 X76.236 Y78.934 E.04356
G1 X76.236 Y79.082 E.00424
G1 X75.16 Y80.158 E.04356
G1 X75.16 Y85.656 E.15748
G1 X76.236 Y86.732 E.04356
G1 X76.236 Y86.88 E.00424
G1 X75.16 Y87.955 E.04356
G1 X75.16 Y93.453 E.15748
G1 X76.236 Y94.529 E.04356
G1 X76.236 Y94.677 E.00424
G1 X75.16 Y95.753 E.04356
G1 X75.16 Y101.251 E.15748
G1 X76.236 Y102.326 E.04356
G1 X76.236 Y102.474 E.00424
G1 X75.16 Y103.55 E.04356
G1 X75.16 Y109.048 E.15748
G1 X76.236 Y110.124 E.04356
G1 X76.236 Y110.272 E.00424
G1 X75.16 Y111.347 E.04356
G1 X75.16 Y116.846 E.15748
G1 X76.236 Y117.921 E.04356
G1 X76.236 Y118.069 E.00424
G1 X75.16 Y119.145 E.04356
G1 X75.16 Y124.643 E.15748
G1 X76.236 Y125.718 E.04356
G1 X76.236 Y125.867 E.00424
G1 X75.16 Y126.942 E.04356
G1 X75.16 Y132.44 E.15748
G1 X76.236 Y133.516 E.04356
G1 X76.236 Y133.664 E.00424
G1 X75.16 Y134.739 E.04356
G1 X75.16 Y140.238 E.15748
G1 X76.27 Y141.347 E.04495
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.554 Y140.333 E.04111
G1 X108.988 Y142.876 E.0739
G1 X107.673 Y141.56 E.05329
G1 X107.951 Y143.191 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 6.46
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.673 Y141.56 E-.62855
G1 X107.917 Y141.805 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 38/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z6.69 I1.134 J-.441 P1  F30000
G1 X76.988 Y62.285 Z6.69
G1 Z6.46
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.307 Y62.285 E2.27184
G1 X156.307 Y181.502 E3.41461
G1 X115.942 Y181.502 E1.15613
G1 X108.842 Y139.918 E1.20829
G1 X76.59 Y139.918 E.92378
G1 X76.59 Y62.285 E2.22356
G1 X76.928 Y62.285 E.0097
G1 X76.988 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.908 Y62.684 E2.09644
G1 X155.908 Y181.104 E3.14572
G1 X116.278 Y181.104 E1.05274
G1 X109.179 Y139.52 E1.12063
G1 X76.988 Y139.52 E.8551
G1 X76.988 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.988 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.567 Y69.926 Z6.86 F30000
G1 X107.343 Y141.73 Z6.86
G1 Z6.46
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.338 Y141.701 E.00085
G1 X74.807 Y141.701 E.93176
G1 X74.807 Y60.502 E2.3257
G1 X158.09 Y60.502 E2.38539
G1 X158.09 Y183.285 E3.51675
G1 X114.438 Y183.285 E1.25028
G1 X107.353 Y141.789 E1.20572
G1 X107.002 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.408 Y142.1 E.86581
G1 X74.408 Y60.104 E2.17814
G1 X158.488 Y60.104 E2.23351
G1 X158.488 Y183.684 E3.28279
G1 X114.101 Y183.684 E1.1791
G1 X107.012 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.012 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.951 Y143.191 Z6.86 F30000
G1 Z6.46
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.673 Y141.561 E.04738
G1 X108.988 Y142.876 E.05329
G1 X108.554 Y140.332 E.07391
G1 X107.539 Y141.347 E.04111
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.161 Y140.238 E.04495
G1 X75.161 Y134.739 E.15749
G1 X76.236 Y133.664 E.04356
G1 X76.236 Y133.516 E.00424
G1 X75.161 Y132.44 E.04356
G1 X75.161 Y126.942 E.15749
G1 X76.236 Y125.866 E.04356
G1 X76.236 Y125.719 E.00424
G1 X75.161 Y124.643 E.04356
G1 X75.161 Y119.145 E.15749
G1 X76.236 Y118.069 E.04356
G1 X76.236 Y117.921 E.00424
G1 X75.161 Y116.846 E.04356
G1 X75.161 Y111.347 E.15749
G1 X76.236 Y110.272 E.04356
G1 X76.236 Y110.124 E.00424
G1 X75.161 Y109.048 E.04356
G1 X75.161 Y103.55 E.15749
G1 X76.236 Y102.474 E.04356
G1 X76.236 Y102.326 E.00424
M73 P79 R13
G1 X75.161 Y101.251 E.04356
G1 X75.161 Y95.752 E.15749
G1 X76.236 Y94.677 E.04356
G1 X76.236 Y94.529 E.00424
G1 X75.161 Y93.454 E.04356
G1 X75.161 Y87.955 E.15749
G1 X76.236 Y86.88 E.04356
G1 X76.236 Y86.732 E.00424
G1 X75.161 Y85.656 E.04356
G1 X75.161 Y80.158 E.15749
G1 X76.236 Y79.082 E.04356
G1 X76.236 Y78.934 E.00424
G1 X75.161 Y77.859 E.04356
G1 X75.161 Y72.36 E.15749
G1 X76.236 Y71.285 E.04356
G1 X76.236 Y71.137 E.00424
G1 X75.161 Y70.061 E.04356
G1 X75.161 Y64.563 E.15749
G1 X76.236 Y63.487 E.04356
G1 X76.236 Y63.34 E.00424
G1 X75.161 Y62.264 E.04356
G1 X75.161 Y60.856 E.04033
G1 X75.407 Y60.856 E.00705
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.736 Y60.856 E.02563
G1 X157.736 Y61.615 E.02174
G1 X156.661 Y64.136 F30000
G1 F16200
G1 X156.661 Y65.791 E.04738
G1 X157.736 Y66.866 E.04356
G1 X157.736 Y67.758 E.02556
G1 X156.661 Y68.834 E.04356
G1 X156.661 Y73.588 E.13616
G1 X157.736 Y74.663 E.04356
G1 X157.736 Y75.556 E.02556
G1 X156.661 Y76.631 E.04356
G1 X156.661 Y81.385 E.13616
G1 X157.736 Y82.461 E.04356
G1 X157.736 Y83.353 E.02556
G1 X156.661 Y84.429 E.04356
G1 X156.661 Y89.183 E.13616
G1 X157.736 Y90.258 E.04356
G1 X157.736 Y91.151 E.02556
G1 X156.661 Y92.226 E.04356
G1 X156.661 Y96.98 E.13616
G1 X157.736 Y98.055 E.04356
G1 X157.736 Y98.948 E.02556
G1 X156.661 Y100.023 E.04356
G1 X156.661 Y104.777 E.13616
G1 X157.736 Y105.853 E.04356
G1 X157.736 Y106.745 E.02556
G1 X156.661 Y107.821 E.04356
G1 X156.661 Y112.575 E.13616
G1 X157.736 Y113.65 E.04356
G1 X157.736 Y114.543 E.02556
G1 X156.661 Y115.618 E.04356
G1 X156.661 Y120.372 E.13616
G1 X157.736 Y121.448 E.04356
G1 X157.736 Y122.34 E.02556
G1 X156.661 Y123.415 E.04356
G1 X156.661 Y128.169 E.13616
G1 X157.736 Y129.245 E.04356
G1 X157.736 Y130.137 E.02556
G1 X156.661 Y131.213 E.04356
G1 X156.661 Y135.967 E.13616
G1 X157.736 Y137.042 E.04356
G1 X157.736 Y137.935 E.02556
G1 X156.661 Y139.01 E.04356
G1 X156.661 Y143.764 E.13616
G1 X157.736 Y144.84 E.04356
G1 X157.736 Y145.732 E.02556
G1 X156.661 Y146.808 E.04356
G1 X156.661 Y151.562 E.13616
G1 X157.736 Y152.637 E.04356
G1 X157.736 Y153.529 E.02556
G1 X156.661 Y154.605 E.04356
G1 X156.661 Y159.359 E.13616
G1 X157.736 Y160.434 E.04356
G1 X157.736 Y161.327 E.02556
G1 X156.661 Y162.402 E.04356
G1 X156.661 Y167.156 E.13616
G1 X157.736 Y168.232 E.04356
G1 X157.736 Y169.124 E.02556
G1 X156.661 Y170.2 E.04356
G1 X156.661 Y174.954 E.13616
G1 X157.736 Y176.029 E.04356
G1 X157.736 Y176.922 E.02556
G1 X156.661 Y177.997 E.04356
G1 X156.661 Y179.651 E.04738
G1 X157.736 Y182.172 F30000
G1 F16200
G1 X157.736 Y182.932 E.02174
G1 X156.841 Y182.932 E.02563
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.723 Y182.856 F30000
G1 F16200
G1 X114.445 Y181.226 E.04738
G1 X115.377 Y180.294 E.03775
G1 X115.41 Y180.487 E.00561
G1 X114.094 Y179.171 E.05329
G1 X113.308 Y174.566 E.13383
G1 X114.24 Y173.634 E.03775
G1 X113.804 Y171.084 E.07407
G1 X112.489 Y169.769 E.05329
G1 X112.171 Y167.905 E.05414
G1 X113.103 Y166.973 E.03775
G1 X112.199 Y161.682 E.15376
G1 X110.883 Y160.366 E.05329
G1 X111.034 Y161.245 E.02555
G1 X111.966 Y160.313 E.03775
G1 X111.687 Y158.683 E.04738
G1 X109.97 Y148.623 F30000
G1 F16200
G1 X109.691 Y146.993 E.04738
G1 X108.759 Y147.925 E.03775
G1 X109.278 Y150.963 E.08829
G1 X110.594 Y152.279 E.05329
G1 X110.828 Y153.653 E.03992
G1 X109.896 Y154.585 E.03775
G1 X110.175 Y156.215 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 6.63
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.896 Y154.585 E-.62855
G1 X110.141 Y154.34 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 39/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z6.86 I1.145 J-.412 P1  F30000
G1 X76.988 Y62.285 Z6.86
G1 Z6.63
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.307 Y62.285 E2.27184
G1 X156.307 Y181.502 E3.41461
G1 X115.942 Y181.502 E1.15613
G1 X108.842 Y139.918 E1.20829
G1 X76.59 Y139.918 E.92378
G1 X76.59 Y62.285 E2.22356
G1 X76.928 Y62.285 E.0097
G1 X76.988 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.908 Y62.684 E2.09644
G1 X155.908 Y181.104 E3.14572
G1 X116.278 Y181.104 E1.05274
G1 X109.179 Y139.52 E1.12063
G1 X76.988 Y139.52 E.8551
G1 X76.988 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.988 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.567 Y69.926 Z7.03 F30000
G1 X107.343 Y141.73 Z7.03
G1 Z6.63
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.338 Y141.701 E.00085
G1 X74.807 Y141.701 E.93176
G1 X74.807 Y60.502 E2.3257
G1 X158.09 Y60.502 E2.38539
G1 X158.09 Y183.285 E3.51675
G1 X114.438 Y183.285 E1.25028
G1 X107.353 Y141.789 E1.20572
G1 X107.002 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.408 Y142.1 E.86581
G1 X74.408 Y60.104 E2.17814
G1 X158.488 Y60.104 E2.23351
G1 X158.488 Y183.684 E3.28279
G1 X114.102 Y183.684 E1.1791
G1 X107.012 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.012 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.643 Y149.32 Z7.03 F30000
G1 X110.175 Y156.215 Z7.03
G1 Z6.63
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.897 Y154.585 E.04738
G1 X110.829 Y153.653 E.03775
G1 X110.594 Y152.279 E.03992
G1 X109.278 Y150.963 E.05329
G1 X108.759 Y147.925 E.0883
G1 X109.691 Y146.993 E.03775
G1 X109.97 Y148.623 E.04738
G1 X111.687 Y158.683 F30000
G1 F16200
G1 X111.966 Y160.313 E.04738
G1 X111.034 Y161.245 E.03775
G1 X110.884 Y160.366 E.02554
G1 X112.199 Y161.682 E.05329
G1 X113.103 Y166.973 E.15375
G1 X112.171 Y167.905 E.03775
G1 X112.489 Y169.769 E.05415
G1 X113.805 Y171.084 E.05329
G1 X114.24 Y173.634 E.07407
G1 X113.308 Y174.565 E.03775
G1 X114.094 Y179.172 E.13384
G1 X115.41 Y180.487 E.05329
G1 X115.377 Y180.294 E.00562
G1 X114.445 Y181.226 E.03775
G1 X114.723 Y182.856 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.736 Y182.932 E.02564
G1 X157.736 Y182.173 E.02174
G1 X156.661 Y179.651 F30000
G1 F16200
G1 X156.661 Y177.997 E.04738
G1 X157.736 Y176.921 E.04356
G1 X157.736 Y176.029 E.02555
G1 X156.661 Y174.954 E.04356
G1 X156.661 Y170.2 E.13617
G1 X157.736 Y169.124 E.04356
G1 X157.736 Y168.232 E.02555
G1 X156.661 Y167.156 E.04356
G1 X156.661 Y162.402 E.13617
G1 X157.736 Y161.327 E.04356
G1 X157.736 Y160.435 E.02555
G1 X156.661 Y159.359 E.04356
G1 X156.661 Y154.605 E.13617
G1 X157.736 Y153.529 E.04356
G1 X157.736 Y152.637 E.02555
G1 X156.661 Y151.562 E.04356
G1 X156.661 Y146.807 E.13617
G1 X157.736 Y145.732 E.04356
G1 X157.736 Y144.84 E.02555
G1 X156.661 Y143.764 E.04356
G1 X156.661 Y139.01 E.13617
G1 X157.736 Y137.935 E.04356
G1 X157.736 Y137.042 E.02555
G1 X156.661 Y135.967 E.04356
G1 X156.661 Y131.213 E.13617
G1 X157.736 Y130.137 E.04356
G1 X157.736 Y129.245 E.02555
G1 X156.661 Y128.17 E.04356
G1 X156.661 Y123.415 E.13617
G1 X157.736 Y122.34 E.04356
G1 X157.736 Y121.448 E.02555
G1 X156.661 Y120.372 E.04356
G1 X156.661 Y115.618 E.13617
G1 X157.736 Y114.542 E.04356
G1 X157.736 Y113.65 E.02555
G1 X156.661 Y112.575 E.04356
G1 X156.661 Y107.821 E.13617
G1 X157.736 Y106.745 E.04356
G1 X157.736 Y105.853 E.02555
G1 X156.661 Y104.777 E.04356
G1 X156.661 Y100.023 E.13617
G1 X157.736 Y98.948 E.04356
G1 X157.736 Y98.056 E.02555
G1 X156.661 Y96.98 E.04356
G1 X156.661 Y92.226 E.13617
G1 X157.736 Y91.15 E.04356
G1 X157.736 Y90.258 E.02555
G1 X156.661 Y89.183 E.04356
G1 X156.661 Y84.429 E.13617
G1 X157.736 Y83.353 E.04356
G1 X157.736 Y82.461 E.02555
G1 X156.661 Y81.385 E.04356
G1 X156.661 Y76.631 E.13617
G1 X157.736 Y75.556 E.04356
G1 X157.736 Y74.664 E.02555
G1 X156.661 Y73.588 E.04356
G1 X156.661 Y68.834 E.13617
G1 X157.736 Y67.758 E.04356
G1 X157.736 Y66.866 E.02555
G1 X156.661 Y65.791 E.04356
G1 X156.661 Y64.137 E.04738
G1 X157.736 Y61.615 F30000
G1 F16200
G1 X157.736 Y60.856 E.02174
G1 X156.841 Y60.856 E.02564
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.161 Y60.856 E.00704
G1 X75.161 Y62.264 E.04033
G1 X76.236 Y63.34 E.04356
G1 X76.236 Y63.487 E.00423
G1 X75.161 Y64.563 E.04356
G1 X75.161 Y70.062 E.1575
G1 X76.236 Y71.137 E.04356
G1 X76.236 Y71.285 E.00423
G1 X75.161 Y72.36 E.04356
G1 X75.161 Y77.859 E.1575
G1 X76.236 Y78.934 E.04356
G1 X76.236 Y79.082 E.00423
G1 X75.161 Y80.158 E.04356
G1 X75.161 Y85.656 E.1575
G1 X76.236 Y86.732 E.04356
G1 X76.236 Y86.879 E.00423
G1 X75.161 Y87.955 E.04356
G1 X75.161 Y93.454 E.1575
G1 X76.236 Y94.529 E.04356
G1 X76.236 Y94.677 E.00423
G1 X75.161 Y95.752 E.04356
G1 X75.161 Y101.251 E.1575
G1 X76.236 Y102.327 E.04356
G1 X76.236 Y102.474 E.00423
G1 X75.161 Y103.55 E.04356
G1 X75.161 Y109.048 E.1575
G1 X76.236 Y110.124 E.04356
G1 X76.236 Y110.272 E.00423
G1 X75.161 Y111.347 E.04356
G1 X75.161 Y116.846 E.1575
G1 X76.236 Y117.921 E.04356
G1 X76.236 Y118.069 E.00423
G1 X75.161 Y119.144 E.04356
G1 X75.161 Y124.643 E.1575
G1 X76.236 Y125.719 E.04356
G1 X76.236 Y125.866 E.00423
G1 X75.161 Y126.942 E.04356
G1 X75.161 Y132.441 E.1575
G1 X76.236 Y133.516 E.04356
G1 X76.236 Y133.664 E.00423
G1 X75.161 Y134.739 E.04356
G1 X75.161 Y140.238 E.1575
G1 X76.27 Y141.347 E.04494
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
M73 P79 R12
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.554 Y140.332 E.04112
G1 X108.989 Y142.876 E.07392
G1 X107.673 Y141.561 E.05329
G1 X107.951 Y143.191 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.673 Y141.561 E-.62855
G1 X107.918 Y141.805 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 40/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z7.03 I1.134 J-.441 P1  F30000
G1 X76.989 Y62.285 Z7.03
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.307 Y62.285 E2.27184
G1 X156.307 Y181.502 E3.41461
G1 X115.942 Y181.502 E1.15613
G1 X108.843 Y139.918 E1.20829
G1 X76.59 Y139.918 E.92378
G1 X76.59 Y62.285 E2.22356
G1 X76.929 Y62.285 E.0097
G1 X76.989 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.909 Y62.684 E2.09644
G1 X155.909 Y181.104 E3.14572
G1 X116.279 Y181.104 E1.05274
G1 X109.179 Y139.52 E1.12063
G1 X76.989 Y139.52 E.8551
G1 X76.989 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.989 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.567 Y69.926 Z7.2 F30000
G1 X107.343 Y141.73 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.338 Y141.701 E.00085
G1 X74.807 Y141.701 E.93176
G1 X74.807 Y60.502 E2.3257
G1 X158.09 Y60.502 E2.38539
G1 X158.09 Y183.285 E3.51675
G1 X114.438 Y183.285 E1.25028
G1 X107.353 Y141.789 E1.20572
G1 X107.002 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.409 Y142.1 E.86581
G1 X74.409 Y60.104 E2.17814
G1 X158.489 Y60.104 E2.23351
G1 X158.489 Y183.684 E3.28279
G1 X114.102 Y183.684 E1.1791
G1 X107.012 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.012 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.952 Y143.191 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.673 Y141.561 E.04738
G1 X108.989 Y142.877 E.05329
G1 X108.554 Y140.332 E.07393
G1 X107.539 Y141.347 E.04112
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.161 Y140.238 E.04493
G1 X75.161 Y134.739 E.1575
G1 X76.236 Y133.663 E.04356
G1 X76.236 Y133.516 E.00422
G1 X75.161 Y132.441 E.04356
G1 X75.161 Y126.942 E.1575
G1 X76.236 Y125.866 E.04356
G1 X76.236 Y125.719 E.00422
G1 X75.161 Y124.643 E.04356
G1 X75.161 Y119.144 E.1575
G1 X76.236 Y118.069 E.04356
G1 X76.236 Y117.921 E.00422
G1 X75.161 Y116.846 E.04356
G1 X75.161 Y111.347 E.1575
G1 X76.236 Y110.271 E.04356
G1 X76.236 Y110.124 E.00422
G1 X75.161 Y109.049 E.04356
G1 X75.161 Y103.55 E.1575
G1 X76.236 Y102.474 E.04356
G1 X76.236 Y102.327 E.00422
G1 X75.161 Y101.251 E.04356
G1 X75.161 Y95.752 E.1575
G1 X76.236 Y94.677 E.04356
G1 X76.236 Y94.529 E.00422
G1 X75.161 Y93.454 E.04356
G1 X75.161 Y87.955 E.1575
G1 X76.236 Y86.879 E.04356
G1 X76.236 Y86.732 E.00422
G1 X75.161 Y85.656 E.04356
G1 X75.161 Y80.157 E.1575
G1 X76.236 Y79.082 E.04356
G1 X76.236 Y78.935 E.00422
G1 X75.161 Y77.859 E.04356
G1 X75.161 Y72.36 E.1575
G1 X76.236 Y71.285 E.04356
G1 X76.236 Y71.137 E.00422
G1 X75.161 Y70.062 E.04356
G1 X75.161 Y64.563 E.1575
G1 X76.236 Y63.487 E.04356
G1 X76.236 Y63.34 E.00422
G1 X75.161 Y62.264 E.04356
G1 X75.161 Y60.856 E.04034
G1 X75.407 Y60.856 E.00704
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.736 Y60.856 E.02564
G1 X157.736 Y61.615 E.02174
G1 X156.661 Y64.137 F30000
G1 F16200
G1 X156.661 Y65.791 E.04738
G1 X157.736 Y66.866 E.04356
G1 X157.736 Y67.758 E.02555
G1 X156.661 Y68.834 E.04356
G1 X156.661 Y73.588 E.13618
G1 X157.736 Y74.664 E.04356
G1 X157.736 Y75.556 E.02555
G1 X156.661 Y76.631 E.04356
G1 X156.661 Y81.386 E.13618
G1 X157.736 Y82.461 E.04356
G1 X157.736 Y83.353 E.02555
G1 X156.661 Y84.428 E.04356
G1 X156.661 Y89.183 E.13618
G1 X157.736 Y90.258 E.04356
G1 X157.736 Y91.15 E.02555
G1 X156.661 Y92.226 E.04356
G1 X156.661 Y96.98 E.13618
G1 X157.736 Y98.056 E.04356
G1 X157.736 Y98.948 E.02554
G1 X156.661 Y100.023 E.04356
G1 X156.661 Y104.778 E.13618
G1 X157.736 Y105.853 E.04356
G1 X157.736 Y106.745 E.02554
G1 X156.661 Y107.82 E.04356
G1 X156.661 Y112.575 E.13618
G1 X157.736 Y113.65 E.04356
G1 X157.736 Y114.542 E.02554
G1 X156.661 Y115.618 E.04356
G1 X156.661 Y120.372 E.13618
G1 X157.736 Y121.448 E.04356
G1 X157.736 Y122.34 E.02554
G1 X156.661 Y123.415 E.04356
G1 X156.661 Y128.17 E.13618
G1 X157.736 Y129.245 E.04356
G1 X157.736 Y130.137 E.02554
G1 X156.661 Y131.213 E.04356
G1 X156.661 Y135.967 E.13618
G1 X157.736 Y137.043 E.04356
G1 X157.736 Y137.934 E.02554
G1 X156.661 Y139.01 E.04356
G1 X156.661 Y143.764 E.13618
G1 X157.736 Y144.84 E.04356
G1 X157.736 Y145.732 E.02554
G1 X156.661 Y146.807 E.04356
G1 X156.661 Y151.562 E.13618
G1 X157.736 Y152.637 E.04356
G1 X157.736 Y153.529 E.02554
G1 X156.661 Y154.605 E.04356
G1 X156.661 Y159.359 E.13618
G1 X157.736 Y160.435 E.04356
G1 X157.736 Y161.327 E.02554
G1 X156.661 Y162.402 E.04356
G1 X156.661 Y167.157 E.13618
G1 X157.736 Y168.232 E.04356
G1 X157.736 Y169.124 E.02554
G1 X156.661 Y170.199 E.04356
G1 X156.661 Y174.954 E.13618
G1 X157.736 Y176.029 E.04356
G1 X157.736 Y176.921 E.02554
G1 X156.661 Y177.997 E.04356
G1 X156.661 Y179.651 E.04738
G1 X157.736 Y182.173 F30000
G1 F16200
G1 X157.736 Y182.932 E.02173
G1 X156.841 Y182.932 E.02564
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.724 Y182.856 F30000
G1 F16200
G1 X114.445 Y181.226 E.04738
G1 X115.377 Y180.294 E.03775
G1 X115.41 Y180.487 E.00563
G1 X114.095 Y179.172 E.05329
G1 X113.308 Y174.565 E.13384
G1 X114.24 Y173.633 E.03775
G1 X113.805 Y171.085 E.07406
G1 X112.489 Y169.769 E.05329
G1 X112.171 Y167.905 E.05416
G1 X113.103 Y166.973 E.03775
G1 X112.2 Y161.682 E.15374
G1 X110.884 Y160.366 E.05329
G1 X111.034 Y161.245 E.02553
G1 X111.966 Y160.313 E.03775
G1 X111.687 Y158.682 E.04738
G1 X109.97 Y148.623 F30000
G1 F16200
G1 X109.692 Y146.992 E.04738
G1 X108.76 Y147.924 E.03775
G1 X109.278 Y150.964 E.08831
G1 X110.594 Y152.279 E.05329
G1 X110.829 Y153.653 E.03991
G1 X109.897 Y154.585 E.03775
G1 X110.175 Y156.215 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 6.97
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.897 Y154.585 E-.62855
G1 X110.141 Y154.34 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 41/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z7.2 I1.145 J-.412 P1  F30000
G1 X76.989 Y62.285 Z7.2
G1 Z6.97
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.307 Y62.285 E2.27184
G1 X156.307 Y181.502 E3.41461
G1 X115.942 Y181.502 E1.15613
G1 X108.843 Y139.918 E1.20829
G1 X76.59 Y139.918 E.92378
G1 X76.59 Y62.285 E2.22356
G1 X76.929 Y62.285 E.0097
G1 X76.989 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.909 Y62.684 E2.09644
G1 X155.909 Y181.104 E3.14572
G1 X116.279 Y181.104 E1.05274
G1 X109.179 Y139.52 E1.12063
G1 X76.989 Y139.52 E.8551
G1 X76.989 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.989 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.567 Y69.926 Z7.37 F30000
G1 X107.343 Y141.73 Z7.37
G1 Z6.97
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.338 Y141.701 E.00085
G1 X74.807 Y141.701 E.93176
G1 X74.807 Y60.502 E2.3257
G1 X158.09 Y60.502 E2.38539
G1 X158.09 Y183.285 E3.51675
G1 X114.438 Y183.285 E1.25028
G1 X107.353 Y141.789 E1.20572
G1 X107.002 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.409 Y142.1 E.86581
G1 X74.409 Y60.104 E2.17814
G1 X158.489 Y60.104 E2.23351
G1 X158.489 Y183.684 E3.28279
G1 X114.102 Y183.684 E1.1791
G1 X107.012 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.012 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.643 Y149.32 Z7.37 F30000
G1 X110.175 Y156.215 Z7.37
G1 Z6.97
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.897 Y154.584 E.04738
G1 X110.829 Y153.653 E.03775
G1 X110.594 Y152.279 E.0399
G1 X109.279 Y150.964 E.05329
G1 X108.76 Y147.924 E.08832
G1 X109.692 Y146.992 E.03775
G1 X109.97 Y148.623 E.04738
G1 X111.688 Y158.682 F30000
G1 F16200
G1 X111.966 Y160.313 E.04738
G1 X111.034 Y161.245 E.03775
G1 X110.884 Y160.366 E.02552
G1 X112.2 Y161.682 E.05329
G1 X113.103 Y166.973 E.15373
G1 X112.171 Y167.905 E.03775
G1 X112.489 Y169.769 E.05417
G1 X113.805 Y171.085 E.05329
G1 X114.24 Y173.633 E.07405
G1 X113.308 Y174.565 E.03775
M73 P80 R12
G1 X114.095 Y179.172 E.13385
G1 X115.41 Y180.488 E.05329
G1 X115.377 Y180.294 E.00564
G1 X114.445 Y181.225 E.03775
G1 X114.724 Y182.856 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.737 Y182.932 E.02565
G1 X157.737 Y182.173 E.02173
G1 X156.661 Y179.651 F30000
G1 F16200
G1 X156.661 Y177.997 E.04738
G1 X157.737 Y176.921 E.04356
G1 X157.737 Y176.03 E.02554
G1 X156.661 Y174.954 E.04356
G1 X156.661 Y170.199 E.13619
G1 X157.737 Y169.124 E.04356
G1 X157.737 Y168.232 E.02554
G1 X156.661 Y167.157 E.04356
G1 X156.661 Y162.402 E.13619
G1 X157.737 Y161.326 E.04356
G1 X157.737 Y160.435 E.02554
G1 X156.661 Y159.359 E.04356
G1 X156.661 Y154.604 E.13619
G1 X157.737 Y153.529 E.04356
G1 X157.737 Y152.637 E.02554
G1 X156.661 Y151.562 E.04356
G1 X156.661 Y146.807 E.13619
G1 X157.737 Y145.732 E.04356
G1 X157.737 Y144.84 E.02554
G1 X156.661 Y143.765 E.04356
G1 X156.661 Y139.01 E.13619
G1 X157.737 Y137.934 E.04356
G1 X157.737 Y137.043 E.02554
G1 X156.661 Y135.967 E.04356
G1 X156.661 Y131.212 E.13619
G1 X157.737 Y130.137 E.04356
G1 X157.737 Y129.245 E.02554
G1 X156.661 Y128.17 E.04356
G1 X156.661 Y123.415 E.13619
G1 X157.737 Y122.34 E.04356
G1 X157.737 Y121.448 E.02554
G1 X156.661 Y120.372 E.04356
G1 X156.661 Y115.618 E.13619
G1 X157.737 Y114.542 E.04356
G1 X157.737 Y113.651 E.02554
G1 X156.661 Y112.575 E.04356
G1 X156.661 Y107.82 E.13619
G1 X157.737 Y106.745 E.04356
G1 X157.737 Y105.853 E.02554
G1 X156.661 Y104.778 E.04356
G1 X156.661 Y100.023 E.13619
G1 X157.737 Y98.947 E.04356
G1 X157.737 Y98.056 E.02554
G1 X156.661 Y96.98 E.04356
G1 X156.661 Y92.226 E.13619
G1 X157.737 Y91.15 E.04356
G1 X157.737 Y90.259 E.02554
G1 X156.661 Y89.183 E.04356
G1 X156.661 Y84.428 E.13619
G1 X157.737 Y83.353 E.04356
G1 X157.737 Y82.461 E.02554
G1 X156.661 Y81.386 E.04356
G1 X156.661 Y76.631 E.13619
G1 X157.737 Y75.555 E.04356
G1 X157.737 Y74.664 E.02554
G1 X156.661 Y73.588 E.04356
G1 X156.661 Y68.834 E.13619
G1 X157.737 Y67.758 E.04356
G1 X157.737 Y66.866 E.02554
G1 X156.661 Y65.791 E.04356
G1 X156.661 Y64.137 E.04738
G1 X157.737 Y61.615 F30000
G1 F16200
G1 X157.737 Y60.856 E.02173
G1 X156.841 Y60.856 E.02564
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.161 Y60.856 E.00703
G1 X75.161 Y62.265 E.04034
G1 X76.236 Y63.34 E.04356
G1 X76.236 Y63.487 E.00421
G1 X75.161 Y64.563 E.04356
G1 X75.161 Y70.062 E.15751
G1 X76.236 Y71.137 E.04356
G1 X76.236 Y71.284 E.00421
G1 X75.161 Y72.36 E.04356
G1 X75.161 Y77.859 E.15751
G1 X76.236 Y78.935 E.04356
G1 X76.236 Y79.082 E.00421
G1 X75.161 Y80.157 E.04356
G1 X75.161 Y85.657 E.15751
G1 X76.236 Y86.732 E.04356
G1 X76.236 Y86.879 E.00421
G1 X75.161 Y87.955 E.04356
G1 X75.161 Y93.454 E.15751
G1 X76.236 Y94.529 E.04356
G1 X76.236 Y94.677 E.00421
G1 X75.161 Y95.752 E.04356
G1 X75.161 Y101.251 E.15751
G1 X76.236 Y102.327 E.04356
G1 X76.236 Y102.474 E.00421
G1 X75.161 Y103.549 E.04356
G1 X75.161 Y109.049 E.15751
G1 X76.236 Y110.124 E.04356
G1 X76.236 Y110.271 E.00421
G1 X75.161 Y111.347 E.04356
G1 X75.161 Y116.846 E.15751
G1 X76.236 Y117.922 E.04356
G1 X76.236 Y118.069 E.00421
G1 X75.161 Y119.144 E.04356
G1 X75.161 Y124.643 E.15751
G1 X76.236 Y125.719 E.04356
G1 X76.236 Y125.866 E.00421
G1 X75.161 Y126.941 E.04356
G1 X75.161 Y132.441 E.15751
G1 X76.236 Y133.516 E.04356
G1 X76.236 Y133.663 E.00421
G1 X75.161 Y134.739 E.04356
G1 X75.161 Y140.238 E.15751
G1 X76.27 Y141.347 E.04493
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.555 Y140.332 E.04113
G1 X108.989 Y142.877 E.07394
G1 X107.673 Y141.561 E.05329
G1 X107.952 Y143.192 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 7.14
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.673 Y141.561 E-.62855
G1 X107.918 Y141.806 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 42/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z7.37 I1.134 J-.441 P1  F30000
G1 X76.989 Y62.285 Z7.37
G1 Z7.14
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.307 Y62.285 E2.27184
G1 X156.307 Y181.502 E3.41461
G1 X115.943 Y181.502 E1.15613
G1 X108.843 Y139.918 E1.20829
G1 X76.59 Y139.918 E.92378
G1 X76.59 Y62.285 E2.22356
G1 X76.929 Y62.285 E.0097
G1 X76.989 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.909 Y62.684 E2.09644
G1 X155.909 Y181.104 E3.14572
G1 X116.279 Y181.104 E1.05274
G1 X109.179 Y139.52 E1.12063
G1 X76.989 Y139.52 E.8551
G1 X76.989 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.989 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.568 Y69.926 Z7.54 F30000
G1 X107.343 Y141.73 Z7.54
G1 Z7.14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.339 Y141.701 E.00085
G1 X74.807 Y141.701 E.93176
G1 X74.807 Y60.502 E2.3257
G1 X158.09 Y60.502 E2.38539
G1 X158.09 Y183.285 E3.51675
G1 X114.438 Y183.285 E1.25028
G1 X107.354 Y141.789 E1.20572
G1 X107.002 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.409 Y142.1 E.86581
G1 X74.409 Y60.104 E2.17814
G1 X158.489 Y60.104 E2.23351
G1 X158.489 Y183.684 E3.28279
G1 X114.102 Y183.684 E1.1791
G1 X107.012 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.012 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.952 Y143.192 Z7.54 F30000
G1 Z7.14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.673 Y141.561 E.04738
G1 X108.989 Y142.877 E.05329
G1 X108.555 Y140.332 E.07395
G1 X107.539 Y141.347 E.04113
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.161 Y140.238 E.04492
G1 X75.161 Y134.739 E.15752
G1 X76.237 Y133.663 E.04356
G1 X76.237 Y133.516 E.0042
G1 X75.161 Y132.441 E.04356
G1 X75.161 Y126.941 E.15752
G1 X76.237 Y125.866 E.04356
G1 X76.237 Y125.719 E.0042
G1 X75.161 Y124.644 E.04356
G1 X75.161 Y119.144 E.15752
G1 X76.237 Y118.068 E.04356
G1 X76.237 Y117.922 E.0042
G1 X75.161 Y116.846 E.04356
G1 X75.161 Y111.347 E.15752
G1 X76.237 Y110.271 E.04356
G1 X76.237 Y110.124 E.0042
G1 X75.161 Y109.049 E.04356
G1 X75.161 Y103.549 E.15752
G1 X76.237 Y102.474 E.04356
G1 X76.237 Y102.327 E.0042
G1 X75.161 Y101.252 E.04356
G1 X75.161 Y95.752 E.15752
G1 X76.237 Y94.676 E.04356
G1 X76.237 Y94.53 E.0042
G1 X75.161 Y93.454 E.04356
G1 X75.161 Y87.954 E.15752
G1 X76.237 Y86.879 E.04356
G1 X76.237 Y86.732 E.0042
G1 X75.161 Y85.657 E.04356
G1 X75.161 Y80.157 E.15752
G1 X76.237 Y79.082 E.04356
G1 X76.237 Y78.935 E.0042
G1 X75.161 Y77.859 E.04356
G1 X75.161 Y72.36 E.15752
G1 X76.237 Y71.284 E.04356
G1 X76.237 Y71.138 E.0042
G1 X75.161 Y70.062 E.04356
G1 X75.161 Y64.562 E.15752
G1 X76.237 Y63.487 E.04356
G1 X76.237 Y63.34 E.0042
G1 X75.161 Y62.265 E.04356
G1 X75.161 Y60.856 E.04035
G1 X75.407 Y60.856 E.00703
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.737 Y60.856 E.02565
G1 X157.737 Y61.615 E.02173
G1 X156.661 Y64.137 F30000
G1 F16200
G1 X156.661 Y65.791 E.04738
G1 X157.737 Y66.867 E.04356
G1 X157.737 Y67.758 E.02553
G1 X156.661 Y68.833 E.04356
G1 X156.661 Y73.588 E.1362
G1 X157.737 Y74.664 E.04356
G1 X157.737 Y75.555 E.02553
G1 X156.661 Y76.631 E.04356
G1 X156.661 Y81.386 E.1362
G1 X157.737 Y82.461 E.04356
G1 X157.737 Y83.353 E.02553
G1 X156.661 Y84.428 E.04356
G1 X156.661 Y89.183 E.1362
G1 X157.737 Y90.259 E.04356
G1 X157.737 Y91.15 E.02553
G1 X156.661 Y92.225 E.04356
G1 X156.661 Y96.981 E.1362
G1 X157.737 Y98.056 E.04356
G1 X157.737 Y98.947 E.02553
G1 X156.661 Y100.023 E.04356
G1 X156.661 Y104.778 E.1362
G1 X157.737 Y105.853 E.04356
G1 X157.737 Y106.745 E.02553
G1 X156.661 Y107.82 E.04356
G1 X156.661 Y112.575 E.1362
G1 X157.737 Y113.651 E.04356
G1 X157.737 Y114.542 E.02553
G1 X156.661 Y115.618 E.04356
G1 X156.661 Y120.373 E.1362
G1 X157.737 Y121.448 E.04356
G1 X157.737 Y122.339 E.02553
G1 X156.661 Y123.415 E.04356
G1 X156.661 Y128.17 E.1362
G1 X157.737 Y129.245 E.04356
G1 X157.737 Y130.137 E.02553
G1 X156.661 Y131.212 E.04356
G1 X156.661 Y135.967 E.1362
G1 X157.737 Y137.043 E.04356
G1 X157.737 Y137.934 E.02553
G1 X156.661 Y139.01 E.04356
G1 X156.661 Y143.765 E.1362
G1 X157.737 Y144.84 E.04356
G1 X157.737 Y145.732 E.02553
G1 X156.661 Y146.807 E.04356
G1 X156.661 Y151.562 E.1362
G1 X157.737 Y152.638 E.04356
G1 X157.737 Y153.529 E.02553
G1 X156.661 Y154.604 E.04356
G1 X156.661 Y159.359 E.1362
G1 X157.737 Y160.435 E.04356
G1 X157.737 Y161.326 E.02553
G1 X156.661 Y162.402 E.04356
G1 X156.661 Y167.157 E.1362
G1 X157.737 Y168.232 E.04356
G1 X157.737 Y169.124 E.02553
G1 X156.661 Y170.199 E.04356
G1 X156.661 Y174.954 E.1362
G1 X157.737 Y176.03 E.04356
G1 X157.737 Y176.921 E.02553
G1 X156.661 Y177.996 E.04356
G1 X156.661 Y179.651 E.04738
G1 X157.737 Y182.173 F30000
G1 F16200
G1 X157.737 Y182.932 E.02173
G1 X156.841 Y182.932 E.02565
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.724 Y182.856 F30000
G1 F16200
G1 X114.445 Y181.225 E.04738
G1 X115.377 Y180.293 E.03775
G1 X115.411 Y180.488 E.00565
G1 X114.095 Y179.172 E.05329
G1 X113.308 Y174.565 E.13386
G1 X114.24 Y173.633 E.03775
G1 X113.805 Y171.085 E.07404
G1 X112.49 Y169.769 E.05329
G1 X112.171 Y167.905 E.05418
G1 X113.103 Y166.973 E.03775
G1 X112.2 Y161.682 E.15373
G1 X110.884 Y160.367 E.05329
G1 X111.034 Y161.245 E.02551
G1 X111.966 Y160.313 E.03775
G1 X111.688 Y158.682 E.04738
G1 X109.97 Y148.623 F30000
G1 F16200
G1 X109.692 Y146.992 E.04738
G1 X108.76 Y147.924 E.03775
G1 X109.279 Y150.964 E.08833
G1 X110.595 Y152.28 E.05329
G1 X110.829 Y153.652 E.03989
G1 X109.897 Y154.584 E.03775
G1 X110.175 Y156.215 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 7.31
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.897 Y154.584 E-.62855
G1 X110.142 Y154.34 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 43/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z7.54 I1.145 J-.412 P1  F30000
G1 X76.989 Y62.285 Z7.54
G1 Z7.31
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.308 Y62.285 E2.27184
G1 X156.308 Y181.502 E3.41461
G1 X115.943 Y181.502 E1.15613
G1 X108.843 Y139.918 E1.20829
G1 X76.591 Y139.918 E.92378
G1 X76.591 Y62.285 E2.22356
G1 X76.929 Y62.285 E.0097
G1 X76.989 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.909 Y62.684 E2.09644
G1 X155.909 Y181.104 E3.14572
G1 X116.279 Y181.104 E1.05274
G1 X109.179 Y139.52 E1.12063
G1 X76.989 Y139.52 E.8551
G1 X76.989 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.989 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.566 Y69.927 Z7.71 F30000
G1 X107.309 Y141.701 Z7.71
G1 Z7.31
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.808 Y141.701 E.93091
G1 X74.808 Y60.502 E2.3257
G1 X158.091 Y60.502 E2.38539
G1 X158.091 Y183.285 E3.51675
G1 X114.438 Y183.285 E1.25028
G1 X107.344 Y141.731 E1.20742
G1 X107.002 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.409 Y142.1 E.86581
G1 X74.409 Y60.104 E2.17814
G1 X158.489 Y60.104 E2.23351
G1 X158.489 Y183.684 E3.28279
G1 X114.102 Y183.684 E1.1791
G1 X107.013 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.013 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.644 Y149.32 Z7.71 F30000
G1 X110.175 Y156.215 Z7.71
G1 Z7.31
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.897 Y154.584 E.04738
G1 X110.829 Y153.652 E.03775
G1 X110.595 Y152.28 E.03988
G1 X109.279 Y150.964 E.05329
G1 X108.76 Y147.924 E.08833
G1 X109.692 Y146.992 E.03775
G1 X109.97 Y148.623 E.04738
G1 X111.688 Y158.682 F30000
G1 F16200
G1 X111.966 Y160.313 E.04738
G1 X111.034 Y161.244 E.03775
G1 X110.884 Y160.367 E.0255
G1 X112.2 Y161.682 E.05329
G1 X113.103 Y166.973 E.15372
G1 X112.171 Y167.905 E.03775
G1 X112.49 Y169.77 E.05418
G1 X113.805 Y171.085 E.05329
G1 X114.24 Y173.633 E.07403
G1 X113.308 Y174.565 E.03775
G1 X114.095 Y179.172 E.13387
G1 X115.411 Y180.488 E.05329
G1 X115.377 Y180.293 E.00565
G1 X114.446 Y181.225 E.03775
G1 X114.724 Y182.856 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.737 Y182.932 E.02565
G1 X157.737 Y182.173 E.02172
G1 X156.661 Y179.65 F30000
G1 F16200
G1 X156.661 Y177.996 E.04738
G1 X157.737 Y176.921 E.04356
G1 X157.737 Y176.03 E.02552
G1 X156.661 Y174.954 E.04356
G1 X156.661 Y170.199 E.1362
G1 X157.737 Y169.123 E.04356
G1 X157.737 Y168.232 E.02552
G1 X156.661 Y167.157 E.04356
G1 X156.661 Y162.402 E.1362
G1 X157.737 Y161.326 E.04356
G1 X157.737 Y160.435 E.02552
G1 X156.661 Y159.36 E.04356
G1 X156.661 Y154.604 E.1362
G1 X157.737 Y153.529 E.04356
G1 X157.737 Y152.638 E.02552
G1 X156.661 Y151.562 E.04356
G1 X156.661 Y146.807 E.1362
G1 X157.737 Y145.731 E.04356
G1 X157.737 Y144.84 E.02552
G1 X156.661 Y143.765 E.04356
G1 X156.661 Y139.009 E.1362
G1 X157.737 Y137.934 E.04356
G1 X157.737 Y137.043 E.02552
G1 X156.661 Y135.968 E.04356
G1 X156.661 Y131.212 E.1362
G1 X157.737 Y130.137 E.04356
G1 X157.737 Y129.246 E.02552
G1 X156.661 Y128.17 E.04356
G1 X156.661 Y123.415 E.1362
G1 X157.737 Y122.339 E.04356
G1 X157.737 Y121.448 E.02552
G1 X156.661 Y120.373 E.04356
G1 X156.661 Y115.617 E.1362
G1 X157.737 Y114.542 E.04356
G1 X157.737 Y113.651 E.02552
G1 X156.661 Y112.575 E.04356
G1 X156.661 Y107.82 E.1362
G1 X157.737 Y106.745 E.04356
G1 X157.737 Y105.854 E.02552
G1 X156.661 Y104.778 E.04356
G1 X156.661 Y100.023 E.1362
G1 X157.737 Y98.947 E.04356
G1 X157.737 Y98.056 E.02552
G1 X156.661 Y96.981 E.04356
G1 X156.661 Y92.225 E.1362
G1 X157.737 Y91.15 E.04356
G1 X157.737 Y90.259 E.02552
G1 X156.661 Y89.183 E.04356
G1 X156.661 Y84.428 E.1362
G1 X157.737 Y83.352 E.04356
G1 X157.737 Y82.461 E.02552
G1 X156.661 Y81.386 E.04356
G1 X156.661 Y76.631 E.1362
G1 X157.737 Y75.555 E.04356
G1 X157.737 Y74.664 E.02552
G1 X156.661 Y73.589 E.04356
G1 X156.661 Y68.833 E.1362
G1 X157.737 Y67.758 E.04356
G1 X157.737 Y66.867 E.02552
G1 X156.661 Y65.791 E.04356
G1 X156.661 Y64.137 E.04738
G1 X157.737 Y61.614 F30000
G1 F16200
G1 X157.737 Y60.856 E.02172
G1 X156.841 Y60.856 E.02565
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.161 Y60.856 E.00702
G1 X75.161 Y62.265 E.04035
G1 X76.237 Y63.34 E.04356
G1 X76.237 Y63.487 E.00419
G1 X75.161 Y64.562 E.04356
G1 X75.161 Y70.062 E.15753
G1 X76.237 Y71.138 E.04356
G1 X76.237 Y71.284 E.00419
G1 X75.161 Y72.36 E.04356
G1 X75.161 Y77.86 E.15753
G1 X76.237 Y78.935 E.04356
G1 X76.237 Y79.081 E.00419
G1 X75.161 Y80.157 E.04356
G1 X75.161 Y85.657 E.15753
G1 X76.237 Y86.732 E.04356
G1 X76.237 Y86.879 E.00419
G1 X75.161 Y87.954 E.04356
G1 X75.161 Y93.454 E.15753
G1 X76.237 Y94.53 E.04356
G1 X76.237 Y94.676 E.00419
G1 X75.161 Y95.752 E.04356
G1 X75.161 Y101.252 E.15753
G1 X76.237 Y102.327 E.04356
G1 X76.237 Y102.474 E.00419
G1 X75.161 Y103.549 E.04356
G1 X75.161 Y109.049 E.15753
G1 X76.237 Y110.125 E.04356
G1 X76.237 Y110.271 E.00419
G1 X75.161 Y111.346 E.04356
G1 X75.161 Y116.846 E.15753
G1 X76.237 Y117.922 E.04356
G1 X76.237 Y118.068 E.00419
G1 X75.161 Y119.144 E.04356
G1 X75.161 Y124.644 E.15753
G1 X76.237 Y125.719 E.04356
G1 X76.237 Y125.866 E.00419
G1 X75.161 Y126.941 E.04356
G1 X75.161 Y132.441 E.15753
G1 X76.237 Y133.517 E.04356
G1 X76.237 Y133.663 E.00419
G1 X75.161 Y134.739 E.04356
G1 X75.161 Y140.238 E.15753
G1 X76.27 Y141.347 E.04492
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.555 Y140.332 E.04114
G1 X108.989 Y142.877 E.07396
G1 X107.674 Y141.561 E.05329
G1 X107.952 Y143.192 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 7.48
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.674 Y141.561 E-.62855
G1 X107.918 Y141.806 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 44/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z7.71 I1.134 J-.441 P1  F30000
G1 X76.989 Y62.285 Z7.71
G1 Z7.48
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.308 Y62.285 E2.27184
G1 X156.308 Y181.502 E3.41461
G1 X115.943 Y181.502 E1.15613
G1 X108.843 Y139.918 E1.20829
G1 X76.591 Y139.918 E.92378
G1 X76.591 Y62.285 E2.22356
G1 X76.929 Y62.285 E.0097
G1 X76.989 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.909 Y62.684 E2.09644
G1 X155.909 Y181.104 E3.14572
G1 X116.279 Y181.104 E1.05274
G1 X109.179 Y139.52 E1.12063
G1 X76.989 Y139.52 E.8551
G1 X76.989 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.989 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.568 Y69.926 Z7.88 F30000
G1 X107.344 Y141.73 Z7.88
G1 Z7.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.339 Y141.701 E.00085
G1 X74.808 Y141.701 E.93176
G1 X74.808 Y60.502 E2.3257
G1 X158.091 Y60.502 E2.38539
G1 X158.091 Y183.285 E3.51675
G1 X114.439 Y183.285 E1.25028
G1 X107.354 Y141.789 E1.20572
G1 X107.003 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.409 Y142.1 E.86581
G1 X74.409 Y60.104 E2.17814
G1 X158.489 Y60.104 E2.23351
G1 X158.489 Y183.684 E3.28279
G1 X114.102 Y183.684 E1.1791
G1 X107.013 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.013 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.952 Y143.192 Z7.88 F30000
G1 Z7.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.674 Y141.562 E.04738
G1 X108.99 Y142.877 E.05329
G1 X108.555 Y140.332 E.07397
G1 X107.539 Y141.347 E.04114
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
M73 P81 R12
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
M73 P81 R11
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.161 Y140.239 E.04491
G1 X75.161 Y134.738 E.15754
G1 X76.237 Y133.663 E.04356
G1 X76.237 Y133.517 E.00419
G1 X75.161 Y132.441 E.04356
G1 X75.161 Y126.941 E.15754
G1 X76.237 Y125.866 E.04356
G1 X76.237 Y125.719 E.00419
G1 X75.161 Y124.644 E.04356
G1 X75.161 Y119.144 E.15754
G1 X76.237 Y118.068 E.04356
G1 X76.237 Y117.922 E.00419
G1 X75.161 Y116.847 E.04356
G1 X75.161 Y111.346 E.15754
G1 X76.237 Y110.271 E.04356
G1 X76.237 Y110.125 E.00419
G1 X75.161 Y109.049 E.04356
G1 X75.161 Y103.549 E.15754
G1 X76.237 Y102.473 E.04356
G1 X76.237 Y102.327 E.00419
G1 X75.161 Y101.252 E.04356
G1 X75.161 Y95.752 E.15754
G1 X76.237 Y94.676 E.04356
G1 X76.237 Y94.53 E.00419
G1 X75.161 Y93.454 E.04356
G1 X75.161 Y87.954 E.15754
G1 X76.237 Y86.879 E.04356
G1 X76.237 Y86.733 E.00419
G1 X75.161 Y85.657 E.04356
G1 X75.161 Y80.157 E.15754
G1 X76.237 Y79.081 E.04356
G1 X76.237 Y78.935 E.00419
G1 X75.161 Y77.86 E.04356
G1 X75.161 Y72.359 E.15754
G1 X76.237 Y71.284 E.04356
G1 X76.237 Y71.138 E.00419
G1 X75.161 Y70.062 E.04356
G1 X75.161 Y64.562 E.15754
G1 X76.237 Y63.487 E.04356
G1 X76.237 Y63.34 E.00419
G1 X75.161 Y62.265 E.04356
G1 X75.161 Y60.856 E.04036
G1 X75.407 Y60.856 E.00702
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.737 Y60.856 E.02566
G1 X157.737 Y61.614 E.02172
G1 X156.661 Y64.137 F30000
G1 F16200
G1 X156.661 Y65.791 E.04738
G1 X157.737 Y66.867 E.04356
G1 X157.737 Y67.758 E.02551
G1 X156.661 Y68.833 E.04356
G1 X156.661 Y73.589 E.13621
G1 X157.737 Y74.664 E.04356
G1 X157.737 Y75.555 E.02551
G1 X156.661 Y76.63 E.04356
G1 X156.661 Y81.386 E.13621
G1 X157.737 Y82.462 E.04356
G1 X157.737 Y83.352 E.02551
G1 X156.661 Y84.428 E.04356
G1 X156.661 Y89.183 E.13621
G1 X157.737 Y90.259 E.04356
G1 X157.737 Y91.15 E.02551
G1 X156.661 Y92.225 E.04356
G1 X156.661 Y96.981 E.13621
G1 X157.737 Y98.056 E.04356
G1 X157.737 Y98.947 E.02551
G1 X156.661 Y100.023 E.04356
G1 X156.661 Y104.778 E.13621
G1 X157.737 Y105.854 E.04356
G1 X157.737 Y106.744 E.02551
G1 X156.661 Y107.82 E.04356
G1 X156.661 Y112.576 E.13621
G1 X157.737 Y113.651 E.04356
G1 X157.737 Y114.542 E.02551
G1 X156.661 Y115.617 E.04356
G1 X156.661 Y120.373 E.13621
G1 X157.737 Y121.448 E.04356
G1 X157.737 Y122.339 E.02551
G1 X156.661 Y123.415 E.04356
G1 X156.661 Y128.17 E.13621
G1 X157.737 Y129.246 E.04356
G1 X157.737 Y130.136 E.02551
G1 X156.661 Y131.212 E.04356
G1 X156.661 Y135.968 E.13621
G1 X157.737 Y137.043 E.04356
G1 X157.737 Y137.934 E.02551
G1 X156.661 Y139.009 E.04356
G1 X156.661 Y143.765 E.13621
G1 X157.737 Y144.841 E.04356
G1 X157.737 Y145.731 E.02551
G1 X156.661 Y146.807 E.04356
G1 X156.661 Y151.562 E.13621
G1 X157.737 Y152.638 E.04356
G1 X157.737 Y153.529 E.02551
G1 X156.661 Y154.604 E.04356
G1 X156.661 Y159.36 E.13621
G1 X157.737 Y160.435 E.04356
G1 X157.737 Y161.326 E.02551
G1 X156.661 Y162.401 E.04356
G1 X156.661 Y167.157 E.13621
G1 X157.737 Y168.233 E.04356
G1 X157.737 Y169.123 E.02551
G1 X156.661 Y170.199 E.04356
G1 X156.661 Y174.954 E.13621
G1 X157.737 Y176.03 E.04356
G1 X157.737 Y176.921 E.02551
G1 X156.661 Y177.996 E.04356
G1 X156.661 Y179.65 E.04738
G1 X157.737 Y182.173 F30000
G1 F16200
G1 X157.737 Y182.932 E.02172
G1 X156.841 Y182.932 E.02566
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.724 Y182.856 F30000
G1 F16200
G1 X114.446 Y181.225 E.04738
G1 X115.378 Y180.293 E.03775
G1 X115.411 Y180.488 E.00566
G1 X114.095 Y179.172 E.05329
G1 X113.309 Y174.565 E.13388
G1 X114.24 Y173.633 E.03775
G1 X113.806 Y171.085 E.07402
G1 X112.49 Y169.77 E.05329
G1 X112.171 Y167.905 E.05419
G1 X113.103 Y166.973 E.03775
G1 X112.2 Y161.683 E.15371
G1 X110.885 Y160.367 E.05329
G1 X111.034 Y161.244 E.02549
G1 X111.966 Y160.312 E.03775
G1 X111.688 Y158.682 E.04738
G1 X109.97 Y148.622 F30000
G1 F16200
G1 X109.692 Y146.992 E.04738
G1 X108.76 Y147.924 E.03775
G1 X109.279 Y150.964 E.08834
G1 X110.595 Y152.28 E.05329
G1 X110.829 Y153.652 E.03987
G1 X109.897 Y154.584 E.03775
G1 X110.176 Y156.215 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 7.65
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.897 Y154.584 E-.62855
G1 X110.142 Y154.34 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 45/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z7.88 I1.145 J-.412 P1  F30000
G1 X76.989 Y62.285 Z7.88
G1 Z7.65
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.308 Y62.285 E2.27184
G1 X156.308 Y181.502 E3.41461
G1 X115.943 Y181.502 E1.15613
G1 X108.843 Y139.918 E1.20829
G1 X76.591 Y139.918 E.92378
G1 X76.591 Y62.285 E2.22356
G1 X76.929 Y62.285 E.0097
G1 X76.989 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.909 Y62.684 E2.09644
G1 X155.909 Y181.104 E3.14572
G1 X116.279 Y181.104 E1.05274
G1 X109.18 Y139.52 E1.12063
G1 X76.989 Y139.52 E.8551
G1 X76.989 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.989 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.568 Y69.926 Z8.05 F30000
G1 X107.344 Y141.73 Z8.05
G1 Z7.65
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.339 Y141.701 E.00085
G1 X74.808 Y141.701 E.93176
G1 X74.808 Y60.502 E2.3257
G1 X158.091 Y60.502 E2.38539
G1 X158.091 Y183.285 E3.51675
G1 X114.439 Y183.285 E1.25028
G1 X107.354 Y141.789 E1.20572
G1 X107.003 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.409 Y142.1 E.86581
G1 X74.409 Y60.104 E2.17814
G1 X158.489 Y60.104 E2.23351
G1 X158.489 Y183.684 E3.28279
G1 X114.102 Y183.684 E1.1791
G1 X107.013 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.013 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.644 Y149.32 Z8.05 F30000
G1 X110.176 Y156.214 Z8.05
G1 Z7.65
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.897 Y154.584 E.04738
G1 X110.829 Y153.652 E.03775
G1 X110.595 Y152.28 E.03986
G1 X109.279 Y150.964 E.05329
G1 X108.76 Y147.924 E.08835
G1 X109.692 Y146.992 E.03775
G1 X109.971 Y148.622 E.04738
G1 X111.688 Y158.682 F30000
G1 F16200
G1 X111.966 Y160.312 E.04738
G1 X111.034 Y161.244 E.03775
G1 X110.885 Y160.367 E.02548
G1 X112.2 Y161.683 E.05329
G1 X113.104 Y166.973 E.1537
G1 X112.172 Y167.904 E.03775
G1 X112.49 Y169.77 E.0542
G1 X113.806 Y171.086 E.05329
G1 X114.241 Y173.633 E.07401
G1 X113.309 Y174.565 E.03775
G1 X114.095 Y179.173 E.13389
G1 X115.411 Y180.488 E.05329
G1 X115.378 Y180.293 E.00567
G1 X114.446 Y181.225 E.03775
G1 X114.724 Y182.855 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.737 Y182.932 E.02566
G1 X157.737 Y182.173 E.02171
G1 X156.662 Y179.65 F30000
G1 F16200
G1 X156.662 Y177.996 E.04738
G1 X157.737 Y176.921 E.04356
G1 X157.737 Y176.03 E.0255
G1 X156.662 Y174.955 E.04356
G1 X156.662 Y170.199 E.13622
G1 X157.737 Y169.123 E.04356
G1 X157.737 Y168.233 E.0255
G1 X156.662 Y167.157 E.04356
G1 X156.662 Y162.401 E.13622
G1 X157.737 Y161.326 E.04356
G1 X157.737 Y160.435 E.0255
G1 X156.662 Y159.36 E.04356
G1 X156.662 Y154.604 E.13622
G1 X157.737 Y153.528 E.04356
G1 X157.737 Y152.638 E.0255
G1 X156.662 Y151.563 E.04356
G1 X156.662 Y146.807 E.13622
G1 X157.737 Y145.731 E.04356
G1 X157.737 Y144.841 E.0255
G1 X156.662 Y143.765 E.04356
G1 X156.662 Y139.009 E.13622
G1 X157.737 Y137.934 E.04356
G1 X157.737 Y137.043 E.0255
G1 X156.662 Y135.968 E.04356
G1 X156.662 Y131.212 E.13622
G1 X157.737 Y130.136 E.04356
G1 X157.737 Y129.246 E.0255
G1 X156.662 Y128.17 E.04356
G1 X156.662 Y123.414 E.13622
G1 X157.737 Y122.339 E.04356
G1 X157.737 Y121.449 E.0255
G1 X156.662 Y120.373 E.04356
G1 X156.662 Y115.617 E.13622
G1 X157.737 Y114.542 E.04356
G1 X157.737 Y113.651 E.0255
G1 X156.662 Y112.576 E.04356
G1 X156.662 Y107.82 E.13622
G1 X157.737 Y106.744 E.04356
G1 X157.737 Y105.854 E.0255
G1 X156.662 Y104.778 E.04356
G1 X156.662 Y100.022 E.13622
G1 X157.737 Y98.947 E.04356
G1 X157.737 Y98.056 E.0255
G1 X156.662 Y96.981 E.04356
G1 X156.662 Y92.225 E.13622
G1 X157.737 Y91.15 E.04356
G1 X157.737 Y90.259 E.0255
G1 X156.662 Y89.184 E.04356
G1 X156.662 Y84.428 E.13622
G1 X157.737 Y83.352 E.04356
G1 X157.737 Y82.462 E.0255
G1 X156.662 Y81.386 E.04356
G1 X156.662 Y76.63 E.13622
G1 X157.737 Y75.555 E.04356
G1 X157.737 Y74.664 E.0255
G1 X156.662 Y73.589 E.04356
G1 X156.662 Y68.833 E.13622
G1 X157.737 Y67.757 E.04356
G1 X157.737 Y66.867 E.0255
G1 X156.662 Y65.792 E.04356
G1 X156.662 Y64.137 E.04738
G1 X157.737 Y61.614 F30000
G1 F16200
G1 X157.737 Y60.856 E.02171
G1 X156.841 Y60.856 E.02566
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.162 Y60.856 E.00702
G1 X75.162 Y62.265 E.04036
G1 X76.237 Y63.341 E.04356
G1 X76.237 Y63.486 E.00418
G1 X75.162 Y64.562 E.04356
G1 X75.162 Y70.062 E.15755
G1 X76.237 Y71.138 E.04356
G1 X76.237 Y71.284 E.00418
G1 X75.162 Y72.359 E.04356
G1 X75.162 Y77.86 E.15755
G1 X76.237 Y78.935 E.04356
G1 X76.237 Y79.081 E.00418
G1 X75.162 Y80.157 E.04356
G1 X75.162 Y85.657 E.15755
G1 X76.237 Y86.733 E.04356
G1 X76.237 Y86.879 E.00418
G1 X75.162 Y87.954 E.04356
G1 X75.162 Y93.455 E.15755
G1 X76.237 Y94.53 E.04356
G1 X76.237 Y94.676 E.00418
G1 X75.162 Y95.751 E.04356
G1 X75.162 Y101.252 E.15755
G1 X76.237 Y102.327 E.04356
G1 X76.237 Y102.473 E.00418
G1 X75.162 Y103.549 E.04356
G1 X75.162 Y109.049 E.15755
G1 X76.237 Y110.125 E.04356
G1 X76.237 Y110.271 E.00418
G1 X75.162 Y111.346 E.04356
G1 X75.162 Y116.847 E.15755
G1 X76.237 Y117.922 E.04356
G1 X76.237 Y118.068 E.00418
G1 X75.162 Y119.144 E.04356
G1 X75.162 Y124.644 E.15755
G1 X76.237 Y125.72 E.04356
G1 X76.237 Y125.865 E.00418
G1 X75.162 Y126.941 E.04356
G1 X75.162 Y132.441 E.15755
G1 X76.237 Y133.517 E.04356
G1 X76.237 Y133.663 E.00418
G1 X75.162 Y134.738 E.04356
G1 X75.162 Y140.239 E.15755
G1 X76.27 Y141.347 E.04491
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.555 Y140.332 E.04115
G1 X108.99 Y142.877 E.07397
G1 X107.674 Y141.562 E.05329
G1 X107.952 Y143.192 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 7.82
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.674 Y141.562 E-.62855
G1 X107.919 Y141.806 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 46/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z8.05 I1.134 J-.441 P1  F30000
G1 X76.989 Y62.285 Z8.05
G1 Z7.82
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.308 Y62.285 E2.27184
G1 X156.308 Y181.502 E3.41461
G1 X115.943 Y181.502 E1.15613
G1 X108.843 Y139.918 E1.20829
G1 X76.591 Y139.918 E.92378
G1 X76.591 Y62.285 E2.22356
G1 X76.929 Y62.285 E.0097
G1 X76.989 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.909 Y62.684 E2.09644
G1 X155.909 Y181.104 E3.14572
G1 X116.279 Y181.104 E1.05274
G1 X109.18 Y139.52 E1.12063
G1 X76.989 Y139.52 E.8551
G1 X76.989 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.989 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.568 Y69.926 Z8.22 F30000
G1 X107.344 Y141.73 Z8.22
G1 Z7.82
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.339 Y141.701 E.00085
G1 X74.808 Y141.701 E.93176
G1 X74.808 Y60.502 E2.3257
G1 X158.091 Y60.502 E2.38539
G1 X158.091 Y183.285 E3.51675
G1 X114.439 Y183.285 E1.25028
G1 X107.354 Y141.789 E1.20572
G1 X107.003 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.409 Y142.1 E.86581
G1 X74.409 Y60.104 E2.17814
G1 X158.489 Y60.104 E2.23351
G1 X158.489 Y183.684 E3.28279
G1 X114.103 Y183.684 E1.1791
G1 X107.013 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.013 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.953 Y143.192 Z8.22 F30000
G1 Z7.82
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.674 Y141.562 E.04738
G1 X108.99 Y142.878 E.05329
G1 X108.555 Y140.331 E.07398
G1 X107.539 Y141.347 E.04115
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.162 Y140.239 E.0449
G1 X75.162 Y134.738 E.15755
G1 X76.237 Y133.663 E.04356
G1 X76.237 Y133.517 E.00417
G1 X75.162 Y132.442 E.04356
G1 X75.162 Y126.941 E.15755
G1 X76.237 Y125.865 E.04356
G1 X76.237 Y125.72 E.00417
G1 X75.162 Y124.644 E.04356
G1 X75.162 Y119.143 E.15755
G1 X76.237 Y118.068 E.04356
G1 X76.237 Y117.922 E.00417
G1 X75.162 Y116.847 E.04356
G1 X75.162 Y111.346 E.15755
G1 X76.237 Y110.271 E.04356
G1 X76.237 Y110.125 E.00417
G1 X75.162 Y109.049 E.04356
G1 X75.162 Y103.549 E.15755
G1 X76.237 Y102.473 E.04356
G1 X76.237 Y102.328 E.00417
G1 X75.162 Y101.252 E.04356
G1 X75.162 Y95.751 E.15755
G1 X76.237 Y94.676 E.04356
G1 X76.237 Y94.53 E.00417
G1 X75.162 Y93.455 E.04356
G1 X75.162 Y87.954 E.15755
G1 X76.237 Y86.878 E.04356
G1 X76.237 Y86.733 E.00417
G1 X75.162 Y85.657 E.04356
G1 X75.162 Y80.157 E.15755
G1 X76.237 Y79.081 E.04356
G1 X76.237 Y78.935 E.00417
G1 X75.162 Y77.86 E.04356
G1 X75.162 Y72.359 E.15755
G1 X76.237 Y71.284 E.04356
G1 X76.237 Y71.138 E.00417
G1 X75.162 Y70.063 E.04356
G1 X75.162 Y64.562 E.15755
G1 X76.237 Y63.486 E.04356
G1 X76.237 Y63.341 E.00417
G1 X75.162 Y62.265 E.04356
G1 X75.162 Y60.856 E.04036
G1 X75.407 Y60.856 E.00701
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.737 Y60.856 E.02567
G1 X157.737 Y61.614 E.02171
G1 X156.662 Y64.138 F30000
G1 F16200
G1 X156.662 Y65.792 E.04738
G1 X157.737 Y66.867 E.04356
G1 X157.737 Y67.757 E.0255
G1 X156.662 Y68.833 E.04356
G1 X156.662 Y73.589 E.13623
G1 X157.737 Y74.665 E.04356
G1 X157.737 Y75.555 E.0255
G1 X156.662 Y76.63 E.04356
G1 X156.662 Y81.386 E.13623
G1 X157.737 Y82.462 E.04356
G1 X157.737 Y83.352 E.0255
G1 X156.662 Y84.428 E.04356
G1 X156.662 Y89.184 E.13623
G1 X157.737 Y90.259 E.04356
G1 X157.737 Y91.149 E.0255
G1 X156.662 Y92.225 E.04356
G1 X156.662 Y96.981 E.13623
G1 X157.737 Y98.057 E.04356
G1 X157.737 Y98.947 E.0255
G1 X156.662 Y100.022 E.04356
G1 X156.662 Y104.778 E.13623
G1 X157.737 Y105.854 E.04356
G1 X157.737 Y106.744 E.0255
G1 X156.662 Y107.82 E.04356
G1 X156.662 Y112.576 E.13623
G1 X157.737 Y113.651 E.04356
G1 X157.737 Y114.541 E.0255
G1 X156.662 Y115.617 E.04356
G1 X156.662 Y120.373 E.13623
G1 X157.737 Y121.449 E.04356
G1 X157.737 Y122.339 E.0255
G1 X156.662 Y123.414 E.04356
G1 X156.662 Y128.171 E.13623
G1 X157.737 Y129.246 E.04356
G1 X157.737 Y130.136 E.0255
G1 X156.662 Y131.212 E.04356
G1 X156.662 Y135.968 E.13623
G1 X157.737 Y137.043 E.04356
G1 X157.737 Y137.934 E.0255
M73 P82 R11
G1 X156.662 Y139.009 E.04356
G1 X156.662 Y143.765 E.13623
G1 X157.737 Y144.841 E.04356
G1 X157.737 Y145.731 E.0255
G1 X156.662 Y146.806 E.04356
G1 X156.662 Y151.563 E.13623
G1 X157.737 Y152.638 E.04356
G1 X157.737 Y153.528 E.0255
G1 X156.662 Y154.604 E.04356
G1 X156.662 Y159.36 E.13623
G1 X157.737 Y160.436 E.04356
G1 X157.737 Y161.326 E.02549
G1 X156.662 Y162.401 E.04356
G1 X156.662 Y167.157 E.13623
G1 X157.737 Y168.233 E.04356
G1 X157.737 Y169.123 E.02549
G1 X156.662 Y170.198 E.04356
G1 X156.662 Y174.955 E.13623
G1 X157.737 Y176.03 E.04356
G1 X157.737 Y176.92 E.02549
G1 X156.662 Y177.996 E.04356
G1 X156.662 Y179.65 E.04738
G1 X157.737 Y182.174 F30000
G1 F16200
G1 X157.737 Y182.932 E.02171
G1 X156.841 Y182.932 E.02567
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.724 Y182.855 F30000
G1 F16200
G1 X114.446 Y181.225 E.04738
G1 X115.378 Y180.293 E.03775
G1 X115.411 Y180.488 E.00568
G1 X114.096 Y179.173 E.05329
G1 X113.309 Y174.565 E.1339
G1 X114.241 Y173.633 E.03775
G1 X113.806 Y171.086 E.07401
G1 X112.49 Y169.77 E.05329
G1 X112.172 Y167.904 E.05421
G1 X113.104 Y166.972 E.03775
G1 X112.201 Y161.683 E.15369
G1 X110.885 Y160.367 E.05329
G1 X111.035 Y161.244 E.02548
G1 X111.967 Y160.312 E.03775
G1 X111.688 Y158.682 E.04738
G1 X109.971 Y148.622 F30000
G1 F16200
G1 X109.692 Y146.992 E.04738
G1 X108.76 Y147.924 E.03775
G1 X109.28 Y150.965 E.08836
G1 X110.595 Y152.28 E.05329
G1 X110.829 Y153.652 E.03985
G1 X109.897 Y154.584 E.03775
G1 X110.176 Y156.214 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 7.99
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.897 Y154.584 E-.62855
G1 X110.142 Y154.339 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 47/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z8.22 I1.145 J-.412 P1  F30000
G1 X76.99 Y62.285 Z8.22
G1 Z7.99
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.308 Y62.285 E2.27184
G1 X156.308 Y181.502 E3.41461
G1 X115.943 Y181.502 E1.15613
G1 X108.844 Y139.918 E1.20829
G1 X76.591 Y139.918 E.92378
G1 X76.591 Y62.285 E2.22356
G1 X76.93 Y62.285 E.0097
G1 X76.99 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.91 Y62.684 E2.09644
G1 X155.91 Y181.104 E3.14572
G1 X116.28 Y181.104 E1.05274
G1 X109.18 Y139.52 E1.12063
G1 X76.99 Y139.52 E.8551
G1 X76.99 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.99 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.568 Y69.926 Z8.39 F30000
G1 X107.344 Y141.73 Z8.39
G1 Z7.99
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.339 Y141.701 E.00085
G1 X74.808 Y141.701 E.93176
G1 X74.808 Y60.502 E2.3257
G1 X158.091 Y60.502 E2.38539
G1 X158.091 Y183.285 E3.51675
G1 X114.439 Y183.285 E1.25028
G1 X107.354 Y141.789 E1.20572
G1 X107.003 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.41 Y142.1 E.86581
G1 X74.41 Y60.104 E2.17814
G1 X158.49 Y60.104 E2.23351
G1 X158.49 Y183.684 E3.28279
G1 X114.103 Y183.684 E1.1791
G1 X107.013 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.013 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.644 Y149.32 Z8.39 F30000
G1 X110.176 Y156.214 Z8.39
G1 Z7.99
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.898 Y154.584 E.04738
G1 X110.83 Y153.652 E.03775
G1 X110.595 Y152.28 E.03985
G1 X109.28 Y150.965 E.05329
G1 X108.76 Y147.924 E.08837
G1 X109.692 Y146.992 E.03775
G1 X109.971 Y148.622 E.04738
G1 X111.688 Y158.682 F30000
G1 F16200
G1 X111.967 Y160.312 E.04738
G1 X111.035 Y161.244 E.03775
G1 X110.885 Y160.368 E.02547
G1 X112.201 Y161.683 E.05329
G1 X113.104 Y166.972 E.15368
G1 X112.172 Y167.904 E.03775
G1 X112.49 Y169.77 E.05422
G1 X113.806 Y171.086 E.05329
G1 X114.241 Y173.633 E.074
G1 X113.309 Y174.564 E.03775
G1 X114.096 Y179.173 E.13391
G1 X115.411 Y180.489 E.05329
G1 X115.378 Y180.293 E.00569
G1 X114.446 Y181.225 E.03775
G1 X114.724 Y182.855 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.737 Y182.932 E.02567
G1 X157.737 Y182.174 E.02171
G1 X156.662 Y179.65 F30000
G1 F16200
G1 X156.662 Y177.996 E.04738
G1 X157.737 Y176.92 E.04356
G1 X157.737 Y176.03 E.02549
G1 X156.662 Y174.955 E.04356
G1 X156.662 Y170.198 E.13624
G1 X157.737 Y169.123 E.04356
G1 X157.737 Y168.233 E.02549
G1 X156.662 Y167.158 E.04356
G1 X156.662 Y162.401 E.13624
G1 X157.737 Y161.326 E.04356
G1 X157.737 Y160.436 E.02549
G1 X156.662 Y159.36 E.04356
G1 X156.662 Y154.604 E.13624
G1 X157.737 Y153.528 E.04356
G1 X157.737 Y152.638 E.02549
G1 X156.662 Y151.563 E.04356
G1 X156.662 Y146.806 E.13624
G1 X157.737 Y145.731 E.04356
G1 X157.737 Y144.841 E.02549
G1 X156.662 Y143.765 E.04356
G1 X156.662 Y139.009 E.13624
G1 X157.737 Y137.933 E.04356
G1 X157.737 Y137.044 E.02549
G1 X156.662 Y135.968 E.04356
G1 X156.662 Y131.212 E.13624
G1 X157.737 Y130.136 E.04356
G1 X157.737 Y129.246 E.02549
G1 X156.662 Y128.171 E.04356
G1 X156.662 Y123.414 E.13624
G1 X157.737 Y122.339 E.04356
G1 X157.737 Y121.449 E.02549
G1 X156.662 Y120.373 E.04356
G1 X156.662 Y115.617 E.13624
G1 X157.737 Y114.541 E.04356
G1 X157.737 Y113.651 E.02549
G1 X156.662 Y112.576 E.04356
G1 X156.662 Y107.819 E.13624
G1 X157.737 Y106.744 E.04356
G1 X157.737 Y105.854 E.02549
G1 X156.662 Y104.779 E.04356
G1 X156.662 Y100.022 E.13624
G1 X157.737 Y98.947 E.04356
G1 X157.737 Y98.057 E.02549
G1 X156.662 Y96.981 E.04356
G1 X156.662 Y92.225 E.13624
G1 X157.737 Y91.149 E.04356
G1 X157.737 Y90.259 E.02549
G1 X156.662 Y89.184 E.04356
G1 X156.662 Y84.427 E.13624
G1 X157.737 Y83.352 E.04356
G1 X157.737 Y82.462 E.02549
G1 X156.662 Y81.387 E.04356
G1 X156.662 Y76.63 E.13624
G1 X157.737 Y75.555 E.04356
G1 X157.737 Y74.665 E.02549
G1 X156.662 Y73.589 E.04356
G1 X156.662 Y68.833 E.13624
G1 X157.737 Y67.757 E.04356
G1 X157.737 Y66.867 E.02549
G1 X156.662 Y65.792 E.04356
G1 X156.662 Y64.138 E.04738
G1 X157.737 Y61.614 F30000
G1 F16200
G1 X157.737 Y60.856 E.02171
G1 X156.841 Y60.856 E.02567
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.162 Y60.856 E.00701
G1 X75.162 Y62.265 E.04037
G1 X76.237 Y63.341 E.04356
G1 X76.237 Y63.486 E.00416
G1 X75.162 Y64.562 E.04356
G1 X75.162 Y70.063 E.15756
G1 X76.237 Y71.138 E.04356
G1 X76.237 Y71.284 E.00416
G1 X75.162 Y72.359 E.04356
G1 X75.162 Y77.86 E.15756
G1 X76.237 Y78.936 E.04356
G1 X76.237 Y79.081 E.00416
G1 X75.162 Y80.156 E.04356
G1 X75.162 Y85.658 E.15756
G1 X76.237 Y86.733 E.04356
G1 X76.237 Y86.878 E.00416
G1 X75.162 Y87.954 E.04356
G1 X75.162 Y93.455 E.15756
G1 X76.237 Y94.53 E.04356
G1 X76.237 Y94.676 E.00416
G1 X75.162 Y95.751 E.04356
G1 X75.162 Y101.252 E.15756
G1 X76.237 Y102.328 E.04356
G1 X76.237 Y102.473 E.00416
G1 X75.162 Y103.548 E.04356
G1 X75.162 Y109.05 E.15756
G1 X76.237 Y110.125 E.04356
G1 X76.237 Y110.27 E.00416
G1 X75.162 Y111.346 E.04356
G1 X75.162 Y116.847 E.15756
G1 X76.237 Y117.922 E.04356
G1 X76.237 Y118.068 E.00416
G1 X75.162 Y119.143 E.04356
G1 X75.162 Y124.644 E.15756
G1 X76.237 Y125.72 E.04356
G1 X76.237 Y125.865 E.00416
G1 X75.162 Y126.941 E.04356
G1 X75.162 Y132.442 E.15756
G1 X76.237 Y133.517 E.04356
G1 X76.237 Y133.662 E.00416
G1 X75.162 Y134.738 E.04356
G1 X75.162 Y140.239 E.15756
G1 X76.27 Y141.347 E.04489
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.555 Y140.331 E.04116
G1 X108.99 Y142.878 E.07399
G1 X107.674 Y141.562 E.05329
G1 X107.953 Y143.193 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 8.16
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.674 Y141.562 E-.62855
G1 X107.919 Y141.807 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 48/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z8.39 I1.134 J-.441 P1  F30000
G1 X76.99 Y62.285 Z8.39
G1 Z8.16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.308 Y62.285 E2.27184
G1 X156.308 Y181.502 E3.41461
G1 X115.943 Y181.502 E1.15613
G1 X108.844 Y139.918 E1.20829
G1 X76.591 Y139.918 E.92378
G1 X76.591 Y62.285 E2.22356
G1 X76.93 Y62.285 E.0097
G1 X76.99 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.91 Y62.684 E2.09644
G1 X155.91 Y181.104 E3.14572
G1 X116.28 Y181.104 E1.05274
G1 X109.18 Y139.52 E1.12063
G1 X76.99 Y139.52 E.8551
G1 X76.99 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.99 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.567 Y69.927 Z8.56 F30000
G1 X107.31 Y141.701 Z8.56
G1 Z8.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.808 Y141.701 E.93091
G1 X74.808 Y60.502 E2.3257
G1 X158.091 Y60.502 E2.38539
G1 X158.091 Y183.285 E3.51675
G1 X114.439 Y183.285 E1.25028
G1 X107.344 Y141.731 E1.20742
G1 X107.003 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.41 Y142.1 E.86581
G1 X74.41 Y60.104 E2.17814
G1 X158.49 Y60.104 E2.23351
G1 X158.49 Y183.684 E3.28279
G1 X114.103 Y183.684 E1.1791
G1 X107.013 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.013 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.953 Y143.193 Z8.56 F30000
G1 Z8.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.675 Y141.562 E.04738
G1 X108.99 Y142.878 E.05329
G1 X108.555 Y140.331 E.074
G1 X107.539 Y141.347 E.04116
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.162 Y140.239 E.04489
G1 X75.162 Y134.738 E.15757
G1 X76.237 Y133.662 E.04356
G1 X76.237 Y133.517 E.00415
G1 X75.162 Y132.442 E.04356
G1 X75.162 Y126.94 E.15757
G1 X76.237 Y125.865 E.04356
G1 X76.237 Y125.72 E.00415
G1 X75.162 Y124.644 E.04356
G1 X75.162 Y119.143 E.15757
G1 X76.237 Y118.068 E.04356
G1 X76.237 Y117.923 E.00415
G1 X75.162 Y116.847 E.04356
G1 X75.162 Y111.346 E.15757
G1 X76.237 Y110.27 E.04356
G1 X76.237 Y110.125 E.00415
G1 X75.162 Y109.05 E.04356
G1 X75.162 Y103.548 E.15757
G1 X76.237 Y102.473 E.04356
G1 X76.237 Y102.328 E.00415
G1 X75.162 Y101.252 E.04356
M73 P82 R10
G1 X75.162 Y95.751 E.15757
G1 X76.237 Y94.675 E.04356
G1 X76.237 Y94.531 E.00415
G1 X75.162 Y93.455 E.04356
G1 X75.162 Y87.954 E.15757
G1 X76.237 Y86.878 E.04356
G1 X76.237 Y86.733 E.00415
G1 X75.162 Y85.658 E.04356
G1 X75.162 Y80.156 E.15757
G1 X76.237 Y79.081 E.04356
G1 X76.237 Y78.936 E.00415
G1 X75.162 Y77.86 E.04356
G1 X75.162 Y72.359 E.15757
G1 X76.237 Y71.283 E.04356
G1 X76.237 Y71.138 E.00415
G1 X75.162 Y70.063 E.04356
G1 X75.162 Y64.562 E.15757
G1 X76.237 Y63.486 E.04356
G1 X76.237 Y63.341 E.00415
G1 X75.162 Y62.266 E.04356
G1 X75.162 Y60.856 E.04037
G1 X75.407 Y60.856 E.007
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.738 Y60.856 E.02567
G1 X157.738 Y61.614 E.0217
G1 X156.662 Y64.138 F30000
G1 F16200
G1 X156.662 Y65.792 E.04738
G1 X157.738 Y66.867 E.04356
G1 X157.738 Y67.757 E.02548
G1 X156.662 Y68.833 E.04356
G1 X156.662 Y73.589 E.13624
G1 X157.738 Y74.665 E.04356
G1 X157.738 Y75.554 E.02548
G1 X156.662 Y76.63 E.04356
G1 X156.662 Y81.387 E.13624
G1 X157.738 Y82.462 E.04356
G1 X157.738 Y83.352 E.02548
G1 X156.662 Y84.427 E.04356
G1 X156.662 Y89.184 E.13624
G1 X157.738 Y90.26 E.04356
G1 X157.738 Y91.149 E.02548
G1 X156.662 Y92.225 E.04356
G1 X156.662 Y96.981 E.13625
G1 X157.738 Y98.057 E.04356
G1 X157.738 Y98.946 E.02548
G1 X156.662 Y100.022 E.04356
G1 X156.662 Y104.779 E.13625
G1 X157.738 Y105.854 E.04356
G1 X157.738 Y106.744 E.02548
G1 X156.662 Y107.819 E.04356
G1 X156.662 Y112.576 E.13625
G1 X157.738 Y113.652 E.04356
G1 X157.738 Y114.541 E.02548
G1 X156.662 Y115.617 E.04356
G1 X156.662 Y120.374 E.13625
G1 X157.738 Y121.449 E.04356
G1 X157.738 Y122.339 E.02548
G1 X156.662 Y123.414 E.04356
G1 X156.662 Y128.171 E.13625
G1 X157.738 Y129.246 E.04356
G1 X157.738 Y130.136 E.02548
G1 X156.662 Y131.211 E.04356
G1 X156.662 Y135.968 E.13625
G1 X157.738 Y137.044 E.04356
G1 X157.738 Y137.933 E.02548
G1 X156.662 Y139.009 E.04356
G1 X156.662 Y143.766 E.13625
G1 X157.738 Y144.841 E.04356
G1 X157.738 Y145.731 E.02548
G1 X156.662 Y146.806 E.04356
G1 X156.662 Y151.563 E.13625
G1 X157.738 Y152.638 E.04356
G1 X157.738 Y153.528 E.02548
G1 X156.662 Y154.603 E.04356
G1 X156.662 Y159.36 E.13625
G1 X157.738 Y160.436 E.04356
G1 X157.738 Y161.325 E.02548
G1 X156.662 Y162.401 E.04356
G1 X156.662 Y167.158 E.13625
G1 X157.738 Y168.233 E.04356
G1 X157.738 Y169.123 E.02548
G1 X156.662 Y170.198 E.04356
G1 X156.662 Y174.955 E.13625
G1 X157.738 Y176.031 E.04356
G1 X157.738 Y176.92 E.02548
G1 X156.662 Y177.996 E.04356
G1 X156.662 Y179.65 E.04738
G1 X157.738 Y182.174 F30000
G1 F16200
G1 X157.738 Y182.932 E.0217
G1 X156.841 Y182.932 E.02567
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.725 Y182.855 F30000
G1 F16200
G1 X114.446 Y181.225 E.04738
G1 X115.378 Y180.293 E.03775
G1 X115.412 Y180.489 E.0057
G1 X114.096 Y179.173 E.05329
G1 X113.309 Y174.564 E.13391
G1 X114.241 Y173.632 E.03775
G1 X113.806 Y171.086 E.07399
G1 X112.491 Y169.77 E.05329
G1 X112.172 Y167.904 E.05423
G1 X113.104 Y166.972 E.03775
G1 X112.201 Y161.683 E.15367
G1 X110.885 Y160.368 E.05329
G1 X111.035 Y161.244 E.02546
G1 X111.967 Y160.312 E.03775
G1 X111.688 Y158.681 E.04738
G1 X109.971 Y148.622 F30000
G1 F16200
G1 X109.693 Y146.991 E.04738
G1 X108.761 Y147.923 E.03775
G1 X109.28 Y150.965 E.08838
G1 X110.596 Y152.281 E.05329
G1 X110.83 Y153.652 E.03984
G1 X109.898 Y154.584 E.03775
G1 X110.176 Y156.214 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 8.33
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.898 Y154.584 E-.62855
G1 X110.142 Y154.339 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 49/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z8.56 I1.145 J-.412 P1  F30000
G1 X76.99 Y62.285 Z8.56
G1 Z8.33
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.308 Y62.285 E2.27184
G1 X156.308 Y181.502 E3.41461
G1 X115.944 Y181.502 E1.15613
G1 X108.844 Y139.918 E1.20829
G1 X76.591 Y139.918 E.92378
G1 X76.591 Y62.285 E2.22356
G1 X76.93 Y62.285 E.0097
G1 X76.99 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.91 Y62.684 E2.09644
G1 X155.91 Y181.104 E3.14572
G1 X116.28 Y181.104 E1.05274
G1 X109.18 Y139.52 E1.12063
G1 X76.99 Y139.52 E.8551
G1 X76.99 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.99 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.567 Y69.927 Z8.73 F30000
G1 X107.31 Y141.701 Z8.73
G1 Z8.33
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.808 Y141.701 E.93091
G1 X74.808 Y60.502 E2.3257
G1 X158.091 Y60.502 E2.38539
G1 X158.091 Y183.285 E3.51675
G1 X114.439 Y183.285 E1.25028
G1 X107.345 Y141.731 E1.20742
G1 X107.003 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.41 Y142.1 E.86581
G1 X74.41 Y60.104 E2.17814
G1 X158.49 Y60.104 E2.23351
G1 X158.49 Y183.684 E3.28279
G1 X114.103 Y183.684 E1.1791
G1 X107.013 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.013 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.644 Y149.32 Z8.73 F30000
G1 X110.176 Y156.214 Z8.73
G1 Z8.33
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.898 Y154.584 E.04738
G1 X110.83 Y153.652 E.03775
G1 X110.596 Y152.281 E.03983
G1 X109.28 Y150.965 E.05329
G1 X108.761 Y147.923 E.08839
G1 X109.693 Y146.991 E.03775
G1 X109.971 Y148.622 E.04738
G1 X111.689 Y158.681 F30000
G1 F16200
G1 X111.967 Y160.312 E.04738
G1 X111.035 Y161.244 E.03775
G1 X110.885 Y160.368 E.02545
G1 X112.201 Y161.684 E.05329
G1 X113.104 Y166.972 E.15367
G1 X112.172 Y167.904 E.03775
G1 X112.491 Y169.771 E.05424
G1 X113.806 Y171.086 E.05329
G1 X114.241 Y173.632 E.07398
G1 X113.309 Y174.564 E.03775
G1 X114.096 Y179.173 E.13392
G1 X115.412 Y180.489 E.05329
G1 X115.378 Y180.293 E.00571
G1 X114.446 Y181.224 E.03775
G1 X114.725 Y182.855 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
M73 P83 R10
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.738 Y182.932 E.02568
G1 X157.738 Y182.174 E.0217
G1 X156.662 Y179.649 F30000
G1 F16200
G1 X156.662 Y177.995 E.04738
G1 X157.738 Y176.92 E.04356
G1 X157.738 Y176.031 E.02547
G1 X156.662 Y174.955 E.04356
G1 X156.662 Y170.198 E.13625
G1 X157.738 Y169.123 E.04356
G1 X157.738 Y168.233 E.02547
G1 X156.662 Y167.158 E.04356
G1 X156.662 Y162.401 E.13625
G1 X157.738 Y161.325 E.04356
G1 X157.738 Y160.436 E.02547
G1 X156.662 Y159.36 E.04356
G1 X156.662 Y154.603 E.13625
G1 X157.738 Y153.528 E.04356
G1 X157.738 Y152.639 E.02547
G1 X156.662 Y151.563 E.04356
G1 X156.662 Y146.806 E.13625
G1 X157.738 Y145.73 E.04356
G1 X157.738 Y144.841 E.02547
G1 X156.662 Y143.766 E.04356
G1 X156.662 Y139.009 E.13625
G1 X157.738 Y137.933 E.04356
G1 X157.738 Y137.044 E.02547
G1 X156.662 Y135.968 E.04356
G1 X156.662 Y131.211 E.13625
G1 X157.738 Y130.136 E.04356
G1 X157.738 Y129.247 E.02547
G1 X156.662 Y128.171 E.04356
G1 X156.662 Y123.414 E.13625
G1 X157.738 Y122.338 E.04356
G1 X157.738 Y121.449 E.02547
G1 X156.662 Y120.374 E.04356
G1 X156.662 Y115.617 E.13625
G1 X157.738 Y114.541 E.04356
G1 X157.738 Y113.652 E.02547
G1 X156.662 Y112.576 E.04356
G1 X156.662 Y107.819 E.13625
G1 X157.738 Y106.744 E.04356
G1 X157.738 Y105.854 E.02547
G1 X156.662 Y104.779 E.04356
G1 X156.662 Y100.022 E.13625
G1 X157.738 Y98.946 E.04356
G1 X157.738 Y98.057 E.02547
G1 X156.662 Y96.982 E.04356
G1 X156.662 Y92.224 E.13625
G1 X157.738 Y91.149 E.04356
G1 X157.738 Y90.26 E.02547
G1 X156.662 Y89.184 E.04356
G1 X156.662 Y84.427 E.13625
G1 X157.738 Y83.352 E.04356
G1 X157.738 Y82.462 E.02547
G1 X156.662 Y81.387 E.04356
G1 X156.662 Y76.63 E.13625
G1 X157.738 Y75.554 E.04356
G1 X157.738 Y74.665 E.02547
G1 X156.662 Y73.589 E.04356
G1 X156.662 Y68.832 E.13625
G1 X157.738 Y67.757 E.04356
G1 X157.738 Y66.868 E.02547
G1 X156.662 Y65.792 E.04356
G1 X156.662 Y64.138 E.04738
G1 X157.738 Y61.614 F30000
G1 F16200
G1 X157.738 Y60.856 E.0217
G1 X156.841 Y60.856 E.02568
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.162 Y60.856 E.007
G1 X75.162 Y62.266 E.04038
G1 X76.238 Y63.341 E.04356
G1 X76.238 Y63.486 E.00414
G1 X75.162 Y64.561 E.04356
G1 X75.162 Y70.063 E.15758
G1 X76.238 Y71.139 E.04356
G1 X76.238 Y71.283 E.00414
G1 X75.162 Y72.359 E.04356
G1 X75.162 Y77.86 E.15758
G1 X76.238 Y78.936 E.04356
G1 X76.238 Y79.081 E.00414
G1 X75.162 Y80.156 E.04356
G1 X75.162 Y85.658 E.15758
G1 X76.238 Y86.733 E.04356
G1 X76.238 Y86.878 E.00414
G1 X75.162 Y87.953 E.04356
G1 X75.162 Y93.455 E.15758
G1 X76.238 Y94.531 E.04356
G1 X76.238 Y94.675 E.00414
G1 X75.162 Y95.751 E.04356
G1 X75.162 Y101.253 E.15758
G1 X76.238 Y102.328 E.04356
G1 X76.238 Y102.473 E.00414
G1 X75.162 Y103.548 E.04356
G1 X75.162 Y109.05 E.15758
G1 X76.238 Y110.125 E.04356
G1 X76.238 Y110.27 E.00414
G1 X75.162 Y111.346 E.04356
G1 X75.162 Y116.847 E.15758
G1 X76.238 Y117.923 E.04356
G1 X76.238 Y118.067 E.00414
G1 X75.162 Y119.143 E.04356
G1 X75.162 Y124.645 E.15758
G1 X76.238 Y125.72 E.04356
G1 X76.238 Y125.865 E.00414
G1 X75.162 Y126.94 E.04356
G1 X75.162 Y132.442 E.15758
G1 X76.238 Y133.517 E.04356
G1 X76.238 Y133.662 E.00414
G1 X75.162 Y134.738 E.04356
G1 X75.162 Y140.239 E.15758
G1 X76.27 Y141.347 E.04488
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.556 Y140.331 E.04117
G1 X108.99 Y142.878 E.07401
G1 X107.675 Y141.562 E.05329
G1 X107.953 Y143.193 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 8.5
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.675 Y141.562 E-.62855
G1 X107.919 Y141.807 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 50/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z8.73 I1.134 J-.441 P1  F30000
G1 X76.99 Y62.285 Z8.73
G1 Z8.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.309 Y62.285 E2.27184
G1 X156.309 Y181.502 E3.41461
G1 X115.944 Y181.502 E1.15613
G1 X108.844 Y139.918 E1.20829
G1 X76.592 Y139.918 E.92378
G1 X76.592 Y62.285 E2.22356
G1 X76.93 Y62.285 E.0097
G1 X76.99 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.91 Y62.684 E2.09644
G1 X155.91 Y181.104 E3.14572
G1 X116.28 Y181.104 E1.05274
G1 X109.18 Y139.52 E1.12063
G1 X76.99 Y139.52 E.8551
G1 X76.99 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.99 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.567 Y69.927 Z8.9 F30000
G1 X107.31 Y141.701 Z8.9
G1 Z8.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.809 Y141.701 E.93091
G1 X74.809 Y60.502 E2.3257
G1 X158.092 Y60.502 E2.38539
G1 X158.092 Y183.285 E3.51675
G1 X114.439 Y183.285 E1.25028
G1 X107.345 Y141.731 E1.20742
G1 X107.003 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.41 Y142.1 E.86581
G1 X74.41 Y60.104 E2.17814
G1 X158.49 Y60.104 E2.23351
G1 X158.49 Y183.684 E3.28279
G1 X114.103 Y183.684 E1.1791
G1 X107.014 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.014 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.953 Y143.193 Z8.9 F30000
G1 Z8.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.675 Y141.563 E.04738
G1 X108.991 Y142.878 E.05329
G1 X108.556 Y140.331 E.07402
G1 X107.539 Y141.347 E.04117
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.162 Y140.239 E.04488
G1 X75.162 Y134.737 E.15759
G1 X76.238 Y133.662 E.04356
G1 X76.238 Y133.518 E.00414
G1 X75.162 Y132.442 E.04356
G1 X75.162 Y126.94 E.15759
G1 X76.238 Y125.865 E.04356
G1 X76.238 Y125.72 E.00414
G1 X75.162 Y124.645 E.04356
G1 X75.162 Y119.143 E.15759
G1 X76.238 Y118.067 E.04356
G1 X76.238 Y117.923 E.00414
G1 X75.162 Y116.847 E.04356
G1 X75.162 Y111.345 E.15759
G1 X76.238 Y110.27 E.04356
G1 X76.238 Y110.126 E.00414
G1 X75.162 Y109.05 E.04356
G1 X75.162 Y103.548 E.15759
G1 X76.238 Y102.473 E.04356
G1 X76.238 Y102.328 E.00414
G1 X75.162 Y101.253 E.04356
G1 X75.162 Y95.751 E.15759
G1 X76.238 Y94.675 E.04356
G1 X76.238 Y94.531 E.00414
G1 X75.162 Y93.455 E.04356
G1 X75.162 Y87.953 E.15759
G1 X76.238 Y86.878 E.04356
G1 X76.238 Y86.733 E.00414
G1 X75.162 Y85.658 E.04356
G1 X75.162 Y80.156 E.15759
G1 X76.238 Y79.08 E.04356
G1 X76.238 Y78.936 E.00414
G1 X75.162 Y77.861 E.04356
G1 X75.162 Y72.359 E.15759
G1 X76.238 Y71.283 E.04356
G1 X76.238 Y71.139 E.00414
G1 X75.162 Y70.063 E.04356
G1 X75.162 Y64.561 E.15759
G1 X76.238 Y63.486 E.04356
G1 X76.238 Y63.341 E.00414
G1 X75.162 Y62.266 E.04356
G1 X75.162 Y60.856 E.04038
G1 X75.407 Y60.856 E.007
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.738 Y60.856 E.02568
G1 X157.738 Y61.613 E.02169
G1 X156.662 Y64.138 F30000
G1 F16200
G1 X156.662 Y65.792 E.04738
G1 X157.738 Y66.868 E.04356
G1 X157.738 Y67.757 E.02546
G1 X156.662 Y68.832 E.04356
G1 X156.662 Y73.59 E.13626
G1 X157.738 Y74.665 E.04356
G1 X157.738 Y75.554 E.02546
G1 X156.662 Y76.63 E.04356
G1 X156.662 Y81.387 E.13626
G1 X157.738 Y82.462 E.04356
G1 X157.738 Y83.351 E.02546
G1 X156.662 Y84.427 E.04356
G1 X156.662 Y89.184 E.13626
G1 X157.738 Y90.26 E.04356
G1 X157.738 Y91.149 E.02546
G1 X156.662 Y92.224 E.04356
G1 X156.662 Y96.982 E.13626
G1 X157.738 Y98.057 E.04356
G1 X157.738 Y98.946 E.02546
G1 X156.662 Y100.022 E.04356
G1 X156.662 Y104.779 E.13626
G1 X157.738 Y105.855 E.04356
G1 X157.738 Y106.744 E.02546
G1 X156.662 Y107.819 E.04356
G1 X156.662 Y112.576 E.13626
G1 X157.738 Y113.652 E.04356
G1 X157.738 Y114.541 E.02546
G1 X156.662 Y115.616 E.04356
G1 X156.662 Y120.374 E.13626
G1 X157.738 Y121.449 E.04356
G1 X157.738 Y122.338 E.02546
G1 X156.662 Y123.414 E.04356
G1 X156.662 Y128.171 E.13626
G1 X157.738 Y129.247 E.04356
G1 X157.738 Y130.136 E.02546
G1 X156.662 Y131.211 E.04356
G1 X156.662 Y135.969 E.13626
G1 X157.738 Y137.044 E.04356
G1 X157.738 Y137.933 E.02546
G1 X156.662 Y139.008 E.04356
G1 X156.662 Y143.766 E.13626
G1 X157.738 Y144.841 E.04356
G1 X157.738 Y145.73 E.02546
G1 X156.662 Y146.806 E.04356
G1 X156.662 Y151.563 E.13626
G1 X157.738 Y152.639 E.04356
G1 X157.738 Y153.528 E.02546
G1 X156.662 Y154.603 E.04356
G1 X156.662 Y159.361 E.13626
G1 X157.738 Y160.436 E.04356
G1 X157.738 Y161.325 E.02546
G1 X156.662 Y162.401 E.04356
G1 X156.662 Y167.158 E.13626
G1 X157.738 Y168.233 E.04356
G1 X157.738 Y169.122 E.02546
G1 X156.662 Y170.198 E.04356
G1 X156.662 Y174.955 E.13626
G1 X157.738 Y176.031 E.04356
G1 X157.738 Y176.92 E.02546
G1 X156.662 Y177.995 E.04356
G1 X156.662 Y179.649 E.04738
G1 X157.738 Y182.174 F30000
G1 F16200
G1 X157.738 Y182.932 E.02169
G1 X156.841 Y182.932 E.02568
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.725 Y182.855 F30000
G1 F16200
G1 X114.446 Y181.224 E.04738
G1 X115.378 Y180.292 E.03775
G1 X115.412 Y180.489 E.00571
G1 X114.096 Y179.173 E.05329
G1 X113.309 Y174.564 E.13393
G1 X114.241 Y173.632 E.03775
G1 X113.807 Y171.086 E.07397
G1 X112.491 Y169.771 E.05329
G1 X112.172 Y167.904 E.05425
G1 X113.104 Y166.972 E.03775
G1 X112.201 Y161.684 E.15366
G1 X110.886 Y160.368 E.05329
G1 X111.035 Y161.244 E.02544
G1 X111.967 Y160.312 E.03775
G1 X111.689 Y158.681 E.04738
G1 X109.971 Y148.622 F30000
G1 F16200
G1 X109.693 Y146.991 E.04738
G1 X108.761 Y147.923 E.03775
G1 X109.28 Y150.965 E.0884
G1 X110.596 Y152.281 E.05329
G1 X110.83 Y153.651 E.03982
G1 X109.898 Y154.583 E.03775
G1 X110.176 Y156.214 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 8.67
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.898 Y154.583 E-.62855
G1 X110.143 Y154.339 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 51/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z8.9 I1.145 J-.412 P1  F30000
G1 X76.99 Y62.285 Z8.9
G1 Z8.67
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.309 Y62.285 E2.27184
G1 X156.309 Y181.502 E3.41461
G1 X115.944 Y181.502 E1.15613
G1 X108.844 Y139.918 E1.20829
G1 X76.592 Y139.918 E.92378
G1 X76.592 Y62.285 E2.22356
G1 X76.93 Y62.285 E.0097
G1 X76.99 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.91 Y62.684 E2.09644
G1 X155.91 Y181.104 E3.14572
G1 X116.28 Y181.104 E1.05274
G1 X109.18 Y139.52 E1.12063
G1 X76.99 Y139.52 E.8551
G1 X76.99 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.99 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.567 Y69.927 Z9.07 F30000
G1 X107.31 Y141.701 Z9.07
G1 Z8.67
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.809 Y141.701 E.93091
G1 X74.809 Y60.502 E2.3257
G1 X158.092 Y60.502 E2.38539
G1 X158.092 Y183.285 E3.51675
G1 X114.44 Y183.285 E1.25028
G1 X107.345 Y141.731 E1.20742
G1 X107.004 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.41 Y142.1 E.86581
G1 X74.41 Y60.104 E2.17814
G1 X158.49 Y60.104 E2.23351
G1 X158.49 Y183.684 E3.28279
G1 X114.103 Y183.684 E1.1791
G1 X107.014 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.014 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.645 Y149.32 Z9.07 F30000
G1 X110.176 Y156.214 Z9.07
G1 Z8.67
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.898 Y154.583 E.04738
G1 X110.83 Y153.651 E.03775
G1 X110.596 Y152.281 E.03981
G1 X109.28 Y150.966 E.05329
G1 X108.761 Y147.923 E.0884
G1 X109.693 Y146.991 E.03775
G1 X109.971 Y148.622 E.04738
G1 X111.689 Y158.681 F30000
G1 F16200
G1 X111.967 Y160.312 E.04738
G1 X111.035 Y161.244 E.03775
G1 X110.886 Y160.368 E.02543
G1 X112.201 Y161.684 E.05329
G1 X113.104 Y166.972 E.15365
G1 X112.172 Y167.904 E.03775
G1 X112.491 Y169.771 E.05425
G1 X113.807 Y171.087 E.05329
G1 X114.241 Y173.632 E.07396
G1 X113.309 Y174.564 E.03775
G1 X114.096 Y179.174 E.13394
G1 X115.412 Y180.489 E.05329
G1 X115.378 Y180.292 E.00572
G1 X114.447 Y181.224 E.03775
G1 X114.725 Y182.855 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.738 Y182.932 E.02569
G1 X157.738 Y182.174 E.02169
G1 X156.662 Y179.649 F30000
G1 F16200
G1 X156.662 Y177.995 E.04738
G1 X157.738 Y176.92 E.04356
G1 X157.738 Y176.031 E.02545
G1 X156.662 Y174.955 E.04356
G1 X156.662 Y170.198 E.13627
G1 X157.738 Y169.122 E.04356
G1 X157.738 Y168.234 E.02545
G1 X156.662 Y167.158 E.04356
G1 X156.662 Y162.4 E.13627
G1 X157.738 Y161.325 E.04356
G1 X157.738 Y160.436 E.02545
G1 X156.662 Y159.361 E.04356
G1 X156.662 Y154.603 E.13627
G1 X157.738 Y153.528 E.04356
G1 X157.738 Y152.639 E.02545
G1 X156.662 Y151.563 E.04356
G1 X156.662 Y146.806 E.13627
G1 X157.738 Y145.73 E.04356
G1 X157.738 Y144.842 E.02545
G1 X156.662 Y143.766 E.04356
G1 X156.662 Y139.008 E.13627
G1 X157.738 Y137.933 E.04356
G1 X157.738 Y137.044 E.02545
G1 X156.662 Y135.969 E.04356
G1 X156.662 Y131.211 E.13627
G1 X157.738 Y130.135 E.04356
G1 X157.738 Y129.247 E.02545
G1 X156.662 Y128.171 E.04356
G1 X156.662 Y123.414 E.13627
G1 X157.738 Y122.338 E.04356
G1 X157.738 Y121.449 E.02545
G1 X156.662 Y120.374 E.04356
G1 X156.662 Y115.616 E.13627
G1 X157.738 Y114.541 E.04356
G1 X157.738 Y113.652 E.02545
G1 X156.662 Y112.577 E.04356
G1 X156.662 Y107.819 E.13627
G1 X157.738 Y106.743 E.04356
G1 X157.738 Y105.855 E.02545
G1 X156.662 Y104.779 E.04356
G1 X156.662 Y100.022 E.13627
G1 X157.738 Y98.946 E.04356
G1 X157.738 Y98.057 E.02545
G1 X156.662 Y96.982 E.04356
G1 X156.662 Y92.224 E.13627
G1 X157.738 Y91.149 E.04356
G1 X157.738 Y90.26 E.02545
G1 X156.662 Y89.184 E.04356
G1 X156.662 Y84.427 E.13627
G1 X157.738 Y83.351 E.04356
G1 X157.738 Y82.463 E.02545
G1 X156.662 Y81.387 E.04356
G1 X156.662 Y76.629 E.13627
G1 X157.738 Y75.554 E.04356
G1 X157.738 Y74.665 E.02545
G1 X156.662 Y73.59 E.04356
G1 X156.662 Y68.832 E.13627
G1 X157.738 Y67.757 E.04356
G1 X157.738 Y66.868 E.02545
G1 X156.662 Y65.792 E.04356
G1 X156.662 Y64.138 E.04738
G1 X157.738 Y61.613 F30000
G1 F16200
G1 X157.738 Y60.856 E.02169
G1 X156.841 Y60.856 E.02569
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.162 Y60.856 E.00699
G1 X75.162 Y62.266 E.04038
G1 X76.238 Y63.341 E.04356
G1 X76.238 Y63.486 E.00413
G1 X75.162 Y64.561 E.04356
G1 X75.162 Y70.063 E.1576
G1 X76.238 Y71.139 E.04356
G1 X76.238 Y71.283 E.00413
G1 X75.162 Y72.358 E.04356
G1 X75.162 Y77.861 E.1576
G1 X76.238 Y78.936 E.04356
G1 X76.238 Y79.08 E.00413
G1 X75.162 Y80.156 E.04356
G1 X75.162 Y85.658 E.1576
G1 X76.238 Y86.734 E.04356
G1 X76.238 Y86.878 E.00413
G1 X75.162 Y87.953 E.04356
G1 X75.162 Y93.455 E.1576
G1 X76.238 Y94.531 E.04356
G1 X76.238 Y94.675 E.00413
G1 X75.162 Y95.751 E.04356
G1 X75.162 Y101.253 E.1576
G1 X76.238 Y102.328 E.04356
G1 X76.238 Y102.472 E.00413
G1 X75.162 Y103.548 E.04356
G1 X75.162 Y109.05 E.1576
G1 X76.238 Y110.126 E.04356
G1 X76.238 Y110.27 E.00413
G1 X75.162 Y111.345 E.04356
G1 X75.162 Y116.848 E.1576
G1 X76.238 Y117.923 E.04356
G1 X76.238 Y118.067 E.00413
G1 X75.162 Y119.143 E.04356
G1 X75.162 Y124.645 E.1576
G1 X76.238 Y125.72 E.04356
G1 X76.238 Y125.865 E.00413
G1 X75.162 Y126.94 E.04356
G1 X75.162 Y132.442 E.1576
G1 X76.238 Y133.518 E.04356
G1 X76.238 Y133.662 E.00413
G1 X75.162 Y134.737 E.04356
G1 X75.162 Y140.24 E.1576
G1 X76.27 Y141.347 E.04487
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.556 Y140.331 E.04118
G1 X108.991 Y142.878 E.07403
G1 X107.675 Y141.563 E.05329
G1 X107.953 Y143.193 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 8.84
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.675 Y141.563 E-.62855
G1 X107.92 Y141.807 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 52/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z9.07 I1.134 J-.441 P1  F30000
G1 X76.99 Y62.285 Z9.07
G1 Z8.84
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.309 Y62.285 E2.27184
G1 X156.309 Y181.502 E3.41461
G1 X115.944 Y181.502 E1.15613
G1 X108.844 Y139.918 E1.20829
G1 X76.592 Y139.918 E.92378
G1 X76.592 Y62.285 E2.22356
G1 X76.93 Y62.285 E.0097
G1 X76.99 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.91 Y62.684 E2.09644
G1 X155.91 Y181.104 E3.14572
G1 X116.28 Y181.104 E1.05274
G1 X109.181 Y139.52 E1.12063
G1 X76.99 Y139.52 E.8551
G1 X76.99 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.99 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.567 Y69.927 Z9.24 F30000
G1 X107.31 Y141.701 Z9.24
G1 Z8.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.809 Y141.701 E.93091
G1 X74.809 Y60.502 E2.3257
G1 X158.092 Y60.502 E2.38539
G1 X158.092 Y183.285 E3.51675
G1 X114.44 Y183.285 E1.25028
G1 X107.345 Y141.731 E1.20742
G1 X107.004 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.41 Y142.1 E.86581
G1 X74.41 Y60.104 E2.17814
G1 X158.49 Y60.104 E2.23351
G1 X158.49 Y183.684 E3.28279
G1 X114.103 Y183.684 E1.1791
G1 X107.014 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.014 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.954 Y143.193 Z9.24 F30000
G1 Z8.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.675 Y141.563 E.04738
G1 X108.991 Y142.879 E.05329
G1 X108.556 Y140.331 E.07403
G1 X107.539 Y141.347 E.04118
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
M73 P84 R10
G1 X75.163 Y140.24 E.04486
G1 X75.163 Y134.737 E.1576
G1 X76.238 Y133.662 E.04356
G1 X76.238 Y133.518 E.00412
G1 X75.163 Y132.442 E.04356
G1 X75.163 Y126.94 E.1576
G1 X76.238 Y125.864 E.04356
G1 X76.238 Y125.721 E.00412
G1 X75.163 Y124.645 E.04356
G1 X75.163 Y119.142 E.1576
G1 X76.238 Y118.067 E.04356
G1 X76.238 Y117.923 E.00412
G1 X75.163 Y116.848 E.04356
G1 X75.163 Y111.345 E.1576
G1 X76.238 Y110.27 E.04356
G1 X76.238 Y110.126 E.00412
G1 X75.163 Y109.05 E.04356
G1 X75.163 Y103.548 E.1576
G1 X76.238 Y102.472 E.04356
G1 X76.238 Y102.328 E.00412
G1 X75.163 Y101.253 E.04356
G1 X75.163 Y95.75 E.1576
G1 X76.238 Y94.675 E.04356
G1 X76.238 Y94.531 E.00412
G1 X75.163 Y93.456 E.04356
G1 X75.163 Y87.953 E.1576
G1 X76.238 Y86.878 E.04356
G1 X76.238 Y86.734 E.00412
G1 X75.163 Y85.658 E.04356
G1 X75.163 Y80.156 E.1576
G1 X76.238 Y79.08 E.04356
G1 X76.238 Y78.936 E.00412
G1 X75.163 Y77.861 E.04356
G1 X75.163 Y72.358 E.1576
G1 X76.238 Y71.283 E.04356
G1 X76.238 Y71.139 E.00412
G1 X75.163 Y70.064 E.04356
G1 X75.163 Y64.561 E.1576
G1 X76.238 Y63.485 E.04356
G1 X76.238 Y63.342 E.00412
G1 X75.163 Y62.266 E.04356
G1 X75.163 Y60.856 E.04039
G1 X75.407 Y60.856 E.00699
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.738 Y60.856 E.02569
G1 X157.738 Y61.613 E.02169
G1 X156.663 Y64.138 F30000
G1 F16200
G1 X156.663 Y65.793 E.04738
G1 X157.738 Y66.868 E.04356
G1 X157.738 Y67.756 E.02545
G1 X156.663 Y68.832 E.04356
G1 X156.663 Y73.59 E.13628
G1 X157.738 Y74.665 E.04356
G1 X157.738 Y75.554 E.02545
G1 X156.663 Y76.629 E.04356
G1 X156.663 Y81.387 E.13628
G1 X157.738 Y82.463 E.04356
G1 X157.738 Y83.351 E.02545
G1 X156.663 Y84.427 E.04356
G1 X156.663 Y89.185 E.13628
G1 X157.738 Y90.26 E.04356
G1 X157.738 Y91.149 E.02545
G1 X156.663 Y92.224 E.04356
G1 X156.663 Y96.982 E.13628
G1 X157.738 Y98.057 E.04356
G1 X157.738 Y98.946 E.02545
G1 X156.663 Y100.021 E.04356
G1 X156.663 Y104.779 E.13628
G1 X157.738 Y105.855 E.04356
G1 X157.738 Y106.743 E.02545
G1 X156.663 Y107.819 E.04356
G1 X156.663 Y112.577 E.13628
G1 X157.738 Y113.652 E.04356
G1 X157.738 Y114.541 E.02545
G1 X156.663 Y115.616 E.04356
G1 X156.663 Y120.374 E.13628
G1 X157.738 Y121.45 E.04356
G1 X157.738 Y122.338 E.02545
G1 X156.663 Y123.413 E.04356
G1 X156.663 Y128.171 E.13628
G1 X157.738 Y129.247 E.04356
G1 X157.738 Y130.135 E.02545
G1 X156.663 Y131.211 E.04356
G1 X156.663 Y135.969 E.13628
G1 X157.738 Y137.044 E.04356
G1 X157.738 Y137.933 E.02545
G1 X156.663 Y139.008 E.04356
G1 X156.663 Y143.766 E.13628
G1 X157.738 Y144.842 E.04356
G1 X157.738 Y145.73 E.02545
G1 X156.663 Y146.806 E.04356
G1 X156.663 Y151.564 E.13628
G1 X157.738 Y152.639 E.04356
G1 X157.738 Y153.527 E.02545
G1 X156.663 Y154.603 E.04356
G1 X156.663 Y159.361 E.13628
G1 X157.738 Y160.436 E.04356
G1 X157.738 Y161.325 E.02545
G1 X156.663 Y162.4 E.04356
G1 X156.663 Y167.158 E.13628
G1 X157.738 Y168.234 E.04356
G1 X157.738 Y169.122 E.02545
G1 X156.663 Y170.198 E.04356
G1 X156.663 Y174.956 E.13628
G1 X157.738 Y176.031 E.04356
G1 X157.738 Y176.919 E.02545
G1 X156.663 Y177.995 E.04356
G1 X156.663 Y179.649 E.04738
G1 X157.738 Y182.174 F30000
G1 F16200
G1 X157.738 Y182.932 E.02169
G1 X156.841 Y182.932 E.02569
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.725 Y182.855 F30000
G1 F16200
G1 X114.447 Y181.224 E.04738
G1 X115.379 Y180.292 E.03775
G1 X115.412 Y180.489 E.00573
G1 X114.097 Y179.174 E.05329
G1 X113.31 Y174.564 E.13395
G1 X114.241 Y173.632 E.03775
G1 X113.807 Y171.087 E.07395
G1 X112.491 Y169.771 E.05329
G1 X112.172 Y167.904 E.05426
G1 X113.104 Y166.972 E.03775
G1 X112.202 Y161.684 E.15364
G1 X110.886 Y160.368 E.05329
G1 X111.035 Y161.243 E.02542
G1 X111.967 Y160.311 E.03775
G1 X111.689 Y158.681 E.04738
M73 P84 R9
G1 X109.971 Y148.621 F30000
G1 F16200
G1 X109.693 Y146.991 E.04738
G1 X108.761 Y147.923 E.03775
G1 X109.281 Y150.966 E.08841
G1 X110.596 Y152.281 E.05329
G1 X110.83 Y153.651 E.0398
G1 X109.898 Y154.583 E.03775
G1 X110.177 Y156.214 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 9.01
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.898 Y154.583 E-.62855
G1 X110.143 Y154.339 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 53/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z9.24 I1.145 J-.412 P1  F30000
G1 X76.99 Y62.285 Z9.24
G1 Z9.01
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.309 Y62.285 E2.27184
G1 X156.309 Y181.502 E3.41461
G1 X115.944 Y181.502 E1.15613
G1 X108.844 Y139.918 E1.20829
G1 X76.592 Y139.918 E.92378
G1 X76.592 Y62.285 E2.22356
G1 X76.93 Y62.285 E.0097
G1 X76.99 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.911 Y62.684 E2.09644
G1 X155.911 Y181.104 E3.14572
G1 X116.28 Y181.104 E1.05274
G1 X109.181 Y139.52 E1.12063
G1 X76.99 Y139.52 E.8551
G1 X76.99 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.99 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.567 Y69.927 Z9.41 F30000
G1 X107.311 Y141.701 Z9.41
G1 Z9.01
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.809 Y141.701 E.93091
G1 X74.809 Y60.502 E2.3257
G1 X158.092 Y60.502 E2.38539
G1 X158.092 Y183.285 E3.51675
G1 X114.44 Y183.285 E1.25028
G1 X107.345 Y141.731 E1.20742
G1 X107.004 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.41 Y142.1 E.86581
G1 X74.41 Y60.104 E2.17814
G1 X158.491 Y60.104 E2.23351
G1 X158.491 Y183.684 E3.28279
G1 X114.104 Y183.684 E1.1791
G1 X107.014 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.014 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.645 Y149.32 Z9.41 F30000
G1 X110.177 Y156.213 Z9.41
G1 Z9.01
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.898 Y154.583 E.04738
G1 X110.83 Y153.651 E.03775
G1 X110.596 Y152.282 E.03979
G1 X109.281 Y150.966 E.05329
G1 X108.761 Y147.923 E.08842
G1 X109.693 Y146.991 E.03775
G1 X109.972 Y148.621 E.04738
G1 X111.689 Y158.681 F30000
G1 F16200
G1 X111.967 Y160.311 E.04738
G1 X111.035 Y161.243 E.03775
G1 X110.886 Y160.369 E.02542
G1 X112.202 Y161.684 E.05329
G1 X113.104 Y166.972 E.15363
G1 X112.173 Y167.903 E.03775
G1 X112.491 Y169.771 E.05427
G1 X113.807 Y171.087 E.05329
G1 X114.242 Y173.632 E.07395
G1 X113.31 Y174.564 E.03775
G1 X114.097 Y179.174 E.13396
G1 X115.412 Y180.49 E.05329
G1 X115.379 Y180.292 E.00574
G1 X114.447 Y181.224 E.03775
G1 X114.725 Y182.854 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.738 Y182.932 E.02569
G1 X157.738 Y182.175 E.02168
G1 X156.663 Y179.649 F30000
G1 F16200
G1 X156.663 Y177.995 E.04738
G1 X157.738 Y176.919 E.04356
G1 X157.738 Y176.031 E.02544
G1 X156.663 Y174.956 E.04356
G1 X156.663 Y170.197 E.13629
G1 X157.738 Y169.122 E.04356
G1 X157.738 Y168.234 E.02544
G1 X156.663 Y167.158 E.04356
G1 X156.663 Y162.4 E.13629
G1 X157.738 Y161.325 E.04356
G1 X157.738 Y160.437 E.02544
G1 X156.663 Y159.361 E.04356
G1 X156.663 Y154.603 E.13629
G1 X157.738 Y153.527 E.04356
G1 X157.738 Y152.639 E.02544
G1 X156.663 Y151.564 E.04356
G1 X156.663 Y146.805 E.13629
G1 X157.738 Y145.73 E.04356
G1 X157.738 Y144.842 E.02544
G1 X156.663 Y143.766 E.04356
G1 X156.663 Y139.008 E.13629
G1 X157.738 Y137.933 E.04356
G1 X157.738 Y137.044 E.02544
G1 X156.663 Y135.969 E.04356
G1 X156.663 Y131.211 E.13629
G1 X157.738 Y130.135 E.04356
G1 X157.738 Y129.247 E.02544
G1 X156.663 Y128.172 E.04356
G1 X156.663 Y123.413 E.13629
G1 X157.738 Y122.338 E.04356
G1 X157.738 Y121.45 E.02544
G1 X156.663 Y120.374 E.04356
G1 X156.663 Y115.616 E.13629
G1 X157.738 Y114.54 E.04356
G1 X157.738 Y113.652 E.02544
G1 X156.663 Y112.577 E.04356
G1 X156.663 Y107.819 E.13629
G1 X157.738 Y106.743 E.04356
G1 X157.738 Y105.855 E.02544
G1 X156.663 Y104.78 E.04356
G1 X156.663 Y100.021 E.13629
G1 X157.738 Y98.946 E.04356
G1 X157.738 Y98.058 E.02544
G1 X156.663 Y96.982 E.04356
G1 X156.663 Y92.224 E.13629
G1 X157.738 Y91.148 E.04356
G1 X157.738 Y90.26 E.02544
G1 X156.663 Y89.185 E.04356
G1 X156.663 Y84.427 E.13629
G1 X157.738 Y83.351 E.04356
G1 X157.738 Y82.463 E.02544
G1 X156.663 Y81.387 E.04356
G1 X156.663 Y76.629 E.13629
G1 X157.738 Y75.554 E.04356
G1 X157.738 Y74.666 E.02544
G1 X156.663 Y73.59 E.04356
G1 X156.663 Y68.832 E.13629
G1 X157.738 Y67.756 E.04356
G1 X157.738 Y66.868 E.02544
G1 X156.663 Y65.793 E.04356
G1 X156.663 Y64.139 E.04738
G1 X157.738 Y61.613 F30000
G1 F16200
G1 X157.738 Y60.856 E.02168
G1 X156.841 Y60.856 E.02569
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.163 Y60.856 E.00698
G1 X75.163 Y62.266 E.04039
G1 X76.238 Y63.342 E.04356
G1 X76.238 Y63.485 E.00411
G1 X75.163 Y64.561 E.04356
G1 X75.163 Y70.064 E.15761
G1 X76.238 Y71.139 E.04356
G1 X76.238 Y71.283 E.00411
G1 X75.163 Y72.358 E.04356
G1 X75.163 Y77.861 E.15761
G1 X76.238 Y78.937 E.04356
G1 X76.238 Y79.08 E.00411
G1 X75.163 Y80.156 E.04356
G1 X75.163 Y85.658 E.15761
G1 X76.238 Y86.734 E.04356
G1 X76.238 Y86.877 E.00411
G1 X75.163 Y87.953 E.04356
G1 X75.163 Y93.456 E.15761
G1 X76.238 Y94.531 E.04356
G1 X76.238 Y94.675 E.00411
G1 X75.163 Y95.75 E.04356
G1 X75.163 Y101.253 E.15761
G1 X76.238 Y102.329 E.04356
G1 X76.238 Y102.472 E.00411
G1 X75.163 Y103.548 E.04356
G1 X75.163 Y109.05 E.15761
G1 X76.238 Y110.126 E.04356
G1 X76.238 Y110.269 E.00411
G1 X75.163 Y111.345 E.04356
G1 X75.163 Y116.848 E.15761
G1 X76.238 Y117.923 E.04356
G1 X76.238 Y118.067 E.00411
G1 X75.163 Y119.142 E.04356
G1 X75.163 Y124.645 E.15761
G1 X76.238 Y125.721 E.04356
G1 X76.238 Y125.864 E.00411
G1 X75.163 Y126.94 E.04356
G1 X75.163 Y132.443 E.15761
G1 X76.238 Y133.518 E.04356
G1 X76.238 Y133.662 E.00411
G1 X75.163 Y134.737 E.04356
G1 X75.163 Y140.24 E.15761
G1 X76.27 Y141.347 E.04486
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.556 Y140.331 E.04119
G1 X108.991 Y142.879 E.07404
G1 X107.675 Y141.563 E.05329
G1 X107.954 Y143.194 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 9.18
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.675 Y141.563 E-.62855
G1 X107.92 Y141.808 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 54/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z9.41 I1.134 J-.441 P1  F30000
G1 X76.991 Y62.285 Z9.41
G1 Z9.18
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.309 Y62.285 E2.27184
G1 X156.309 Y181.502 E3.41461
G1 X115.944 Y181.502 E1.15613
G1 X108.845 Y139.918 E1.20829
G1 X76.592 Y139.918 E.92378
G1 X76.592 Y62.285 E2.22356
G1 X76.931 Y62.285 E.0097
G1 X76.991 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.911 Y62.684 E2.09644
G1 X155.911 Y181.104 E3.14572
G1 X116.281 Y181.104 E1.05274
G1 X109.181 Y139.52 E1.12063
G1 X76.991 Y139.52 E.8551
G1 X76.991 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.991 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.567 Y69.927 Z9.58 F30000
G1 X107.311 Y141.701 Z9.58
G1 Z9.18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.809 Y141.701 E.93091
G1 X74.809 Y60.502 E2.3257
G1 X158.092 Y60.502 E2.38539
G1 X158.092 Y183.285 E3.51675
G1 X114.44 Y183.285 E1.25028
G1 X107.345 Y141.731 E1.20742
G1 X107.004 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.411 Y142.1 E.86581
G1 X74.411 Y60.104 E2.17814
G1 X158.491 Y60.104 E2.23351
G1 X158.491 Y183.684 E3.28279
G1 X114.104 Y183.684 E1.1791
G1 X107.014 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.014 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.954 Y143.194 Z9.58 F30000
G1 Z9.18
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.676 Y141.563 E.04738
G1 X108.991 Y142.879 E.05329
G1 X108.556 Y140.33 E.07405
G1 X107.539 Y141.347 E.04119
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.163 Y140.24 E.04485
G1 X75.163 Y134.737 E.15762
G1 X76.238 Y133.661 E.04356
G1 X76.238 Y133.518 E.0041
G1 X75.163 Y132.443 E.04356
G1 X75.163 Y126.94 E.15762
G1 X76.238 Y125.864 E.04356
G1 X76.238 Y125.721 E.0041
G1 X75.163 Y124.645 E.04356
G1 X75.163 Y119.142 E.15762
G1 X76.238 Y118.067 E.04356
G1 X76.238 Y117.923 E.0041
G1 X75.163 Y116.848 E.04356
G1 X75.163 Y111.345 E.15762
G1 X76.238 Y110.269 E.04356
G1 X76.238 Y110.126 E.0041
G1 X75.163 Y109.051 E.04356
G1 X75.163 Y103.547 E.15762
G1 X76.238 Y102.472 E.04356
G1 X76.238 Y102.329 E.0041
G1 X75.163 Y101.253 E.04356
G1 X75.163 Y95.75 E.15762
G1 X76.238 Y94.675 E.04356
G1 X76.238 Y94.531 E.0041
G1 X75.163 Y93.456 E.04356
G1 X75.163 Y87.953 E.15762
G1 X76.238 Y86.877 E.04356
G1 X76.238 Y86.734 E.0041
G1 X75.163 Y85.659 E.04356
G1 X75.163 Y80.155 E.15762
G1 X76.238 Y79.08 E.04356
G1 X76.238 Y78.937 E.0041
G1 X75.163 Y77.861 E.04356
G1 X75.163 Y72.358 E.15762
G1 X76.238 Y71.283 E.04356
G1 X76.238 Y71.139 E.0041
G1 X75.163 Y70.064 E.04356
G1 X75.163 Y64.561 E.15762
G1 X76.238 Y63.485 E.04356
G1 X76.238 Y63.342 E.0041
G1 X75.163 Y62.266 E.04356
G1 X75.163 Y60.856 E.0404
G1 X75.407 Y60.856 E.00698
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.738 Y60.856 E.0257
G1 X157.738 Y61.613 E.02168
G1 X156.663 Y64.139 F30000
G1 F16200
G1 X156.663 Y65.793 E.04738
G1 X157.738 Y66.868 E.04356
G1 X157.738 Y67.756 E.02543
G1 X156.663 Y68.832 E.04356
G1 X156.663 Y73.59 E.13629
G1 X157.738 Y74.666 E.04356
G1 X157.738 Y75.554 E.02543
G1 X156.663 Y76.629 E.04356
G1 X156.663 Y81.388 E.13629
G1 X157.738 Y82.463 E.04356
G1 X157.738 Y83.351 E.02543
G1 X156.663 Y84.426 E.04356
G1 X156.663 Y89.185 E.13629
G1 X157.738 Y90.26 E.04356
G1 X157.738 Y91.148 E.02543
G1 X156.663 Y92.224 E.04356
G1 X156.663 Y96.982 E.13629
G1 X157.738 Y98.058 E.04356
G1 X157.738 Y98.946 E.02543
G1 X156.663 Y100.021 E.04356
G1 X156.663 Y104.78 E.13629
G1 X157.738 Y105.855 E.04356
G1 X157.738 Y106.743 E.02543
G1 X156.663 Y107.818 E.04356
G1 X156.663 Y112.577 E.13629
G1 X157.738 Y113.653 E.04356
G1 X157.738 Y114.54 E.02543
G1 X156.663 Y115.616 E.04356
G1 X156.663 Y120.374 E.13629
G1 X157.738 Y121.45 E.04356
G1 X157.738 Y122.338 E.02543
G1 X156.663 Y123.413 E.04356
G1 X156.663 Y128.172 E.13629
G1 X157.738 Y129.247 E.04356
G1 X157.738 Y130.135 E.02543
G1 X156.663 Y131.211 E.04356
G1 X156.663 Y135.969 E.13629
G1 X157.738 Y137.045 E.04356
G1 X157.738 Y137.932 E.02543
G1 X156.663 Y139.008 E.04356
G1 X156.663 Y143.766 E.1363
G1 X157.738 Y144.842 E.04356
G1 X157.738 Y145.73 E.02543
G1 X156.663 Y146.805 E.04356
G1 X156.663 Y151.564 E.1363
G1 X157.738 Y152.639 E.04356
G1 X157.738 Y153.527 E.02543
G1 X156.663 Y154.603 E.04356
G1 X156.663 Y159.361 E.1363
G1 X157.738 Y160.437 E.04356
G1 X157.738 Y161.324 E.02543
G1 X156.663 Y162.4 E.04356
G1 X156.663 Y167.159 E.1363
G1 X157.738 Y168.234 E.04356
G1 X157.738 Y169.122 E.02543
G1 X156.663 Y170.197 E.04356
G1 X156.663 Y174.956 E.1363
G1 X157.738 Y176.031 E.04356
G1 X157.738 Y176.919 E.02543
G1 X156.663 Y177.995 E.04356
G1 X156.663 Y179.649 E.04738
G1 X157.738 Y182.175 F30000
G1 F16200
G1 X157.738 Y182.932 E.02168
G1 X156.841 Y182.932 E.0257
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.725 Y182.854 F30000
G1 F16200
G1 X114.447 Y181.224 E.04738
G1 X115.379 Y180.292 E.03775
G1 X115.413 Y180.49 E.00575
G1 X114.097 Y179.174 E.05329
G1 X113.31 Y174.564 E.13397
G1 X114.242 Y173.632 E.03775
G1 X113.807 Y171.087 E.07394
G1 X112.492 Y169.771 E.05329
G1 X112.173 Y167.903 E.05428
G1 X113.105 Y166.971 E.03775
G1 X112.202 Y161.684 E.15362
G1 X110.886 Y160.369 E.05329
G1 X111.036 Y161.243 E.02541
G1 X111.967 Y160.311 E.03775
G1 X111.689 Y158.681 E.04738
G1 X109.972 Y148.621 F30000
G1 F16200
G1 X109.693 Y146.991 E.04738
G1 X108.761 Y147.923 E.03775
G1 X109.281 Y150.966 E.08843
G1 X110.597 Y152.282 E.05329
G1 X110.83 Y153.651 E.03979
G1 X109.898 Y154.583 E.03775
G1 X110.177 Y156.213 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 9.35
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.898 Y154.583 E-.62855
G1 X110.143 Y154.338 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 55/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z9.58 I1.145 J-.412 P1  F30000
G1 X76.991 Y62.285 Z9.58
G1 Z9.35
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.309 Y62.285 E2.27184
G1 X156.309 Y181.502 E3.41461
G1 X115.944 Y181.502 E1.15613
G1 X108.845 Y139.918 E1.20829
G1 X76.592 Y139.918 E.92378
G1 X76.592 Y62.285 E2.22356
G1 X76.931 Y62.285 E.0097
G1 X76.991 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.911 Y62.684 E2.09644
G1 X155.911 Y181.104 E3.14572
G1 X116.281 Y181.104 E1.05274
G1 X109.181 Y139.52 E1.12063
G1 X76.991 Y139.52 E.8551
G1 X76.991 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.991 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.568 Y69.927 Z9.75 F30000
G1 X107.311 Y141.701 Z9.75
G1 Z9.35
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.809 Y141.701 E.93091
G1 X74.809 Y60.502 E2.3257
G1 X158.092 Y60.502 E2.38539
G1 X158.092 Y183.285 E3.51675
G1 X114.44 Y183.285 E1.25028
G1 X107.346 Y141.731 E1.20742
G1 X107.004 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.411 Y142.1 E.86581
G1 X74.411 Y60.104 E2.17814
G1 X158.491 Y60.104 E2.23351
G1 X158.491 Y183.684 E3.28279
G1 X114.104 Y183.684 E1.1791
G1 X107.014 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.014 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.645 Y149.32 Z9.75 F30000
G1 X110.177 Y156.213 Z9.75
G1 Z9.35
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.899 Y154.583 E.04738
G1 X110.831 Y153.651 E.03775
M73 P85 R9
G1 X110.597 Y152.282 E.03978
G1 X109.281 Y150.966 E.05329
G1 X108.761 Y147.923 E.08844
G1 X109.693 Y146.991 E.03775
G1 X109.972 Y148.621 E.04738
G1 X111.689 Y158.681 F30000
G1 F16200
G1 X111.968 Y160.311 E.04738
G1 X111.036 Y161.243 E.03775
G1 X110.886 Y160.369 E.0254
G1 X112.202 Y161.685 E.05329
G1 X113.105 Y166.971 E.15361
G1 X112.173 Y167.903 E.03775
G1 X112.492 Y169.772 E.05429
G1 X113.807 Y171.087 E.05329
G1 X114.242 Y173.632 E.07393
G1 X113.31 Y174.563 E.03775
G1 X114.097 Y179.174 E.13397
G1 X115.413 Y180.49 E.05329
G1 X115.379 Y180.292 E.00576
G1 X114.447 Y181.224 E.03775
G1 X114.725 Y182.854 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.739 Y182.932 E.0257
G1 X157.739 Y182.175 E.02167
G1 X156.663 Y179.649 F30000
G1 F16200
G1 X156.663 Y177.995 E.04738
G1 X157.739 Y176.919 E.04356
G1 X157.739 Y176.032 E.02542
G1 X156.663 Y174.956 E.04356
G1 X156.663 Y170.197 E.1363
G1 X157.739 Y169.122 E.04356
G1 X157.739 Y168.234 E.02542
G1 X156.663 Y167.159 E.04356
G1 X156.663 Y162.4 E.1363
G1 X157.739 Y161.324 E.04356
G1 X157.739 Y160.437 E.02542
G1 X156.663 Y159.361 E.04356
G1 X156.663 Y154.602 E.1363
G1 X157.739 Y153.527 E.04356
G1 X157.739 Y152.639 E.02542
G1 X156.663 Y151.564 E.04356
G1 X156.663 Y146.805 E.1363
G1 X157.739 Y145.73 E.04356
G1 X157.739 Y144.842 E.02542
G1 X156.663 Y143.767 E.04356
G1 X156.663 Y139.008 E.1363
G1 X157.739 Y137.932 E.04356
G1 X157.739 Y137.045 E.02542
G1 X156.663 Y135.969 E.04356
G1 X156.663 Y131.21 E.1363
G1 X157.739 Y130.135 E.04356
G1 X157.739 Y129.247 E.02542
G1 X156.663 Y128.172 E.04356
G1 X156.663 Y123.413 E.1363
G1 X157.739 Y122.338 E.04356
G1 X157.739 Y121.45 E.02542
G1 X156.663 Y120.375 E.04356
G1 X156.663 Y115.616 E.1363
G1 X157.739 Y114.54 E.04356
G1 X157.739 Y113.653 E.02542
G1 X156.663 Y112.577 E.04356
G1 X156.663 Y107.818 E.1363
G1 X157.739 Y106.743 E.04356
G1 X157.739 Y105.855 E.02542
G1 X156.663 Y104.78 E.04356
G1 X156.663 Y100.021 E.1363
G1 X157.739 Y98.945 E.04356
G1 X157.739 Y98.058 E.02542
G1 X156.663 Y96.982 E.04356
G1 X156.663 Y92.224 E.1363
G1 X157.739 Y91.148 E.04356
G1 X157.739 Y90.261 E.02542
G1 X156.663 Y89.185 E.04356
G1 X156.663 Y84.426 E.1363
G1 X157.739 Y83.351 E.04356
G1 X157.739 Y82.463 E.02542
G1 X156.663 Y81.388 E.04356
G1 X156.663 Y76.629 E.1363
G1 X157.739 Y75.553 E.04356
G1 X157.739 Y74.666 E.02542
G1 X156.663 Y73.59 E.04356
G1 X156.663 Y68.831 E.1363
G1 X157.739 Y67.756 E.04356
G1 X157.739 Y66.868 E.02542
G1 X156.663 Y65.793 E.04356
G1 X156.663 Y64.139 E.04738
G1 X157.739 Y61.613 F30000
G1 F16200
G1 X157.739 Y60.856 E.02167
G1 X156.841 Y60.856 E.0257
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.163 Y60.856 E.00697
G1 X75.163 Y62.267 E.0404
G1 X76.239 Y63.342 E.04356
G1 X76.239 Y63.485 E.00409
G1 X75.163 Y64.561 E.04356
G1 X75.163 Y70.064 E.15763
G1 X76.239 Y71.139 E.04356
G1 X76.239 Y71.282 E.00409
G1 X75.163 Y72.358 E.04356
G1 X75.163 Y77.861 E.15763
G1 X76.239 Y78.937 E.04356
G1 X76.239 Y79.08 E.00409
G1 X75.163 Y80.155 E.04356
G1 X75.163 Y85.659 E.15763
G1 X76.239 Y86.734 E.04356
G1 X76.239 Y86.877 E.00409
G1 X75.163 Y87.953 E.04356
G1 X75.163 Y93.456 E.15763
G1 X76.239 Y94.532 E.04356
G1 X76.239 Y94.674 E.00409
G1 X75.163 Y95.75 E.04356
G1 X75.163 Y101.253 E.15763
G1 X76.239 Y102.329 E.04356
G1 X76.239 Y102.472 E.00409
G1 X75.163 Y103.547 E.04356
G1 X75.163 Y109.051 E.15763
G1 X76.239 Y110.126 E.04356
G1 X76.239 Y110.269 E.00409
G1 X75.163 Y111.345 E.04356
G1 X75.163 Y116.848 E.15763
G1 X76.239 Y117.924 E.04356
G1 X76.239 Y118.067 E.00409
G1 X75.163 Y119.142 E.04356
G1 X75.163 Y124.645 E.15763
G1 X76.239 Y125.721 E.04356
G1 X76.239 Y125.864 E.00409
G1 X75.163 Y126.939 E.04356
G1 X75.163 Y132.443 E.15763
G1 X76.239 Y133.518 E.04356
G1 X76.239 Y133.661 E.00409
G1 X75.163 Y134.737 E.04356
G1 X75.163 Y140.24 E.15763
G1 X76.27 Y141.347 E.04485
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.556 Y140.33 E.0412
G1 X108.991 Y142.879 E.07406
G1 X107.676 Y141.563 E.05329
G1 X107.954 Y143.194 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 9.52
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.676 Y141.563 E-.62855
G1 X107.92 Y141.808 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 56/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z9.75 I1.134 J-.441 P1  F30000
G1 X76.991 Y62.285 Z9.75
G1 Z9.52
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.309 Y62.285 E2.27184
G1 X156.309 Y181.502 E3.41461
G1 X115.945 Y181.502 E1.15613
G1 X108.845 Y139.918 E1.20829
G1 X76.592 Y139.918 E.92378
G1 X76.592 Y62.285 E2.22356
G1 X76.931 Y62.285 E.0097
G1 X76.991 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.911 Y62.684 E2.09644
G1 X155.911 Y181.104 E3.14572
G1 X116.281 Y181.104 E1.05274
G1 X109.181 Y139.52 E1.12063
G1 X76.991 Y139.52 E.8551
G1 X76.991 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.991 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.568 Y69.927 Z9.92 F30000
G1 X107.311 Y141.701 Z9.92
G1 Z9.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.809 Y141.701 E.93091
G1 X74.809 Y60.502 E2.3257
G1 X158.092 Y60.502 E2.38539
G1 X158.092 Y183.285 E3.51675
G1 X114.44 Y183.285 E1.25028
G1 X107.346 Y141.731 E1.20742
G1 X107.004 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.411 Y142.1 E.86581
G1 X74.411 Y60.104 E2.17814
G1 X158.491 Y60.104 E2.23351
G1 X158.491 Y183.684 E3.28279
G1 X114.104 Y183.684 E1.1791
G1 X107.014 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.014 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.954 Y143.194 Z9.92 F30000
G1 Z9.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.676 Y141.564 E.04738
G1 X108.992 Y142.879 E.05329
G1 X108.556 Y140.33 E.07407
G1 X107.539 Y141.347 E.0412
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.163 Y140.24 E.04484
G1 X75.163 Y134.737 E.15764
G1 X76.239 Y133.661 E.04356
G1 X76.239 Y133.518 E.00409
G1 X75.163 Y132.443 E.04356
G1 X75.163 Y126.939 E.15764
G1 X76.239 Y125.864 E.04356
G1 X76.239 Y125.721 E.00409
G1 X75.163 Y124.646 E.04356
G1 X75.163 Y119.142 E.15764
G1 X76.239 Y118.066 E.04356
G1 X76.239 Y117.924 E.00409
G1 X75.163 Y116.848 E.04356
G1 X75.163 Y111.345 E.15764
G1 X76.239 Y110.269 E.04356
G1 X76.239 Y110.126 E.00409
G1 X75.163 Y109.051 E.04356
G1 X75.163 Y103.547 E.15764
G1 X76.239 Y102.472 E.04356
G1 X76.239 Y102.329 E.00409
G1 X75.163 Y101.254 E.04356
G1 X75.163 Y95.75 E.15764
G1 X76.239 Y94.674 E.04356
G1 X76.239 Y94.532 E.00409
G1 X75.163 Y93.456 E.04356
G1 X75.163 Y87.952 E.15764
G1 X76.239 Y86.877 E.04356
G1 X76.239 Y86.734 E.00409
G1 X75.163 Y85.659 E.04356
G1 X75.163 Y80.155 E.15764
G1 X76.239 Y79.08 E.04356
G1 X76.239 Y78.937 E.00409
G1 X75.163 Y77.861 E.04356
G1 X75.163 Y72.358 E.15764
G1 X76.239 Y71.282 E.04356
G1 X76.239 Y71.14 E.00409
G1 X75.163 Y70.064 E.04356
G1 X75.163 Y64.56 E.15764
G1 X76.239 Y63.485 E.04356
G1 X76.239 Y63.342 E.00409
G1 X75.163 Y62.267 E.04356
G1 X75.163 Y60.856 E.04041
G1 X75.407 Y60.856 E.00697
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.739 Y60.856 E.02571
G1 X157.739 Y61.613 E.02167
G1 X156.663 Y64.139 F30000
G1 F16200
G1 X156.663 Y65.793 E.04738
G1 X157.739 Y66.869 E.04356
G1 X157.739 Y67.756 E.02541
G1 X156.663 Y68.831 E.04356
G1 X156.663 Y73.59 E.13631
G1 X157.739 Y74.666 E.04356
G1 X157.739 Y75.553 E.02541
G1 X156.663 Y76.629 E.04356
G1 X156.663 Y81.388 E.13631
G1 X157.739 Y82.463 E.04356
G1 X157.739 Y83.351 E.02541
G1 X156.663 Y84.426 E.04356
G1 X156.663 Y89.185 E.13631
G1 X157.739 Y90.261 E.04356
G1 X157.739 Y91.148 E.02541
G1 X156.663 Y92.223 E.04356
G1 X156.663 Y96.983 E.13631
G1 X157.739 Y98.058 E.04356
G1 X157.739 Y98.945 E.02541
G1 X156.663 Y100.021 E.04356
G1 X156.663 Y104.78 E.13631
G1 X157.739 Y105.855 E.04356
G1 X157.739 Y106.743 E.02541
G1 X156.663 Y107.818 E.04356
G1 X156.663 Y112.577 E.13631
G1 X157.739 Y113.653 E.04356
G1 X157.739 Y114.54 E.02541
G1 X156.663 Y115.616 E.04356
G1 X156.663 Y120.375 E.13631
G1 X157.739 Y121.45 E.04356
G1 X157.739 Y122.337 E.02541
G1 X156.663 Y123.413 E.04356
G1 X156.663 Y128.172 E.13631
G1 X157.739 Y129.248 E.04356
G1 X157.739 Y130.135 E.02541
G1 X156.663 Y131.21 E.04356
G1 X156.663 Y135.969 E.13631
G1 X157.739 Y137.045 E.04356
G1 X157.739 Y137.932 E.02541
G1 X156.663 Y139.008 E.04356
G1 X156.663 Y143.767 E.13631
G1 X157.739 Y144.842 E.04356
G1 X157.739 Y145.729 E.02541
G1 X156.663 Y146.805 E.04356
G1 X156.663 Y151.564 E.13631
G1 X157.739 Y152.64 E.04356
G1 X157.739 Y153.527 E.02541
G1 X156.663 Y154.602 E.04356
G1 X156.663 Y159.361 E.13631
G1 X157.739 Y160.437 E.04356
G1 X157.739 Y161.324 E.02541
G1 X156.663 Y162.4 E.04356
G1 X156.663 Y167.159 E.13631
G1 X157.739 Y168.234 E.04356
G1 X157.739 Y169.122 E.02541
G1 X156.663 Y170.197 E.04356
G1 X156.663 Y174.956 E.13631
G1 X157.739 Y176.032 E.04356
G1 X157.739 Y176.919 E.02541
G1 X156.663 Y177.994 E.04356
G1 X156.663 Y179.648 E.04738
G1 X157.739 Y182.175 F30000
G1 F16200
G1 X157.739 Y182.932 E.02167
G1 X156.841 Y182.932 E.02571
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.726 Y182.854 F30000
G1 F16200
G1 X114.447 Y181.224 E.04738
G1 X115.379 Y180.292 E.03775
G1 X115.413 Y180.49 E.00577
G1 X114.097 Y179.175 E.05329
G1 X113.31 Y174.563 E.13398
G1 X114.242 Y173.631 E.03775
G1 X113.808 Y171.087 E.07392
G1 X112.492 Y169.772 E.05329
G1 X112.173 Y167.903 E.0543
G1 X113.105 Y166.971 E.03775
G1 X112.202 Y161.685 E.15361
G1 X110.887 Y160.369 E.05329
G1 X111.036 Y161.243 E.02539
G1 X111.968 Y160.311 E.03775
G1 X111.689 Y158.68 E.04738
G1 X109.972 Y148.621 F30000
G1 F16200
G1 X109.694 Y146.99 E.04738
G1 X108.762 Y147.922 E.03775
G1 X109.281 Y150.966 E.08845
G1 X110.597 Y152.282 E.05329
G1 X110.831 Y153.651 E.03977
G1 X109.899 Y154.583 E.03775
G1 X110.177 Y156.213 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 9.69
; LAYER_HEIGHT: 0.169999
; WIPE_START
G1 F24000
G1 X109.899 Y154.583 E-.62855
G1 X110.143 Y154.338 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 57/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z9.92 I1.145 J-.412 P1  F30000
G1 X76.991 Y62.285 Z9.92
G1 Z9.69
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.31 Y62.285 E2.27184
G1 X156.31 Y181.502 E3.41461
G1 X115.945 Y181.502 E1.15613
G1 X108.845 Y139.918 E1.20829
G1 X76.593 Y139.918 E.92378
G1 X76.593 Y62.285 E2.22356
G1 X76.931 Y62.285 E.0097
G1 X76.991 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.911 Y62.684 E2.09644
G1 X155.911 Y181.104 E3.14572
G1 X116.281 Y181.104 E1.05274
G1 X109.181 Y139.52 E1.12063
G1 X76.991 Y139.52 E.8551
G1 X76.991 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.991 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.568 Y69.927 Z10.09 F30000
G1 X107.311 Y141.701 Z10.09
G1 Z9.69
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.81 Y141.701 E.93091
G1 X74.81 Y60.502 E2.3257
G1 X158.093 Y60.502 E2.38539
G1 X158.093 Y183.285 E3.51675
G1 X114.44 Y183.285 E1.25028
G1 X107.346 Y141.731 E1.20742
G1 X107.004 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.411 Y142.1 E.86581
G1 X74.411 Y60.104 E2.17814
G1 X158.491 Y60.104 E2.23351
G1 X158.491 Y183.684 E3.28279
G1 X114.104 Y183.684 E1.1791
G1 X107.015 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.015 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.646 Y149.32 Z10.09 F30000
G1 X110.177 Y156.213 Z10.09
G1 Z9.69
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.899 Y154.583 E.04738
G1 X110.831 Y153.651 E.03775
G1 X110.597 Y152.282 E.03976
G1 X109.281 Y150.967 E.05329
G1 X108.762 Y147.922 E.08846
G1 X109.694 Y146.99 E.03775
G1 X109.972 Y148.621 E.04738
G1 X111.689 Y158.68 F30000
G1 F16200
G1 X111.968 Y160.311 E.04738
G1 X111.036 Y161.243 E.03775
G1 X110.887 Y160.369 E.02538
G1 X112.202 Y161.685 E.05329
G1 X113.105 Y166.971 E.1536
G1 X112.173 Y167.903 E.03775
G1 X112.492 Y169.772 E.05431
G1 X113.808 Y171.088 E.05329
M73 P85 R8
G1 X114.242 Y173.631 E.07391
G1 X113.31 Y174.563 E.03775
G1 X114.097 Y179.175 E.13399
G1 X115.413 Y180.49 E.05329
G1 X115.379 Y180.292 E.00578
G1 X114.447 Y181.223 E.03775
G1 X114.726 Y182.854 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.739 Y182.932 E.02571
G1 X157.739 Y182.175 E.02166
G1 X156.663 Y179.648 F30000
G1 F16200
G1 X156.663 Y177.994 E.04738
G1 X157.739 Y176.919 E.04356
G1 X157.739 Y176.032 E.0254
G1 X156.663 Y174.956 E.04356
G1 X156.663 Y170.197 E.13632
G1 X157.739 Y169.121 E.04356
G1 X157.739 Y168.234 E.0254
G1 X156.663 Y167.159 E.04356
G1 X156.663 Y162.4 E.13632
G1 X157.739 Y161.324 E.04356
G1 X157.739 Y160.437 E.0254
G1 X156.663 Y159.362 E.04356
G1 X156.663 Y154.602 E.13632
G1 X157.739 Y153.527 E.04356
G1 X157.739 Y152.64 E.0254
G1 X156.663 Y151.564 E.04356
G1 X156.663 Y146.805 E.13632
G1 X157.739 Y145.729 E.04356
G1 X157.739 Y144.842 E.0254
G1 X156.663 Y143.767 E.04356
G1 X156.663 Y139.007 E.13632
G1 X157.739 Y137.932 E.04356
G1 X157.739 Y137.045 E.0254
G1 X156.663 Y135.97 E.04356
G1 X156.663 Y131.21 E.13632
G1 X157.739 Y130.135 E.04356
G1 X157.739 Y129.248 E.0254
G1 X156.663 Y128.172 E.04356
G1 X156.663 Y123.413 E.13632
G1 X157.739 Y122.337 E.04356
G1 X157.739 Y121.45 E.0254
G1 X156.663 Y120.375 E.04356
G1 X156.663 Y115.615 E.13632
G1 X157.739 Y114.54 E.04356
G1 X157.739 Y113.653 E.0254
G1 X156.663 Y112.577 E.04356
G1 X156.663 Y107.818 E.13632
G1 X157.739 Y106.743 E.04356
G1 X157.739 Y105.856 E.0254
G1 X156.663 Y104.78 E.04356
G1 X156.663 Y100.021 E.13632
G1 X157.739 Y98.945 E.04356
G1 X157.739 Y98.058 E.0254
G1 X156.663 Y96.983 E.04356
G1 X156.663 Y92.223 E.13632
G1 X157.739 Y91.148 E.04356
G1 X157.739 Y90.261 E.0254
G1 X156.663 Y89.185 E.04356
G1 X156.663 Y84.426 E.13632
G1 X157.739 Y83.35 E.04356
G1 X157.739 Y82.463 E.0254
G1 X156.663 Y81.388 E.04356
G1 X156.663 Y76.629 E.13632
G1 X157.739 Y75.553 E.04356
G1 X157.739 Y74.666 E.0254
G1 X156.663 Y73.591 E.04356
G1 X156.663 Y68.831 E.13632
G1 X157.739 Y67.756 E.04356
G1 X157.739 Y66.869 E.0254
G1 X156.663 Y65.793 E.04356
G1 X156.663 Y64.139 E.04738
G1 X157.739 Y61.612 F30000
G1 F16200
G1 X157.739 Y60.856 E.02166
G1 X156.841 Y60.856 E.02571
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
M73 P86 R8
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.163 Y60.856 E.00697
G1 X75.163 Y62.267 E.04041
G1 X76.239 Y63.342 E.04356
G1 X76.239 Y63.485 E.00408
G1 X75.163 Y64.56 E.04356
G1 X75.163 Y70.064 E.15765
G1 X76.239 Y71.14 E.04356
G1 X76.239 Y71.282 E.00408
G1 X75.163 Y72.358 E.04356
G1 X75.163 Y77.862 E.15765
G1 X76.239 Y78.937 E.04356
G1 X76.239 Y79.079 E.00408
G1 X75.163 Y80.155 E.04356
G1 X75.163 Y85.659 E.15765
G1 X76.239 Y86.734 E.04356
G1 X76.239 Y86.877 E.00408
G1 X75.163 Y87.952 E.04356
G1 X75.163 Y93.456 E.15765
G1 X76.239 Y94.532 E.04356
G1 X76.239 Y94.674 E.00408
G1 X75.163 Y95.75 E.04356
G1 X75.163 Y101.254 E.15765
G1 X76.239 Y102.329 E.04356
G1 X76.239 Y102.472 E.00408
G1 X75.163 Y103.547 E.04356
G1 X75.163 Y109.051 E.15765
G1 X76.239 Y110.127 E.04356
G1 X76.239 Y110.269 E.00408
G1 X75.163 Y111.344 E.04356
G1 X75.163 Y116.848 E.15765
G1 X76.239 Y117.924 E.04356
G1 X76.239 Y118.066 E.00408
G1 X75.163 Y119.142 E.04356
G1 X75.163 Y124.646 E.15765
G1 X76.239 Y125.721 E.04356
G1 X76.239 Y125.864 E.00408
G1 X75.163 Y126.939 E.04356
G1 X75.163 Y132.443 E.15765
G1 X76.239 Y133.519 E.04356
G1 X76.239 Y133.661 E.00408
G1 X75.163 Y134.736 E.04356
G1 X75.163 Y140.24 E.15765
G1 X76.27 Y141.347 E.04483
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.557 Y140.33 E.04121
G1 X108.992 Y142.88 E.07408
G1 X107.676 Y141.564 E.05329
G1 X107.954 Y143.194 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 9.86
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.676 Y141.564 E-.62855
G1 X107.921 Y141.808 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 58/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z10.09 I1.134 J-.441 P1  F30000
G1 X76.991 Y62.285 Z10.09
G1 Z9.86
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.31 Y62.285 E2.27184
G1 X156.31 Y181.502 E3.41461
G1 X115.945 Y181.502 E1.15613
G1 X108.845 Y139.918 E1.20829
G1 X76.593 Y139.918 E.92378
G1 X76.593 Y62.285 E2.22356
G1 X76.931 Y62.285 E.0097
G1 X76.991 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.911 Y62.684 E2.09644
G1 X155.911 Y181.104 E3.14572
G1 X116.281 Y181.104 E1.05274
G1 X109.181 Y139.52 E1.12063
G1 X76.991 Y139.52 E.8551
G1 X76.991 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.991 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.568 Y69.927 Z10.26 F30000
G1 X107.311 Y141.701 Z10.26
G1 Z9.86
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.81 Y141.701 E.93091
G1 X74.81 Y60.502 E2.3257
G1 X158.093 Y60.502 E2.38539
G1 X158.093 Y183.285 E3.51675
G1 X114.441 Y183.285 E1.25028
G1 X107.346 Y141.731 E1.20742
G1 X107.005 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.411 Y142.1 E.86581
G1 X74.411 Y60.104 E2.17814
G1 X158.491 Y60.104 E2.23351
G1 X158.491 Y183.684 E3.28279
G1 X114.104 Y183.684 E1.1791
G1 X107.015 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.015 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.955 Y143.194 Z10.26 F30000
G1 Z9.86
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.676 Y141.564 E.04738
G1 X108.992 Y142.88 E.05329
G1 X108.557 Y140.33 E.07409
G1 X107.539 Y141.347 E.04121
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.163 Y140.241 E.04483
G1 X75.163 Y134.736 E.15765
G1 X76.239 Y133.661 E.04356
G1 X76.239 Y133.519 E.00407
G1 X75.163 Y132.443 E.04356
G1 X75.163 Y126.939 E.15765
G1 X76.239 Y125.863 E.04356
G1 X76.239 Y125.721 E.00407
G1 X75.163 Y124.646 E.04356
G1 X75.163 Y119.142 E.15765
G1 X76.239 Y118.066 E.04356
G1 X76.239 Y117.924 E.00407
G1 X75.163 Y116.849 E.04356
G1 X75.163 Y111.344 E.15765
G1 X76.239 Y110.269 E.04356
G1 X76.239 Y110.127 E.00407
G1 X75.163 Y109.051 E.04356
G1 X75.163 Y103.547 E.15765
G1 X76.239 Y102.471 E.04356
G1 X76.239 Y102.329 E.00407
G1 X75.163 Y101.254 E.04356
G1 X75.163 Y95.75 E.15765
G1 X76.239 Y94.674 E.04356
G1 X76.239 Y94.532 E.00407
G1 X75.163 Y93.456 E.04356
G1 X75.163 Y87.952 E.15765
G1 X76.239 Y86.877 E.04356
G1 X76.239 Y86.735 E.00407
G1 X75.163 Y85.659 E.04356
G1 X75.163 Y80.155 E.15765
G1 X76.239 Y79.079 E.04356
G1 X76.239 Y78.937 E.00407
G1 X75.163 Y77.862 E.04356
G1 X75.163 Y72.357 E.15765
G1 X76.239 Y71.282 E.04356
G1 X76.239 Y71.14 E.00407
G1 X75.163 Y70.064 E.04356
G1 X75.163 Y64.56 E.15765
G1 X76.239 Y63.485 E.04356
G1 X76.239 Y63.343 E.00407
G1 X75.163 Y62.267 E.04356
G1 X75.163 Y60.856 E.04041
G1 X75.407 Y60.856 E.00696
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.739 Y60.856 E.02572
G1 X157.739 Y61.612 E.02166
G1 X156.663 Y64.139 F30000
G1 F16200
G1 X156.663 Y65.793 E.04738
G1 X157.739 Y66.869 E.04356
G1 X157.739 Y67.756 E.0254
G1 X156.663 Y68.831 E.04356
G1 X156.663 Y73.591 E.13633
G1 X157.739 Y74.666 E.04356
G1 X157.739 Y75.553 E.0254
G1 X156.663 Y76.628 E.04356
G1 X156.663 Y81.388 E.13633
G1 X157.739 Y82.464 E.04356
G1 X157.739 Y83.35 E.0254
G1 X156.663 Y84.426 E.04356
G1 X156.663 Y89.186 E.13633
G1 X157.739 Y90.261 E.04356
G1 X157.739 Y91.148 E.0254
G1 X156.663 Y92.223 E.04356
G1 X156.663 Y96.983 E.13633
G1 X157.739 Y98.058 E.04356
G1 X157.739 Y98.945 E.0254
G1 X156.663 Y100.021 E.04356
G1 X156.663 Y104.78 E.13633
G1 X157.739 Y105.856 E.04356
G1 X157.739 Y106.742 E.0254
G1 X156.663 Y107.818 E.04356
G1 X156.663 Y112.578 E.13633
G1 X157.739 Y113.653 E.04356
G1 X157.739 Y114.54 E.0254
G1 X156.663 Y115.615 E.04356
G1 X156.663 Y120.375 E.13633
G1 X157.739 Y121.45 E.04356
G1 X157.739 Y122.337 E.0254
G1 X156.663 Y123.413 E.04356
G1 X156.663 Y128.172 E.13633
G1 X157.739 Y129.248 E.04356
G1 X157.739 Y130.134 E.0254
G1 X156.663 Y131.21 E.04356
G1 X156.663 Y135.97 E.13633
G1 X157.739 Y137.045 E.04356
G1 X157.739 Y137.932 E.0254
G1 X156.663 Y139.007 E.04356
G1 X156.663 Y143.767 E.13633
G1 X157.739 Y144.843 E.04356
G1 X157.739 Y145.729 E.0254
G1 X156.663 Y146.805 E.04356
G1 X156.663 Y151.564 E.13633
G1 X157.739 Y152.64 E.04356
G1 X157.739 Y153.527 E.0254
G1 X156.663 Y154.602 E.04356
G1 X156.663 Y159.362 E.13633
G1 X157.739 Y160.437 E.04356
G1 X157.739 Y161.324 E.0254
G1 X156.663 Y162.399 E.04356
G1 X156.663 Y167.159 E.13633
G1 X157.739 Y168.235 E.04356
G1 X157.739 Y169.121 E.0254
G1 X156.663 Y170.197 E.04356
G1 X156.663 Y174.956 E.13633
G1 X157.739 Y176.032 E.04356
G1 X157.739 Y176.919 E.0254
G1 X156.663 Y177.994 E.04356
G1 X156.663 Y179.648 E.04738
G1 X157.739 Y182.175 F30000
G1 F16200
G1 X157.739 Y182.932 E.02166
G1 X156.841 Y182.932 E.02572
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.726 Y182.854 F30000
G1 F16200
G1 X114.447 Y181.223 E.04738
G1 X115.379 Y180.291 E.03775
G1 X115.413 Y180.491 E.00578
G1 X114.098 Y179.175 E.05329
G1 X113.31 Y174.563 E.134
G1 X114.242 Y173.631 E.03775
G1 X113.808 Y171.088 E.0739
G1 X112.492 Y169.772 E.05329
G1 X112.173 Y167.903 E.05431
G1 X113.105 Y166.971 E.03775
G1 X112.203 Y161.685 E.15359
G1 X110.887 Y160.369 E.05329
G1 X111.036 Y161.243 E.02537
G1 X111.968 Y160.311 E.03775
G1 X111.69 Y158.68 E.04738
G1 X109.972 Y148.621 F30000
G1 F16200
G1 X109.694 Y146.99 E.04738
G1 X108.762 Y147.922 E.03775
G1 X109.282 Y150.967 E.08846
G1 X110.597 Y152.282 E.05329
G1 X110.831 Y153.65 E.03975
G1 X109.899 Y154.582 E.03775
G1 X110.177 Y156.213 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 10.03
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.899 Y154.582 E-.62855
G1 X110.144 Y154.338 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 59/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z10.26 I1.145 J-.412 P1  F30000
G1 X76.991 Y62.285 Z10.26
G1 Z10.03
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.31 Y62.285 E2.27184
G1 X156.31 Y181.502 E3.41461
G1 X115.945 Y181.502 E1.15613
G1 X108.845 Y139.918 E1.20829
G1 X76.593 Y139.918 E.92378
G1 X76.593 Y62.285 E2.22356
G1 X76.931 Y62.285 E.0097
G1 X76.991 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.911 Y62.684 E2.09644
G1 X155.911 Y181.104 E3.14572
G1 X116.281 Y181.104 E1.05274
G1 X109.182 Y139.52 E1.12063
G1 X76.991 Y139.52 E.8551
G1 X76.991 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.991 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.568 Y69.927 Z10.43 F30000
G1 X107.311 Y141.701 Z10.43
G1 Z10.03
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.81 Y141.701 E.93091
G1 X74.81 Y60.502 E2.3257
G1 X158.093 Y60.502 E2.38539
G1 X158.093 Y183.285 E3.51675
G1 X114.441 Y183.285 E1.25028
G1 X107.346 Y141.731 E1.20742
G1 X107.005 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.411 Y142.1 E.86581
G1 X74.411 Y60.104 E2.17814
G1 X158.491 Y60.104 E2.23351
G1 X158.491 Y183.684 E3.28279
G1 X114.104 Y183.684 E1.1791
G1 X107.015 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.015 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.646 Y149.32 Z10.43 F30000
G1 X110.177 Y156.213 Z10.43
G1 Z10.03
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.899 Y154.582 E.04738
G1 X110.831 Y153.65 E.03775
G1 X110.597 Y152.283 E.03974
G1 X109.282 Y150.967 E.05329
G1 X108.762 Y147.922 E.08847
G1 X109.694 Y146.99 E.03775
G1 X109.972 Y148.621 E.04738
G1 X111.69 Y158.68 F30000
G1 F16200
G1 X111.968 Y160.311 E.04738
G1 X111.036 Y161.243 E.03775
G1 X110.887 Y160.37 E.02536
G1 X112.203 Y161.685 E.05329
G1 X113.105 Y166.971 E.15358
G1 X112.173 Y167.903 E.03775
G1 X112.492 Y169.772 E.05432
G1 X113.808 Y171.088 E.05329
G1 X114.242 Y173.631 E.07389
G1 X113.31 Y174.563 E.03775
G1 X114.098 Y179.175 E.13401
G1 X115.414 Y180.491 E.05329
G1 X115.379 Y180.291 E.00579
G1 X114.448 Y181.223 E.03775
G1 X114.726 Y182.854 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.739 Y182.932 E.02572
G1 X157.739 Y182.175 E.02166
G1 X156.664 Y179.648 F30000
G1 F16200
G1 X156.664 Y177.994 E.04738
G1 X157.739 Y176.918 E.04356
G1 X157.739 Y176.032 E.02539
G1 X156.664 Y174.957 E.04356
G1 X156.664 Y170.197 E.13634
G1 X157.739 Y169.121 E.04356
G1 X157.739 Y168.235 E.02539
G1 X156.664 Y167.159 E.04356
G1 X156.664 Y162.399 E.13634
G1 X157.739 Y161.324 E.04356
G1 X157.739 Y160.437 E.02539
G1 X156.664 Y159.362 E.04356
G1 X156.664 Y154.602 E.13634
G1 X157.739 Y153.526 E.04356
G1 X157.739 Y152.64 E.02539
G1 X156.664 Y151.565 E.04356
G1 X156.664 Y146.805 E.13634
G1 X157.739 Y145.729 E.04356
G1 X157.739 Y144.843 E.02539
G1 X156.664 Y143.767 E.04356
G1 X156.664 Y139.007 E.13634
G1 X157.739 Y137.932 E.04356
G1 X157.739 Y137.045 E.02539
G1 X156.664 Y135.97 E.04356
G1 X156.664 Y131.21 E.13634
G1 X157.739 Y130.134 E.04356
G1 X157.739 Y129.248 E.02539
G1 X156.664 Y128.172 E.04356
G1 X156.664 Y123.412 E.13634
G1 X157.739 Y122.337 E.04356
G1 X157.739 Y121.451 E.02539
G1 X156.664 Y120.375 E.04356
G1 X156.664 Y115.615 E.13634
G1 X157.739 Y114.54 E.04356
G1 X157.739 Y113.653 E.02539
G1 X156.664 Y112.578 E.04356
G1 X156.664 Y107.818 E.13634
G1 X157.739 Y106.742 E.04356
G1 X157.739 Y105.856 E.02539
G1 X156.664 Y104.78 E.04356
G1 X156.664 Y100.02 E.13634
G1 X157.739 Y98.945 E.04356
G1 X157.739 Y98.059 E.02539
G1 X156.664 Y96.983 E.04356
G1 X156.664 Y92.223 E.13634
G1 X157.739 Y91.148 E.04356
G1 X157.739 Y90.261 E.02539
G1 X156.664 Y89.186 E.04356
G1 X156.664 Y84.426 E.13634
G1 X157.739 Y83.35 E.04356
G1 X157.739 Y82.464 E.02539
G1 X156.664 Y81.388 E.04356
G1 X156.664 Y76.628 E.13634
G1 X157.739 Y75.553 E.04356
G1 X157.739 Y74.666 E.02539
G1 X156.664 Y73.591 E.04356
G1 X156.664 Y68.831 E.13634
G1 X157.739 Y67.755 E.04356
G1 X157.739 Y66.869 E.02539
G1 X156.664 Y65.794 E.04356
G1 X156.664 Y64.139 E.04738
G1 X157.739 Y61.612 F30000
G1 F16200
G1 X157.739 Y60.856 E.02166
G1 X156.841 Y60.856 E.02572
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.164 Y60.856 E.00696
G1 X75.164 Y62.267 E.04042
G1 X76.239 Y63.343 E.04356
G1 X76.239 Y63.484 E.00406
G1 X75.164 Y64.56 E.04356
G1 X75.164 Y70.065 E.15766
G1 X76.239 Y71.14 E.04356
G1 X76.239 Y71.282 E.00406
G1 X75.164 Y72.357 E.04356
G1 X75.164 Y77.862 E.15766
G1 X76.239 Y78.937 E.04356
G1 X76.239 Y79.079 E.00406
G1 X75.164 Y80.155 E.04356
G1 X75.164 Y85.659 E.15766
G1 X76.239 Y86.735 E.04356
G1 X76.239 Y86.877 E.00406
G1 X75.164 Y87.952 E.04356
G1 X75.164 Y93.457 E.15766
G1 X76.239 Y94.532 E.04356
G1 X76.239 Y94.674 E.00406
G1 X75.164 Y95.749 E.04356
G1 X75.164 Y101.254 E.15766
G1 X76.239 Y102.329 E.04356
G1 X76.239 Y102.471 E.00406
G1 X75.164 Y103.547 E.04356
G1 X75.164 Y109.051 E.15766
G1 X76.239 Y110.127 E.04356
G1 X76.239 Y110.269 E.00406
G1 X75.164 Y111.344 E.04356
G1 X75.164 Y116.849 E.15766
G1 X76.239 Y117.924 E.04356
G1 X76.239 Y118.066 E.00406
G1 X75.164 Y119.141 E.04356
G1 X75.164 Y124.646 E.15766
G1 X76.239 Y125.722 E.04356
G1 X76.239 Y125.863 E.00406
G1 X75.164 Y126.939 E.04356
G1 X75.164 Y132.443 E.15766
G1 X76.239 Y133.519 E.04356
G1 X76.239 Y133.661 E.00406
G1 X75.164 Y134.736 E.04356
G1 X75.164 Y140.241 E.15766
G1 X76.27 Y141.347 E.04482
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.557 Y140.33 E.04122
G1 X108.992 Y142.88 E.07409
G1 X107.676 Y141.564 E.05329
G1 X107.955 Y143.195 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.676 Y141.564 E-.62855
G1 X107.921 Y141.809 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 60/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z10.43 I1.134 J-.441 P1  F30000
G1 X76.991 Y62.285 Z10.43
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.31 Y62.285 E2.27184
G1 X156.31 Y181.502 E3.41461
G1 X115.945 Y181.502 E1.15613
G1 X108.845 Y139.918 E1.20829
G1 X76.593 Y139.918 E.92378
G1 X76.593 Y62.285 E2.22356
G1 X76.931 Y62.285 E.0097
G1 X76.991 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.912 Y62.684 E2.09644
G1 X155.912 Y181.104 E3.14572
G1 X116.281 Y181.104 E1.05274
G1 X109.182 Y139.52 E1.12063
G1 X76.991 Y139.52 E.8551
G1 X76.991 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.991 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.568 Y69.927 Z10.6 F30000
G1 X107.312 Y141.701 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.81 Y141.701 E.93091
G1 X74.81 Y60.502 E2.3257
G1 X158.093 Y60.502 E2.38539
G1 X158.093 Y183.285 E3.51675
G1 X114.441 Y183.285 E1.25028
G1 X107.346 Y141.731 E1.20742
G1 X107.005 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.411 Y142.1 E.86581
G1 X74.411 Y60.104 E2.17814
G1 X158.492 Y60.104 E2.23351
G1 X158.492 Y183.684 E3.28279
G1 X114.105 Y183.684 E1.1791
G1 X107.015 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.015 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.955 Y143.195 Z10.6 F30000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.677 Y141.564 E.04738
G1 X108.992 Y142.88 E.05329
G1 X108.557 Y140.33 E.0741
G1 X107.539 Y141.347 E.04122
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.164 Y140.241 E.04482
G1 X75.164 Y134.736 E.15767
G1 X76.239 Y133.661 E.04356
G1 X76.239 Y133.519 E.00405
G1 X75.164 Y132.444 E.04356
G1 X75.164 Y126.939 E.15767
G1 X76.239 Y125.863 E.04356
G1 X76.239 Y125.722 E.00405
G1 X75.164 Y124.646 E.04356
G1 X75.164 Y119.141 E.15767
G1 X76.239 Y118.066 E.04356
G1 X76.239 Y117.924 E.00405
G1 X75.164 Y116.849 E.04356
G1 X75.164 Y111.344 E.15767
G1 X76.239 Y110.268 E.04356
G1 X76.239 Y110.127 E.00405
G1 X75.164 Y109.051 E.04356
G1 X75.164 Y103.547 E.15767
G1 X76.239 Y102.471 E.04356
M73 P87 R8
G1 X76.239 Y102.33 E.00405
G1 X75.164 Y101.254 E.04356
G1 X75.164 Y95.749 E.15767
G1 X76.239 Y94.674 E.04356
G1 X76.239 Y94.532 E.00405
G1 X75.164 Y93.457 E.04356
G1 X75.164 Y87.952 E.15767
G1 X76.239 Y86.876 E.04356
G1 X76.239 Y86.735 E.00405
G1 X75.164 Y85.659 E.04356
G1 X75.164 Y80.155 E.15767
G1 X76.239 Y79.079 E.04356
G1 X76.239 Y78.938 E.00405
G1 X75.164 Y77.862 E.04356
G1 X75.164 Y72.357 E.15767
G1 X76.239 Y71.282 E.04356
G1 X76.239 Y71.14 E.00405
G1 X75.164 Y70.065 E.04356
G1 X75.164 Y64.56 E.15767
G1 X76.239 Y63.484 E.04356
G1 X76.239 Y63.343 E.00405
G1 X75.164 Y62.267 E.04356
G1 X75.164 Y60.856 E.04042
G1 X75.407 Y60.856 E.00695
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.739 Y60.856 E.02572
G1 X157.739 Y61.612 E.02165
G1 X156.664 Y64.14 F30000
G1 F16200
G1 X156.664 Y65.794 E.04738
G1 X157.739 Y66.869 E.04356
G1 X157.739 Y67.755 E.02538
G1 X156.664 Y68.831 E.04356
G1 X156.664 Y73.591 E.13634
G1 X157.739 Y74.667 E.04356
G1 X157.739 Y75.553 E.02538
G1 X156.664 Y76.628 E.04356
G1 X156.664 Y81.388 E.13634
G1 X157.739 Y82.464 E.04356
G1 X157.739 Y83.35 E.02538
G1 X156.664 Y84.425 E.04356
G1 X156.664 Y89.186 E.13634
G1 X157.739 Y90.261 E.04356
G1 X157.739 Y91.147 E.02538
G1 X156.664 Y92.223 E.04356
G1 X156.664 Y96.983 E.13634
G1 X157.739 Y98.059 E.04356
G1 X157.739 Y98.945 E.02538
G1 X156.664 Y100.02 E.04356
G1 X156.664 Y104.781 E.13634
G1 X157.739 Y105.856 E.04356
G1 X157.739 Y106.742 E.02538
G1 X156.664 Y107.818 E.04356
G1 X156.664 Y112.578 E.13634
G1 X157.739 Y113.653 E.04356
G1 X157.739 Y114.539 E.02538
G1 X156.664 Y115.615 E.04356
G1 X156.664 Y120.375 E.13634
G1 X157.739 Y121.451 E.04356
G1 X157.739 Y122.337 E.02538
G1 X156.664 Y123.412 E.04356
G1 X156.664 Y128.173 E.13634
G1 X157.739 Y129.248 E.04356
G1 X157.739 Y130.134 E.02538
G1 X156.664 Y131.21 E.04356
G1 X156.664 Y135.97 E.13634
G1 X157.739 Y137.045 E.04356
G1 X157.739 Y137.932 E.02538
G1 X156.664 Y139.007 E.04356
G1 X156.664 Y143.767 E.13634
G1 X157.739 Y144.843 E.04356
G1 X157.739 Y145.729 E.02538
G1 X156.664 Y146.804 E.04356
G1 X156.664 Y151.565 E.13634
G1 X157.739 Y152.64 E.04356
G1 X157.739 Y153.526 E.02538
G1 X156.664 Y154.602 E.04356
G1 X156.664 Y159.362 E.13634
G1 X157.739 Y160.438 E.04356
G1 X157.739 Y161.324 E.02538
G1 X156.664 Y162.399 E.04356
G1 X156.664 Y167.159 E.13634
G1 X157.739 Y168.235 E.04356
G1 X157.739 Y169.121 E.02538
G1 X156.664 Y170.196 E.04356
G1 X156.664 Y174.957 E.13634
G1 X157.739 Y176.032 E.04356
G1 X157.739 Y176.918 E.02538
G1 X156.664 Y177.994 E.04356
G1 X156.664 Y179.648 E.04738
G1 X157.739 Y182.176 F30000
G1 F16200
G1 X157.739 Y182.932 E.02165
G1 X156.841 Y182.932 E.02572
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.726 Y182.854 F30000
G1 F16200
G1 X114.448 Y181.223 E.04738
G1 X115.38 Y180.291 E.03775
G1 X115.414 Y180.491 E.0058
G1 X114.098 Y179.175 E.05329
G1 X113.311 Y174.563 E.13402
G1 X114.242 Y173.631 E.03775
G1 X113.808 Y171.088 E.07388
G1 X112.493 Y169.772 E.05329
G1 X112.173 Y167.903 E.05433
G1 X113.105 Y166.971 E.03775
G1 X112.203 Y161.685 E.15357
G1 X110.887 Y160.37 E.05329
G1 X111.036 Y161.242 E.02535
G1 X111.968 Y160.31 E.03775
G1 X111.69 Y158.68 E.04738
G1 X109.972 Y148.62 F30000
G1 F16200
G1 X109.694 Y146.99 E.04738
G1 X108.762 Y147.922 E.03775
G1 X109.282 Y150.967 E.08848
G1 X110.598 Y152.283 E.05329
G1 X110.831 Y153.65 E.03973
G1 X109.899 Y154.582 E.03775
G1 X110.178 Y156.213 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 10.37
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.899 Y154.582 E-.62855
G1 X110.144 Y154.338 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 61/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z10.6 I1.145 J-.412 P1  F30000
G1 X76.992 Y62.285 Z10.6
G1 Z10.37
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.31 Y62.285 E2.27184
G1 X156.31 Y181.502 E3.41461
G1 X115.945 Y181.502 E1.15613
G1 X108.846 Y139.918 E1.20829
G1 X76.593 Y139.918 E.92378
G1 X76.593 Y62.285 E2.22356
G1 X76.932 Y62.285 E.0097
G1 X76.992 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.912 Y62.684 E2.09644
G1 X155.912 Y181.104 E3.14572
G1 X116.282 Y181.104 E1.05274
G1 X109.182 Y139.52 E1.12063
G1 X76.992 Y139.52 E.8551
G1 X76.992 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.992 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.568 Y69.927 Z10.77 F30000
G1 X107.312 Y141.701 Z10.77
G1 Z10.37
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.81 Y141.701 E.93091
G1 X74.81 Y60.502 E2.3257
G1 X158.093 Y60.502 E2.38539
G1 X158.093 Y183.285 E3.51675
G1 X114.441 Y183.285 E1.25028
G1 X107.346 Y141.731 E1.20742
G1 X107.005 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.412 Y142.1 E.86581
G1 X74.412 Y60.104 E2.17814
G1 X158.492 Y60.104 E2.23351
G1 X158.492 Y183.684 E3.28279
G1 X114.105 Y183.684 E1.1791
G1 X107.015 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.015 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.646 Y149.32 Z10.77 F30000
G1 X110.178 Y156.213 Z10.77
G1 Z10.37
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.899 Y154.582 E.04738
G1 X110.831 Y153.65 E.03775
G1 X110.598 Y152.283 E.03972
G1 X109.282 Y150.967 E.05329
G1 X108.762 Y147.922 E.08849
G1 X109.694 Y146.99 E.03775
G1 X109.973 Y148.62 E.04738
G1 X111.69 Y158.68 F30000
G1 F16200
G1 X111.968 Y160.31 E.04738
G1 X111.036 Y161.242 E.03775
G1 X110.887 Y160.37 E.02535
G1 X112.203 Y161.686 E.05329
G1 X113.105 Y166.971 E.15356
G1 X112.174 Y167.903 E.03775
G1 X112.493 Y169.773 E.05434
G1 X113.809 Y171.088 E.05329
G1 X114.243 Y173.631 E.07388
G1 X113.311 Y174.563 E.03775
G1 X114.098 Y179.175 E.13403
G1 X115.414 Y180.491 E.05329
G1 X115.38 Y180.291 E.00581
G1 X114.448 Y181.223 E.03775
G1 X114.726 Y182.853 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
M73 P87 R7
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.739 Y182.932 E.02573
G1 X157.739 Y182.176 E.02165
G1 X156.664 Y179.648 F30000
G1 F16200
G1 X156.664 Y177.994 E.04738
G1 X157.739 Y176.918 E.04356
G1 X157.739 Y176.032 E.02537
G1 X156.664 Y174.957 E.04356
G1 X156.664 Y170.196 E.13635
G1 X157.739 Y169.121 E.04356
G1 X157.739 Y168.235 E.02537
G1 X156.664 Y167.16 E.04356
G1 X156.664 Y162.399 E.13635
G1 X157.739 Y161.323 E.04356
G1 X157.739 Y160.438 E.02537
G1 X156.664 Y159.362 E.04356
G1 X156.664 Y154.602 E.13635
G1 X157.739 Y153.526 E.04356
G1 X157.739 Y152.64 E.02537
G1 X156.664 Y151.565 E.04356
G1 X156.664 Y146.804 E.13635
G1 X157.739 Y145.729 E.04356
G1 X157.739 Y144.843 E.02537
G1 X156.664 Y143.767 E.04356
G1 X156.664 Y139.007 E.13635
G1 X157.739 Y137.931 E.04356
G1 X157.739 Y137.046 E.02537
G1 X156.664 Y135.97 E.04356
G1 X156.664 Y131.21 E.13635
G1 X157.739 Y130.134 E.04356
G1 X157.739 Y129.248 E.02537
G1 X156.664 Y128.173 E.04356
G1 X156.664 Y123.412 E.13635
G1 X157.739 Y122.337 E.04356
G1 X157.739 Y121.451 E.02537
G1 X156.664 Y120.375 E.04356
G1 X156.664 Y115.615 E.13635
G1 X157.739 Y114.539 E.04356
G1 X157.739 Y113.654 E.02537
G1 X156.664 Y112.578 E.04356
G1 X156.664 Y107.817 E.13635
G1 X157.739 Y106.742 E.04356
G1 X157.739 Y105.856 E.02537
G1 X156.664 Y104.781 E.04356
G1 X156.664 Y100.02 E.13635
G1 X157.739 Y98.945 E.04356
G1 X157.739 Y98.059 E.02537
G1 X156.664 Y96.983 E.04356
G1 X156.664 Y92.223 E.13635
G1 X157.739 Y91.147 E.04356
G1 X157.739 Y90.261 E.02537
G1 X156.664 Y89.186 E.04356
G1 X156.664 Y84.425 E.13635
G1 X157.739 Y83.35 E.04356
G1 X157.739 Y82.464 E.02537
G1 X156.664 Y81.389 E.04356
G1 X156.664 Y76.628 E.13635
G1 X157.739 Y75.553 E.04356
G1 X157.739 Y74.667 E.02537
G1 X156.664 Y73.591 E.04356
G1 X156.664 Y68.831 E.13635
G1 X157.739 Y67.755 E.04356
G1 X157.739 Y66.869 E.02537
G1 X156.664 Y65.794 E.04356
G1 X156.664 Y64.14 E.04738
G1 X157.739 Y61.612 F30000
G1 F16200
G1 X157.739 Y60.856 E.02165
G1 X156.841 Y60.856 E.02573
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.164 Y60.856 E.00695
G1 X75.164 Y62.267 E.04043
G1 X76.239 Y63.343 E.04356
G1 X76.239 Y63.484 E.00405
G1 X75.164 Y64.56 E.04356
G1 X75.164 Y70.065 E.15768
G1 X76.239 Y71.14 E.04356
G1 X76.239 Y71.282 E.00404
G1 X75.164 Y72.357 E.04356
G1 X75.164 Y77.862 E.15768
G1 X76.239 Y78.938 E.04356
G1 X76.239 Y79.079 E.00404
G1 X75.164 Y80.154 E.04356
G1 X75.164 Y85.66 E.15768
G1 X76.239 Y86.735 E.04356
G1 X76.239 Y86.876 E.00404
G1 X75.164 Y87.952 E.04356
G1 X75.164 Y93.457 E.15768
G1 X76.239 Y94.532 E.04356
G1 X76.239 Y94.674 E.00404
G1 X75.164 Y95.749 E.04356
G1 X75.164 Y101.254 E.15768
G1 X76.239 Y102.33 E.04356
G1 X76.239 Y102.471 E.00404
G1 X75.164 Y103.546 E.04356
G1 X75.164 Y109.052 E.15768
G1 X76.239 Y110.127 E.04356
G1 X76.239 Y110.268 E.00404
G1 X75.164 Y111.344 E.04356
G1 X75.164 Y116.849 E.15768
G1 X76.239 Y117.924 E.04356
G1 X76.239 Y118.066 E.00404
G1 X75.164 Y119.141 E.04356
G1 X75.164 Y124.646 E.15768
G1 X76.239 Y125.722 E.04356
G1 X76.239 Y125.863 E.00404
G1 X75.164 Y126.939 E.04356
G1 X75.164 Y132.444 E.15768
G1 X76.239 Y133.519 E.04356
G1 X76.239 Y133.66 E.00404
G1 X75.164 Y134.736 E.04356
G1 X75.164 Y140.241 E.15768
G1 X76.27 Y141.347 E.04481
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.557 Y140.33 E.04123
G1 X108.992 Y142.88 E.07411
G1 X107.677 Y141.565 E.05329
G1 X107.955 Y143.195 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 10.54
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.677 Y141.565 E-.62855
G1 X107.921 Y141.809 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 62/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z10.77 I1.134 J-.441 P1  F30000
G1 X76.992 Y62.285 Z10.77
G1 Z10.54
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.31 Y62.285 E2.27184
G1 X156.31 Y181.502 E3.41461
G1 X115.946 Y181.502 E1.15613
G1 X108.846 Y139.918 E1.20829
G1 X76.593 Y139.918 E.92378
G1 X76.593 Y62.285 E2.22356
G1 X76.932 Y62.285 E.0097
G1 X76.992 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.912 Y62.684 E2.09644
G1 X155.912 Y181.104 E3.14572
G1 X116.282 Y181.104 E1.05274
G1 X109.182 Y139.52 E1.12063
G1 X76.992 Y139.52 E.8551
G1 X76.992 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.992 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.569 Y69.927 Z10.94 F30000
G1 X107.312 Y141.701 Z10.94
G1 Z10.54
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.81 Y141.701 E.93091
G1 X74.81 Y60.502 E2.3257
G1 X158.093 Y60.502 E2.38539
G1 X158.093 Y183.285 E3.51675
G1 X114.441 Y183.285 E1.25028
G1 X107.347 Y141.731 E1.20742
G1 X107.005 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.412 Y142.1 E.86581
G1 X74.412 Y60.104 E2.17814
G1 X158.492 Y60.104 E2.23351
G1 X158.492 Y183.684 E3.28279
G1 X114.105 Y183.684 E1.1791
G1 X107.015 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.015 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.955 Y143.195 Z10.94 F30000
G1 Z10.54
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.677 Y141.565 E.04738
G1 X108.993 Y142.88 E.05329
G1 X108.557 Y140.329 E.07412
G1 X107.539 Y141.347 E.04123
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.164 Y140.241 E.04481
G1 X75.164 Y134.736 E.15769
G1 X76.24 Y133.66 E.04356
G1 X76.24 Y133.519 E.00404
G1 X75.164 Y132.444 E.04356
G1 X75.164 Y126.938 E.15769
G1 X76.24 Y125.863 E.04356
G1 X76.24 Y125.722 E.00404
G1 X75.164 Y124.646 E.04356
G1 X75.164 Y119.141 E.15769
G1 X76.24 Y118.066 E.04356
G1 X76.24 Y117.925 E.00404
G1 X75.164 Y116.849 E.04356
G1 X75.164 Y111.344 E.15769
G1 X76.24 Y110.268 E.04356
G1 X76.24 Y110.127 E.00404
G1 X75.164 Y109.052 E.04356
G1 X75.164 Y103.546 E.15769
G1 X76.24 Y102.471 E.04356
G1 X76.24 Y102.33 E.00404
G1 X75.164 Y101.254 E.04356
G1 X75.164 Y95.749 E.15769
G1 X76.24 Y94.673 E.04356
G1 X76.24 Y94.533 E.00404
G1 X75.164 Y93.457 E.04356
G1 X75.164 Y87.952 E.15769
G1 X76.24 Y86.876 E.04356
G1 X76.24 Y86.735 E.00404
G1 X75.164 Y85.66 E.04356
G1 X75.164 Y80.154 E.15769
G1 X76.24 Y79.079 E.04356
G1 X76.24 Y78.938 E.00404
G1 X75.164 Y77.862 E.04356
G1 X75.164 Y72.357 E.15769
G1 X76.24 Y71.281 E.04356
G1 X76.24 Y71.14 E.00404
G1 X75.164 Y70.065 E.04356
G1 X75.164 Y64.56 E.15769
G1 X76.24 Y63.484 E.04356
G1 X76.24 Y63.343 E.00404
G1 X75.164 Y62.268 E.04356
G1 X75.164 Y60.856 E.04043
G1 X75.407 Y60.856 E.00695
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.74 Y60.856 E.02573
G1 X157.74 Y61.612 E.02164
G1 X156.664 Y64.14 F30000
G1 F16200
G1 X156.664 Y65.794 E.04738
G1 X157.74 Y66.869 E.04356
G1 X157.74 Y67.755 E.02536
G1 X156.664 Y68.83 E.04356
G1 X156.664 Y73.591 E.13636
G1 X157.74 Y74.667 E.04356
G1 X157.74 Y75.552 E.02536
G1 X156.664 Y76.628 E.04356
G1 X156.664 Y81.389 E.13636
G1 X157.74 Y82.464 E.04356
G1 X157.74 Y83.35 E.02536
G1 X156.664 Y84.425 E.04356
G1 X156.664 Y89.186 E.13636
G1 X157.74 Y90.262 E.04356
G1 X157.74 Y91.147 E.02536
G1 X156.664 Y92.223 E.04356
G1 X156.664 Y96.983 E.13636
G1 X157.74 Y98.059 E.04356
G1 X157.74 Y98.944 E.02536
G1 X156.664 Y100.02 E.04356
G1 X156.664 Y104.781 E.13636
G1 X157.74 Y105.856 E.04356
G1 X157.74 Y106.742 E.02536
G1 X156.664 Y107.817 E.04356
G1 X156.664 Y112.578 E.13636
G1 X157.74 Y113.654 E.04356
G1 X157.74 Y114.539 E.02536
G1 X156.664 Y115.615 E.04356
G1 X156.664 Y120.376 E.13636
G1 X157.74 Y121.451 E.04356
G1 X157.74 Y122.337 E.02536
G1 X156.664 Y123.412 E.04356
G1 X156.664 Y128.173 E.13636
G1 X157.74 Y129.248 E.04356
G1 X157.74 Y130.134 E.02536
G1 X156.664 Y131.209 E.04356
G1 X156.664 Y135.97 E.13636
G1 X157.74 Y137.046 E.04356
G1 X157.74 Y137.931 E.02536
G1 X156.664 Y139.007 E.04356
G1 X156.664 Y143.768 E.13636
G1 X157.74 Y144.843 E.04356
G1 X157.74 Y145.729 E.02536
G1 X156.664 Y146.804 E.04356
G1 X156.664 Y151.565 E.13636
G1 X157.74 Y152.64 E.04356
G1 X157.74 Y153.526 E.02536
G1 X156.664 Y154.601 E.04356
G1 X156.664 Y159.362 E.13636
G1 X157.74 Y160.438 E.04356
G1 X157.74 Y161.323 E.02536
G1 X156.664 Y162.399 E.04356
G1 X156.664 Y167.16 E.13636
G1 X157.74 Y168.235 E.04356
G1 X157.74 Y169.121 E.02536
G1 X156.664 Y170.196 E.04356
G1 X156.664 Y174.957 E.13636
G1 X157.74 Y176.033 E.04356
G1 X157.74 Y176.918 E.02536
G1 X156.664 Y177.994 E.04356
G1 X156.664 Y179.648 E.04738
G1 X157.74 Y182.176 F30000
G1 F16200
G1 X157.74 Y182.932 E.02164
G1 X156.841 Y182.932 E.02573
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.726 Y182.853 F30000
G1 F16200
G1 X114.448 Y181.223 E.04738
G1 X115.38 Y180.291 E.03775
G1 X115.414 Y180.491 E.00582
G1 X114.098 Y179.176 E.05329
G1 X113.311 Y174.563 E.13404
G1 X114.243 Y173.631 E.03775
G1 X113.809 Y171.089 E.07387
G1 X112.493 Y169.773 E.05329
G1 X112.174 Y167.902 E.05435
G1 X113.106 Y166.97 E.03775
G1 X112.203 Y161.686 E.15355
G1 X110.888 Y160.37 E.05329
G1 X111.037 Y161.242 E.02534
G1 X111.968 Y160.31 E.03775
G1 X111.69 Y158.68 E.04738
G1 X109.973 Y148.62 F30000
G1 F16200
G1 X109.694 Y146.99 E.04738
G1 X108.762 Y147.922 E.03775
G1 X109.282 Y150.967 E.0885
G1 X110.598 Y152.283 E.05329
G1 X110.831 Y153.65 E.03972
G1 X109.899 Y154.582 E.03775
G1 X110.178 Y156.212 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 10.71
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.899 Y154.582 E-.62855
G1 X110.144 Y154.337 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 63/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z10.94 I1.145 J-.412 P1  F30000
G1 X76.992 Y62.285 Z10.94
G1 Z10.71
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.31 Y62.285 E2.27184
G1 X156.31 Y181.502 E3.41461
G1 X115.946 Y181.502 E1.15613
G1 X108.846 Y139.918 E1.20829
G1 X76.593 Y139.918 E.92378
G1 X76.593 Y62.285 E2.22356
G1 X76.932 Y62.285 E.0097
G1 X76.992 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.912 Y62.684 E2.09644
G1 X155.912 Y181.104 E3.14572
G1 X116.282 Y181.104 E1.05274
G1 X109.182 Y139.52 E1.12063
G1 X76.992 Y139.52 E.8551
G1 X76.992 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.992 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.569 Y69.927 Z11.11 F30000
G1 X107.312 Y141.701 Z11.11
G1 Z10.71
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.81 Y141.701 E.93091
G1 X74.81 Y60.502 E2.3257
G1 X158.093 Y60.502 E2.38539
G1 X158.093 Y183.285 E3.51675
G1 X114.441 Y183.285 E1.25028
G1 X107.347 Y141.731 E1.20742
G1 X107.005 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.412 Y142.1 E.86581
G1 X74.412 Y60.104 E2.17814
G1 X158.492 Y60.104 E2.23351
G1 X158.492 Y183.684 E3.28279
G1 X114.105 Y183.684 E1.1791
G1 X107.015 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.015 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.647 Y149.32 Z11.11 F30000
G1 X110.178 Y156.212 Z11.11
G1 Z10.71
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.9 Y154.582 E.04738
G1 X110.831 Y153.65 E.03775
G1 X110.598 Y152.283 E.03971
G1 X109.282 Y150.968 E.05329
G1 X108.762 Y147.922 E.08851
G1 X109.694 Y146.99 E.03775
G1 X109.973 Y148.62 E.04738
G1 X111.69 Y158.68 F30000
G1 F16200
G1 X111.969 Y160.31 E.04738
G1 X111.037 Y161.242 E.03775
G1 X110.888 Y160.37 E.02533
G1 X112.204 Y161.686 E.05329
G1 X113.106 Y166.97 E.15354
G1 X112.174 Y167.902 E.03775
G1 X112.493 Y169.773 E.05436
G1 X113.809 Y171.089 E.05329
G1 X114.243 Y173.631 E.07386
G1 X113.311 Y174.563 E.03775
M73 P88 R7
G1 X114.099 Y179.176 E.13404
G1 X115.414 Y180.491 E.05329
G1 X115.38 Y180.291 E.00583
G1 X114.448 Y181.223 E.03775
G1 X114.726 Y182.853 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.74 Y182.932 E.02574
G1 X157.74 Y182.176 E.02164
G1 X156.664 Y179.647 F30000
G1 F16200
G1 X156.664 Y177.993 E.04738
G1 X157.74 Y176.918 E.04356
G1 X157.74 Y176.033 E.02535
G1 X156.664 Y174.957 E.04356
G1 X156.664 Y170.196 E.13637
G1 X157.74 Y169.121 E.04356
G1 X157.74 Y168.235 E.02535
G1 X156.664 Y167.16 E.04356
G1 X156.664 Y162.399 E.13637
G1 X157.74 Y161.323 E.04356
G1 X157.74 Y160.438 E.02535
G1 X156.664 Y159.362 E.04356
G1 X156.664 Y154.601 E.13637
G1 X157.74 Y153.526 E.04356
G1 X157.74 Y152.641 E.02535
G1 X156.664 Y151.565 E.04356
G1 X156.664 Y146.804 E.13637
G1 X157.74 Y145.728 E.04356
G1 X157.74 Y144.843 E.02535
G1 X156.664 Y143.768 E.04356
G1 X156.664 Y139.007 E.13637
G1 X157.74 Y137.931 E.04356
G1 X157.74 Y137.046 E.02535
G1 X156.664 Y135.97 E.04356
G1 X156.664 Y131.209 E.13637
G1 X157.74 Y130.134 E.04356
G1 X157.74 Y129.249 E.02535
G1 X156.664 Y128.173 E.04356
G1 X156.664 Y123.412 E.13637
G1 X157.74 Y122.336 E.04356
G1 X157.74 Y121.451 E.02535
G1 X156.664 Y120.376 E.04356
G1 X156.664 Y115.615 E.13637
G1 X157.74 Y114.539 E.04356
G1 X157.74 Y113.654 E.02535
G1 X156.664 Y112.578 E.04356
G1 X156.664 Y107.817 E.13637
G1 X157.74 Y106.742 E.04356
G1 X157.74 Y105.856 E.02535
G1 X156.664 Y104.781 E.04356
G1 X156.664 Y100.02 E.13637
G1 X157.74 Y98.944 E.04356
G1 X157.74 Y98.059 E.02535
G1 X156.664 Y96.984 E.04356
G1 X156.664 Y92.222 E.13637
G1 X157.74 Y91.147 E.04356
G1 X157.74 Y90.262 E.02535
G1 X156.664 Y89.186 E.04356
G1 X156.664 Y84.425 E.13637
G1 X157.74 Y83.35 E.04356
G1 X157.74 Y82.464 E.02535
G1 X156.664 Y81.389 E.04356
G1 X156.664 Y76.628 E.13637
G1 X157.74 Y75.552 E.04356
G1 X157.74 Y74.667 E.02535
G1 X156.664 Y73.592 E.04356
G1 X156.664 Y68.83 E.13637
G1 X157.74 Y67.755 E.04356
G1 X157.74 Y66.87 E.02535
G1 X156.664 Y65.794 E.04356
G1 X156.664 Y64.14 E.04738
G1 X157.74 Y61.612 F30000
G1 F16200
G1 X157.74 Y60.856 E.02164
G1 X156.841 Y60.856 E.02574
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.164 Y60.856 E.00694
G1 X75.164 Y62.268 E.04043
G1 X76.24 Y63.343 E.04356
G1 X76.24 Y63.484 E.00403
G1 X75.164 Y64.559 E.04356
G1 X75.164 Y70.065 E.1577
G1 X76.24 Y71.141 E.04356
G1 X76.24 Y71.281 E.00403
G1 X75.164 Y72.357 E.04356
G1 X75.164 Y77.862 E.1577
G1 X76.24 Y78.938 E.04356
G1 X76.24 Y79.079 E.00403
G1 X75.164 Y80.154 E.04356
G1 X75.164 Y85.66 E.1577
G1 X76.24 Y86.735 E.04356
G1 X76.24 Y86.876 E.00403
G1 X75.164 Y87.951 E.04356
G1 X75.164 Y93.457 E.1577
G1 X76.24 Y94.533 E.04356
G1 X76.24 Y94.673 E.00403
G1 X75.164 Y95.749 E.04356
G1 X75.164 Y101.255 E.1577
G1 X76.24 Y102.33 E.04356
G1 X76.24 Y102.471 E.00403
G1 X75.164 Y103.546 E.04356
G1 X75.164 Y109.052 E.1577
G1 X76.24 Y110.127 E.04356
G1 X76.24 Y110.268 E.00403
G1 X75.164 Y111.344 E.04356
G1 X75.164 Y116.849 E.1577
G1 X76.24 Y117.925 E.04356
G1 X76.24 Y118.065 E.00403
G1 X75.164 Y119.141 E.04356
G1 X75.164 Y124.647 E.1577
G1 X76.24 Y125.722 E.04356
G1 X76.24 Y125.863 E.00403
G1 X75.164 Y126.938 E.04356
G1 X75.164 Y132.444 E.1577
G1 X76.24 Y133.519 E.04356
G1 X76.24 Y133.66 E.00403
G1 X75.164 Y134.736 E.04356
G1 X75.164 Y140.241 E.1577
G1 X76.27 Y141.347 E.0448
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.557 Y140.329 E.04124
G1 X108.993 Y142.881 E.07413
G1 X107.677 Y141.565 E.05329
G1 X107.956 Y143.195 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 10.88
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.677 Y141.565 E-.62855
G1 X107.922 Y141.809 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 64/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z11.11 I1.134 J-.441 P1  F30000
G1 X76.992 Y62.285 Z11.11
G1 Z10.88
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.311 Y62.285 E2.27184
G1 X156.311 Y181.502 E3.41461
G1 X115.946 Y181.502 E1.15613
G1 X108.846 Y139.918 E1.20829
G1 X76.594 Y139.918 E.92378
G1 X76.594 Y62.285 E2.22356
G1 X76.932 Y62.285 E.0097
G1 X76.992 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.912 Y62.684 E2.09644
G1 X155.912 Y181.104 E3.14572
G1 X116.282 Y181.104 E1.05274
G1 X109.182 Y139.52 E1.12063
G1 X76.992 Y139.52 E.8551
G1 X76.992 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.992 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.571 Y69.926 Z11.28 F30000
G1 X107.347 Y141.73 Z11.28
G1 Z10.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.342 Y141.701 E.00085
G1 X74.811 Y141.701 E.93176
G1 X74.811 Y60.502 E2.3257
G1 X158.094 Y60.502 E2.38539
G1 X158.094 Y183.285 E3.51675
G1 X114.441 Y183.285 E1.25028
G1 X107.357 Y141.789 E1.20572
G1 X107.005 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.412 Y142.1 E.86581
G1 X74.412 Y60.104 E2.17814
G1 X158.492 Y60.104 E2.23351
G1 X158.492 Y183.684 E3.28279
G1 X114.105 Y183.684 E1.1791
G1 X107.016 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.016 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.956 Y143.196 Z11.28 F30000
G1 Z10.88
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.677 Y141.565 E.04738
G1 X108.993 Y142.881 E.05329
G1 X108.557 Y140.329 E.07414
G1 X107.539 Y141.347 E.04124
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.164 Y140.242 E.04479
G1 X75.164 Y134.735 E.1577
G1 X76.24 Y133.66 E.04356
G1 X76.24 Y133.52 E.00402
G1 X75.164 Y132.444 E.04356
G1 X75.164 Y126.938 E.1577
G1 X76.24 Y125.863 E.04356
G1 X76.24 Y125.722 E.00402
G1 X75.164 Y124.647 E.04356
G1 X75.164 Y119.141 E.1577
G1 X76.24 Y118.065 E.04356
G1 X76.24 Y117.925 E.00402
G1 X75.164 Y116.849 E.04356
G1 X75.164 Y111.343 E.1577
G1 X76.24 Y110.268 E.04356
G1 X76.24 Y110.128 E.00402
G1 X75.164 Y109.052 E.04356
G1 X75.164 Y103.546 E.1577
G1 X76.24 Y102.471 E.04356
G1 X76.24 Y102.33 E.00402
G1 X75.164 Y101.255 E.04356
G1 X75.164 Y95.749 E.1577
G1 X76.24 Y94.673 E.04356
G1 X76.24 Y94.533 E.00402
G1 X75.164 Y93.457 E.04356
G1 X75.164 Y87.951 E.1577
G1 X76.24 Y86.876 E.04356
G1 X76.24 Y86.735 E.00402
G1 X75.164 Y85.66 E.04356
G1 X75.164 Y80.154 E.1577
G1 X76.24 Y79.078 E.04356
G1 X76.24 Y78.938 E.00402
G1 X75.164 Y77.863 E.04356
G1 X75.164 Y72.357 E.1577
G1 X76.24 Y71.281 E.04356
G1 X76.24 Y71.141 E.00402
G1 X75.164 Y70.065 E.04356
G1 X75.164 Y64.559 E.1577
G1 X76.24 Y63.484 E.04356
G1 X76.24 Y63.343 E.00402
G1 X75.164 Y62.268 E.04356
G1 X75.164 Y60.856 E.04044
G1 X75.407 Y60.856 E.00694
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.74 Y60.856 E.02574
G1 X157.74 Y61.611 E.02164
G1 X156.664 Y64.14 F30000
G1 F16200
G1 X156.664 Y65.794 E.04738
G1 X157.74 Y66.87 E.04356
G1 X157.74 Y67.755 E.02535
G1 X156.664 Y68.83 E.04356
G1 X156.664 Y73.592 E.13638
G1 X157.74 Y74.667 E.04356
G1 X157.74 Y75.552 E.02535
G1 X156.664 Y76.628 E.04356
G1 X156.664 Y81.389 E.13638
G1 X157.74 Y82.464 E.04356
G1 X157.74 Y83.349 E.02535
G1 X156.664 Y84.425 E.04356
G1 X156.664 Y89.186 E.13638
G1 X157.74 Y90.262 E.04356
G1 X157.74 Y91.147 E.02535
G1 X156.664 Y92.222 E.04356
G1 X156.664 Y96.984 E.13638
G1 X157.74 Y98.059 E.04356
G1 X157.74 Y98.944 E.02535
G1 X156.664 Y100.02 E.04356
G1 X156.664 Y104.781 E.13638
G1 X157.74 Y105.857 E.04356
G1 X157.74 Y106.742 E.02535
G1 X156.664 Y107.817 E.04356
G1 X156.664 Y112.578 E.13638
G1 X157.74 Y113.654 E.04356
G1 X157.74 Y114.539 E.02535
G1 X156.664 Y115.614 E.04356
G1 X156.664 Y120.376 E.13638
G1 X157.74 Y121.451 E.04356
G1 X157.74 Y122.336 E.02535
G1 X156.664 Y123.412 E.04356
G1 X156.664 Y128.173 E.13638
G1 X157.74 Y129.249 E.04356
G1 X157.74 Y130.134 E.02535
G1 X156.664 Y131.209 E.04356
G1 X156.664 Y135.971 E.13638
G1 X157.74 Y137.046 E.04356
G1 X157.74 Y137.931 E.02535
G1 X156.664 Y139.006 E.04356
G1 X156.664 Y143.768 E.13638
G1 X157.74 Y144.843 E.04356
G1 X157.74 Y145.728 E.02535
G1 X156.664 Y146.804 E.04356
G1 X156.664 Y151.565 E.13638
G1 X157.74 Y152.641 E.04356
G1 X157.74 Y153.526 E.02535
G1 X156.664 Y154.601 E.04356
G1 X156.664 Y159.363 E.13638
G1 X157.74 Y160.438 E.04356
G1 X157.74 Y161.323 E.02535
G1 X156.664 Y162.399 E.04356
G1 X156.664 Y167.16 E.13638
G1 X157.74 Y168.235 E.04356
G1 X157.74 Y169.12 E.02535
G1 X156.664 Y170.196 E.04356
G1 X156.664 Y174.957 E.13638
G1 X157.74 Y176.033 E.04356
G1 X157.74 Y176.918 E.02535
G1 X156.664 Y177.993 E.04356
G1 X156.664 Y179.647 E.04738
G1 X157.74 Y182.176 F30000
G1 F16200
G1 X157.74 Y182.932 E.02164
G1 X156.841 Y182.932 E.02574
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.727 Y182.853 F30000
G1 F16200
G1 X114.448 Y181.223 E.04738
G1 X115.38 Y180.291 E.03775
G1 X115.414 Y180.492 E.00584
G1 X114.099 Y179.176 E.05329
G1 X113.311 Y174.562 E.13405
G1 X114.243 Y173.63 E.03775
G1 X113.809 Y171.089 E.07385
G1 X112.493 Y169.773 E.05329
G1 X112.174 Y167.902 E.05437
G1 X113.106 Y166.97 E.03775
G1 X112.204 Y161.686 E.15354
G1 X110.888 Y160.37 E.05329
G1 X111.037 Y161.242 E.02532
G1 X111.969 Y160.31 E.03775
G1 X111.69 Y158.679 E.04738
G1 X109.973 Y148.62 F30000
G1 F16200
G1 X109.695 Y146.989 E.04738
G1 X108.763 Y147.921 E.03775
G1 X109.283 Y150.968 E.08852
G1 X110.598 Y152.283 E.05329
G1 X110.832 Y153.65 E.0397
G1 X109.9 Y154.582 E.03775
G1 X110.178 Y156.212 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 11.05
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.9 Y154.582 E-.62855
G1 X110.144 Y154.337 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 65/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z11.28 I1.145 J-.412 P1  F30000
G1 X76.992 Y62.285 Z11.28
G1 Z11.05
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.311 Y62.285 E2.27184
G1 X156.311 Y181.502 E3.41461
G1 X115.946 Y181.502 E1.15613
G1 X108.846 Y139.918 E1.20829
G1 X76.594 Y139.918 E.92378
G1 X76.594 Y62.285 E2.22356
G1 X76.932 Y62.285 E.0097
G1 X76.992 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.912 Y62.684 E2.09644
G1 X155.912 Y181.104 E3.14572
G1 X116.282 Y181.104 E1.05274
G1 X109.182 Y139.52 E1.12063
G1 X76.992 Y139.52 E.8551
G1 X76.992 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.992 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.569 Y69.927 Z11.45 F30000
G1 X107.312 Y141.701 Z11.45
G1 Z11.05
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.811 Y141.701 E.93091
G1 X74.811 Y60.502 E2.3257
G1 X158.094 Y60.502 E2.38539
G1 X158.094 Y183.285 E3.51675
G1 X114.442 Y183.285 E1.25028
G1 X107.347 Y141.731 E1.20742
G1 X107.006 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.412 Y142.1 E.86581
G1 X74.412 Y60.104 E2.17814
G1 X158.492 Y60.104 E2.23351
G1 X158.492 Y183.684 E3.28279
G1 X114.105 Y183.684 E1.1791
G1 X107.016 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.016 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.647 Y149.32 Z11.45 F30000
G1 X110.178 Y156.212 Z11.45
G1 Z11.05
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.9 Y154.582 E.04738
G1 X110.832 Y153.65 E.03775
G1 X110.599 Y152.284 E.03969
G1 X109.283 Y150.968 E.05329
G1 X108.763 Y147.921 E.08853
G1 X109.695 Y146.989 E.03775
G1 X109.973 Y148.62 E.04738
G1 X111.69 Y158.679 F30000
G1 F16200
G1 X111.969 Y160.31 E.04738
G1 X111.037 Y161.242 E.03775
G1 X110.888 Y160.371 E.02531
G1 X112.204 Y161.686 E.05329
G1 X113.106 Y166.97 E.15353
G1 X112.174 Y167.902 E.03775
G1 X112.494 Y169.773 E.05437
G1 X113.809 Y171.089 E.05329
G1 X114.243 Y173.63 E.07384
G1 X113.311 Y174.562 E.03775
G1 X114.099 Y179.176 E.13406
G1 X115.415 Y180.492 E.05329
G1 X115.38 Y180.291 E.00584
G1 X114.448 Y181.222 E.03775
G1 X114.727 Y182.853 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.74 Y182.932 E.02574
G1 X157.74 Y182.176 E.02163
G1 X156.664 Y179.647 F30000
G1 F16200
G1 X156.664 Y177.993 E.04738
G1 X157.74 Y176.918 E.04356
G1 X157.74 Y176.033 E.02534
G1 X156.664 Y174.958 E.04356
G1 X156.664 Y170.196 E.13639
G1 X157.74 Y169.12 E.04356
G1 X157.74 Y168.236 E.02534
G1 X156.664 Y167.16 E.04356
G1 X156.664 Y162.398 E.13639
G1 X157.74 Y161.323 E.04356
G1 X157.74 Y160.438 E.02534
G1 X156.664 Y159.363 E.04356
G1 X156.664 Y154.601 E.13639
G1 X157.74 Y153.526 E.04356
G1 X157.74 Y152.641 E.02534
G1 X156.664 Y151.565 E.04356
G1 X156.664 Y146.804 E.13639
G1 X157.74 Y145.728 E.04356
G1 X157.74 Y144.844 E.02534
G1 X156.664 Y143.768 E.04356
G1 X156.664 Y139.006 E.13639
G1 X157.74 Y137.931 E.04356
G1 X157.74 Y137.046 E.02534
G1 X156.664 Y135.971 E.04356
G1 X156.664 Y131.209 E.13639
G1 X157.74 Y130.133 E.04356
G1 X157.74 Y129.249 E.02534
G1 X156.664 Y128.173 E.04356
G1 X156.664 Y123.412 E.13639
G1 X157.74 Y122.336 E.04356
G1 X157.74 Y121.451 E.02534
G1 X156.664 Y120.376 E.04356
G1 X156.664 Y115.614 E.13639
G1 X157.74 Y114.539 E.04356
G1 X157.74 Y113.654 E.02534
G1 X156.664 Y112.579 E.04356
G1 X156.664 Y107.817 E.13639
G1 X157.74 Y106.741 E.04356
G1 X157.74 Y105.857 E.02534
G1 X156.664 Y104.781 E.04356
G1 X156.664 Y100.019 E.13639
G1 X157.74 Y98.944 E.04356
G1 X157.74 Y98.059 E.02534
G1 X156.664 Y96.984 E.04356
G1 X156.664 Y92.222 E.13639
G1 X157.74 Y91.147 E.04356
G1 X157.74 Y90.262 E.02534
G1 X156.664 Y89.187 E.04356
G1 X156.664 Y84.425 E.13639
G1 X157.74 Y83.349 E.04356
G1 X157.74 Y82.465 E.02534
G1 X156.664 Y81.389 E.04356
G1 X156.664 Y76.627 E.13639
G1 X157.74 Y75.552 E.04356
G1 X157.74 Y74.667 E.02534
G1 X156.664 Y73.592 E.04356
G1 X156.664 Y68.83 E.13639
G1 X157.74 Y67.755 E.04356
G1 X157.74 Y66.87 E.02534
G1 X156.664 Y65.794 E.04356
G1 X156.664 Y64.14 E.04738
G1 X157.74 Y61.611 F30000
G1 F16200
G1 X157.74 Y60.856 E.02163
G1 X156.841 Y60.856 E.02574
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.164 Y60.856 E.00693
G1 X75.164 Y62.268 E.04044
G1 X76.24 Y63.344 E.04356
G1 X76.24 Y63.484 E.00401
G1 X75.164 Y64.559 E.04356
G1 X75.164 Y70.065 E.15771
G1 X76.24 Y71.141 E.04356
G1 X76.24 Y71.281 E.00401
G1 X75.164 Y72.356 E.04356
G1 X75.164 Y77.863 E.15771
G1 X76.24 Y78.938 E.04356
G1 X76.24 Y79.078 E.00401
G1 X75.164 Y80.154 E.04356
G1 X75.164 Y85.66 E.15771
G1 X76.24 Y86.736 E.04356
G1 X76.24 Y86.876 E.00401
G1 X75.164 Y87.951 E.04356
G1 X75.164 Y93.457 E.15771
G1 X76.24 Y94.533 E.04356
G1 X76.24 Y94.673 E.00401
G1 X75.164 Y95.749 E.04356
G1 X75.164 Y101.255 E.15771
G1 X76.24 Y102.33 E.04356
G1 X76.24 Y102.47 E.00401
G1 X75.164 Y103.546 E.04356
G1 X75.164 Y109.052 E.15771
G1 X76.24 Y110.128 E.04356
G1 X76.24 Y110.268 E.00401
G1 X75.164 Y111.343 E.04356
G1 X75.164 Y116.85 E.15771
G1 X76.24 Y117.925 E.04356
G1 X76.24 Y118.065 E.00401
G1 X75.164 Y119.141 E.04356
G1 X75.164 Y124.647 E.15771
G1 X76.24 Y125.722 E.04356
G1 X76.24 Y125.862 E.00401
G1 X75.164 Y126.938 E.04356
G1 X75.164 Y132.444 E.15771
G1 X76.24 Y133.52 E.04356
G1 X76.24 Y133.66 E.00401
G1 X75.164 Y134.735 E.04356
G1 X75.164 Y140.242 E.15771
G1 X76.27 Y141.347 E.04479
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
M73 P88 R6
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.558 Y140.329 E.04125
G1 X108.993 Y142.881 E.07415
G1 X107.678 Y141.565 E.05329
G1 X107.956 Y143.196 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 11.22
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.678 Y141.565 E-.62855
G1 X107.922 Y141.81 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 66/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z11.45 I1.134 J-.441 P1  F30000
G1 X76.992 Y62.285 Z11.45
G1 Z11.22
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.311 Y62.285 E2.27184
G1 X156.311 Y181.502 E3.41461
G1 X115.946 Y181.502 E1.15613
G1 X108.846 Y139.918 E1.20829
G1 X76.594 Y139.918 E.92378
G1 X76.594 Y62.285 E2.22356
G1 X76.932 Y62.285 E.0097
G1 X76.992 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.912 Y62.684 E2.09644
G1 X155.912 Y181.104 E3.14572
G1 X116.282 Y181.104 E1.05274
G1 X109.183 Y139.52 E1.12063
G1 X76.992 Y139.52 E.8551
G1 X76.992 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.992 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.571 Y69.926 Z11.62 F30000
G1 X107.347 Y141.73 Z11.62
G1 Z11.22
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.342 Y141.701 E.00085
G1 X74.811 Y141.701 E.93176
G1 X74.811 Y60.502 E2.3257
G1 X158.094 Y60.502 E2.38539
G1 X158.094 Y183.285 E3.51675
G1 X114.442 Y183.285 E1.25028
G1 X107.357 Y141.789 E1.20572
G1 X107.006 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.412 Y142.1 E.86581
G1 X74.412 Y60.104 E2.17814
G1 X158.492 Y60.104 E2.23351
G1 X158.492 Y183.684 E3.28279
G1 X114.106 Y183.684 E1.1791
G1 X107.016 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
M73 P89 R6
G1 X105.016 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.956 Y143.196 Z11.62 F30000
G1 Z11.22
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.678 Y141.565 E.04738
G1 X108.993 Y142.881 E.05329
G1 X108.558 Y140.329 E.07416
G1 X107.539 Y141.347 E.04125
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.165 Y140.242 E.04478
G1 X75.165 Y134.735 E.15772
G1 X76.24 Y133.66 E.04356
G1 X76.24 Y133.52 E.004
G1 X75.165 Y132.444 E.04356
G1 X75.165 Y126.938 E.15772
G1 X76.24 Y125.862 E.04356
G1 X76.24 Y125.723 E.004
G1 X75.165 Y124.647 E.04356
G1 X75.165 Y119.14 E.15772
G1 X76.24 Y118.065 E.04356
G1 X76.24 Y117.925 E.004
G1 X75.165 Y116.85 E.04356
G1 X75.165 Y111.343 E.15772
G1 X76.24 Y110.268 E.04356
G1 X76.24 Y110.128 E.004
G1 X75.165 Y109.052 E.04356
G1 X75.165 Y103.546 E.15772
G1 X76.24 Y102.47 E.04356
G1 X76.24 Y102.33 E.004
G1 X75.165 Y101.255 E.04356
G1 X75.165 Y95.748 E.15772
G1 X76.24 Y94.673 E.04356
G1 X76.24 Y94.533 E.004
G1 X75.165 Y93.458 E.04356
G1 X75.165 Y87.951 E.15772
G1 X76.24 Y86.876 E.04356
G1 X76.24 Y86.736 E.004
G1 X75.165 Y85.66 E.04356
G1 X75.165 Y80.154 E.15772
G1 X76.24 Y79.078 E.04356
G1 X76.24 Y78.938 E.004
G1 X75.165 Y77.863 E.04356
G1 X75.165 Y72.356 E.15772
G1 X76.24 Y71.281 E.04356
G1 X76.24 Y71.141 E.004
G1 X75.165 Y70.066 E.04356
G1 X75.165 Y64.559 E.15772
G1 X76.24 Y63.483 E.04356
G1 X76.24 Y63.344 E.004
G1 X75.165 Y62.268 E.04356
G1 X75.165 Y60.856 E.04045
G1 X75.407 Y60.856 E.00693
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.74 Y60.856 E.02575
G1 X157.74 Y61.611 E.02163
G1 X156.665 Y64.141 F30000
G1 F16200
G1 X156.665 Y65.795 E.04738
G1 X157.74 Y66.87 E.04356
G1 X157.74 Y67.754 E.02533
G1 X156.665 Y68.83 E.04356
G1 X156.665 Y73.592 E.13639
G1 X157.74 Y74.667 E.04356
G1 X157.74 Y75.552 E.02533
G1 X156.665 Y76.627 E.04356
G1 X156.665 Y81.389 E.13639
G1 X157.74 Y82.465 E.04356
G1 X157.74 Y83.349 E.02533
G1 X156.665 Y84.425 E.04356
G1 X156.665 Y89.187 E.13639
G1 X157.74 Y90.262 E.04356
G1 X157.74 Y91.146 E.02533
G1 X156.665 Y92.222 E.04356
G1 X156.665 Y96.984 E.13639
G1 X157.74 Y98.06 E.04356
G1 X157.74 Y98.944 E.02533
G1 X156.665 Y100.019 E.04356
G1 X156.665 Y104.781 E.13639
G1 X157.74 Y105.857 E.04356
G1 X157.74 Y106.741 E.02533
G1 X156.665 Y107.817 E.04356
G1 X156.665 Y112.579 E.13639
G1 X157.74 Y113.654 E.04356
G1 X157.74 Y114.539 E.02533
G1 X156.665 Y115.614 E.04356
G1 X156.665 Y120.376 E.13639
G1 X157.74 Y121.452 E.04356
G1 X157.74 Y122.336 E.02533
G1 X156.665 Y123.411 E.04356
G1 X156.665 Y128.173 E.13639
G1 X157.74 Y129.249 E.04356
G1 X157.74 Y130.133 E.02533
G1 X156.665 Y131.209 E.04356
G1 X156.665 Y135.971 E.13639
G1 X157.74 Y137.046 E.04356
G1 X157.74 Y137.931 E.02533
G1 X156.665 Y139.006 E.04356
G1 X156.665 Y143.768 E.13639
G1 X157.74 Y144.844 E.04356
G1 X157.74 Y145.728 E.02533
G1 X156.665 Y146.804 E.04356
G1 X156.665 Y151.566 E.13639
G1 X157.74 Y152.641 E.04356
G1 X157.74 Y153.525 E.02533
G1 X156.665 Y154.601 E.04356
G1 X156.665 Y159.363 E.13639
G1 X157.74 Y160.438 E.04356
G1 X157.74 Y161.323 E.02533
G1 X156.665 Y162.398 E.04356
G1 X156.665 Y167.16 E.13639
G1 X157.74 Y168.236 E.04356
G1 X157.74 Y169.12 E.02533
G1 X156.665 Y170.196 E.04356
G1 X156.665 Y174.958 E.13639
G1 X157.74 Y176.033 E.04356
G1 X157.74 Y176.917 E.02533
G1 X156.665 Y177.993 E.04356
G1 X156.665 Y179.647 E.04738
G1 X157.74 Y182.176 F30000
G1 F16200
G1 X157.74 Y182.932 E.02163
G1 X156.841 Y182.932 E.02575
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.727 Y182.853 F30000
G1 F16200
G1 X114.448 Y181.222 E.04738
G1 X115.38 Y180.29 E.03775
G1 X115.415 Y180.492 E.00585
G1 X114.099 Y179.176 E.05329
G1 X113.311 Y174.562 E.13407
G1 X114.243 Y173.63 E.03775
G1 X113.809 Y171.089 E.07383
G1 X112.494 Y169.774 E.05329
G1 X112.174 Y167.902 E.05438
G1 X113.106 Y166.97 E.03775
G1 X112.204 Y161.687 E.15352
G1 X110.888 Y160.371 E.05329
G1 X111.037 Y161.242 E.0253
G1 X111.969 Y160.31 E.03775
G1 X111.691 Y158.679 E.04738
G1 X109.973 Y148.62 F30000
G1 F16200
G1 X109.695 Y146.989 E.04738
G1 X108.763 Y147.921 E.03775
G1 X109.283 Y150.968 E.08853
G1 X110.599 Y152.284 E.05329
G1 X110.832 Y153.649 E.03968
G1 X109.9 Y154.581 E.03775
G1 X110.178 Y156.212 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 11.39
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.9 Y154.581 E-.62855
G1 X110.145 Y154.337 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 67/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z11.62 I1.145 J-.412 P1  F30000
G1 X76.993 Y62.285 Z11.62
G1 Z11.39
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.311 Y62.285 E2.27184
G1 X156.311 Y181.502 E3.41461
G1 X115.946 Y181.502 E1.15613
G1 X108.846 Y139.918 E1.20829
G1 X76.594 Y139.918 E.92378
G1 X76.594 Y62.285 E2.22356
G1 X76.933 Y62.285 E.0097
G1 X76.993 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.913 Y62.684 E2.09644
G1 X155.913 Y181.104 E3.14572
G1 X116.282 Y181.104 E1.05274
G1 X109.183 Y139.52 E1.12063
G1 X76.993 Y139.52 E.8551
G1 X76.993 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.993 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.571 Y69.926 Z11.79 F30000
G1 X107.347 Y141.73 Z11.79
G1 Z11.39
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.342 Y141.701 E.00085
G1 X74.811 Y141.701 E.93176
G1 X74.811 Y60.502 E2.3257
G1 X158.094 Y60.502 E2.38539
G1 X158.094 Y183.285 E3.51675
G1 X114.442 Y183.285 E1.25028
G1 X107.357 Y141.789 E1.20572
G1 X107.006 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.412 Y142.1 E.86581
G1 X74.412 Y60.104 E2.17814
G1 X158.493 Y60.104 E2.23351
G1 X158.493 Y183.684 E3.28279
G1 X114.106 Y183.684 E1.1791
G1 X107.016 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.016 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.647 Y149.32 Z11.79 F30000
G1 X110.178 Y156.212 Z11.79
G1 Z11.39
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.9 Y154.581 E.04738
G1 X110.832 Y153.649 E.03775
G1 X110.599 Y152.284 E.03967
G1 X109.283 Y150.968 E.05329
G1 X108.763 Y147.921 E.08854
G1 X109.695 Y146.989 E.03775
G1 X109.973 Y148.62 E.04738
G1 X111.691 Y158.679 F30000
G1 F16200
G1 X111.969 Y160.31 E.04738
G1 X111.037 Y161.242 E.03775
G1 X110.889 Y160.371 E.02529
G1 X112.204 Y161.687 E.05329
G1 X113.106 Y166.97 E.15351
G1 X112.174 Y167.902 E.03775
G1 X112.494 Y169.774 E.05439
G1 X113.81 Y171.089 E.05329
G1 X114.243 Y173.63 E.07382
G1 X113.311 Y174.562 E.03775
G1 X114.099 Y179.176 E.13408
G1 X115.415 Y180.492 E.05329
G1 X115.38 Y180.29 E.00586
G1 X114.449 Y181.222 E.03775
G1 X114.727 Y182.853 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.74 Y182.932 E.02575
G1 X157.74 Y182.177 E.02162
G1 X156.665 Y179.647 F30000
G1 F16200
G1 X156.665 Y177.993 E.04738
G1 X157.74 Y176.917 E.04356
G1 X157.74 Y176.033 E.02532
G1 X156.665 Y174.958 E.04356
G1 X156.665 Y170.195 E.1364
G1 X157.74 Y169.12 E.04356
G1 X157.74 Y168.236 E.02532
G1 X156.665 Y167.16 E.04356
G1 X156.665 Y162.398 E.1364
G1 X157.74 Y161.323 E.04356
G1 X157.74 Y160.439 E.02532
G1 X156.665 Y159.363 E.04356
G1 X156.665 Y154.601 E.1364
G1 X157.74 Y153.525 E.04356
G1 X157.74 Y152.641 E.02532
G1 X156.665 Y151.566 E.04356
G1 X156.665 Y146.803 E.1364
G1 X157.74 Y145.728 E.04356
G1 X157.74 Y144.844 E.02532
G1 X156.665 Y143.768 E.04356
G1 X156.665 Y139.006 E.1364
G1 X157.74 Y137.931 E.04356
G1 X157.74 Y137.046 E.02532
G1 X156.665 Y135.971 E.04356
G1 X156.665 Y131.209 E.1364
G1 X157.74 Y130.133 E.04356
G1 X157.74 Y129.249 E.02532
G1 X156.665 Y128.174 E.04356
G1 X156.665 Y123.411 E.1364
G1 X157.74 Y122.336 E.04356
G1 X157.74 Y121.452 E.02532
G1 X156.665 Y120.376 E.04356
G1 X156.665 Y115.614 E.1364
G1 X157.74 Y114.538 E.04356
G1 X157.74 Y113.654 E.02532
G1 X156.665 Y112.579 E.04356
G1 X156.665 Y107.817 E.1364
G1 X157.74 Y106.741 E.04356
G1 X157.74 Y105.857 E.02532
G1 X156.665 Y104.782 E.04356
G1 X156.665 Y100.019 E.1364
G1 X157.74 Y98.944 E.04356
G1 X157.74 Y98.06 E.02532
G1 X156.665 Y96.984 E.04356
G1 X156.665 Y92.222 E.1364
G1 X157.74 Y91.146 E.04356
G1 X157.74 Y90.262 E.02532
G1 X156.665 Y89.187 E.04356
G1 X156.665 Y84.424 E.1364
G1 X157.74 Y83.349 E.04356
G1 X157.74 Y82.465 E.02532
G1 X156.665 Y81.389 E.04356
G1 X156.665 Y76.627 E.1364
G1 X157.74 Y75.552 E.04356
G1 X157.74 Y74.668 E.02532
G1 X156.665 Y73.592 E.04356
G1 X156.665 Y68.83 E.1364
G1 X157.74 Y67.754 E.04356
G1 X157.74 Y66.87 E.02532
G1 X156.665 Y65.795 E.04356
G1 X156.665 Y64.141 E.04738
G1 X157.74 Y61.611 F30000
G1 F16200
G1 X157.74 Y60.856 E.02162
G1 X156.841 Y60.856 E.02575
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.165 Y60.856 E.00693
G1 X75.165 Y62.268 E.04045
G1 X76.24 Y63.344 E.04356
G1 X76.24 Y63.483 E.004
G1 X75.165 Y64.559 E.04356
G1 X75.165 Y70.066 E.15773
G1 X76.24 Y71.141 E.04356
G1 X76.24 Y71.281 E.004
G1 X75.165 Y72.356 E.04356
G1 X75.165 Y77.863 E.15773
G1 X76.24 Y78.939 E.04356
G1 X76.24 Y79.078 E.004
G1 X75.165 Y80.154 E.04356
G1 X75.165 Y85.66 E.15773
G1 X76.24 Y86.736 E.04356
G1 X76.24 Y86.875 E.004
G1 X75.165 Y87.951 E.04356
G1 X75.165 Y93.458 E.15773
G1 X76.24 Y94.533 E.04356
G1 X76.24 Y94.673 E.004
G1 X75.165 Y95.748 E.04356
G1 X75.165 Y101.255 E.15773
G1 X76.24 Y102.331 E.04356
G1 X76.24 Y102.47 E.004
G1 X75.165 Y103.546 E.04356
G1 X75.165 Y109.052 E.15773
G1 X76.24 Y110.128 E.04356
G1 X76.24 Y110.267 E.004
G1 X75.165 Y111.343 E.04356
G1 X75.165 Y116.85 E.15773
G1 X76.24 Y117.925 E.04356
G1 X76.24 Y118.065 E.004
G1 X75.165 Y119.14 E.04356
G1 X75.165 Y124.647 E.15773
G1 X76.24 Y125.723 E.04356
G1 X76.24 Y125.862 E.004
G1 X75.165 Y126.938 E.04356
G1 X75.165 Y132.445 E.15773
G1 X76.24 Y133.52 E.04356
G1 X76.24 Y133.66 E.004
G1 X75.165 Y134.735 E.04356
G1 X75.165 Y140.242 E.15773
G1 X76.27 Y141.347 E.04478
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.558 Y140.329 E.04126
G1 X108.994 Y142.881 E.07416
G1 X107.678 Y141.566 E.05329
G1 X107.956 Y143.196 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 11.56
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.678 Y141.566 E-.62855
G1 X107.922 Y141.81 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 68/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z11.79 I1.134 J-.441 P1  F30000
G1 X76.993 Y62.285 Z11.79
G1 Z11.56
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.311 Y62.285 E2.27184
G1 X156.311 Y181.502 E3.41461
G1 X115.946 Y181.502 E1.15613
G1 X108.847 Y139.918 E1.20829
G1 X76.594 Y139.918 E.92378
G1 X76.594 Y62.285 E2.22356
G1 X76.933 Y62.285 E.0097
G1 X76.993 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.913 Y62.684 E2.09644
G1 X155.913 Y181.104 E3.14572
G1 X116.283 Y181.104 E1.05274
G1 X109.183 Y139.52 E1.12063
G1 X76.993 Y139.52 E.8551
G1 X76.993 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.993 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.571 Y69.926 Z11.96 F30000
G1 X107.347 Y141.73 Z11.96
G1 Z11.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.342 Y141.701 E.00085
G1 X74.811 Y141.701 E.93176
G1 X74.811 Y60.502 E2.3257
G1 X158.094 Y60.502 E2.38539
G1 X158.094 Y183.285 E3.51675
G1 X114.442 Y183.285 E1.25028
G1 X107.357 Y141.789 E1.20572
G1 X107.006 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.413 Y142.1 E.86581
G1 X74.413 Y60.104 E2.17814
G1 X158.493 Y60.104 E2.23351
G1 X158.493 Y183.684 E3.28279
G1 X114.106 Y183.684 E1.1791
G1 X107.016 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.016 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.956 Y143.196 Z11.96 F30000
G1 Z11.56
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.678 Y141.566 E.04738
G1 X108.994 Y142.881 E.05329
G1 X108.558 Y140.329 E.07417
G1 X107.539 Y141.347 E.04126
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.165 Y140.242 E.04477
G1 X75.165 Y134.735 E.15774
G1 X76.24 Y133.659 E.04356
G1 X76.24 Y133.52 E.00399
G1 X75.165 Y132.445 E.04356
G1 X75.165 Y126.938 E.15774
G1 X76.24 Y125.862 E.04356
G1 X76.24 Y125.723 E.00399
G1 X75.165 Y124.647 E.04356
G1 X75.165 Y119.14 E.15774
G1 X76.24 Y118.065 E.04356
G1 X76.24 Y117.925 E.00399
G1 X75.165 Y116.85 E.04356
G1 X75.165 Y111.343 E.15774
G1 X76.24 Y110.267 E.04356
G1 X76.24 Y110.128 E.00399
G1 X75.165 Y109.053 E.04356
G1 X75.165 Y103.545 E.15774
G1 X76.24 Y102.47 E.04356
G1 X76.24 Y102.331 E.00399
G1 X75.165 Y101.255 E.04356
G1 X75.165 Y95.748 E.15774
G1 X76.24 Y94.673 E.04356
G1 X76.24 Y94.533 E.00399
G1 X75.165 Y93.458 E.04356
G1 X75.165 Y87.951 E.15774
G1 X76.24 Y86.875 E.04356
G1 X76.24 Y86.736 E.00399
G1 X75.165 Y85.661 E.04356
G1 X75.165 Y80.153 E.15774
G1 X76.24 Y79.078 E.04356
G1 X76.24 Y78.939 E.00399
G1 X75.165 Y77.863 E.04356
G1 X75.165 Y72.356 E.15774
G1 X76.24 Y71.281 E.04356
G1 X76.24 Y71.141 E.00399
G1 X75.165 Y70.066 E.04356
G1 X75.165 Y64.559 E.15774
G1 X76.24 Y63.483 E.04356
G1 X76.24 Y63.344 E.00399
G1 X75.165 Y62.268 E.04356
G1 X75.165 Y60.856 E.04045
G1 X75.407 Y60.856 E.00692
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.74 Y60.856 E.02576
G1 X157.74 Y61.611 E.02162
G1 X156.665 Y64.141 F30000
G1 F16200
G1 X156.665 Y65.795 E.04738
G1 X157.74 Y66.87 E.04356
G1 X157.74 Y67.754 E.02531
G1 X156.665 Y68.83 E.04356
G1 X156.665 Y73.592 E.13641
G1 X157.74 Y74.668 E.04356
G1 X157.74 Y75.551 E.02531
G1 X156.665 Y76.627 E.04356
G1 X156.665 Y81.39 E.13641
G1 X157.74 Y82.465 E.04356
G1 X157.74 Y83.349 E.02531
G1 X156.665 Y84.424 E.04356
G1 X156.665 Y89.187 E.13641
G1 X157.74 Y90.262 E.04356
G1 X157.74 Y91.146 E.02531
G1 X156.665 Y92.222 E.04356
G1 X156.665 Y96.984 E.13641
G1 X157.74 Y98.06 E.04356
G1 X157.74 Y98.944 E.02531
G1 X156.665 Y100.019 E.04356
M73 P90 R6
G1 X156.665 Y104.782 E.13641
G1 X157.74 Y105.857 E.04356
G1 X157.74 Y106.741 E.02531
G1 X156.665 Y107.816 E.04356
G1 X156.665 Y112.579 E.13641
G1 X157.74 Y113.655 E.04356
G1 X157.74 Y114.538 E.02531
G1 X156.665 Y115.614 E.04356
G1 X156.665 Y120.376 E.13641
G1 X157.74 Y121.452 E.04356
G1 X157.74 Y122.336 E.02531
G1 X156.665 Y123.411 E.04356
G1 X156.665 Y128.174 E.13641
G1 X157.74 Y129.249 E.04356
G1 X157.74 Y130.133 E.02531
G1 X156.665 Y131.209 E.04356
G1 X156.665 Y135.971 E.13641
G1 X157.74 Y137.047 E.04356
G1 X157.74 Y137.93 E.02531
G1 X156.665 Y139.006 E.04356
G1 X156.665 Y143.768 E.13641
G1 X157.74 Y144.844 E.04356
G1 X157.74 Y145.728 E.02531
G1 X156.665 Y146.803 E.04356
G1 X156.665 Y151.566 E.13641
G1 X157.74 Y152.641 E.04356
G1 X157.74 Y153.525 E.02531
G1 X156.665 Y154.601 E.04356
G1 X156.665 Y159.363 E.13641
G1 X157.74 Y160.439 E.04356
G1 X157.74 Y161.322 E.02531
G1 X156.665 Y162.398 E.04356
G1 X156.665 Y167.161 E.13641
G1 X157.74 Y168.236 E.04356
G1 X157.74 Y169.12 E.02531
G1 X156.665 Y170.195 E.04356
G1 X156.665 Y174.958 E.13641
G1 X157.74 Y176.033 E.04356
G1 X157.74 Y176.917 E.02531
G1 X156.665 Y177.993 E.04356
G1 X156.665 Y179.647 E.04738
G1 X157.74 Y182.177 F30000
G1 F16200
G1 X157.74 Y182.932 E.02162
G1 X156.841 Y182.932 E.02576
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.727 Y182.853 F30000
G1 F16200
G1 X114.449 Y181.222 E.04738
G1 X115.381 Y180.29 E.03775
G1 X115.415 Y180.492 E.00587
G1 X114.099 Y179.177 E.05329
G1 X113.312 Y174.562 E.13409
G1 X114.243 Y173.63 E.03775
G1 X113.81 Y171.09 E.07382
G1 X112.494 Y169.774 E.05329
G1 X112.174 Y167.902 E.0544
G1 X113.106 Y166.97 E.03775
G1 X112.204 Y161.687 E.1535
G1 X110.889 Y160.371 E.05329
G1 X111.037 Y161.241 E.02529
G1 X111.969 Y160.309 E.03775
G1 X111.691 Y158.679 E.04738
G1 X109.973 Y148.619 F30000
G1 F16200
G1 X109.695 Y146.989 E.04738
G1 X108.763 Y147.921 E.03775
G1 X109.283 Y150.968 E.08855
G1 X110.599 Y152.284 E.05329
G1 X110.832 Y153.649 E.03966
G1 X109.9 Y154.581 E.03775
G1 X110.179 Y156.212 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 11.73
; LAYER_HEIGHT: 0.169999
; WIPE_START
G1 F24000
G1 X109.9 Y154.581 E-.62855
G1 X110.145 Y154.337 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 69/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z11.96 I1.145 J-.412 P1  F30000
G1 X76.993 Y62.285 Z11.96
G1 Z11.73
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.311 Y62.285 E2.27184
G1 X156.311 Y181.502 E3.41461
G1 X115.947 Y181.502 E1.15613
G1 X108.847 Y139.918 E1.20829
G1 X76.594 Y139.918 E.92378
G1 X76.594 Y62.285 E2.22356
G1 X76.933 Y62.285 E.0097
G1 X76.993 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.913 Y62.684 E2.09644
G1 X155.913 Y181.104 E3.14572
G1 X116.283 Y181.104 E1.05274
G1 X109.183 Y139.52 E1.12063
G1 X76.993 Y139.52 E.8551
G1 X76.993 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.993 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.572 Y69.926 Z12.13 F30000
G1 X107.347 Y141.73 Z12.13
G1 Z11.73
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.342 Y141.701 E.00085
G1 X74.811 Y141.701 E.93176
G1 X74.811 Y60.502 E2.3257
G1 X158.094 Y60.502 E2.38539
G1 X158.094 Y183.285 E3.51675
G1 X114.442 Y183.285 E1.25028
G1 X107.357 Y141.789 E1.20572
G1 X107.006 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.413 Y142.1 E.86581
G1 X74.413 Y60.104 E2.17814
G1 X158.493 Y60.104 E2.23351
G1 X158.493 Y183.684 E3.28279
G1 X114.106 Y183.684 E1.1791
G1 X107.016 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.016 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.648 Y149.32 Z12.13 F30000
G1 X110.179 Y156.212 Z12.13
G1 Z11.73
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.9 Y154.581 E.04738
G1 X110.832 Y153.649 E.03775
G1 X110.599 Y152.284 E.03966
G1 X109.284 Y150.969 E.05329
G1 X108.763 Y147.921 E.08856
G1 X109.695 Y146.989 E.03775
G1 X109.973 Y148.619 E.04738
G1 X111.691 Y158.679 F30000
G1 F16200
G1 X111.969 Y160.309 E.04738
G1 X111.037 Y161.241 E.03775
G1 X110.889 Y160.371 E.02528
G1 X112.205 Y161.687 E.05329
G1 X113.106 Y166.97 E.15349
G1 X112.175 Y167.902 E.03775
G1 X112.494 Y169.774 E.05441
G1 X113.81 Y171.09 E.05329
G1 X114.244 Y173.63 E.07381
G1 X113.312 Y174.562 E.03775
G1 X114.1 Y179.177 E.1341
G1 X115.415 Y180.492 E.05329
G1 X115.381 Y180.29 E.00588
G1 X114.449 Y181.222 E.03775
G1 X114.727 Y182.852 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.741 Y182.932 E.02576
G1 X157.741 Y182.177 E.02161
G1 X156.665 Y179.647 F30000
G1 F16200
G1 X156.665 Y177.993 E.04738
G1 X157.741 Y176.917 E.04356
G1 X157.741 Y176.034 E.0253
G1 X156.665 Y174.958 E.04356
G1 X156.665 Y170.195 E.13642
G1 X157.741 Y169.12 E.04356
G1 X157.741 Y168.236 E.0253
G1 X156.665 Y167.161 E.04356
G1 X156.665 Y162.398 E.13642
G1 X157.741 Y161.322 E.04356
G1 X157.741 Y160.439 E.0253
G1 X156.665 Y159.363 E.04356
G1 X156.665 Y154.6 E.13642
G1 X157.741 Y153.525 E.04356
G1 X157.741 Y152.641 E.0253
G1 X156.665 Y151.566 E.04356
G1 X156.665 Y146.803 E.13642
G1 X157.741 Y145.728 E.04356
G1 X157.741 Y144.844 E.0253
G1 X156.665 Y143.769 E.04356
G1 X156.665 Y139.006 E.13642
G1 X157.741 Y137.93 E.04356
G1 X157.741 Y137.047 E.0253
G1 X156.665 Y135.971 E.04356
G1 X156.665 Y131.208 E.13642
G1 X157.741 Y130.133 E.04356
G1 X157.741 Y129.249 E.0253
G1 X156.665 Y128.174 E.04356
G1 X156.665 Y123.411 E.13642
G1 X157.741 Y122.336 E.04356
G1 X157.741 Y121.452 E.0253
G1 X156.665 Y120.377 E.04356
G1 X156.665 Y115.614 E.13642
G1 X157.741 Y114.538 E.04356
G1 X157.741 Y113.655 E.0253
G1 X156.665 Y112.579 E.04356
G1 X156.665 Y107.816 E.13642
G1 X157.741 Y106.741 E.04356
G1 X157.741 Y105.857 E.0253
G1 X156.665 Y104.782 E.04356
G1 X156.665 Y100.019 E.13642
G1 X157.741 Y98.943 E.04356
G1 X157.741 Y98.06 E.0253
G1 X156.665 Y96.984 E.04356
G1 X156.665 Y92.222 E.13642
G1 X157.741 Y91.146 E.04356
G1 X157.741 Y90.263 E.0253
G1 X156.665 Y89.187 E.04356
G1 X156.665 Y84.424 E.13642
G1 X157.741 Y83.349 E.04356
G1 X157.741 Y82.465 E.0253
G1 X156.665 Y81.39 E.04356
G1 X156.665 Y76.627 E.13642
G1 X157.741 Y75.551 E.04356
G1 X157.741 Y74.668 E.0253
G1 X156.665 Y73.592 E.04356
G1 X156.665 Y68.829 E.13642
G1 X157.741 Y67.754 E.04356
G1 X157.741 Y66.87 E.0253
G1 X156.665 Y65.795 E.04356
G1 X156.665 Y64.141 E.04738
G1 X157.741 Y61.611 F30000
G1 F16200
G1 X157.741 Y60.856 E.02162
G1 X156.841 Y60.856 E.02576
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.165 Y60.856 E.00692
G1 X75.165 Y62.269 E.04046
G1 X76.241 Y63.344 E.04356
G1 X76.241 Y63.483 E.00398
G1 X75.165 Y64.558 E.04356
G1 X75.165 Y70.066 E.15774
G1 X76.241 Y71.141 E.04356
G1 X76.241 Y71.28 E.00398
G1 X75.165 Y72.356 E.04356
G1 X75.165 Y77.863 E.15774
G1 X76.241 Y78.939 E.04356
G1 X76.241 Y79.078 E.00398
G1 X75.165 Y80.153 E.04356
G1 X75.165 Y85.661 E.15774
G1 X76.241 Y86.736 E.04356
G1 X76.241 Y86.875 E.00398
G1 X75.165 Y87.951 E.04356
G1 X75.165 Y93.458 E.15774
G1 X76.241 Y94.534 E.04356
G1 X76.241 Y94.672 E.00398
G1 X75.165 Y95.748 E.04356
G1 X75.165 Y101.255 E.15774
G1 X76.241 Y102.331 E.04356
G1 X76.241 Y102.47 E.00398
G1 X75.165 Y103.545 E.04356
G1 X75.165 Y109.053 E.15774
G1 X76.241 Y110.128 E.04356
G1 X76.241 Y110.267 E.00398
G1 X75.165 Y111.343 E.04356
G1 X75.165 Y116.85 E.15775
G1 X76.241 Y117.926 E.04356
G1 X76.241 Y118.065 E.00398
G1 X75.165 Y119.14 E.04356
G1 X75.165 Y124.648 E.15775
G1 X76.241 Y125.723 E.04356
G1 X76.241 Y125.862 E.00398
G1 X75.165 Y126.937 E.04356
G1 X75.165 Y132.445 E.15775
G1 X76.241 Y133.52 E.04356
G1 X76.241 Y133.659 E.00398
G1 X75.165 Y134.735 E.04356
G1 X75.165 Y140.242 E.15775
G1 X76.27 Y141.347 E.04476
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.558 Y140.329 E.04127
G1 X108.994 Y142.882 E.07418
G1 X107.678 Y141.566 E.05329
G1 X107.957 Y143.196 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 11.9
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.678 Y141.566 E-.62855
G1 X107.923 Y141.811 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 70/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z12.13 I1.134 J-.441 P1  F30000
G1 X76.993 Y62.285 Z12.13
G1 Z11.9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.311 Y62.285 E2.27184
G1 X156.311 Y181.502 E3.41461
G1 X115.947 Y181.502 E1.15613
G1 X108.847 Y139.918 E1.20829
G1 X76.594 Y139.918 E.92378
G1 X76.594 Y62.285 E2.22356
G1 X76.933 Y62.285 E.0097
G1 X76.993 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.913 Y62.684 E2.09644
G1 X155.913 Y181.104 E3.14572
G1 X116.283 Y181.104 E1.05274
G1 X109.183 Y139.52 E1.12063
G1 X76.993 Y139.52 E.8551
G1 X76.993 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.993 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.572 Y69.926 Z12.3 F30000
G1 X107.348 Y141.73 Z12.3
G1 Z11.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.343 Y141.701 E.00085
G1 X74.811 Y141.701 E.93176
G1 X74.811 Y60.502 E2.3257
G1 X158.094 Y60.502 E2.38539
G1 X158.094 Y183.285 E3.51675
G1 X114.442 Y183.285 E1.25028
G1 X107.358 Y141.789 E1.20572
G1 X107.006 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.413 Y142.1 E.86581
G1 X74.413 Y60.104 E2.17814
G1 X158.493 Y60.104 E2.23351
G1 X158.493 Y183.684 E3.28279
G1 X114.106 Y183.684 E1.1791
G1 X107.016 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.016 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.957 Y143.197 Z12.3 F30000
G1 Z11.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.678 Y141.566 E.04738
G1 X108.994 Y142.882 E.05329
G1 X108.558 Y140.328 E.07419
G1 X107.539 Y141.347 E.04127
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
M73 P90 R5
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.165 Y140.242 E.04476
G1 X75.165 Y134.735 E.15775
G1 X76.241 Y133.659 E.04356
G1 X76.241 Y133.521 E.00397
G1 X75.165 Y132.445 E.04356
G1 X75.165 Y126.937 E.15775
G1 X76.241 Y125.862 E.04356
G1 X76.241 Y125.723 E.00397
G1 X75.165 Y124.648 E.04356
G1 X75.165 Y119.14 E.15775
G1 X76.241 Y118.064 E.04356
G1 X76.241 Y117.926 E.00397
G1 X75.165 Y116.85 E.04356
G1 X75.165 Y111.343 E.15775
G1 X76.241 Y110.267 E.04356
G1 X76.241 Y110.128 E.00397
G1 X75.165 Y109.053 E.04356
G1 X75.165 Y103.545 E.15775
G1 X76.241 Y102.47 E.04356
G1 X76.241 Y102.331 E.00397
G1 X75.165 Y101.256 E.04356
G1 X75.165 Y95.748 E.15775
G1 X76.241 Y94.672 E.04356
G1 X76.241 Y94.534 E.00397
G1 X75.165 Y93.458 E.04356
G1 X75.165 Y87.95 E.15775
G1 X76.241 Y86.875 E.04356
G1 X76.241 Y86.736 E.00397
G1 X75.165 Y85.661 E.04356
G1 X75.165 Y80.153 E.15775
G1 X76.241 Y79.078 E.04356
G1 X76.241 Y78.939 E.00397
G1 X75.165 Y77.863 E.04356
G1 X75.165 Y72.356 E.15775
G1 X76.241 Y71.28 E.04356
G1 X76.241 Y71.142 E.00397
G1 X75.165 Y70.066 E.04356
G1 X75.165 Y64.558 E.15775
G1 X76.241 Y63.483 E.04356
G1 X76.241 Y63.344 E.00397
G1 X75.165 Y62.269 E.04356
G1 X75.165 Y60.856 E.04046
G1 X75.407 Y60.856 E.00691
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.741 Y60.856 E.02576
G1 X157.741 Y61.611 E.02161
G1 X156.665 Y64.141 F30000
G1 F16200
G1 X156.665 Y65.795 E.04738
G1 X157.741 Y66.871 E.04356
G1 X157.741 Y67.754 E.0253
G1 X156.665 Y68.829 E.04356
G1 X156.665 Y73.593 E.13643
G1 X157.741 Y74.668 E.04356
G1 X157.741 Y75.551 E.0253
G1 X156.665 Y76.627 E.04356
G1 X156.665 Y81.39 E.13643
G1 X157.741 Y82.465 E.04356
G1 X157.741 Y83.349 E.0253
G1 X156.665 Y84.424 E.04356
G1 X156.665 Y89.187 E.13643
G1 X157.741 Y90.263 E.04356
G1 X157.741 Y91.146 E.0253
G1 X156.665 Y92.221 E.04356
G1 X156.665 Y96.985 E.13643
G1 X157.741 Y98.06 E.04356
G1 X157.741 Y98.943 E.0253
G1 X156.665 Y100.019 E.04356
G1 X156.665 Y104.782 E.13643
G1 X157.741 Y105.857 E.04356
G1 X157.741 Y106.741 E.0253
G1 X156.665 Y107.816 E.04356
G1 X156.665 Y112.579 E.13643
G1 X157.741 Y113.655 E.04356
G1 X157.741 Y114.538 E.0253
G1 X156.665 Y115.613 E.04356
G1 X156.665 Y120.377 E.13643
G1 X157.741 Y121.452 E.04356
G1 X157.741 Y122.335 E.0253
G1 X156.665 Y123.411 E.04356
G1 X156.665 Y128.174 E.13643
G1 X157.741 Y129.25 E.04356
G1 X157.741 Y130.133 E.0253
G1 X156.665 Y131.208 E.04356
G1 X156.665 Y135.971 E.13643
G1 X157.741 Y137.047 E.04356
G1 X157.741 Y137.93 E.0253
G1 X156.665 Y139.006 E.04356
G1 X156.665 Y143.769 E.13643
G1 X157.741 Y144.844 E.04356
G1 X157.741 Y145.727 E.0253
G1 X156.665 Y146.803 E.04356
G1 X156.665 Y151.566 E.13643
G1 X157.741 Y152.642 E.04356
G1 X157.741 Y153.525 E.0253
G1 X156.665 Y154.6 E.04356
G1 X156.665 Y159.364 E.13643
G1 X157.741 Y160.439 E.04356
G1 X157.741 Y161.322 E.0253
G1 X156.665 Y162.398 E.04356
G1 X156.665 Y167.161 E.13643
G1 X157.741 Y168.236 E.04356
G1 X157.741 Y169.12 E.0253
G1 X156.665 Y170.195 E.04356
G1 X156.665 Y174.958 E.13643
G1 X157.741 Y176.034 E.04356
G1 X157.741 Y176.917 E.0253
G1 X156.665 Y177.992 E.04356
G1 X156.665 Y179.646 E.04738
G1 X157.741 Y182.177 F30000
G1 F16200
G1 X157.741 Y182.932 E.02161
G1 X156.841 Y182.932 E.02577
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.727 Y182.852 F30000
G1 F16200
G1 X114.449 Y181.222 E.04738
G1 X115.381 Y180.29 E.03775
G1 X115.415 Y180.493 E.00589
G1 X114.1 Y179.177 E.05329
G1 X113.312 Y174.562 E.1341
G1 X114.244 Y173.63 E.03775
G1 X113.81 Y171.09 E.0738
G1 X112.494 Y169.774 E.05329
G1 X112.175 Y167.901 E.05442
G1 X113.107 Y166.969 E.03775
G1 X112.205 Y161.687 E.15348
G1 X110.889 Y160.372 E.05329
G1 X111.038 Y161.241 E.02527
G1 X111.969 Y160.309 E.03775
G1 X111.691 Y158.679 E.04738
G1 X109.974 Y148.619 F30000
G1 F16200
G1 X109.695 Y146.989 E.04738
G1 X108.763 Y147.921 E.03775
G1 X109.284 Y150.969 E.08857
G1 X110.599 Y152.284 E.05329
G1 X110.832 Y153.649 E.03965
G1 X109.9 Y154.581 E.03775
G1 X110.179 Y156.211 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 12.07
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.9 Y154.581 E-.62855
G1 X110.145 Y154.336 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 71/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z12.3 I1.145 J-.412 P1  F30000
G1 X76.993 Y62.285 Z12.3
G1 Z12.07
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.312 Y62.285 E2.27184
G1 X156.312 Y181.502 E3.41461
G1 X115.947 Y181.502 E1.15613
G1 X108.847 Y139.918 E1.20829
G1 X76.595 Y139.918 E.92378
G1 X76.595 Y62.285 E2.22356
G1 X76.933 Y62.285 E.0097
G1 X76.993 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.913 Y62.684 E2.09644
G1 X155.913 Y181.104 E3.14572
G1 X116.283 Y181.104 E1.05274
G1 X109.183 Y139.52 E1.12063
G1 X76.993 Y139.52 E.8551
G1 X76.993 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.993 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.57 Y69.927 Z12.47 F30000
G1 X107.313 Y141.701 Z12.47
G1 Z12.07
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.812 Y141.701 E.93091
G1 X74.812 Y60.502 E2.3257
G1 X158.095 Y60.502 E2.38539
G1 X158.095 Y183.285 E3.51675
G1 X114.442 Y183.285 E1.25028
G1 X107.348 Y141.731 E1.20742
G1 X107.006 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.413 Y142.1 E.86581
G1 X74.413 Y60.104 E2.17814
G1 X158.493 Y60.104 E2.23351
G1 X158.493 Y183.684 E3.28279
G1 X114.106 Y183.684 E1.1791
G1 X107.017 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.017 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.648 Y149.32 Z12.47 F30000
G1 X110.179 Y156.211 Z12.47
G1 Z12.07
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.901 Y154.581 E.04738
G1 X110.832 Y153.649 E.03775
G1 X110.6 Y152.285 E.03964
G1 X109.284 Y150.969 E.05329
G1 X108.763 Y147.921 E.08858
G1 X109.695 Y146.989 E.03775
G1 X109.974 Y148.619 E.04738
G1 X111.691 Y158.679 F30000
G1 F16200
G1 X111.97 Y160.309 E.04738
G1 X111.038 Y161.241 E.03775
G1 X110.889 Y160.372 E.02526
G1 X112.205 Y161.687 E.05329
G1 X113.107 Y166.969 E.15348
G1 X112.175 Y167.901 E.03775
G1 X112.495 Y169.774 E.05443
G1 X113.81 Y171.09 E.05329
G1 X114.244 Y173.63 E.07379
G1 X113.312 Y174.562 E.03775
G1 X114.1 Y179.177 E.13411
G1 X115.416 Y180.493 E.05329
G1 X115.381 Y180.29 E.0059
G1 X114.449 Y181.222 E.03775
G1 X114.727 Y182.852 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
M73 P91 R5
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.741 Y182.932 E.02577
G1 X157.741 Y182.177 E.02161
G1 X156.665 Y179.646 F30000
G1 F16200
G1 X156.665 Y177.992 E.04738
G1 X157.741 Y176.917 E.04356
G1 X157.741 Y176.034 E.02529
G1 X156.665 Y174.958 E.04356
G1 X156.665 Y170.195 E.13644
G1 X157.741 Y169.119 E.04356
G1 X157.741 Y168.237 E.02529
G1 X156.665 Y167.161 E.04356
G1 X156.665 Y162.398 E.13644
G1 X157.741 Y161.322 E.04356
G1 X157.741 Y160.439 E.02529
G1 X156.665 Y159.364 E.04356
G1 X156.665 Y154.6 E.13644
G1 X157.741 Y153.525 E.04356
G1 X157.741 Y152.642 E.02529
G1 X156.665 Y151.566 E.04356
G1 X156.665 Y146.803 E.13644
G1 X157.741 Y145.727 E.04356
G1 X157.741 Y144.844 E.02529
G1 X156.665 Y143.769 E.04356
G1 X156.665 Y139.005 E.13644
G1 X157.741 Y137.93 E.04356
G1 X157.741 Y137.047 E.02529
G1 X156.665 Y135.972 E.04356
G1 X156.665 Y131.208 E.13644
G1 X157.741 Y130.133 E.04356
G1 X157.741 Y129.25 E.02529
G1 X156.665 Y128.174 E.04356
G1 X156.665 Y123.411 E.13644
G1 X157.741 Y122.335 E.04356
G1 X157.741 Y121.452 E.02529
G1 X156.665 Y120.377 E.04356
G1 X156.665 Y115.613 E.13644
G1 X157.741 Y114.538 E.04356
G1 X157.741 Y113.655 E.02529
G1 X156.665 Y112.579 E.04356
G1 X156.665 Y107.816 E.13644
G1 X157.741 Y106.74 E.04356
G1 X157.741 Y105.858 E.02529
G1 X156.665 Y104.782 E.04356
G1 X156.665 Y100.019 E.13644
G1 X157.741 Y98.943 E.04356
G1 X157.741 Y98.06 E.02529
G1 X156.665 Y96.985 E.04356
G1 X156.665 Y92.221 E.13644
G1 X157.741 Y91.146 E.04356
G1 X157.741 Y90.263 E.02529
G1 X156.665 Y89.187 E.04356
G1 X156.665 Y84.424 E.13644
G1 X157.741 Y83.348 E.04356
G1 X157.741 Y82.466 E.02529
G1 X156.665 Y81.39 E.04356
G1 X156.665 Y76.627 E.13644
G1 X157.741 Y75.551 E.04356
G1 X157.741 Y74.668 E.02529
G1 X156.665 Y73.593 E.04356
G1 X156.665 Y68.829 E.13644
G1 X157.741 Y67.754 E.04356
G1 X157.741 Y66.871 E.02529
G1 X156.665 Y65.795 E.04356
G1 X156.665 Y64.141 E.04738
G1 X157.741 Y61.61 F30000
G1 F16200
G1 X157.741 Y60.856 E.02161
G1 X156.841 Y60.856 E.02577
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.165 Y60.856 E.00691
G1 X75.165 Y62.269 E.04047
G1 X76.241 Y63.344 E.04356
G1 X76.241 Y63.483 E.00396
G1 X75.165 Y64.558 E.04356
G1 X75.165 Y70.066 E.15776
G1 X76.241 Y71.142 E.04356
G1 X76.241 Y71.28 E.00396
G1 X75.165 Y72.356 E.04356
G1 X75.165 Y77.864 E.15776
G1 X76.241 Y78.939 E.04356
G1 X76.241 Y79.077 E.00396
G1 X75.165 Y80.153 E.04356
G1 X75.165 Y85.661 E.15776
G1 X76.241 Y86.736 E.04356
G1 X76.241 Y86.875 E.00396
G1 X75.165 Y87.95 E.04356
G1 X75.165 Y93.458 E.15776
G1 X76.241 Y94.534 E.04356
G1 X76.241 Y94.672 E.00396
G1 X75.165 Y95.748 E.04356
G1 X75.165 Y101.256 E.15776
G1 X76.241 Y102.331 E.04356
G1 X76.241 Y102.47 E.00396
G1 X75.165 Y103.545 E.04356
G1 X75.165 Y109.053 E.15776
G1 X76.241 Y110.129 E.04356
G1 X76.241 Y110.267 E.00396
G1 X75.165 Y111.342 E.04356
G1 X75.165 Y116.85 E.15776
G1 X76.241 Y117.926 E.04356
G1 X76.241 Y118.064 E.00396
G1 X75.165 Y119.14 E.04356
G1 X75.165 Y124.648 E.15776
G1 X76.241 Y125.723 E.04356
G1 X76.241 Y125.862 E.00396
G1 X75.165 Y126.937 E.04356
G1 X75.165 Y132.445 E.15776
G1 X76.241 Y133.521 E.04356
G1 X76.241 Y133.659 E.00396
G1 X75.165 Y134.734 E.04356
G1 X75.165 Y140.243 E.15776
G1 X76.27 Y141.347 E.04475
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.558 Y140.328 E.04128
G1 X108.994 Y142.882 E.0742
G1 X107.679 Y141.566 E.05329
G1 X107.957 Y143.197 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 12.24
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.679 Y141.566 E-.62855
G1 X107.923 Y141.811 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 72/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z12.47 I1.134 J-.441 P1  F30000
G1 X76.993 Y62.285 Z12.47
G1 Z12.24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.312 Y62.285 E2.27184
G1 X156.312 Y181.502 E3.41461
G1 X115.947 Y181.502 E1.15613
G1 X108.847 Y139.918 E1.20829
G1 X76.595 Y139.918 E.92378
G1 X76.595 Y62.285 E2.22356
G1 X76.933 Y62.285 E.0097
G1 X76.993 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.913 Y62.684 E2.09644
G1 X155.913 Y181.104 E3.14572
G1 X116.283 Y181.104 E1.05274
G1 X109.183 Y139.52 E1.12063
G1 X76.993 Y139.52 E.8551
G1 X76.993 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.993 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.572 Y69.926 Z12.64 F30000
G1 X107.348 Y141.73 Z12.64
G1 Z12.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.343 Y141.701 E.00085
G1 X74.812 Y141.701 E.93176
G1 X74.812 Y60.502 E2.3257
G1 X158.095 Y60.502 E2.38539
G1 X158.095 Y183.285 E3.51675
G1 X114.443 Y183.285 E1.25028
G1 X107.358 Y141.789 E1.20572
G1 X107.007 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.413 Y142.1 E.86581
G1 X74.413 Y60.104 E2.17814
G1 X158.493 Y60.104 E2.23351
G1 X158.493 Y183.684 E3.28279
G1 X114.106 Y183.684 E1.1791
G1 X107.017 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.017 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.957 Y143.197 Z12.64 F30000
G1 Z12.24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.679 Y141.566 E.04738
G1 X108.994 Y142.882 E.05329
G1 X108.558 Y140.328 E.07421
G1 X107.539 Y141.347 E.04128
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.165 Y140.243 E.04475
G1 X75.165 Y134.734 E.15777
G1 X76.241 Y133.659 E.04356
G1 X76.241 Y133.521 E.00395
G1 X75.165 Y132.445 E.04356
G1 X75.165 Y126.937 E.15777
G1 X76.241 Y125.861 E.04356
G1 X76.241 Y125.723 E.00395
G1 X75.165 Y124.648 E.04356
G1 X75.165 Y119.14 E.15777
G1 X76.241 Y118.064 E.04356
G1 X76.241 Y117.926 E.00395
G1 X75.165 Y116.851 E.04356
G1 X75.165 Y111.342 E.15777
G1 X76.241 Y110.267 E.04356
G1 X76.241 Y110.129 E.00395
G1 X75.165 Y109.053 E.04356
G1 X75.165 Y103.545 E.15777
G1 X76.241 Y102.469 E.04356
G1 X76.241 Y102.331 E.00395
G1 X75.165 Y101.256 E.04356
G1 X75.165 Y95.748 E.15777
G1 X76.241 Y94.672 E.04356
G1 X76.241 Y94.534 E.00395
G1 X75.165 Y93.458 E.04356
G1 X75.165 Y87.95 E.15777
G1 X76.241 Y86.875 E.04356
G1 X76.241 Y86.737 E.00395
G1 X75.165 Y85.661 E.04356
G1 X75.165 Y80.153 E.15777
G1 X76.241 Y79.077 E.04356
G1 X76.241 Y78.939 E.00395
G1 X75.165 Y77.864 E.04356
G1 X75.165 Y72.355 E.15777
G1 X76.241 Y71.28 E.04356
G1 X76.241 Y71.142 E.00395
G1 X75.165 Y70.066 E.04356
G1 X75.165 Y64.558 E.15777
G1 X76.241 Y63.483 E.04356
G1 X76.241 Y63.345 E.00395
G1 X75.165 Y62.269 E.04356
G1 X75.165 Y60.856 E.04047
G1 X75.407 Y60.856 E.0069
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.741 Y60.856 E.02577
G1 X157.741 Y61.61 E.0216
G1 X156.666 Y64.141 F30000
G1 F16200
G1 X156.666 Y65.795 E.04738
G1 X157.741 Y66.871 E.04356
G1 X157.741 Y67.754 E.02528
G1 X156.666 Y68.829 E.04356
G1 X156.666 Y73.593 E.13644
G1 X157.741 Y74.668 E.04356
G1 X157.741 Y75.551 E.02528
G1 X156.666 Y76.626 E.04356
G1 X156.666 Y81.39 E.13644
G1 X157.741 Y82.466 E.04356
G1 X157.741 Y83.348 E.02528
G1 X156.666 Y84.424 E.04356
G1 X156.666 Y89.188 E.13644
G1 X157.741 Y90.263 E.04356
G1 X157.741 Y91.146 E.02528
G1 X156.666 Y92.221 E.04356
G1 X156.666 Y96.985 E.13644
G1 X157.741 Y98.06 E.04356
G1 X157.741 Y98.943 E.02528
G1 X156.666 Y100.018 E.04356
G1 X156.666 Y104.782 E.13644
G1 X157.741 Y105.858 E.04356
G1 X157.741 Y106.74 E.02528
G1 X156.666 Y107.816 E.04356
G1 X156.666 Y112.58 E.13644
G1 X157.741 Y113.655 E.04356
G1 X157.741 Y114.538 E.02528
G1 X156.666 Y115.613 E.04356
G1 X156.666 Y120.377 E.13644
G1 X157.741 Y121.452 E.04356
G1 X157.741 Y122.335 E.02528
G1 X156.666 Y123.411 E.04356
G1 X156.666 Y128.174 E.13644
G1 X157.741 Y129.25 E.04356
G1 X157.741 Y130.132 E.02528
G1 X156.666 Y131.208 E.04356
G1 X156.666 Y135.972 E.13644
G1 X157.741 Y137.047 E.04356
G1 X157.741 Y137.93 E.02528
G1 X156.666 Y139.005 E.04356
G1 X156.666 Y143.769 E.13644
G1 X157.741 Y144.845 E.04356
G1 X157.741 Y145.727 E.02528
G1 X156.666 Y146.803 E.04356
G1 X156.666 Y151.566 E.13644
G1 X157.741 Y152.642 E.04356
G1 X157.741 Y153.525 E.02528
G1 X156.666 Y154.6 E.04356
G1 X156.666 Y159.364 E.13644
G1 X157.741 Y160.439 E.04356
G1 X157.741 Y161.322 E.02528
G1 X156.666 Y162.397 E.04356
G1 X156.666 Y167.161 E.13644
G1 X157.741 Y168.237 E.04356
G1 X157.741 Y169.119 E.02528
G1 X156.666 Y170.195 E.04356
G1 X156.666 Y174.959 E.13644
G1 X157.741 Y176.034 E.04356
G1 X157.741 Y176.917 E.02528
G1 X156.666 Y177.992 E.04356
G1 X156.666 Y179.646 E.04738
G1 X157.741 Y182.177 F30000
G1 F16200
G1 X157.741 Y182.932 E.0216
G1 X156.841 Y182.932 E.02577
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.728 Y182.852 F30000
G1 F16200
G1 X114.449 Y181.222 E.04738
G1 X115.381 Y180.29 E.03775
G1 X115.416 Y180.493 E.00591
G1 X114.1 Y179.177 E.05329
G1 X113.312 Y174.561 E.13412
G1 X114.244 Y173.629 E.03775
G1 X113.81 Y171.09 E.07378
G1 X112.495 Y169.775 E.05329
G1 X112.175 Y167.901 E.05444
G1 X113.107 Y166.969 E.03775
G1 X112.205 Y161.688 E.15347
G1 X110.889 Y160.372 E.05329
G1 X111.038 Y161.241 E.02525
G1 X111.97 Y160.309 E.03775
G1 X111.691 Y158.678 E.04738
G1 X109.974 Y148.619 F30000
G1 F16200
G1 X109.695 Y146.988 E.04738
G1 X108.764 Y147.92 E.03775
G1 X109.284 Y150.969 E.08859
G1 X110.6 Y152.285 E.05329
G1 X110.833 Y153.649 E.03963
G1 X109.901 Y154.581 E.03775
G1 X110.179 Y156.211 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 12.41
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.901 Y154.581 E-.62855
G1 X110.145 Y154.336 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 73/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z12.64 I1.145 J-.412 P1  F30000
G1 X76.993 Y62.285 Z12.64
G1 Z12.41
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.312 Y62.285 E2.27184
G1 X156.312 Y181.502 E3.41461
G1 X115.947 Y181.502 E1.15613
G1 X108.847 Y139.918 E1.20829
G1 X76.595 Y139.918 E.92378
G1 X76.595 Y62.285 E2.22356
G1 X76.933 Y62.285 E.0097
G1 X76.993 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.913 Y62.684 E2.09644
G1 X155.913 Y181.104 E3.14572
G1 X116.283 Y181.104 E1.05274
G1 X109.184 Y139.52 E1.12063
G1 X76.993 Y139.52 E.8551
G1 X76.993 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.993 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.572 Y69.926 Z12.81 F30000
G1 X107.348 Y141.73 Z12.81
G1 Z12.41
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.343 Y141.701 E.00085
G1 X74.812 Y141.701 E.93176
G1 X74.812 Y60.502 E2.3257
G1 X158.095 Y60.502 E2.38539
G1 X158.095 Y183.285 E3.51675
G1 X114.443 Y183.285 E1.25028
G1 X107.358 Y141.789 E1.20572
G1 X107.007 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.413 Y142.1 E.86581
G1 X74.413 Y60.104 E2.17814
G1 X158.493 Y60.104 E2.23351
G1 X158.493 Y183.684 E3.28279
G1 X114.107 Y183.684 E1.1791
G1 X107.017 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.017 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.648 Y149.32 Z12.81 F30000
G1 X110.179 Y156.211 Z12.81
G1 Z12.41
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.901 Y154.581 E.04738
G1 X110.833 Y153.649 E.03775
G1 X110.6 Y152.285 E.03962
G1 X109.284 Y150.969 E.05329
G1 X108.764 Y147.92 E.08859
G1 X109.696 Y146.988 E.03775
G1 X109.974 Y148.619 E.04738
G1 X111.691 Y158.678 F30000
G1 F16200
G1 X111.97 Y160.309 E.04738
G1 X111.038 Y161.241 E.03775
G1 X110.89 Y160.372 E.02524
G1 X112.205 Y161.688 E.05329
G1 X113.107 Y166.969 E.15346
G1 X112.175 Y167.901 E.03775
G1 X112.495 Y169.775 E.05444
G1 X113.811 Y171.09 E.05329
G1 X114.244 Y173.629 E.07377
G1 X113.312 Y174.561 E.03775
G1 X114.1 Y179.177 E.13413
G1 X115.416 Y180.493 E.05329
G1 X115.381 Y180.29 E.00591
G1 X114.449 Y181.222 E.03775
G1 X114.728 Y182.852 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.741 Y182.932 E.02578
G1 X157.741 Y182.177 E.0216
G1 X156.666 Y179.646 F30000
G1 F16200
G1 X156.666 Y177.992 E.04738
G1 X157.741 Y176.916 E.04356
G1 X157.741 Y176.034 E.02527
G1 X156.666 Y174.959 E.04356
G1 X156.666 Y170.195 E.13645
G1 X157.741 Y169.119 E.04356
G1 X157.741 Y168.237 E.02527
G1 X156.666 Y167.161 E.04356
G1 X156.666 Y162.397 E.13645
G1 X157.741 Y161.322 E.04356
G1 X157.741 Y160.439 E.02527
G1 X156.666 Y159.364 E.04356
G1 X156.666 Y154.6 E.13645
G1 X157.741 Y153.524 E.04356
G1 X157.741 Y152.642 E.02527
G1 X156.666 Y151.567 E.04356
G1 X156.666 Y146.803 E.13645
G1 X157.741 Y145.727 E.04356
G1 X157.741 Y144.845 E.02527
G1 X156.666 Y143.769 E.04356
G1 X156.666 Y139.005 E.13645
G1 X157.741 Y137.93 E.04356
G1 X157.741 Y137.047 E.02527
G1 X156.666 Y135.972 E.04356
G1 X156.666 Y131.208 E.13645
G1 X157.741 Y130.132 E.04356
G1 X157.741 Y129.25 E.02527
G1 X156.666 Y128.174 E.04356
G1 X156.666 Y123.41 E.13645
G1 X157.741 Y122.335 E.04356
G1 X157.741 Y121.453 E.02527
G1 X156.666 Y120.377 E.04356
G1 X156.666 Y115.613 E.13645
G1 X157.741 Y114.538 E.04356
G1 X157.741 Y113.655 E.02527
G1 X156.666 Y112.58 E.04356
G1 X156.666 Y107.816 E.13645
G1 X157.741 Y106.74 E.04356
G1 X157.741 Y105.858 E.02527
G1 X156.666 Y104.782 E.04356
G1 X156.666 Y100.018 E.13645
G1 X157.741 Y98.943 E.04356
G1 X157.741 Y98.061 E.02527
G1 X156.666 Y96.985 E.04356
G1 X156.666 Y92.221 E.13645
G1 X157.741 Y91.145 E.04356
G1 X157.741 Y90.263 E.02527
G1 X156.666 Y89.188 E.04356
G1 X156.666 Y84.424 E.13645
G1 X157.741 Y83.348 E.04356
G1 X157.741 Y82.466 E.02527
G1 X156.666 Y81.39 E.04356
G1 X156.666 Y76.626 E.13645
G1 X157.741 Y75.551 E.04356
G1 X157.741 Y74.668 E.02527
G1 X156.666 Y73.593 E.04356
G1 X156.666 Y68.829 E.13645
G1 X157.741 Y67.753 E.04356
G1 X157.741 Y66.871 E.02527
G1 X156.666 Y65.796 E.04356
G1 X156.666 Y64.142 E.04738
G1 X157.741 Y61.61 F30000
G1 F16200
G1 X157.741 Y60.856 E.0216
G1 X156.841 Y60.856 E.02578
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.166 Y60.856 E.0069
G1 X75.166 Y62.269 E.04048
G1 X76.241 Y63.345 E.04356
G1 X76.241 Y63.482 E.00395
G1 X75.166 Y64.558 E.04356
G1 X75.166 Y70.067 E.15778
G1 X76.241 Y71.142 E.04356
G1 X76.241 Y71.28 E.00395
G1 X75.166 Y72.355 E.04356
G1 X75.166 Y77.864 E.15778
G1 X76.241 Y78.939 E.04356
G1 X76.241 Y79.077 E.00395
G1 X75.166 Y80.153 E.04356
G1 X75.166 Y85.661 E.15778
G1 X76.241 Y86.737 E.04356
G1 X76.241 Y86.875 E.00395
G1 X75.166 Y87.95 E.04356
G1 X75.166 Y93.459 E.15778
G1 X76.241 Y94.534 E.04356
G1 X76.241 Y94.672 E.00395
G1 X75.166 Y95.747 E.04356
G1 X75.166 Y101.256 E.15778
G1 X76.241 Y102.331 E.04356
G1 X76.241 Y102.469 E.00395
G1 X75.166 Y103.545 E.04356
G1 X75.166 Y109.053 E.15778
G1 X76.241 Y110.129 E.04356
G1 X76.241 Y110.267 E.00395
G1 X75.166 Y111.342 E.04356
G1 X75.166 Y116.851 E.15778
G1 X76.241 Y117.926 E.04356
G1 X76.241 Y118.064 E.00395
G1 X75.166 Y119.139 E.04356
G1 X75.166 Y124.648 E.15778
G1 X76.241 Y125.724 E.04356
G1 X76.241 Y125.861 E.00395
G1 X75.166 Y126.937 E.04356
G1 X75.166 Y132.445 E.15778
G1 X76.241 Y133.521 E.04356
G1 X76.241 Y133.659 E.00395
G1 X75.166 Y134.734 E.04356
G1 X75.166 Y140.243 E.15778
G1 X76.27 Y141.347 E.04474
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.559 Y140.328 E.04129
G1 X108.995 Y142.882 E.07422
G1 X107.679 Y141.567 E.05329
G1 X107.957 Y143.197 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 12.58
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.679 Y141.567 E-.62855
G1 X107.924 Y141.811 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 74/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z12.81 I1.134 J-.441 P1  F30000
G1 X76.994 Y62.285 Z12.81
G1 Z12.58
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.312 Y62.285 E2.27184
G1 X156.312 Y181.502 E3.41461
G1 X115.947 Y181.502 E1.15613
G1 X108.848 Y139.918 E1.20829
G1 X76.595 Y139.918 E.92378
G1 X76.595 Y62.285 E2.22356
G1 X76.934 Y62.285 E.0097
G1 X76.994 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.914 Y62.684 E2.09644
G1 X155.914 Y181.104 E3.14572
G1 X116.283 Y181.104 E1.05274
G1 X109.184 Y139.52 E1.12063
G1 X76.994 Y139.52 E.8551
G1 X76.994 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.994 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.572 Y69.926 Z12.98 F30000
G1 X107.348 Y141.73 Z12.98
G1 Z12.58
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.343 Y141.701 E.00085
G1 X74.812 Y141.701 E.93176
G1 X74.812 Y60.502 E2.3257
G1 X158.095 Y60.502 E2.38539
G1 X158.095 Y183.285 E3.51675
G1 X114.443 Y183.285 E1.25028
G1 X107.358 Y141.789 E1.20572
G1 X107.007 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.414 Y142.1 E.86581
G1 X74.414 Y60.104 E2.17814
G1 X158.494 Y60.104 E2.23351
G1 X158.494 Y183.684 E3.28279
G1 X114.107 Y183.684 E1.1791
G1 X107.017 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.017 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.957 Y143.197 Z12.98 F30000
G1 Z12.58
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.679 Y141.567 E.04738
G1 X108.995 Y142.882 E.05329
G1 X108.559 Y140.328 E.07422
G1 X107.539 Y141.347 E.04129
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
M73 P92 R5
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.166 Y140.243 E.04474
G1 X75.166 Y134.734 E.15779
G1 X76.241 Y133.659 E.04356
G1 X76.241 Y133.521 E.00394
G1 X75.166 Y132.446 E.04356
G1 X75.166 Y126.937 E.15779
G1 X76.241 Y125.861 E.04356
G1 X76.241 Y125.724 E.00394
G1 X75.166 Y124.648 E.04356
G1 X75.166 Y119.139 E.15779
G1 X76.241 Y118.064 E.04356
G1 X76.241 Y117.926 E.00394
G1 X75.166 Y116.851 E.04356
G1 X75.166 Y111.342 E.15779
G1 X76.241 Y110.266 E.04356
G1 X76.241 Y110.129 E.00394
G1 X75.166 Y109.054 E.04356
G1 X75.166 Y103.545 E.15779
G1 X76.241 Y102.469 E.04356
G1 X76.241 Y102.332 E.00394
G1 X75.166 Y101.256 E.04356
M73 P92 R4
G1 X75.166 Y95.747 E.15779
G1 X76.241 Y94.672 E.04356
G1 X76.241 Y94.534 E.00394
G1 X75.166 Y93.459 E.04356
G1 X75.166 Y87.95 E.15779
G1 X76.241 Y86.874 E.04356
G1 X76.241 Y86.737 E.00394
G1 X75.166 Y85.661 E.04356
G1 X75.166 Y80.152 E.15779
G1 X76.241 Y79.077 E.04356
G1 X76.241 Y78.94 E.00394
G1 X75.166 Y77.864 E.04356
G1 X75.166 Y72.355 E.15779
G1 X76.241 Y71.28 E.04356
G1 X76.241 Y71.142 E.00394
G1 X75.166 Y70.067 E.04356
G1 X75.166 Y64.558 E.15779
G1 X76.241 Y63.482 E.04356
G1 X76.241 Y63.345 E.00394
G1 X75.166 Y62.269 E.04356
G1 X75.166 Y60.856 E.04048
G1 X75.407 Y60.856 E.0069
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.741 Y60.856 E.02578
G1 X157.741 Y61.61 E.02159
G1 X156.666 Y64.142 F30000
G1 F16200
G1 X156.666 Y65.796 E.04738
G1 X157.741 Y66.871 E.04356
G1 X157.741 Y67.753 E.02526
G1 X156.666 Y68.829 E.04356
G1 X156.666 Y73.593 E.13646
G1 X157.741 Y74.669 E.04356
G1 X157.741 Y75.551 E.02526
G1 X156.666 Y76.626 E.04356
G1 X156.666 Y81.39 E.13646
G1 X157.741 Y82.466 E.04356
G1 X157.741 Y83.348 E.02526
G1 X156.666 Y84.423 E.04356
G1 X156.666 Y89.188 E.13646
G1 X157.741 Y90.263 E.04356
G1 X157.741 Y91.145 E.02526
G1 X156.666 Y92.221 E.04356
G1 X156.666 Y96.985 E.13646
G1 X157.741 Y98.061 E.04356
G1 X157.741 Y98.943 E.02526
G1 X156.666 Y100.018 E.04356
G1 X156.666 Y104.783 E.13646
G1 X157.741 Y105.858 E.04356
G1 X157.741 Y106.74 E.02526
G1 X156.666 Y107.816 E.04356
G1 X156.666 Y112.58 E.13646
G1 X157.741 Y113.655 E.04356
G1 X157.741 Y114.537 E.02526
G1 X156.666 Y115.613 E.04356
G1 X156.666 Y120.377 E.13646
G1 X157.741 Y121.453 E.04356
G1 X157.741 Y122.335 E.02526
G1 X156.666 Y123.41 E.04356
G1 X156.666 Y128.175 E.13646
G1 X157.741 Y129.25 E.04356
G1 X157.741 Y130.132 E.02526
G1 X156.666 Y131.208 E.04356
G1 X156.666 Y135.972 E.13646
G1 X157.741 Y137.047 E.04356
G1 X157.741 Y137.93 E.02526
G1 X156.666 Y139.005 E.04356
G1 X156.666 Y143.769 E.13646
G1 X157.741 Y144.845 E.04356
G1 X157.741 Y145.727 E.02526
G1 X156.666 Y146.802 E.04356
G1 X156.666 Y151.567 E.13646
G1 X157.741 Y152.642 E.04356
G1 X157.741 Y153.524 E.02526
G1 X156.666 Y154.6 E.04356
G1 X156.666 Y159.364 E.13646
G1 X157.741 Y160.44 E.04356
G1 X157.741 Y161.322 E.02526
G1 X156.666 Y162.397 E.04356
G1 X156.666 Y167.161 E.13646
G1 X157.741 Y168.237 E.04356
G1 X157.741 Y169.119 E.02526
G1 X156.666 Y170.194 E.04356
G1 X156.666 Y174.959 E.13646
G1 X157.741 Y176.034 E.04356
G1 X157.741 Y176.916 E.02526
G1 X156.666 Y177.992 E.04356
G1 X156.666 Y179.646 E.04738
G1 X157.741 Y182.178 F30000
G1 F16200
G1 X157.741 Y182.932 E.02159
G1 X156.841 Y182.932 E.02578
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.728 Y182.852 F30000
G1 F16200
G1 X114.449 Y181.221 E.04738
G1 X115.381 Y180.289 E.03775
G1 X115.416 Y180.493 E.00592
G1 X114.1 Y179.178 E.05329
G1 X113.312 Y174.561 E.13414
G1 X114.244 Y173.629 E.03775
G1 X113.811 Y171.091 E.07376
G1 X112.495 Y169.775 E.05329
G1 X112.175 Y167.901 E.05445
G1 X113.107 Y166.969 E.03775
G1 X112.205 Y161.688 E.15345
G1 X110.89 Y160.372 E.05329
G1 X111.038 Y161.241 E.02523
G1 X111.97 Y160.309 E.03775
G1 X111.692 Y158.678 E.04738
G1 X109.974 Y148.619 F30000
G1 F16200
G1 X109.696 Y146.988 E.04738
G1 X108.764 Y147.92 E.03775
G1 X109.284 Y150.97 E.0886
G1 X110.6 Y152.285 E.05329
G1 X110.833 Y153.648 E.03961
G1 X109.901 Y154.58 E.03775
G1 X110.179 Y156.211 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 12.75
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.901 Y154.58 E-.62855
G1 X110.146 Y154.336 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 75/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z12.98 I1.145 J-.412 P1  F30000
G1 X76.994 Y62.285 Z12.98
G1 Z12.75
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.312 Y62.285 E2.27184
G1 X156.312 Y181.502 E3.41461
G1 X115.947 Y181.502 E1.15613
G1 X108.848 Y139.918 E1.20829
G1 X76.595 Y139.918 E.92378
G1 X76.595 Y62.285 E2.22356
G1 X76.934 Y62.285 E.0097
G1 X76.994 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.914 Y62.684 E2.09644
G1 X155.914 Y181.104 E3.14572
G1 X116.284 Y181.104 E1.05274
G1 X109.184 Y139.52 E1.12063
G1 X76.994 Y139.52 E.8551
G1 X76.994 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.994 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.572 Y69.926 Z13.15 F30000
G1 X107.348 Y141.73 Z13.15
G1 Z12.75
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.343 Y141.701 E.00085
G1 X74.812 Y141.701 E.93176
G1 X74.812 Y60.502 E2.3257
G1 X158.095 Y60.502 E2.38539
G1 X158.095 Y183.285 E3.51675
G1 X114.443 Y183.285 E1.25028
G1 X107.358 Y141.789 E1.20572
G1 X107.007 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.414 Y142.1 E.86581
G1 X74.414 Y60.104 E2.17814
G1 X158.494 Y60.104 E2.23351
G1 X158.494 Y183.684 E3.28279
G1 X114.107 Y183.684 E1.1791
G1 X107.017 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.017 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.648 Y149.32 Z13.15 F30000
G1 X110.179 Y156.211 Z13.15
G1 Z12.75
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.901 Y154.58 E.04738
G1 X110.833 Y153.648 E.03775
G1 X110.6 Y152.285 E.0396
G1 X109.285 Y150.97 E.05329
G1 X108.764 Y147.92 E.08861
G1 X109.696 Y146.988 E.03775
G1 X109.974 Y148.619 E.04738
G1 X111.692 Y158.678 F30000
G1 F16200
G1 X111.97 Y160.309 E.04738
G1 X111.038 Y161.241 E.03775
G1 X110.89 Y160.372 E.02522
G1 X112.206 Y161.688 E.05329
G1 X113.107 Y166.969 E.15344
G1 X112.175 Y167.901 E.03775
G1 X112.495 Y169.775 E.05446
G1 X113.811 Y171.091 E.05329
G1 X114.244 Y173.629 E.07375
G1 X113.312 Y174.561 E.03775
G1 X114.101 Y179.178 E.13415
G1 X115.416 Y180.493 E.05329
G1 X115.381 Y180.289 E.00593
G1 X114.45 Y181.221 E.03775
G1 X114.728 Y182.852 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.741 Y182.932 E.02579
G1 X157.741 Y182.178 E.02159
G1 X156.666 Y179.646 F30000
G1 F16200
G1 X156.666 Y177.992 E.04738
G1 X157.741 Y176.916 E.04356
G1 X157.741 Y176.034 E.02525
G1 X156.666 Y174.959 E.04356
G1 X156.666 Y170.194 E.13647
G1 X157.741 Y169.119 E.04356
G1 X157.741 Y168.237 E.02525
G1 X156.666 Y167.162 E.04356
G1 X156.666 Y162.397 E.13647
G1 X157.741 Y161.321 E.04356
G1 X157.741 Y160.44 E.02525
G1 X156.666 Y159.364 E.04356
G1 X156.666 Y154.6 E.13647
G1 X157.741 Y153.524 E.04356
G1 X157.741 Y152.642 E.02525
G1 X156.666 Y151.567 E.04356
G1 X156.666 Y146.802 E.13647
G1 X157.741 Y145.727 E.04356
G1 X157.741 Y144.845 E.02525
G1 X156.666 Y143.77 E.04356
G1 X156.666 Y139.005 E.13647
G1 X157.741 Y137.929 E.04356
G1 X157.741 Y137.048 E.02525
G1 X156.666 Y135.972 E.04356
G1 X156.666 Y131.207 E.13647
G1 X157.741 Y130.132 E.04356
G1 X157.741 Y129.25 E.02525
G1 X156.666 Y128.175 E.04356
G1 X156.666 Y123.41 E.13647
G1 X157.741 Y122.335 E.04356
G1 X157.741 Y121.453 E.02525
G1 X156.666 Y120.377 E.04356
G1 X156.666 Y115.613 E.13647
G1 X157.741 Y114.537 E.04356
G1 X157.741 Y113.656 E.02525
G1 X156.666 Y112.58 E.04356
G1 X156.666 Y107.815 E.13647
G1 X157.741 Y106.74 E.04356
G1 X157.741 Y105.858 E.02525
G1 X156.666 Y104.783 E.04356
G1 X156.666 Y100.018 E.13647
G1 X157.741 Y98.943 E.04356
G1 X157.741 Y98.061 E.02525
G1 X156.666 Y96.985 E.04356
G1 X156.666 Y92.221 E.13647
G1 X157.741 Y91.145 E.04356
G1 X157.741 Y90.263 E.02525
G1 X156.666 Y89.188 E.04356
G1 X156.666 Y84.423 E.13647
G1 X157.741 Y83.348 E.04356
G1 X157.741 Y82.466 E.02525
G1 X156.666 Y81.391 E.04356
G1 X156.666 Y76.626 E.13647
G1 X157.741 Y75.55 E.04356
G1 X157.741 Y74.669 E.02525
G1 X156.666 Y73.593 E.04356
G1 X156.666 Y68.829 E.13647
G1 X157.741 Y67.753 E.04356
G1 X157.741 Y66.871 E.02525
G1 X156.666 Y65.796 E.04356
G1 X156.666 Y64.142 E.04738
G1 X157.741 Y61.61 F30000
G1 F16200
G1 X157.741 Y60.856 E.02159
G1 X156.841 Y60.856 E.02579
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.166 Y60.856 E.00689
G1 X75.166 Y62.269 E.04048
G1 X76.241 Y63.345 E.04356
G1 X76.241 Y63.482 E.00393
G1 X75.166 Y64.558 E.04356
G1 X75.166 Y70.067 E.15779
G1 X76.241 Y71.142 E.04356
G1 X76.241 Y71.28 E.00393
G1 X75.166 Y72.355 E.04356
G1 X75.166 Y77.864 E.15779
G1 X76.241 Y78.94 E.04356
G1 X76.241 Y79.077 E.00393
G1 X75.166 Y80.152 E.04356
G1 X75.166 Y85.662 E.15779
G1 X76.241 Y86.737 E.04356
G1 X76.241 Y86.874 E.00393
G1 X75.166 Y87.95 E.04356
G1 X75.166 Y93.459 E.15779
G1 X76.241 Y94.534 E.04356
G1 X76.241 Y94.672 E.00393
G1 X75.166 Y95.747 E.04356
G1 X75.166 Y101.256 E.15779
G1 X76.241 Y102.332 E.04356
G1 X76.241 Y102.469 E.00393
G1 X75.166 Y103.544 E.04356
G1 X75.166 Y109.054 E.15779
G1 X76.241 Y110.129 E.04356
G1 X76.241 Y110.266 E.00393
G1 X75.166 Y111.342 E.04356
G1 X75.166 Y116.851 E.15779
G1 X76.241 Y117.927 E.04356
G1 X76.241 Y118.064 E.00393
G1 X75.166 Y119.139 E.04356
G1 X75.166 Y124.648 E.15779
G1 X76.241 Y125.724 E.04356
G1 X76.241 Y125.861 E.00393
G1 X75.166 Y126.937 E.04356
G1 X75.166 Y132.446 E.15779
G1 X76.241 Y133.521 E.04356
G1 X76.241 Y133.658 E.00393
G1 X75.166 Y134.734 E.04356
G1 X75.166 Y140.243 E.15779
G1 X76.27 Y141.347 E.04473
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.559 Y140.328 E.0413
G1 X108.995 Y142.883 E.07423
G1 X107.679 Y141.567 E.05329
G1 X107.958 Y143.197 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 12.92
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.679 Y141.567 E-.62855
G1 X107.924 Y141.812 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 76/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z13.15 I1.134 J-.441 P1  F30000
G1 X76.994 Y62.285 Z13.15
G1 Z12.92
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.312 Y62.285 E2.27184
G1 X156.312 Y181.502 E3.41461
G1 X115.948 Y181.502 E1.15613
G1 X108.848 Y139.918 E1.20829
G1 X76.595 Y139.918 E.92378
G1 X76.595 Y62.285 E2.22356
G1 X76.934 Y62.285 E.0097
G1 X76.994 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.914 Y62.684 E2.09644
G1 X155.914 Y181.104 E3.14572
G1 X116.284 Y181.104 E1.05274
G1 X109.184 Y139.52 E1.12063
G1 X76.994 Y139.52 E.8551
G1 X76.994 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.994 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.573 Y69.926 Z13.32 F30000
G1 X107.348 Y141.73 Z13.32
G1 Z12.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.343 Y141.701 E.00085
G1 X74.812 Y141.701 E.93176
G1 X74.812 Y60.502 E2.3257
G1 X158.095 Y60.502 E2.38539
G1 X158.095 Y183.285 E3.51675
G1 X114.443 Y183.285 E1.25028
G1 X107.359 Y141.789 E1.20572
G1 X107.007 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.414 Y142.1 E.86581
G1 X74.414 Y60.104 E2.17814
G1 X158.494 Y60.104 E2.23351
G1 X158.494 Y183.684 E3.28279
G1 X114.107 Y183.684 E1.1791
G1 X107.017 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.017 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.958 Y143.198 Z13.32 F30000
G1 Z12.92
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.679 Y141.567 E.04738
G1 X108.995 Y142.883 E.05329
G1 X108.559 Y140.328 E.07424
G1 X107.539 Y141.347 E.0413
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.166 Y140.243 E.04472
G1 X75.166 Y134.734 E.1578
G1 X76.242 Y133.658 E.04356
G1 X76.242 Y133.521 E.00392
G1 X75.166 Y132.446 E.04356
G1 X75.166 Y126.936 E.1578
G1 X76.242 Y125.861 E.04356
G1 X76.242 Y125.724 E.00392
G1 X75.166 Y124.649 E.04356
G1 X75.166 Y119.139 E.1578
G1 X76.242 Y118.064 E.04356
G1 X76.242 Y117.927 E.00392
G1 X75.166 Y116.851 E.04356
G1 X75.166 Y111.342 E.1578
G1 X76.242 Y110.266 E.04356
G1 X76.242 Y110.129 E.00392
G1 X75.166 Y109.054 E.04356
G1 X75.166 Y103.544 E.1578
G1 X76.242 Y102.469 E.04356
G1 X76.242 Y102.332 E.00392
G1 X75.166 Y101.256 E.04356
G1 X75.166 Y95.747 E.1578
G1 X76.242 Y94.671 E.04356
G1 X76.242 Y94.535 E.00392
G1 X75.166 Y93.459 E.04356
G1 X75.166 Y87.95 E.1578
G1 X76.242 Y86.874 E.04356
G1 X76.242 Y86.737 E.00392
G1 X75.166 Y85.662 E.04356
G1 X75.166 Y80.152 E.1578
G1 X76.242 Y79.077 E.04356
G1 X76.242 Y78.94 E.00392
G1 X75.166 Y77.864 E.04356
G1 X75.166 Y72.355 E.1578
G1 X76.242 Y71.279 E.04356
G1 X76.242 Y71.142 E.00392
G1 X75.166 Y70.067 E.04356
G1 X75.166 Y64.557 E.1578
G1 X76.242 Y63.482 E.04356
G1 X76.242 Y63.345 E.00392
G1 X75.166 Y62.27 E.04356
G1 X75.166 Y60.856 E.04049
G1 X75.407 Y60.856 E.00689
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.742 Y60.856 E.02579
G1 X157.742 Y61.61 E.02159
G1 X156.666 Y64.142 F30000
G1 F16200
G1 X156.666 Y65.796 E.04738
G1 X157.742 Y66.872 E.04356
G1 X157.742 Y67.753 E.02525
G1 X156.666 Y68.828 E.04356
G1 X156.666 Y73.593 E.13648
G1 X157.742 Y74.669 E.04356
G1 X157.742 Y75.55 E.02525
G1 X156.666 Y76.626 E.04356
G1 X156.666 Y81.391 E.13648
G1 X157.742 Y82.466 E.04356
G1 X157.742 Y83.348 E.02525
G1 X156.666 Y84.423 E.04356
G1 X156.666 Y89.188 E.13648
G1 X157.742 Y90.264 E.04356
G1 X157.742 Y91.145 E.02525
G1 X156.666 Y92.221 E.04356
G1 X156.666 Y96.985 E.13648
G1 X157.742 Y98.061 E.04356
G1 X157.742 Y98.942 E.02525
G1 X156.666 Y100.018 E.04356
G1 X156.666 Y104.783 E.13648
G1 X157.742 Y105.858 E.04356
G1 X157.742 Y106.74 E.02525
G1 X156.666 Y107.815 E.04356
G1 X156.666 Y112.58 E.13648
G1 X157.742 Y113.656 E.04356
G1 X157.742 Y114.537 E.02525
G1 X156.666 Y115.613 E.04356
G1 X156.666 Y120.378 E.13648
G1 X157.742 Y121.453 E.04356
G1 X157.742 Y122.334 E.02525
G1 X156.666 Y123.41 E.04356
G1 X156.666 Y128.175 E.13648
G1 X157.742 Y129.25 E.04356
G1 X157.742 Y130.132 E.02525
G1 X156.666 Y131.207 E.04356
G1 X156.666 Y135.972 E.13648
G1 X157.742 Y137.048 E.04356
G1 X157.742 Y137.929 E.02525
G1 X156.666 Y139.005 E.04356
G1 X156.666 Y143.77 E.13648
G1 X157.742 Y144.845 E.04356
G1 X157.742 Y145.727 E.02525
G1 X156.666 Y146.802 E.04356
G1 X156.666 Y151.567 E.13648
G1 X157.742 Y152.642 E.04356
G1 X157.742 Y153.524 E.02525
G1 X156.666 Y154.599 E.04356
G1 X156.666 Y159.364 E.13648
G1 X157.742 Y160.44 E.04356
G1 X157.742 Y161.321 E.02525
G1 X156.666 Y162.397 E.04356
G1 X156.666 Y167.162 E.13648
G1 X157.742 Y168.237 E.04356
G1 X157.742 Y169.119 E.02525
G1 X156.666 Y170.194 E.04356
G1 X156.666 Y174.959 E.13648
G1 X157.742 Y176.035 E.04356
G1 X157.742 Y176.916 E.02525
G1 X156.666 Y177.992 E.04356
G1 X156.666 Y179.646 E.04738
G1 X157.742 Y182.178 F30000
G1 F16200
G1 X157.742 Y182.932 E.02159
G1 X156.841 Y182.932 E.02579
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.728 Y182.852 F30000
G1 F16200
G1 X114.45 Y181.221 E.04738
G1 X115.382 Y180.289 E.03775
G1 X115.416 Y180.494 E.00594
G1 X114.101 Y179.178 E.05329
G1 X113.313 Y174.561 E.13416
G1 X114.244 Y173.629 E.03775
G1 X113.811 Y171.091 E.07375
G1 X112.495 Y169.775 E.05329
G1 X112.175 Y167.901 E.05447
G1 X113.107 Y166.969 E.03775
G1 X112.206 Y161.688 E.15343
G1 X110.89 Y160.373 E.05329
G1 X111.038 Y161.24 E.02522
G1 X111.97 Y160.308 E.03775
G1 X111.692 Y158.678 E.04738
G1 X109.974 Y148.618 F30000
G1 F16200
G1 X109.696 Y146.988 E.04738
G1 X108.764 Y147.92 E.03775
G1 X109.285 Y150.97 E.08862
G1 X110.6 Y152.286 E.05329
G1 X110.833 Y153.648 E.03959
G1 X109.901 Y154.58 E.03775
G1 X110.18 Y156.211 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 13.09
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.901 Y154.58 E-.62855
G1 X110.146 Y154.336 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 77/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z13.32 I1.145 J-.412 P1  F30000
G1 X76.994 Y62.285 Z13.32
G1 Z13.09
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.312 Y62.285 E2.27184
G1 X156.312 Y181.502 E3.41461
G1 X115.948 Y181.502 E1.15613
G1 X108.848 Y139.918 E1.20829
G1 X76.595 Y139.918 E.92378
G1 X76.595 Y62.285 E2.22356
G1 X76.934 Y62.285 E.0097
G1 X76.994 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.914 Y62.684 E2.09644
G1 X155.914 Y181.104 E3.14572
G1 X116.284 Y181.104 E1.05274
G1 X109.184 Y139.52 E1.12063
G1 X76.994 Y139.52 E.8551
G1 X76.994 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.994 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.573 Y69.926 Z13.49 F30000
G1 X107.349 Y141.73 Z13.49
G1 Z13.09
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.344 Y141.701 E.00085
G1 X74.812 Y141.701 E.93176
G1 X74.812 Y60.502 E2.3257
G1 X158.095 Y60.502 E2.38539
G1 X158.095 Y183.285 E3.51675
G1 X114.443 Y183.285 E1.25028
G1 X107.359 Y141.789 E1.20572
M73 P93 R4
G1 X107.007 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.414 Y142.1 E.86581
G1 X74.414 Y60.104 E2.17814
G1 X158.494 Y60.104 E2.23351
G1 X158.494 Y183.684 E3.28279
G1 X114.107 Y183.684 E1.1791
G1 X107.017 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.017 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.649 Y149.32 Z13.49 F30000
G1 X110.18 Y156.211 Z13.49
G1 Z13.09
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.901 Y154.58 E.04738
G1 X110.833 Y153.648 E.03775
G1 X110.601 Y152.286 E.03959
G1 X109.285 Y150.97 E.05329
G1 X108.764 Y147.92 E.08863
G1 X109.696 Y146.988 E.03775
G1 X109.974 Y148.618 E.04738
G1 X111.692 Y158.678 F30000
G1 F16200
G1 X111.97 Y160.308 E.04738
G1 X111.038 Y161.24 E.03775
G1 X110.89 Y160.373 E.02521
G1 X112.206 Y161.688 E.05329
G1 X113.107 Y166.969 E.15342
G1 X112.176 Y167.901 E.03775
G1 X112.496 Y169.775 E.05448
G1 X113.811 Y171.091 E.05329
G1 X114.245 Y173.629 E.07374
G1 X113.313 Y174.561 E.03775
G1 X114.101 Y179.178 E.13417
G1 X115.417 Y180.494 E.05329
G1 X115.382 Y180.289 E.00595
G1 X114.45 Y181.221 E.03775
G1 X114.728 Y182.851 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.742 Y182.932 E.02579
G1 X157.742 Y182.178 E.02158
G1 X156.666 Y179.645 F30000
G1 F16200
G1 X156.666 Y177.991 E.04738
G1 X157.742 Y176.916 E.04356
G1 X157.742 Y176.035 E.02524
G1 X156.666 Y174.959 E.04356
G1 X156.666 Y170.194 E.13649
G1 X157.742 Y169.119 E.04356
G1 X157.742 Y168.237 E.02524
G1 X156.666 Y167.162 E.04356
G1 X156.666 Y162.397 E.13649
G1 X157.742 Y161.321 E.04356
G1 X157.742 Y160.44 E.02524
G1 X156.666 Y159.365 E.04356
G1 X156.666 Y154.599 E.13649
G1 X157.742 Y153.524 E.04356
G1 X157.742 Y152.643 E.02524
G1 X156.666 Y151.567 E.04356
G1 X156.666 Y146.802 E.13649
G1 X157.742 Y145.726 E.04356
G1 X157.742 Y144.845 E.02524
G1 X156.666 Y143.77 E.04356
G1 X156.666 Y139.005 E.13649
G1 X157.742 Y137.929 E.04356
G1 X157.742 Y137.048 E.02524
G1 X156.666 Y135.972 E.04356
G1 X156.666 Y131.207 E.13649
G1 X157.742 Y130.132 E.04356
G1 X157.742 Y129.251 E.02524
G1 X156.666 Y128.175 E.04356
G1 X156.666 Y123.41 E.13649
G1 X157.742 Y122.334 E.04356
G1 X157.742 Y121.453 E.02524
G1 X156.666 Y120.378 E.04356
G1 X156.666 Y115.612 E.13649
G1 X157.742 Y114.537 E.04356
G1 X157.742 Y113.656 E.02524
G1 X156.666 Y112.58 E.04356
G1 X156.666 Y107.815 E.13649
G1 X157.742 Y106.74 E.04356
G1 X157.742 Y105.858 E.02524
G1 X156.666 Y104.783 E.04356
G1 X156.666 Y100.018 E.13649
G1 X157.742 Y98.942 E.04356
G1 X157.742 Y98.061 E.02524
G1 X156.666 Y96.986 E.04356
G1 X156.666 Y92.22 E.13649
G1 X157.742 Y91.145 E.04356
G1 X157.742 Y90.264 E.02524
G1 X156.666 Y89.188 E.04356
G1 X156.666 Y84.423 E.13649
G1 X157.742 Y83.348 E.04356
G1 X157.742 Y82.466 E.02524
G1 X156.666 Y81.391 E.04356
G1 X156.666 Y76.626 E.13649
G1 X157.742 Y75.55 E.04356
G1 X157.742 Y74.669 E.02524
G1 X156.666 Y73.594 E.04356
G1 X156.666 Y68.828 E.13649
G1 X157.742 Y67.753 E.04356
G1 X157.742 Y66.872 E.02524
G1 X156.666 Y65.796 E.04356
G1 X156.666 Y64.142 E.04738
G1 X157.742 Y61.61 F30000
G1 F16200
G1 X157.742 Y60.856 E.02158
G1 X156.841 Y60.856 E.02579
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.166 Y60.856 E.00688
G1 X75.166 Y62.27 E.04049
G1 X76.242 Y63.345 E.04356
G1 X76.242 Y63.482 E.00391
G1 X75.166 Y64.557 E.04356
G1 X75.166 Y70.067 E.15781
G1 X76.242 Y71.143 E.04356
G1 X76.242 Y71.279 E.00391
G1 X75.166 Y72.355 E.04356
G1 X75.166 Y77.864 E.15781
G1 X76.242 Y78.94 E.04356
G1 X76.242 Y79.077 E.00391
G1 X75.166 Y80.152 E.04356
G1 X75.166 Y85.662 E.15781
G1 X76.242 Y86.737 E.04356
G1 X76.242 Y86.874 E.00391
G1 X75.166 Y87.949 E.04356
G1 X75.166 Y93.459 E.15781
G1 X76.242 Y94.535 E.04356
G1 X76.242 Y94.671 E.00391
G1 X75.166 Y95.747 E.04356
G1 X75.166 Y101.257 E.15781
G1 X76.242 Y102.332 E.04356
G1 X76.242 Y102.469 E.00391
G1 X75.166 Y103.544 E.04356
G1 X75.166 Y109.054 E.15781
G1 X76.242 Y110.129 E.04356
G1 X76.242 Y110.266 E.00391
G1 X75.166 Y111.342 E.04356
G1 X75.166 Y116.851 E.15781
G1 X76.242 Y117.927 E.04356
G1 X76.242 Y118.063 E.00391
G1 X75.166 Y119.139 E.04356
G1 X75.166 Y124.649 E.15781
G1 X76.242 Y125.724 E.04356
G1 X76.242 Y125.861 E.00391
G1 X75.166 Y126.936 E.04356
G1 X75.166 Y132.446 E.15781
G1 X76.242 Y133.522 E.04356
G1 X76.242 Y133.658 E.00391
G1 X75.166 Y134.734 E.04356
G1 X75.166 Y140.243 E.15781
G1 X76.27 Y141.347 E.04472
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.559 Y140.328 E.04131
G1 X108.995 Y142.883 E.07425
G1 X107.68 Y141.567 E.05329
G1 X107.958 Y143.198 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 13.26
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.68 Y141.567 E-.62855
G1 X107.924 Y141.812 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 78/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z13.49 I1.134 J-.441 P1  F30000
G1 X76.994 Y62.285 Z13.49
G1 Z13.26
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.313 Y62.285 E2.27184
G1 X156.313 Y181.502 E3.41461
G1 X115.948 Y181.502 E1.15613
G1 X108.848 Y139.918 E1.20829
G1 X76.596 Y139.918 E.92378
G1 X76.596 Y62.285 E2.22356
G1 X76.934 Y62.285 E.0097
G1 X76.994 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.914 Y62.684 E2.09644
G1 X155.914 Y181.104 E3.14572
G1 X116.284 Y181.104 E1.05274
G1 X109.184 Y139.52 E1.12063
G1 X76.994 Y139.52 E.8551
G1 X76.994 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.994 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.571 Y69.927 Z13.66 F30000
G1 X107.314 Y141.701 Z13.66
G1 Z13.26
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.813 Y141.701 E.93091
G1 X74.813 Y60.502 E2.3257
G1 X158.096 Y60.502 E2.38539
G1 X158.096 Y183.285 E3.51675
G1 X114.443 Y183.285 E1.25028
G1 X107.349 Y141.731 E1.20742
G1 X107.007 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.414 Y142.1 E.86581
G1 X74.414 Y60.104 E2.17814
G1 X158.494 Y60.104 E2.23351
G1 X158.494 Y183.684 E3.28279
G1 X114.107 Y183.684 E1.1791
G1 X107.018 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.018 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.958 Y143.198 Z13.66 F30000
G1 Z13.26
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.68 Y141.568 E.04738
G1 X108.995 Y142.883 E.05329
G1 X108.559 Y140.327 E.07426
G1 X107.539 Y141.347 E.04131
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.166 Y140.244 E.04471
G1 X75.166 Y134.733 E.15782
G1 X76.242 Y133.658 E.04356
G1 X76.242 Y133.522 E.0039
G1 X75.166 Y132.446 E.04356
G1 X75.166 Y126.936 E.15782
G1 X76.242 Y125.861 E.04356
G1 X76.242 Y125.724 E.0039
G1 X75.166 Y124.649 E.04356
G1 X75.166 Y119.139 E.15782
G1 X76.242 Y118.063 E.04356
G1 X76.242 Y117.927 E.0039
G1 X75.166 Y116.851 E.04356
G1 X75.166 Y111.341 E.15782
G1 X76.242 Y110.266 E.04356
G1 X76.242 Y110.13 E.0039
G1 X75.166 Y109.054 E.04356
G1 X75.166 Y103.544 E.15782
G1 X76.242 Y102.469 E.04356
G1 X76.242 Y102.332 E.0039
G1 X75.166 Y101.257 E.04356
G1 X75.166 Y95.747 E.15782
G1 X76.242 Y94.671 E.04356
G1 X76.242 Y94.535 E.0039
G1 X75.166 Y93.459 E.04356
G1 X75.166 Y87.949 E.15782
G1 X76.242 Y86.874 E.04356
G1 X76.242 Y86.737 E.0039
G1 X75.166 Y85.662 E.04356
G1 X75.166 Y80.152 E.15782
G1 X76.242 Y79.076 E.04356
G1 X76.242 Y78.94 E.0039
G1 X75.166 Y77.865 E.04356
G1 X75.166 Y72.355 E.15782
G1 X76.242 Y71.279 E.04356
G1 X76.242 Y71.143 E.0039
G1 X75.166 Y70.067 E.04356
G1 X75.166 Y64.557 E.15782
G1 X76.242 Y63.482 E.04356
G1 X76.242 Y63.345 E.0039
G1 X75.166 Y62.27 E.04356
G1 X75.166 Y60.856 E.0405
G1 X75.407 Y60.856 E.00688
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.742 Y60.856 E.0258
G1 X157.742 Y61.609 E.02158
G1 X156.666 Y64.142 F30000
G1 F16200
G1 X156.666 Y65.796 E.04738
G1 X157.742 Y66.872 E.04356
G1 X157.742 Y67.753 E.02523
G1 X156.666 Y68.828 E.04356
G1 X156.666 Y73.594 E.13649
G1 X157.742 Y74.669 E.04356
G1 X157.742 Y75.55 E.02523
G1 X156.666 Y76.626 E.04356
G1 X156.666 Y81.391 E.13649
G1 X157.742 Y82.467 E.04356
G1 X157.742 Y83.347 E.02523
G1 X156.666 Y84.423 E.04356
G1 X156.666 Y89.188 E.13649
G1 X157.742 Y90.264 E.04356
G1 X157.742 Y91.145 E.02523
G1 X156.666 Y92.22 E.04356
G1 X156.666 Y96.986 E.13649
G1 X157.742 Y98.061 E.04356
G1 X157.742 Y98.942 E.02523
G1 X156.666 Y100.018 E.04356
G1 X156.666 Y104.783 E.13649
G1 X157.742 Y105.859 E.04356
G1 X157.742 Y106.739 E.02523
G1 X156.666 Y107.815 E.04356
G1 X156.666 Y112.58 E.13649
G1 X157.742 Y113.656 E.04356
G1 X157.742 Y114.537 E.02523
G1 X156.666 Y115.612 E.04356
G1 X156.666 Y120.378 E.13649
G1 X157.742 Y121.453 E.04356
G1 X157.742 Y122.334 E.02523
G1 X156.666 Y123.41 E.04356
G1 X156.666 Y128.175 E.13649
G1 X157.742 Y129.251 E.04356
G1 X157.742 Y130.132 E.02523
G1 X156.666 Y131.207 E.04356
G1 X156.666 Y135.973 E.13649
G1 X157.742 Y137.048 E.04356
G1 X157.742 Y137.929 E.02523
G1 X156.666 Y139.004 E.04356
G1 X156.666 Y143.77 E.13649
G1 X157.742 Y144.845 E.04356
G1 X157.742 Y145.726 E.02523
G1 X156.666 Y146.802 E.04356
G1 X156.666 Y151.567 E.13649
G1 X157.742 Y152.643 E.04356
G1 X157.742 Y153.524 E.02523
G1 X156.666 Y154.599 E.04356
G1 X156.666 Y159.365 E.13649
G1 X157.742 Y160.44 E.04356
G1 X157.742 Y161.321 E.02523
G1 X156.666 Y162.397 E.04356
G1 X156.666 Y167.162 E.13649
G1 X157.742 Y168.238 E.04356
G1 X157.742 Y169.118 E.02523
G1 X156.666 Y170.194 E.04356
G1 X156.666 Y174.959 E.13649
G1 X157.742 Y176.035 E.04356
G1 X157.742 Y176.916 E.02523
G1 X156.666 Y177.991 E.04356
G1 X156.666 Y179.645 E.04738
G1 X157.742 Y182.178 F30000
G1 F16200
G1 X157.742 Y182.932 E.02158
G1 X156.841 Y182.932 E.0258
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.728 Y182.851 F30000
G1 F16200
G1 X114.45 Y181.221 E.04738
G1 X115.382 Y180.289 E.03775
G1 X115.417 Y180.494 E.00596
G1 X114.101 Y179.178 E.05329
G1 X113.313 Y174.561 E.13417
G1 X114.245 Y173.629 E.03775
G1 X113.811 Y171.091 E.07373
G1 X112.496 Y169.776 E.05329
G1 X112.176 Y167.9 E.05449
G1 X113.108 Y166.968 E.03775
G1 X112.206 Y161.689 E.15341
G1 X110.89 Y160.373 E.05329
G1 X111.039 Y161.24 E.0252
G1 X111.97 Y160.308 E.03775
G1 X111.692 Y158.678 E.04738
G1 X109.975 Y148.618 F30000
G1 F16200
G1 X109.696 Y146.988 E.04738
M73 P93 R3
G1 X108.764 Y147.92 E.03775
G1 X109.285 Y150.97 E.08864
G1 X110.601 Y152.286 E.05329
G1 X110.833 Y153.648 E.03958
G1 X109.901 Y154.58 E.03775
G1 X110.18 Y156.21 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 13.43
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.901 Y154.58 E-.62855
G1 X110.146 Y154.335 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 79/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z13.66 I1.145 J-.412 P1  F30000
G1 X76.994 Y62.285 Z13.66
G1 Z13.43
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.313 Y62.285 E2.27184
G1 X156.313 Y181.502 E3.41461
G1 X115.948 Y181.502 E1.15613
G1 X108.848 Y139.918 E1.20829
G1 X76.596 Y139.918 E.92378
G1 X76.596 Y62.285 E2.22356
G1 X76.934 Y62.285 E.0097
G1 X76.994 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.914 Y62.684 E2.09644
G1 X155.914 Y181.104 E3.14572
G1 X116.284 Y181.104 E1.05274
G1 X109.184 Y139.52 E1.12063
G1 X76.994 Y139.52 E.8551
G1 X76.994 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.994 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.573 Y69.926 Z13.83 F30000
G1 X107.349 Y141.73 Z13.83
G1 Z13.43
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.344 Y141.701 E.00085
G1 X74.813 Y141.701 E.93176
G1 X74.813 Y60.502 E2.3257
G1 X158.096 Y60.502 E2.38539
G1 X158.096 Y183.285 E3.51675
G1 X114.444 Y183.285 E1.25028
G1 X107.359 Y141.789 E1.20572
G1 X107.008 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.414 Y142.1 E.86581
G1 X74.414 Y60.104 E2.17814
G1 X158.494 Y60.104 E2.23351
G1 X158.494 Y183.684 E3.28279
G1 X114.107 Y183.684 E1.1791
G1 X107.018 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.018 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.649 Y149.32 Z13.83 F30000
G1 X110.18 Y156.21 Z13.83
G1 Z13.43
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.902 Y154.58 E.04738
G1 X110.833 Y153.648 E.03775
G1 X110.601 Y152.286 E.03957
G1 X109.285 Y150.97 E.05329
G1 X108.764 Y147.92 E.08865
G1 X109.696 Y146.988 E.03775
G1 X109.975 Y148.618 E.04738
G1 X111.692 Y158.678 F30000
G1 F16200
G1 X111.971 Y160.308 E.04738
G1 X111.039 Y161.24 E.03775
G1 X110.891 Y160.373 E.02519
G1 X112.206 Y161.689 E.05329
G1 X113.108 Y166.968 E.15341
G1 X112.176 Y167.9 E.03775
G1 X112.496 Y169.776 E.0545
G1 X113.812 Y171.091 E.05329
G1 X114.245 Y173.629 E.07372
G1 X113.313 Y174.561 E.03775
G1 X114.101 Y179.179 E.13418
G1 X115.417 Y180.494 E.05329
G1 X115.382 Y180.289 E.00597
G1 X114.45 Y181.221 E.03775
G1 X114.728 Y182.851 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.742 Y182.932 E.0258
G1 X157.742 Y182.178 E.02157
G1 X156.667 Y179.645 F30000
G1 F16200
G1 X156.667 Y177.991 E.04738
G1 X157.742 Y176.916 E.04356
G1 X157.742 Y176.035 E.02522
G1 X156.667 Y174.96 E.04356
G1 X156.667 Y170.194 E.1365
G1 X157.742 Y169.118 E.04356
G1 X157.742 Y168.238 E.02522
G1 X156.667 Y167.162 E.04356
G1 X156.667 Y162.396 E.1365
G1 X157.742 Y161.321 E.04356
G1 X157.742 Y160.44 E.02522
G1 X156.667 Y159.365 E.04356
G1 X156.667 Y154.599 E.1365
G1 X157.742 Y153.524 E.04356
G1 X157.742 Y152.643 E.02522
G1 X156.667 Y151.567 E.04356
G1 X156.667 Y146.802 E.1365
G1 X157.742 Y145.726 E.04356
G1 X157.742 Y144.846 E.02522
G1 X156.667 Y143.77 E.04356
G1 X156.667 Y139.004 E.1365
G1 X157.742 Y137.929 E.04356
G1 X157.742 Y137.048 E.02522
G1 X156.667 Y135.973 E.04356
G1 X156.667 Y131.207 E.1365
G1 X157.742 Y130.131 E.04356
G1 X157.742 Y129.251 E.02522
G1 X156.667 Y128.175 E.04356
G1 X156.667 Y123.41 E.1365
G1 X157.742 Y122.334 E.04356
G1 X157.742 Y121.453 E.02522
G1 X156.667 Y120.378 E.04356
G1 X156.667 Y115.612 E.1365
G1 X157.742 Y114.537 E.04356
G1 X157.742 Y113.656 E.02522
G1 X156.667 Y112.581 E.04356
G1 X156.667 Y107.815 E.1365
G1 X157.742 Y106.739 E.04356
G1 X157.742 Y105.859 E.02522
G1 X156.667 Y104.783 E.04356
G1 X156.667 Y100.017 E.1365
G1 X157.742 Y98.942 E.04356
G1 X157.742 Y98.061 E.02522
G1 X156.667 Y96.986 E.04356
G1 X156.667 Y92.22 E.1365
G1 X157.742 Y91.145 E.04356
G1 X157.742 Y90.264 E.02522
G1 X156.667 Y89.189 E.04356
G1 X156.667 Y84.423 E.1365
G1 X157.742 Y83.347 E.04356
G1 X157.742 Y82.467 E.02522
G1 X156.667 Y81.391 E.04356
G1 X156.667 Y76.625 E.1365
G1 X157.742 Y75.55 E.04356
G1 X157.742 Y74.669 E.02522
G1 X156.667 Y73.594 E.04356
G1 X156.667 Y68.828 E.1365
G1 X157.742 Y67.753 E.04356
G1 X157.742 Y66.872 E.02522
G1 X156.667 Y65.796 E.04356
G1 X156.667 Y64.142 E.04738
G1 X157.742 Y61.609 F30000
G1 F16200
G1 X157.742 Y60.856 E.02157
G1 X156.841 Y60.856 E.0258
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
M73 P94 R3
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.166 Y60.856 E.00688
G1 X75.166 Y62.27 E.0405
G1 X76.242 Y63.346 E.04356
G1 X76.242 Y63.482 E.0039
G1 X75.166 Y64.557 E.04356
G1 X75.166 Y70.067 E.15783
G1 X76.242 Y71.143 E.04356
G1 X76.242 Y71.279 E.0039
G1 X75.166 Y72.354 E.04356
G1 X75.166 Y77.865 E.15783
G1 X76.242 Y78.94 E.04356
G1 X76.242 Y79.076 E.0039
G1 X75.166 Y80.152 E.04356
G1 X75.166 Y85.662 E.15783
G1 X76.242 Y86.738 E.04356
G1 X76.242 Y86.874 E.0039
G1 X75.166 Y87.949 E.04356
G1 X75.166 Y93.46 E.15783
G1 X76.242 Y94.535 E.04356
G1 X76.242 Y94.671 E.0039
G1 X75.166 Y95.746 E.04356
G1 X75.166 Y101.257 E.15783
G1 X76.242 Y102.332 E.04356
G1 X76.242 Y102.468 E.0039
G1 X75.166 Y103.544 E.04356
G1 X75.166 Y109.054 E.15783
G1 X76.242 Y110.13 E.04356
G1 X76.242 Y110.266 E.0039
G1 X75.166 Y111.341 E.04356
G1 X75.166 Y116.852 E.15783
G1 X76.242 Y117.927 E.04356
G1 X76.242 Y118.063 E.0039
G1 X75.166 Y119.139 E.04356
G1 X75.166 Y124.649 E.15783
G1 X76.242 Y125.724 E.04356
G1 X76.242 Y125.86 E.0039
G1 X75.166 Y126.936 E.04356
G1 X75.166 Y132.446 E.15783
G1 X76.242 Y133.522 E.04356
G1 X76.242 Y133.658 E.0039
G1 X75.166 Y134.733 E.04356
G1 X75.166 Y140.244 E.15783
G1 X76.27 Y141.347 E.04471
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.559 Y140.327 E.04132
G1 X108.996 Y142.883 E.07427
G1 X107.68 Y141.568 E.05329
G1 X107.958 Y143.198 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X107.68 Y141.568 E-.62855
G1 X107.925 Y141.812 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 80/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z13.83 I1.134 J-.441 P1  F30000
G1 X76.994 Y62.285 Z13.83
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.313 Y62.285 E2.27184
G1 X156.313 Y181.502 E3.41461
G1 X115.948 Y181.502 E1.15613
G1 X108.848 Y139.918 E1.20829
G1 X76.596 Y139.918 E.92378
G1 X76.596 Y62.285 E2.22356
G1 X76.934 Y62.285 E.0097
G1 X76.994 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.914 Y62.684 E2.09644
G1 X155.914 Y181.104 E3.14572
G1 X116.284 Y181.104 E1.05274
G1 X109.185 Y139.52 E1.12063
G1 X76.994 Y139.52 E.8551
G1 X76.994 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.994 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.573 Y69.926 Z14 F30000
G1 X107.349 Y141.73 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.344 Y141.701 E.00085
G1 X74.813 Y141.701 E.93176
G1 X74.813 Y60.502 E2.3257
G1 X158.096 Y60.502 E2.38539
G1 X158.096 Y183.285 E3.51675
G1 X114.444 Y183.285 E1.25028
G1 X107.359 Y141.789 E1.20572
G1 X107.008 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.414 Y142.1 E.86581
G1 X74.414 Y60.104 E2.17814
G1 X158.494 Y60.104 E2.23351
G1 X158.494 Y183.684 E3.28279
G1 X114.108 Y183.684 E1.1791
G1 X107.018 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.018 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.958 Y143.198 Z14 F30000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.68 Y141.568 E.04738
G1 X108.996 Y142.884 E.05329
G1 X108.559 Y140.327 E.07428
G1 X107.539 Y141.347 E.04132
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.167 Y140.244 E.0447
G1 X75.167 Y134.733 E.15784
G1 X76.242 Y133.658 E.04356
G1 X76.242 Y133.522 E.00389
G1 X75.167 Y132.446 E.04356
G1 X75.167 Y126.936 E.15784
G1 X76.242 Y125.86 E.04356
G1 X76.242 Y125.725 E.00389
G1 X75.167 Y124.649 E.04356
G1 X75.167 Y119.138 E.15784
G1 X76.242 Y118.063 E.04356
G1 X76.242 Y117.927 E.00389
G1 X75.167 Y116.852 E.04356
G1 X75.167 Y111.341 E.15784
G1 X76.242 Y110.266 E.04356
G1 X76.242 Y110.13 E.00389
G1 X75.167 Y109.054 E.04356
G1 X75.167 Y103.544 E.15784
G1 X76.242 Y102.468 E.04356
G1 X76.242 Y102.332 E.00389
G1 X75.167 Y101.257 E.04356
G1 X75.167 Y95.746 E.15784
G1 X76.242 Y94.671 E.04356
G1 X76.242 Y94.535 E.00389
G1 X75.167 Y93.46 E.04356
G1 X75.167 Y87.949 E.15784
G1 X76.242 Y86.874 E.04356
G1 X76.242 Y86.738 E.00389
G1 X75.167 Y85.662 E.04356
G1 X75.167 Y80.152 E.15784
G1 X76.242 Y79.076 E.04356
G1 X76.242 Y78.94 E.00389
G1 X75.167 Y77.865 E.04356
G1 X75.167 Y72.354 E.15784
G1 X76.242 Y71.279 E.04356
G1 X76.242 Y71.143 E.00389
G1 X75.167 Y70.068 E.04356
G1 X75.167 Y64.557 E.15784
G1 X76.242 Y63.481 E.04356
G1 X76.242 Y63.346 E.00389
G1 X75.167 Y62.27 E.04356
G1 X75.167 Y60.856 E.0405
G1 X75.407 Y60.856 E.00687
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.742 Y60.856 E.02581
G1 X157.742 Y61.609 E.02157
G1 X156.667 Y64.143 F30000
G1 F16200
G1 X156.667 Y65.797 E.04738
G1 X157.742 Y66.872 E.04356
G1 X157.742 Y67.752 E.02521
G1 X156.667 Y68.828 E.04356
G1 X156.667 Y73.594 E.13651
G1 X157.742 Y74.669 E.04356
G1 X157.742 Y75.55 E.02521
G1 X156.667 Y76.625 E.04356
G1 X156.667 Y81.391 E.13651
G1 X157.742 Y82.467 E.04356
G1 X157.742 Y83.347 E.02521
G1 X156.667 Y84.423 E.04356
G1 X156.667 Y89.189 E.13651
G1 X157.742 Y90.264 E.04356
G1 X157.742 Y91.144 E.02521
G1 X156.667 Y92.22 E.04356
G1 X156.667 Y96.986 E.13651
G1 X157.742 Y98.062 E.04356
G1 X157.742 Y98.942 E.02521
G1 X156.667 Y100.017 E.04356
G1 X156.667 Y104.783 E.13651
G1 X157.742 Y105.859 E.04356
G1 X157.742 Y106.739 E.02521
G1 X156.667 Y107.815 E.04356
G1 X156.667 Y112.581 E.13651
G1 X157.742 Y113.656 E.04356
G1 X157.742 Y114.537 E.02521
G1 X156.667 Y115.612 E.04356
G1 X156.667 Y120.378 E.13651
G1 X157.742 Y121.454 E.04356
G1 X157.742 Y122.334 E.02521
G1 X156.667 Y123.409 E.04356
G1 X156.667 Y128.176 E.13651
G1 X157.742 Y129.251 E.04356
G1 X157.742 Y130.131 E.02521
G1 X156.667 Y131.207 E.04356
G1 X156.667 Y135.973 E.13651
G1 X157.742 Y137.048 E.04356
G1 X157.742 Y137.929 E.02521
G1 X156.667 Y139.004 E.04356
G1 X156.667 Y143.77 E.13651
G1 X157.742 Y144.846 E.04356
G1 X157.742 Y145.726 E.02521
G1 X156.667 Y146.801 E.04356
G1 X156.667 Y151.568 E.13651
G1 X157.742 Y152.643 E.04356
G1 X157.742 Y153.523 E.02521
G1 X156.667 Y154.599 E.04356
G1 X156.667 Y159.365 E.13651
G1 X157.742 Y160.44 E.04356
G1 X157.742 Y161.321 E.02521
G1 X156.667 Y162.396 E.04356
G1 X156.667 Y167.162 E.13651
G1 X157.742 Y168.238 E.04356
G1 X157.742 Y169.118 E.02521
G1 X156.667 Y170.194 E.04356
G1 X156.667 Y174.96 E.13651
G1 X157.742 Y176.035 E.04356
G1 X157.742 Y176.915 E.02521
G1 X156.667 Y177.991 E.04356
G1 X156.667 Y179.645 E.04738
G1 X157.742 Y182.178 F30000
G1 F16200
G1 X157.742 Y182.932 E.02157
G1 X156.841 Y182.932 E.02581
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.729 Y182.851 F30000
G1 F16200
G1 X114.45 Y181.221 E.04738
G1 X115.382 Y180.289 E.03775
G1 X115.417 Y180.494 E.00597
G1 X114.102 Y179.179 E.05329
G1 X113.313 Y174.56 E.13419
G1 X114.245 Y173.628 E.03775
G1 X113.812 Y171.092 E.07371
G1 X112.496 Y169.776 E.05329
G1 X112.176 Y167.9 E.0545
G1 X113.108 Y166.968 E.03775
G1 X112.206 Y161.689 E.1534
G1 X110.891 Y160.373 E.05329
G1 X111.039 Y161.24 E.02518
G1 X111.971 Y160.308 E.03775
G1 X111.692 Y158.678 E.04738
G1 X109.975 Y148.618 F30000
G1 F16200
G1 X109.696 Y146.987 E.04738
G1 X108.765 Y147.919 E.03775
G1 X109.285 Y150.971 E.08866
G1 X110.601 Y152.286 E.05329
G1 X110.834 Y153.648 E.03956
G1 X109.902 Y154.58 E.03775
G1 X110.18 Y156.21 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 13.77
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.902 Y154.58 E-.62855
G1 X110.146 Y154.335 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 81/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z14 I1.145 J-.412 P1  F30000
G1 X76.995 Y62.285 Z14
G1 Z13.77
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.313 Y62.285 E2.27184
G1 X156.313 Y181.502 E3.41461
G1 X115.948 Y181.502 E1.15613
G1 X108.849 Y139.918 E1.20829
G1 X76.596 Y139.918 E.92378
G1 X76.596 Y62.285 E2.22356
G1 X76.935 Y62.285 E.0097
G1 X76.995 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.915 Y62.684 E2.09644
G1 X155.915 Y181.104 E3.14572
G1 X116.284 Y181.104 E1.05274
G1 X109.185 Y139.52 E1.12063
G1 X76.995 Y139.52 E.8551
G1 X76.995 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.995 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.573 Y69.926 Z14.17 F30000
G1 X107.349 Y141.73 Z14.17
G1 Z13.77
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.344 Y141.701 E.00085
G1 X74.813 Y141.701 E.93176
G1 X74.813 Y60.502 E2.3257
G1 X158.096 Y60.502 E2.38539
G1 X158.096 Y183.285 E3.51675
G1 X114.444 Y183.285 E1.25028
G1 X107.359 Y141.789 E1.20572
G1 X107.008 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.415 Y142.1 E.86581
G1 X74.415 Y60.104 E2.17814
G1 X158.495 Y60.104 E2.23351
G1 X158.495 Y183.684 E3.28279
G1 X114.108 Y183.684 E1.1791
G1 X107.018 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.018 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.649 Y149.32 Z14.17 F30000
G1 X110.18 Y156.21 Z14.17
G1 Z13.77
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.902 Y154.58 E.04738
G1 X110.834 Y153.648 E.03775
G1 X110.601 Y152.286 E.03955
G1 X109.286 Y150.971 E.05329
G1 X108.765 Y147.919 E.08866
G1 X109.697 Y146.987 E.03775
G1 X109.975 Y148.618 E.04738
G1 X111.692 Y158.677 F30000
G1 F16200
G1 X111.971 Y160.308 E.04738
G1 X111.039 Y161.24 E.03775
G1 X110.891 Y160.373 E.02517
G1 X112.207 Y161.689 E.05329
G1 X113.108 Y166.968 E.15339
G1 X112.176 Y167.9 E.03775
G1 X112.496 Y169.776 E.05451
G1 X113.812 Y171.092 E.05329
G1 X114.245 Y173.628 E.0737
G1 X113.313 Y174.56 E.03775
G1 X114.102 Y179.179 E.1342
G1 X115.417 Y180.495 E.05329
G1 X115.382 Y180.289 E.00598
G1 X114.45 Y181.221 E.03775
G1 X114.729 Y182.851 E.04738
G1 X118.433 Y181.856 F30000
G1 F16200
G1 X116.779 Y181.856 E.04738
G1 X117.854 Y182.932 E.04356
G1 X120.537 Y182.932 E.07683
G1 X121.612 Y181.856 E.04356
G1 X124.576 Y181.856 E.0849
G1 X125.652 Y182.932 E.04356
G1 X128.334 Y182.932 E.07683
G1 X129.409 Y181.856 E.04356
G1 X132.374 Y181.856 E.0849
G1 X133.449 Y182.932 E.04356
G1 X136.131 Y182.932 E.07683
G1 X137.207 Y181.856 E.04356
G1 X140.171 Y181.856 E.0849
G1 X141.246 Y182.932 E.04356
G1 X143.929 Y182.932 E.07683
G1 X145.004 Y181.856 E.04356
G1 X147.968 Y181.856 E.0849
G1 X149.044 Y182.932 E.04356
G1 X151.726 Y182.932 E.07683
G1 X152.802 Y181.856 E.04356
G1 X155.766 Y181.856 E.0849
G1 X156.841 Y182.932 E.04356
G1 X157.742 Y182.932 E.02581
G1 X157.742 Y182.179 E.02156
G1 X156.667 Y179.645 F30000
G1 F16200
G1 X156.667 Y177.991 E.04738
G1 X157.742 Y176.915 E.04356
G1 X157.742 Y176.035 E.0252
G1 X156.667 Y174.96 E.04356
G1 X156.667 Y170.193 E.13652
G1 X157.742 Y169.118 E.04356
G1 X157.742 Y168.238 E.0252
G1 X156.667 Y167.162 E.04356
G1 X156.667 Y162.396 E.13652
G1 X157.742 Y161.321 E.04356
G1 X157.742 Y160.441 E.0252
G1 X156.667 Y159.365 E.04356
G1 X156.667 Y154.599 E.13652
G1 X157.742 Y153.523 E.04356
G1 X157.742 Y152.643 E.0252
G1 X156.667 Y151.568 E.04356
G1 X156.667 Y146.801 E.13652
G1 X157.742 Y145.726 E.04356
G1 X157.742 Y144.846 E.0252
G1 X156.667 Y143.77 E.04356
G1 X156.667 Y139.004 E.13652
G1 X157.742 Y137.928 E.04356
G1 X157.742 Y137.048 E.0252
G1 X156.667 Y135.973 E.04356
G1 X156.667 Y131.207 E.13652
G1 X157.742 Y130.131 E.04356
G1 X157.742 Y129.251 E.0252
G1 X156.667 Y128.176 E.04356
G1 X156.667 Y123.409 E.13652
G1 X157.742 Y122.334 E.04356
G1 X157.742 Y121.454 E.02521
G1 X156.667 Y120.378 E.04356
G1 X156.667 Y115.612 E.13652
G1 X157.742 Y114.536 E.04356
G1 X157.742 Y113.656 E.02521
G1 X156.667 Y112.581 E.04356
G1 X156.667 Y107.815 E.13652
G1 X157.742 Y106.739 E.04356
G1 X157.742 Y105.859 E.02521
G1 X156.667 Y104.784 E.04356
G1 X156.667 Y100.017 E.13652
G1 X157.742 Y98.942 E.04356
G1 X157.742 Y98.062 E.02521
G1 X156.667 Y96.986 E.04356
G1 X156.667 Y92.22 E.13652
G1 X157.742 Y91.144 E.04356
G1 X157.742 Y90.264 E.02521
G1 X156.667 Y89.189 E.04356
G1 X156.667 Y84.422 E.13652
G1 X157.742 Y83.347 E.04356
G1 X157.742 Y82.467 E.02521
G1 X156.667 Y81.391 E.04356
G1 X156.667 Y76.625 E.13652
G1 X157.742 Y75.55 E.04356
G1 X157.742 Y74.67 E.02521
G1 X156.667 Y73.594 E.04356
G1 X156.667 Y68.828 E.13652
G1 X157.742 Y67.752 E.04356
G1 X157.742 Y66.872 E.02521
G1 X156.667 Y65.797 E.04356
G1 X156.667 Y64.143 E.04738
G1 X157.742 Y61.609 F30000
G1 F16200
G1 X157.742 Y60.856 E.02157
G1 X156.841 Y60.856 E.02581
G1 X155.766 Y61.932 E.04356
G1 X152.802 Y61.932 E.0849
G1 X151.726 Y60.856 E.04356
G1 X149.044 Y60.856 E.07683
G1 X147.968 Y61.932 E.04356
G1 X145.004 Y61.932 E.0849
G1 X143.929 Y60.856 E.04356
G1 X141.246 Y60.856 E.07683
G1 X140.171 Y61.932 E.04356
G1 X137.207 Y61.932 E.0849
G1 X136.131 Y60.856 E.04356
G1 X133.449 Y60.856 E.07683
G1 X132.374 Y61.932 E.04356
G1 X129.409 Y61.932 E.0849
G1 X128.334 Y60.856 E.04356
G1 X125.652 Y60.856 E.07683
G1 X124.576 Y61.932 E.04356
G1 X121.612 Y61.932 E.0849
G1 X120.537 Y60.856 E.04356
G1 X117.854 Y60.856 E.07683
G1 X116.779 Y61.932 E.04356
G1 X113.815 Y61.932 E.0849
G1 X112.739 Y60.856 E.04356
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.167 Y60.856 E.00687
G1 X75.167 Y62.27 E.04051
G1 X76.242 Y63.346 E.04356
G1 X76.242 Y63.481 E.00388
G1 X75.167 Y64.557 E.04356
G1 X75.167 Y70.068 E.15784
G1 X76.242 Y71.143 E.04356
G1 X76.242 Y71.279 E.00388
G1 X75.167 Y72.354 E.04356
G1 X75.167 Y77.865 E.15784
G1 X76.242 Y78.941 E.04356
G1 X76.242 Y79.076 E.00388
G1 X75.167 Y80.151 E.04356
G1 X75.167 Y85.662 E.15784
G1 X76.242 Y86.738 E.04356
G1 X76.242 Y86.873 E.00388
G1 X75.167 Y87.949 E.04356
G1 X75.167 Y93.46 E.15784
G1 X76.242 Y94.535 E.04356
G1 X76.242 Y94.671 E.00388
G1 X75.167 Y95.746 E.04356
G1 X75.167 Y101.257 E.15784
G1 X76.242 Y102.333 E.04356
G1 X76.242 Y102.468 E.00388
G1 X75.167 Y103.544 E.04356
G1 X75.167 Y109.055 E.15784
G1 X76.242 Y110.13 E.04356
G1 X76.242 Y110.265 E.00388
G1 X75.167 Y111.341 E.04356
G1 X75.167 Y116.852 E.15784
G1 X76.242 Y117.927 E.04356
G1 X76.242 Y118.063 E.00388
G1 X75.167 Y119.138 E.04356
G1 X75.167 Y124.649 E.15784
G1 X76.242 Y125.725 E.04356
G1 X76.242 Y125.86 E.00388
G1 X75.167 Y126.936 E.04356
G1 X75.167 Y132.447 E.15784
G1 X76.242 Y133.522 E.04356
G1 X76.242 Y133.658 E.00388
G1 X75.167 Y134.733 E.04356
G1 X75.167 Y140.244 E.15784
G1 X76.27 Y141.347 E.04469
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.559 Y140.327 E.04133
G1 X108.996 Y142.884 E.07429
G1 X107.68 Y141.568 E.05329
G1 X107.959 Y143.199 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 13.94
; LAYER_HEIGHT: 0.169999
; WIPE_START
G1 F24000
G1 X107.68 Y141.568 E-.62855
G1 X107.925 Y141.813 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 82/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z14.17 I1.134 J-.441 P1  F30000
G1 X76.995 Y62.285 Z14.17
G1 Z13.94
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.313 Y62.285 E2.27184
G1 X156.313 Y181.502 E3.41461
G1 X115.948 Y181.502 E1.15613
G1 X108.849 Y139.918 E1.20829
G1 X76.596 Y139.918 E.92378
G1 X76.596 Y62.285 E2.22356
G1 X76.935 Y62.285 E.0097
G1 X76.995 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.915 Y62.684 E2.09644
G1 X155.915 Y181.104 E3.14572
G1 X116.285 Y181.104 E1.05274
G1 X109.185 Y139.52 E1.12063
G1 X76.995 Y139.52 E.8551
G1 X76.995 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.995 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.573 Y69.926 Z14.34 F30000
G1 X107.349 Y141.73 Z14.34
G1 Z13.94
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X107.344 Y141.701 E.00085
G1 X74.813 Y141.701 E.93176
G1 X74.813 Y60.502 E2.3257
G1 X158.096 Y60.502 E2.38539
G1 X158.096 Y183.285 E3.51675
G1 X114.444 Y183.285 E1.25028
G1 X107.359 Y141.789 E1.20572
G1 X107.008 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.415 Y142.1 E.86581
G1 X74.415 Y60.104 E2.17814
G1 X158.495 Y60.104 E2.23351
G1 X158.495 Y183.684 E3.28279
G1 X114.108 Y183.684 E1.1791
G1 X107.018 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.018 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.959 Y143.199 Z14.34 F30000
G1 Z13.94
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X107.68 Y141.568 E.04738
G1 X108.996 Y142.884 E.05329
G1 X108.56 Y140.327 E.07429
G1 X107.539 Y141.347 E.04133
G1 X107.46 Y141.347 E.00228
G1 X106.384 Y140.272 E.04356
G1 X100.817 Y140.272 E.15944
G1 X99.742 Y141.347 E.04356
G1 X99.662 Y141.347 E.00228
G1 X98.587 Y140.272 E.04356
G1 X93.02 Y140.272 E.15944
G1 X91.945 Y141.347 E.04356
G1 X91.865 Y141.347 E.00228
G1 X90.789 Y140.272 E.04356
G1 X85.223 Y140.272 E.15944
G1 X84.147 Y141.347 E.04356
G1 X84.068 Y141.347 E.00228
G1 X82.992 Y140.272 E.04356
G1 X77.425 Y140.272 E.15944
G1 X76.35 Y141.347 E.04356
G1 X76.27 Y141.347 E.00228
G1 X75.167 Y140.244 E.04469
G1 X75.167 Y134.733 E.15785
G1 X76.242 Y133.657 E.04356
G1 X76.242 Y133.522 E.00387
G1 X75.167 Y132.447 E.04356
G1 X75.167 Y126.936 E.15785
G1 X76.242 Y125.86 E.04356
G1 X76.242 Y125.725 E.00387
G1 X75.167 Y124.649 E.04356
G1 X75.167 Y119.138 E.15785
G1 X76.242 Y118.063 E.04356
G1 X76.242 Y117.928 E.00387
G1 X75.167 Y116.852 E.04356
G1 X75.167 Y111.341 E.15785
G1 X76.242 Y110.265 E.04356
G1 X76.242 Y110.13 E.00387
G1 X75.167 Y109.055 E.04356
G1 X75.167 Y103.543 E.15785
M73 P95 R3
G1 X76.242 Y102.468 E.04356
G1 X76.242 Y102.333 E.00387
G1 X75.167 Y101.257 E.04356
G1 X75.167 Y95.746 E.15785
G1 X76.242 Y94.671 E.04356
G1 X76.242 Y94.535 E.00387
G1 X75.167 Y93.46 E.04356
G1 X75.167 Y87.949 E.15785
G1 X76.242 Y86.873 E.04356
G1 X76.242 Y86.738 E.00387
G1 X75.167 Y85.663 E.04356
G1 X75.167 Y80.151 E.15785
G1 X76.242 Y79.076 E.04356
G1 X76.242 Y78.941 E.00387
G1 X75.167 Y77.865 E.04356
G1 X75.167 Y72.354 E.15785
G1 X76.242 Y71.278 E.04356
G1 X76.242 Y71.143 E.00387
G1 X75.167 Y70.068 E.04356
G1 X75.167 Y64.557 E.15785
G1 X76.242 Y63.481 E.04356
G1 X76.242 Y63.346 E.00387
G1 X75.167 Y62.27 E.04356
G1 X75.167 Y60.856 E.04051
G1 X75.407 Y60.856 E.00686
G1 X79.446 Y61.932 F30000
G1 F16200
G1 X77.792 Y61.932 E.04738
G1 X78.868 Y60.856 E.04356
G1 X81.55 Y60.856 E.07683
G1 X82.625 Y61.932 E.04356
G1 X85.589 Y61.932 E.0849
G1 X86.665 Y60.856 E.04356
G1 X89.347 Y60.856 E.07683
G1 X90.423 Y61.932 E.04356
G1 X93.387 Y61.932 E.0849
G1 X94.462 Y60.856 E.04356
G1 X97.145 Y60.856 E.07683
G1 X98.22 Y61.932 E.04356
G1 X101.184 Y61.932 E.0849
G1 X102.26 Y60.856 E.04356
G1 X104.942 Y60.856 E.07683
G1 X106.017 Y61.932 E.04356
G1 X108.981 Y61.932 E.0849
G1 X110.057 Y60.856 E.04356
G1 X112.739 Y60.856 E.07683
G1 X113.815 Y61.932 E.04356
G1 X116.779 Y61.932 E.0849
G1 X117.854 Y60.856 E.04356
G1 X120.537 Y60.856 E.07683
G1 X121.612 Y61.932 E.04356
G1 X124.576 Y61.932 E.0849
G1 X125.652 Y60.856 E.04356
G1 X128.334 Y60.856 E.07683
G1 X129.409 Y61.932 E.04356
G1 X132.374 Y61.932 E.0849
G1 X133.449 Y60.856 E.04356
G1 X136.131 Y60.856 E.07683
G1 X137.207 Y61.932 E.04356
G1 X140.171 Y61.932 E.0849
G1 X141.246 Y60.856 E.04356
G1 X143.929 Y60.856 E.07683
G1 X145.004 Y61.932 E.04356
G1 X147.968 Y61.932 E.0849
G1 X149.044 Y60.856 E.04356
G1 X151.726 Y60.856 E.07683
G1 X152.802 Y61.932 E.04356
G1 X155.766 Y61.932 E.0849
G1 X156.841 Y60.856 E.04356
G1 X157.742 Y60.856 E.02581
G1 X157.742 Y61.609 E.02156
G1 X156.667 Y64.143 F30000
G1 F16200
G1 X156.667 Y65.797 E.04738
G1 X157.742 Y66.872 E.04356
G1 X157.742 Y67.752 E.0252
G1 X156.667 Y68.828 E.04356
G1 X156.667 Y73.594 E.13653
G1 X157.742 Y74.67 E.04356
G1 X157.742 Y75.549 E.0252
G1 X156.667 Y76.625 E.04356
G1 X156.667 Y81.392 E.13653
G1 X157.742 Y82.467 E.04356
G1 X157.742 Y83.347 E.0252
G1 X156.667 Y84.422 E.04356
G1 X156.667 Y89.189 E.13653
G1 X157.742 Y90.264 E.04356
G1 X157.742 Y91.144 E.0252
G1 X156.667 Y92.22 E.04356
G1 X156.667 Y96.986 E.13653
G1 X157.742 Y98.062 E.04356
G1 X157.742 Y98.942 E.0252
G1 X156.667 Y100.017 E.04356
G1 X156.667 Y104.784 E.13653
G1 X157.742 Y105.859 E.04356
G1 X157.742 Y106.739 E.0252
G1 X156.667 Y107.814 E.04356
G1 X156.667 Y112.581 E.13653
G1 X157.742 Y113.657 E.04356
G1 X157.742 Y114.536 E.0252
G1 X156.667 Y115.612 E.04356
G1 X156.667 Y120.378 E.13653
G1 X157.742 Y121.454 E.04356
G1 X157.742 Y122.334 E.0252
G1 X156.667 Y123.409 E.04356
G1 X156.667 Y128.176 E.13653
G1 X157.742 Y129.251 E.04356
G1 X157.742 Y130.131 E.0252
G1 X156.667 Y131.206 E.04356
G1 X156.667 Y135.973 E.13653
G1 X157.742 Y137.049 E.04356
G1 X157.742 Y137.928 E.0252
G1 X156.667 Y139.004 E.04356
G1 X156.667 Y143.771 E.13653
G1 X157.742 Y144.846 E.04356
G1 X157.742 Y145.726 E.0252
G1 X156.667 Y146.801 E.04356
G1 X156.667 Y151.568 E.13653
G1 X157.742 Y152.643 E.04356
G1 X157.742 Y153.523 E.0252
G1 X156.667 Y154.599 E.04356
G1 X156.667 Y159.365 E.13653
G1 X157.742 Y160.441 E.04356
G1 X157.742 Y161.32 E.0252
G1 X156.667 Y162.396 E.04356
G1 X156.667 Y167.163 E.13653
G1 X157.742 Y168.238 E.04356
G1 X157.742 Y169.118 E.0252
G1 X156.667 Y170.193 E.04356
G1 X156.667 Y174.96 E.13653
G1 X157.742 Y176.035 E.04356
G1 X157.742 Y176.915 E.0252
G1 X156.667 Y177.991 E.04356
G1 X156.667 Y179.645 E.04738
G1 X157.742 Y182.179 F30000
G1 F16200
G1 X157.742 Y182.932 E.02156
G1 X156.841 Y182.932 E.02582
G1 X155.766 Y181.856 E.04356
G1 X152.802 Y181.856 E.0849
G1 X151.726 Y182.932 E.04356
G1 X149.044 Y182.932 E.07683
G1 X147.968 Y181.856 E.04356
G1 X145.004 Y181.856 E.0849
G1 X143.929 Y182.932 E.04356
G1 X141.246 Y182.932 E.07683
G1 X140.171 Y181.856 E.04356
G1 X137.207 Y181.856 E.0849
G1 X136.131 Y182.932 E.04356
G1 X133.449 Y182.932 E.07683
G1 X132.374 Y181.856 E.04356
G1 X129.409 Y181.856 E.0849
G1 X128.334 Y182.932 E.04356
G1 X125.652 Y182.932 E.07683
G1 X124.576 Y181.856 E.04356
G1 X121.612 Y181.856 E.0849
G1 X120.537 Y182.932 E.04356
G1 X117.854 Y182.932 E.07683
G1 X116.779 Y181.856 E.04356
G1 X118.433 Y181.856 E.04738
G1 X114.729 Y182.851 F30000
G1 F16200
G1 X114.45 Y181.22 E.04738
G1 X115.382 Y180.288 E.03775
G1 X115.418 Y180.495 E.00599
G1 X114.102 Y179.179 E.05329
G1 X113.313 Y174.56 E.13421
G1 X114.245 Y173.628 E.03775
G1 X113.812 Y171.092 E.07369
G1 X112.497 Y169.776 E.05329
G1 X112.176 Y167.9 E.05452
G1 X113.108 Y166.968 E.03775
G1 X112.207 Y161.689 E.15338
G1 X110.891 Y160.374 E.05329
G1 X111.039 Y161.24 E.02516
G1 X111.971 Y160.308 E.03775
G1 X111.693 Y158.677 E.04738
G1 X109.975 Y148.618 F30000
G1 F16200
G1 X109.697 Y146.987 E.04738
G1 X108.765 Y147.919 E.03775
G1 X109.286 Y150.971 E.08867
G1 X110.601 Y152.287 E.05329
G1 X110.834 Y153.647 E.03954
G1 X109.902 Y154.579 E.03775
G1 X110.18 Y156.21 E.04738
; CHANGE_LAYER
; Z_HEIGHT: 14.11
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X109.902 Y154.579 E-.62855
G1 X110.147 Y154.335 E-.13145
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 83/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change
M106 S247.35
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z14.34 I1.145 J-.412 P1  F30000
G1 X76.995 Y62.285 Z14.34
G1 Z14.11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F17923.694
G1 X156.313 Y62.285 E2.27184
G1 X156.313 Y181.502 E3.41461
G1 X115.949 Y181.502 E1.15613
G1 X108.849 Y139.918 E1.20829
G1 X76.596 Y139.918 E.92378
G1 X76.596 Y62.285 E2.22356
G1 X76.935 Y62.285 E.0097
G1 X76.995 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.915 Y62.684 E2.09644
G1 X155.915 Y181.104 E3.14572
G1 X116.285 Y181.104 E1.05274
G1 X109.185 Y139.52 E1.12063
G1 X76.995 Y139.52 E.8551
G1 X76.995 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.995 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.572 Y69.927 Z14.51 F30000
G1 X107.315 Y141.701 Z14.51
G1 Z14.11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.813 Y141.701 E.93091
G1 X74.813 Y60.502 E2.3257
G1 X158.096 Y60.502 E2.38539
G1 X158.096 Y183.285 E3.51675
G1 X114.444 Y183.285 E1.25028
G1 X107.35 Y141.731 E1.20742
G1 X107.008 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.415 Y142.1 E.86581
G1 X74.415 Y60.104 E2.17814
G1 X158.495 Y60.104 E2.23351
G1 X158.495 Y183.684 E3.28279
G1 X114.108 Y183.684 E1.1791
G1 X107.018 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.018 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.65 Y149.32 Z14.51 F30000
G1 X110.18 Y156.21 Z14.51
G1 Z14.11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
G1 X109.902 Y154.579 E.04738
G1 X110.834 Y153.647 E.03775
G1 X110.602 Y152.287 E.03953
G1 X109.286 Y150.971 E.05329
G1 X108.765 Y147.919 E.08868
G1 X109.697 Y146.987 E.03775
G1 X109.975 Y148.618 E.04738
G1 X111.693 Y158.677 F30000
G1 F16200
G1 X111.971 Y160.308 E.04738
G1 X111.039 Y161.24 E.03775
G1 X110.891 Y160.374 E.02516
G1 X112.207 Y161.689 E.05329
G1 X113.108 Y166.968 E.15337
G1 X112.176 Y167.9 E.03775
G1 X112.497 Y169.777 E.05453
G1 X113.812 Y171.092 E.05329
G1 X114.245 Y173.628 E.07369
M73 P95 R2
G1 X113.313 Y174.56 E.03775
G1 X113.035 Y172.93 E.04738
; WIPE_START
G1 F24000
G1 X113.313 Y174.56 E-.62855
G1 X113.558 Y174.315 E-.13145
; WIPE_END
G1 E-.04 F1800
G1 X113.463 Y166.684 Z14.51 F30000
G1 X112.161 Y61.932 Z14.51
G1 Z14.11
G1 E.8 F1800
G1 F16200
G1 X113.657 Y61.932 E.04287
G1 X113.657 Y61.774 E.00451
G1 X112.739 Y60.856 E.03719
G1 X110.057 Y60.856 E.07683
G1 X108.981 Y61.932 E.04356
G1 X106.017 Y61.932 E.0849
G1 X104.942 Y60.856 E.04356
G1 X102.26 Y60.856 E.07683
G1 X101.184 Y61.932 E.04356
G1 X98.22 Y61.932 E.0849
G1 X97.145 Y60.856 E.04356
G1 X94.462 Y60.856 E.07683
G1 X93.387 Y61.932 E.04356
G1 X90.423 Y61.932 E.0849
G1 X89.347 Y60.856 E.04356
G1 X86.665 Y60.856 E.07683
G1 X85.589 Y61.932 E.04356
G1 X82.625 Y61.932 E.0849
G1 X81.55 Y60.856 E.04356
G1 X78.868 Y60.856 E.07683
G1 X77.792 Y61.932 E.04356
G1 X79.446 Y61.932 E.04738
G1 X75.407 Y60.856 F30000
G1 F16200
G1 X75.167 Y60.856 E.00686
G1 X75.167 Y62.271 E.04052
G1 X76.243 Y63.346 E.04356
G1 X76.243 Y63.481 E.00386
G1 X75.167 Y64.556 E.04356
G1 X75.167 Y70.068 E.15786
G1 X76.243 Y71.143 E.04356
G1 X76.243 Y71.278 E.00386
G1 X75.167 Y72.354 E.04356
G1 X75.167 Y77.865 E.15786
G1 X76.243 Y78.941 E.04356
G1 X76.243 Y79.076 E.00386
G1 X75.167 Y80.151 E.04356
G1 X75.167 Y85.663 E.15786
G1 X76.243 Y86.738 E.04356
G1 X76.243 Y86.873 E.00386
G1 X75.167 Y87.949 E.04356
G1 X75.167 Y93.46 E.15786
G1 X76.243 Y94.536 E.04356
G1 X76.243 Y94.67 E.00386
G1 X75.167 Y95.746 E.04356
G1 X75.167 Y101.257 E.15786
G1 X76.243 Y102.333 E.04356
G1 X76.243 Y102.468 E.00386
G1 X75.167 Y103.543 E.04356
G1 X75.167 Y109.055 E.15786
G1 X76.243 Y110.13 E.04356
G1 X76.243 Y110.265 E.00386
G1 X75.167 Y111.341 E.04356
G1 X75.167 Y116.852 E.15786
G1 X76.243 Y117.928 E.04356
G1 X76.243 Y118.063 E.00386
G1 X75.167 Y119.138 E.04356
G1 X75.167 Y124.65 E.15786
G1 X76.243 Y125.725 E.04356
G1 X76.243 Y125.86 E.00386
G1 X75.167 Y126.935 E.04356
G1 X75.167 Y132.447 E.15786
G1 X76.243 Y133.522 E.04356
G1 X76.243 Y133.657 E.00386
G1 X75.167 Y134.733 E.04356
G1 X75.167 Y140.244 E.15786
G1 X76.27 Y141.347 E.04468
G1 X76.35 Y141.347 E.00228
G1 X77.425 Y140.272 E.04356
G1 X82.992 Y140.272 E.15944
G1 X84.068 Y141.347 E.04356
G1 X84.147 Y141.347 E.00228
G1 X85.223 Y140.272 E.04356
G1 X90.789 Y140.272 E.15944
G1 X91.865 Y141.347 E.04356
G1 X91.945 Y141.347 E.00228
G1 X93.02 Y140.272 E.04356
G1 X98.587 Y140.272 E.15944
G1 X99.662 Y141.347 E.04356
G1 X99.742 Y141.347 E.00228
G1 X100.817 Y140.272 E.04356
G1 X106.384 Y140.272 E.15944
G1 X107.46 Y141.347 E.04356
G1 X107.539 Y141.347 E.00228
G1 X108.56 Y140.327 E.04134
G1 X108.996 Y142.884 E.0743
G1 X107.681 Y141.568 E.05329
G1 X107.959 Y143.199 E.04738
; WIPE_START
G1 F24000
G1 X107.681 Y141.568 E-.62855
G1 X107.925 Y141.813 E-.13145
; WIPE_END
G1 E-.04 F1800
G1 X111.938 Y135.32 Z14.51 F30000
G1 X157.205 Y62.078 Z14.51
G1 Z14.11
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.615931
G1 F12791.072
G1 X157.228 Y61.937 E.00577
; LINE_WIDTH: 0.569999
G1 F13892.28
G1 X157.251 Y61.795 E.00531
; LINE_WIDTH: 0.524068
G1 F15000
G1 X157.274 Y61.653 E.00485
; LINE_WIDTH: 0.464517
G2 X157.297 Y61.302 I-1.073 J-.246 E.01048
; LINE_WIDTH: 0.478137
G1 X157.103 Y61.325 E.00598
; LINE_WIDTH: 0.524069
G1 X156.908 Y61.348 E.0066
; LINE_WIDTH: 0.570002
G1 F13892.215
G1 X156.714 Y61.371 E.00722
; LINE_WIDTH: 0.615934
G1 F12790.995
G1 X156.52 Y61.394 E.00785
G1 X156.625 Y61.46 E.00498
; LINE_WIDTH: 0.570002
G1 F13892.215
G1 X156.73 Y61.527 E.00458
; LINE_WIDTH: 0.524069
G1 F15000
G1 X156.835 Y61.593 E.00419
; LINE_WIDTH: 0.478137
G1 X156.939 Y61.659 E.00379
; LINE_WIDTH: 0.478136
G1 X156.998 Y61.751 E.00334
; LINE_WIDTH: 0.524068
G1 X157.056 Y61.844 E.00368
; LINE_WIDTH: 0.569999
G1 F13892.28
G1 X157.114 Y61.936 E.00403
; LINE_WIDTH: 0.592965
G1 F13318.954
G1 X157.173 Y62.028 E.0042
G1 X114.549 Y61.394 F30000
; LINE_WIDTH: 0.6389
G1 F12303.358
G1 X156.46 Y61.394 E1.74879
; WIPE_START
G1 F24000
G1 X154.46 Y61.394 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.943 Y68.599 Z14.51 F30000
G1 X114.544 Y175.644 Z14.51
G1 Z14.11
G1 E.8 F1800
; LINE_WIDTH: 0.419999
G1 F15000
G1 X114.017 Y176.218 E.02069
G1 X113.925 Y176.415 E.00578
G1 X113.685 Y176.47 E.00654
G1 X114.78 Y182.887 E.17293
G1 X157.698 Y182.887 E1.14006
G1 X157.698 Y60.901 E3.24044
G1 X114.056 Y60.901 E1.15931
G2 X114.062 Y61.887 I41.455 J.241 E.02619
G1 X156.52 Y61.887 E1.12787
G1 X156.656 Y61.943 E.0039
G1 X156.712 Y62.078 E.0039
G1 X156.712 Y181.709 E3.17787
G1 X156.656 Y181.845 E.0039
G1 X156.52 Y181.901 E.0039
G1 X115.774 Y181.901 E1.08238
G1 X115.63 Y181.835 E.00422
G1 X115.585 Y181.741 E.00276
G1 X114.554 Y175.703 E.16271
G1 X114.24 Y176.794 F30000
; LINE_WIDTH: 0.63888
G1 F12303.767
G1 X115.089 Y181.765 E.21044
G1 X115.099 Y181.824 F30000
; LINE_WIDTH: 0.617318
G1 F12760.518
G1 X115.091 Y181.89 E.00265
; LINE_WIDTH: 0.574201
G1 F13783.712
G1 X115.083 Y181.955 E.00245
; LINE_WIDTH: 0.531085
G1 F14985.3
G1 X115.075 Y182.02 E.00226
; LINE_WIDTH: 0.487968
G1 F15000
G1 X115.067 Y182.086 E.00206
; LINE_WIDTH: 0.444851
G1 X115.059 Y182.151 E.00186
; LINE_WIDTH: 0.412112
G1 X115.052 Y182.217 E.00171
G1 X115.108 Y182.499 E.00748
G1 X115.274 Y182.499 E.00431
; LINE_WIDTH: 0.450135
G1 X115.374 Y182.478 E.00293
; LINE_WIDTH: 0.492083
G1 X115.474 Y182.457 E.00323
; LINE_WIDTH: 0.534031
G1 F14896.567
G1 X115.574 Y182.436 E.00352
; LINE_WIDTH: 0.575979
G1 F13738.304
G1 X115.674 Y182.415 E.00382
; LINE_WIDTH: 0.617926
G1 F12747.165
G1 X115.774 Y182.394 E.00412
G1 X115.699 Y182.345 E.00359
; LINE_WIDTH: 0.575979
G1 F13738.304
G1 X115.625 Y182.297 E.00333
; LINE_WIDTH: 0.534031
G1 F14896.567
G1 X115.55 Y182.249 E.00307
; LINE_WIDTH: 0.492083
G1 F15000
G1 X115.475 Y182.201 E.00281
; LINE_WIDTH: 0.450135
G1 X115.4 Y182.152 E.00255
; LINE_WIDTH: 0.450133
G1 X115.348 Y182.095 E.00221
; LINE_WIDTH: 0.492076
G1 X115.296 Y182.039 E.00243
; LINE_WIDTH: 0.534019
G1 F14896.927
G1 X115.244 Y181.982 E.00265
; LINE_WIDTH: 0.575962
G1 F13738.732
G1 X115.192 Y181.925 E.00288
; LINE_WIDTH: 0.596933
G1 F13224.644
G1 X115.14 Y181.868 E.00299
G1 X115.774 Y182.394 F30000
; LINE_WIDTH: 0.6389
G1 F12303.358
G1 X156.579 Y182.391 E1.70264
G1 X157.2 Y181.828 F30000
; LINE_WIDTH: 0.638907
G1 F12303.229
G1 X157.205 Y62.138 E4.99423
G1 X157.2 Y181.828 F30000
; LINE_WIDTH: 0.62501
G1 F12593.749
G1 X157.135 Y181.903 E.00405
; LINE_WIDTH: 0.576484
G1 F13725.445
G1 X157.069 Y181.978 E.00371
; LINE_WIDTH: 0.527959
G1 F15000
G1 X157.004 Y182.053 E.00338
; LINE_WIDTH: 0.479433
G1 X156.939 Y182.128 E.00305
; LINE_WIDTH: 0.479434
G1 X156.864 Y182.193 E.00305
; LINE_WIDTH: 0.52796
G1 X156.789 Y182.258 E.00338
; LINE_WIDTH: 0.576487
G1 F13725.382
G1 X156.714 Y182.324 E.00371
; LINE_WIDTH: 0.625013
G1 F12593.675
G1 X156.639 Y182.389 E.00405
G1 X156.751 Y182.413 E.00467
; LINE_WIDTH: 0.576487
G1 F13725.382
G1 X156.863 Y182.437 E.00429
; LINE_WIDTH: 0.52796
G1 F15000
G1 X156.975 Y182.461 E.0039
; LINE_WIDTH: 0.460385
G2 X157.297 Y182.486 I.217 J-.73 E.00953
G1 X157.297 Y182.276 E.00615
; LINE_WIDTH: 0.479433
G1 X157.276 Y182.179 E.00306
; LINE_WIDTH: 0.527959
G1 X157.255 Y182.082 E.00339
; LINE_WIDTH: 0.576484
G1 F13725.445
G1 X157.233 Y181.984 E.00373
; LINE_WIDTH: 0.600747
G1 F13135.267
G1 X157.212 Y181.887 E.00389
; CHANGE_LAYER
; Z_HEIGHT: 14.28
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X157.233 Y181.984 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 84/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L84
M991 S0 P83 ;notify layer change
M106 S242.25
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z14.51 I1.011 J-.678 P1  F30000
G1 X76.995 Y62.285 Z14.51
G1 Z14.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X156.314 Y62.285 E2.27184
G1 X156.314 Y181.502 E3.41461
G1 X115.949 Y181.502 E1.15613
G1 X108.849 Y139.918 E1.20829
G1 X76.596 Y139.918 E.92378
G1 X76.596 Y62.285 E2.22356
G1 X76.935 Y62.285 E.0097
G1 X76.995 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.915 Y62.684 E2.09644
G1 X155.915 Y181.104 E3.14572
G1 X116.285 Y181.104 E1.05274
G1 X109.185 Y139.52 E1.12063
G1 X76.995 Y139.52 E.8551
G1 X76.995 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.995 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.572 Y69.927 Z14.68 F30000
G1 X107.315 Y141.701 Z14.68
G1 Z14.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.813 Y141.701 E.93091
G1 X74.813 Y60.502 E2.3257
G1 X158.096 Y60.502 E2.38539
G1 X158.096 Y183.285 E3.51675
G1 X114.444 Y183.285 E1.25028
G1 X107.35 Y141.731 E1.20742
G1 X107.008 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.415 Y142.1 E.86581
G1 X74.415 Y60.104 E2.17814
G1 X158.495 Y60.104 E2.23351
G1 X158.495 Y183.684 E3.28279
G1 X114.108 Y183.684 E1.1791
G1 X107.018 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.018 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X109.186 Y135.761 Z14.68 F30000
G1 X157.205 Y62.078 Z14.68
G1 Z14.28
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.638896
G1 F12303.44
G1 X157.202 Y181.768 E4.99415
G1 X157.205 Y62.078 F30000
; LINE_WIDTH: 0.615931
G1 F12791.072
G1 X157.228 Y61.937 E.00577
; LINE_WIDTH: 0.569999
G1 F13892.28
G1 X157.251 Y61.795 E.00531
; LINE_WIDTH: 0.524068
G1 F15000
G1 X157.274 Y61.653 E.00485
; LINE_WIDTH: 0.464517
G2 X157.297 Y61.302 I-1.073 J-.246 E.01048
; LINE_WIDTH: 0.478137
G1 X157.103 Y61.325 E.00598
; LINE_WIDTH: 0.524069
G1 X156.909 Y61.348 E.0066
; LINE_WIDTH: 0.570002
G1 F13892.215
G1 X156.714 Y61.371 E.00722
; LINE_WIDTH: 0.615934
G1 F12790.995
G1 X156.52 Y61.394 E.00785
G1 X156.625 Y61.46 E.00498
; LINE_WIDTH: 0.570002
G1 F13892.215
G1 X156.73 Y61.527 E.00458
; LINE_WIDTH: 0.524069
G1 F15000
G1 X156.835 Y61.593 E.00419
; LINE_WIDTH: 0.478137
G1 X156.939 Y61.659 E.00379
; LINE_WIDTH: 0.478136
G1 X156.998 Y61.751 E.00334
; LINE_WIDTH: 0.524068
G1 X157.056 Y61.844 E.00368
; LINE_WIDTH: 0.569999
G1 F13892.28
G1 X157.115 Y61.936 E.00403
; LINE_WIDTH: 0.592965
G1 F13318.954
G1 X157.173 Y62.028 E.0042
G1 X76.27 Y61.399 F30000
; LINE_WIDTH: 0.638916
G1 F12303.042
G1 X156.46 Y61.394 E3.34609
G1 X75.705 Y62.078 F30000
; LINE_WIDTH: 0.615936
G1 F12790.953
G1 X75.771 Y61.974 E.00498
; LINE_WIDTH: 0.570003
G1 F13892.173
G1 X75.838 Y61.869 E.00458
; LINE_WIDTH: 0.52407
G1 F15000
G1 X75.904 Y61.764 E.00419
; LINE_WIDTH: 0.478138
G1 X75.97 Y61.659 E.00379
; LINE_WIDTH: 0.479434
G1 X76.045 Y61.594 E.00305
; LINE_WIDTH: 0.527961
G1 X76.12 Y61.529 E.00338
; LINE_WIDTH: 0.576487
G1 F13725.373
G1 X76.195 Y61.464 E.00371
; LINE_WIDTH: 0.625013
G1 F12593.671
G1 X76.27 Y61.399 E.00405
G1 X76.158 Y61.375 E.00467
; LINE_WIDTH: 0.576487
G1 F13725.373
G1 X76.046 Y61.35 E.00429
; LINE_WIDTH: 0.527961
G1 F15000
G1 X75.934 Y61.326 E.0039
; LINE_WIDTH: 0.463755
G2 X75.613 Y61.302 I-.217 J.73 E.00961
; LINE_WIDTH: 0.478138
G1 X75.634 Y61.481 E.00552
; LINE_WIDTH: 0.52407
G1 X75.656 Y61.66 E.0061
; LINE_WIDTH: 0.570003
G1 F13892.173
G1 X75.677 Y61.84 E.00667
; LINE_WIDTH: 0.59297
G1 F13318.839
G1 X75.698 Y62.019 E.00696
G1 X75.71 Y140.244 F30000
; LINE_WIDTH: 0.638918
G1 F12302.992
G1 X75.705 Y62.138 E3.25913
G1 X76.39 Y140.81 F30000
; LINE_WIDTH: 0.615934
G1 F12790.992
G1 X76.285 Y140.743 E.00498
; LINE_WIDTH: 0.570002
G1 F13892.206
G1 X76.18 Y140.677 E.00458
; LINE_WIDTH: 0.52407
G1 F15000
G1 X76.075 Y140.61 E.00419
; LINE_WIDTH: 0.478137
G1 X75.97 Y140.544 E.00379
; LINE_WIDTH: 0.479435
G1 X75.905 Y140.469 E.00305
; LINE_WIDTH: 0.527961
G1 X75.84 Y140.394 E.00338
; LINE_WIDTH: 0.576488
G1 F13725.34
G1 X75.775 Y140.319 E.00371
; LINE_WIDTH: 0.625015
G1 F12593.633
G1 X75.71 Y140.244 E.00405
G1 X75.686 Y140.356 E.00467
; LINE_WIDTH: 0.576488
G1 F13725.34
G1 X75.662 Y140.468 E.00429
; LINE_WIDTH: 0.527961
G1 F15000
G1 X75.637 Y140.58 E.0039
; LINE_WIDTH: 0.463755
G2 X75.613 Y140.901 I.73 J.217 E.00961
; LINE_WIDTH: 0.478137
G1 X75.792 Y140.88 E.00552
; LINE_WIDTH: 0.52407
G1 X75.972 Y140.859 E.0061
; LINE_WIDTH: 0.570002
G1 F13892.206
G1 X76.151 Y140.838 E.00667
; LINE_WIDTH: 0.592968
G1 F13318.875
G1 X76.33 Y140.817 E.00696
G1 X107.643 Y141.348 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X107.708 Y141.462 E.0035
G1 X114.781 Y182.887 E1.11633
G1 X157.698 Y182.887 E1.14006
G1 X157.698 Y60.901 E3.24044
G1 X75.212 Y60.901 E2.19116
G1 X75.212 Y141.303 E2.13579
G1 X107.519 Y141.303 E.8582
G1 X107.586 Y141.327 E.0019
G1 X107.519 Y140.81 F30000
; LINE_WIDTH: 0.638898
G1 F12303.4
G1 X76.45 Y140.81 E1.2964
G1 X108.185 Y140.705 F30000
; LINE_WIDTH: 0.42917
G1 F15000
G1 X108.02 Y140.705 E.00451
; LINE_WIDTH: 0.450143
G1 X107.919 Y140.726 E.00293
; LINE_WIDTH: 0.492089
G1 X107.819 Y140.747 E.00323
; LINE_WIDTH: 0.534034
G1 F14896.462
G1 X107.719 Y140.768 E.00352
; LINE_WIDTH: 0.57598
G1 F13738.271
G1 X107.619 Y140.789 E.00382
; LINE_WIDTH: 0.617926
G1 F12747.186
G1 X107.519 Y140.81 E.00412
G1 X107.594 Y140.858 E.00359
; LINE_WIDTH: 0.57598
G1 F13738.271
G1 X107.669 Y140.906 E.00333
; LINE_WIDTH: 0.534034
G1 F14896.462
G1 X107.743 Y140.955 E.00307
; LINE_WIDTH: 0.492089
G1 F15000
G1 X107.818 Y141.003 E.00281
; LINE_WIDTH: 0.450143
G1 X107.893 Y141.051 E.00255
; LINE_WIDTH: 0.450144
G1 X107.953 Y141.117 E.00255
; LINE_WIDTH: 0.492091
G1 X108.013 Y141.182 E.00281
; LINE_WIDTH: 0.534038
G1 F14896.343
G1 X108.074 Y141.248 E.00307
; LINE_WIDTH: 0.575985
G1 F13738.129
G1 X108.134 Y141.314 E.00333
; LINE_WIDTH: 0.617933
G1 F12747.028
G1 X108.194 Y141.379 E.00359
G1 X108.198 Y141.277 E.00412
; LINE_WIDTH: 0.575985
G1 F13738.129
G1 X108.202 Y141.175 E.00382
; LINE_WIDTH: 0.534038
G1 F14896.343
G1 X108.205 Y141.072 E.00352
; LINE_WIDTH: 0.492091
G1 F15000
G1 X108.209 Y140.97 E.00323
; LINE_WIDTH: 0.449803
G2 X108.195 Y140.764 I-.499 J-.07 E.00596
G1 X108.513 Y140.317 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X76.39 Y140.317 E.85332
G1 X76.254 Y140.26 E.0039
G1 X76.198 Y140.125 E.0039
G1 X76.198 Y62.078 E2.07323
G1 X76.254 Y61.943 E.0039
G1 X76.39 Y61.887 E.0039
G1 X156.52 Y61.887 E2.12859
G1 X156.656 Y61.943 E.0039
G1 X156.712 Y62.078 E.0039
G1 X156.712 Y181.709 E3.17787
G1 X156.656 Y181.845 E.0039
G3 X156.52 Y181.901 I-.136 J-.136 E.004
G1 X115.774 Y181.901 E1.08238
G1 X115.63 Y181.835 E.00422
G1 X115.585 Y181.741 E.00276
G1 X108.523 Y140.376 E1.11473
G1 X115.099 Y181.824 F30000
; LINE_WIDTH: 0.617318
G1 F12760.518
G1 X115.091 Y181.89 E.00265
; LINE_WIDTH: 0.574201
G1 F13783.712
G1 X115.083 Y181.955 E.00245
; LINE_WIDTH: 0.531085
G1 F14985.3
G1 X115.075 Y182.02 E.00226
; LINE_WIDTH: 0.487968
G1 F15000
G1 X115.068 Y182.086 E.00206
; LINE_WIDTH: 0.444851
G1 X115.06 Y182.151 E.00186
; LINE_WIDTH: 0.412112
G1 X115.052 Y182.217 E.00171
G1 X115.108 Y182.499 E.00748
G1 X115.274 Y182.499 E.00431
; LINE_WIDTH: 0.450135
G1 X115.374 Y182.478 E.00293
; LINE_WIDTH: 0.492083
G1 X115.474 Y182.457 E.00323
; LINE_WIDTH: 0.534031
G1 F14896.567
G1 X115.574 Y182.436 E.00352
; LINE_WIDTH: 0.575979
G1 F13738.304
G1 X115.674 Y182.415 E.00382
; LINE_WIDTH: 0.617926
G1 F12747.165
G1 X115.774 Y182.394 E.00412
G1 X115.699 Y182.345 E.00359
; LINE_WIDTH: 0.575979
G1 F13738.304
G1 X115.625 Y182.297 E.00333
; LINE_WIDTH: 0.534031
G1 F14896.567
G1 X115.55 Y182.249 E.00307
; LINE_WIDTH: 0.492083
G1 F15000
G1 X115.475 Y182.201 E.00281
; LINE_WIDTH: 0.450135
G1 X115.4 Y182.152 E.00255
; LINE_WIDTH: 0.450133
G1 X115.348 Y182.095 E.00221
; LINE_WIDTH: 0.492076
G1 X115.296 Y182.039 E.00243
; LINE_WIDTH: 0.534019
G1 F14896.927
G1 X115.244 Y181.982 E.00265
; LINE_WIDTH: 0.575962
G1 F13738.732
G1 X115.192 Y181.925 E.00288
; LINE_WIDTH: 0.596933
G1 F13224.644
G1 X115.14 Y181.868 E.00299
G1 X115.099 Y181.824 F30000
; LINE_WIDTH: 0.638876
G1 F12303.849
G1 X108.204 Y141.438 E1.70946
; WIPE_START
G1 F24000
G1 X108.541 Y143.41 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X114.47 Y148.215 Z14.68 F30000
M73 P96 R2
G1 X156.639 Y182.389 Z14.68
G1 Z14.28
G1 E.8 F1800
; LINE_WIDTH: 0.638931
G1 F12302.74
G1 X115.834 Y182.394 E1.70273
G1 X157.2 Y181.828 F30000
; LINE_WIDTH: 0.62501
G1 F12593.749
G1 X157.135 Y181.903 E.00405
; LINE_WIDTH: 0.576484
G1 F13725.445
G1 X157.07 Y181.978 E.00371
; LINE_WIDTH: 0.527959
G1 F15000
G1 X157.005 Y182.053 E.00338
; LINE_WIDTH: 0.479433
G1 X156.939 Y182.128 E.00305
; LINE_WIDTH: 0.479434
G1 X156.864 Y182.193 E.00305
; LINE_WIDTH: 0.52796
G1 X156.789 Y182.258 E.00338
; LINE_WIDTH: 0.576487
G1 F13725.382
G1 X156.714 Y182.324 E.00371
; LINE_WIDTH: 0.625013
G1 F12593.675
G1 X156.639 Y182.389 E.00405
G1 X156.751 Y182.413 E.00467
; LINE_WIDTH: 0.576487
G1 F13725.382
G1 X156.863 Y182.437 E.00429
; LINE_WIDTH: 0.52796
G1 F15000
G1 X156.975 Y182.461 E.0039
; LINE_WIDTH: 0.460385
G2 X157.297 Y182.486 I.217 J-.73 E.00953
G1 X157.297 Y182.276 E.00615
; LINE_WIDTH: 0.479433
G1 X157.276 Y182.179 E.00306
; LINE_WIDTH: 0.527959
G1 X157.255 Y182.082 E.00339
; LINE_WIDTH: 0.576484
G1 F13725.445
G1 X157.234 Y181.984 E.00373
; LINE_WIDTH: 0.600747
G1 F13135.267
G1 X157.213 Y181.887 E.00389
; CHANGE_LAYER
; Z_HEIGHT: 14.45
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X157.234 Y181.984 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 85/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L85
M991 S0 P84 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z14.68 I1.011 J-.678 P1  F30000
G1 X76.995 Y62.285 Z14.68
G1 Z14.45
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X156.314 Y62.285 E2.27184
G1 X156.314 Y181.502 E3.41461
G1 X115.949 Y181.502 E1.15613
G1 X108.849 Y139.918 E1.20829
G1 X76.597 Y139.918 E.92378
G1 X76.597 Y62.285 E2.22356
G1 X76.935 Y62.285 E.0097
G1 X76.995 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.915 Y62.684 E2.09644
G1 X155.915 Y181.104 E3.14572
G1 X116.285 Y181.104 E1.05274
G1 X109.185 Y139.52 E1.12063
G1 X76.995 Y139.52 E.8551
G1 X76.995 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.995 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.572 Y69.927 Z14.85 F30000
G1 X107.315 Y141.701 Z14.85
G1 Z14.45
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.814 Y141.701 E.93091
G1 X74.814 Y60.502 E2.3257
G1 X158.097 Y60.502 E2.38539
G1 X158.097 Y183.285 E3.51675
G1 X114.444 Y183.285 E1.25028
G1 X107.35 Y141.731 E1.20742
G1 X107.008 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.415 Y142.1 E.86581
G1 X74.415 Y60.104 E2.17814
G1 X158.495 Y60.104 E2.23351
G1 X158.495 Y183.684 E3.28279
G1 X114.108 Y183.684 E1.1791
G1 X107.019 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.019 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X109.186 Y135.761 Z14.85 F30000
G1 X157.205 Y62.078 Z14.85
G1 Z14.45
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.638898
G1 F12303.4
G1 X157.203 Y181.768 E4.99416
G1 X157.205 Y62.078 F30000
; LINE_WIDTH: 0.615932
G1 F12791.031
G1 X157.228 Y61.937 E.00577
; LINE_WIDTH: 0.570001
G1 F13892.238
G1 X157.251 Y61.795 E.00531
; LINE_WIDTH: 0.524069
G1 F15000
G1 X157.274 Y61.653 E.00485
; LINE_WIDTH: 0.464518
G2 X157.297 Y61.302 I-1.073 J-.246 E.01048
; LINE_WIDTH: 0.478137
G1 X157.103 Y61.325 E.00598
; LINE_WIDTH: 0.52407
G1 X156.909 Y61.348 E.0066
; LINE_WIDTH: 0.570002
G1 F13892.206
G1 X156.715 Y61.371 E.00722
; LINE_WIDTH: 0.615934
G1 F12790.992
G1 X156.52 Y61.394 E.00785
G1 X156.625 Y61.46 E.00498
; LINE_WIDTH: 0.570002
G1 F13892.206
G1 X156.73 Y61.527 E.00458
; LINE_WIDTH: 0.52407
G1 F15000
G1 X156.835 Y61.593 E.00419
; LINE_WIDTH: 0.478137
G1 X156.94 Y61.659 E.00379
; LINE_WIDTH: 0.478137
G1 X156.998 Y61.751 E.00334
; LINE_WIDTH: 0.524069
G1 X157.056 Y61.844 E.00368
; LINE_WIDTH: 0.570001
G1 F13892.238
G1 X157.115 Y61.936 E.00403
; LINE_WIDTH: 0.592967
G1 F13318.912
G1 X157.173 Y62.028 E.0042
G1 X76.271 Y61.399 F30000
; LINE_WIDTH: 0.638916
G1 F12303.042
G1 X156.46 Y61.394 E3.34609
G1 X75.705 Y62.078 F30000
; LINE_WIDTH: 0.615936
G1 F12790.953
G1 X75.771 Y61.974 E.00498
; LINE_WIDTH: 0.570003
G1 F13892.173
G1 X75.838 Y61.869 E.00458
; LINE_WIDTH: 0.52407
G1 F15000
G1 X75.904 Y61.764 E.00419
; LINE_WIDTH: 0.478138
G1 X75.971 Y61.659 E.00379
; LINE_WIDTH: 0.479434
G1 X76.046 Y61.594 E.00305
; LINE_WIDTH: 0.527961
G1 X76.121 Y61.529 E.00338
; LINE_WIDTH: 0.576487
G1 F13725.373
G1 X76.196 Y61.464 E.00371
; LINE_WIDTH: 0.625013
G1 F12593.671
G1 X76.271 Y61.399 E.00405
G1 X76.159 Y61.375 E.00467
; LINE_WIDTH: 0.576487
G1 F13725.373
G1 X76.047 Y61.35 E.00429
; LINE_WIDTH: 0.527961
G1 F15000
G1 X75.935 Y61.326 E.0039
; LINE_WIDTH: 0.463755
G2 X75.613 Y61.302 I-.217 J.73 E.00961
; LINE_WIDTH: 0.478138
G1 X75.634 Y61.481 E.00552
; LINE_WIDTH: 0.52407
G1 X75.656 Y61.66 E.0061
; LINE_WIDTH: 0.570003
G1 F13892.173
G1 X75.677 Y61.84 E.00667
; LINE_WIDTH: 0.59297
G1 F13318.839
G1 X75.698 Y62.019 E.00696
G1 X75.71 Y140.244 F30000
; LINE_WIDTH: 0.638918
G1 F12302.992
G1 X75.705 Y62.138 E3.25913
G1 X76.39 Y140.81 F30000
; LINE_WIDTH: 0.615934
G1 F12790.992
G1 X76.285 Y140.743 E.00498
; LINE_WIDTH: 0.570002
G1 F13892.206
G1 X76.18 Y140.677 E.00458
; LINE_WIDTH: 0.52407
G1 F15000
G1 X76.075 Y140.61 E.00419
; LINE_WIDTH: 0.478137
G1 X75.971 Y140.544 E.00379
; LINE_WIDTH: 0.479435
G1 X75.906 Y140.469 E.00305
; LINE_WIDTH: 0.527961
G1 X75.84 Y140.394 E.00338
; LINE_WIDTH: 0.576488
G1 F13725.34
G1 X75.775 Y140.319 E.00371
; LINE_WIDTH: 0.625015
G1 F12593.633
G1 X75.71 Y140.244 E.00405
G1 X75.686 Y140.356 E.00467
; LINE_WIDTH: 0.576488
G1 F13725.34
G1 X75.662 Y140.468 E.00429
; LINE_WIDTH: 0.527961
G1 F15000
G1 X75.638 Y140.58 E.0039
; LINE_WIDTH: 0.463755
G2 X75.613 Y140.901 I.73 J.217 E.00961
; LINE_WIDTH: 0.478137
G1 X75.792 Y140.88 E.00552
; LINE_WIDTH: 0.52407
G1 X75.972 Y140.859 E.0061
; LINE_WIDTH: 0.570002
G1 F13892.206
G1 X76.151 Y140.838 E.00667
; LINE_WIDTH: 0.592968
G1 F13318.875
G1 X76.33 Y140.817 E.00696
G1 X107.643 Y141.348 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X107.708 Y141.462 E.0035
G1 X114.781 Y182.887 E1.11633
G1 X157.698 Y182.887 E1.14006
G1 X157.698 Y60.901 E3.24044
G1 X75.212 Y60.901 E2.19116
G1 X75.212 Y141.303 E2.13579
G1 X107.519 Y141.303 E.8582
G1 X107.586 Y141.327 E.0019
G1 X107.519 Y140.81 F30000
; LINE_WIDTH: 0.638898
G1 F12303.4
G1 X76.45 Y140.81 E1.2964
G1 X108.185 Y140.705 F30000
; LINE_WIDTH: 0.42917
G1 F15000
G1 X108.02 Y140.705 E.00451
; LINE_WIDTH: 0.450143
G1 X107.92 Y140.726 E.00293
; LINE_WIDTH: 0.492089
G1 X107.82 Y140.747 E.00323
; LINE_WIDTH: 0.534034
G1 F14896.462
G1 X107.719 Y140.768 E.00352
; LINE_WIDTH: 0.57598
G1 F13738.271
G1 X107.619 Y140.789 E.00382
; LINE_WIDTH: 0.617926
G1 F12747.186
G1 X107.519 Y140.81 E.00412
G1 X107.594 Y140.858 E.00359
; LINE_WIDTH: 0.57598
G1 F13738.271
G1 X107.669 Y140.906 E.00333
; LINE_WIDTH: 0.534034
G1 F14896.462
G1 X107.744 Y140.955 E.00307
; LINE_WIDTH: 0.492089
G1 F15000
G1 X107.818 Y141.003 E.00281
; LINE_WIDTH: 0.450143
G1 X107.893 Y141.051 E.00255
; LINE_WIDTH: 0.450144
G1 X107.953 Y141.117 E.00255
; LINE_WIDTH: 0.492091
G1 X108.014 Y141.182 E.00281
; LINE_WIDTH: 0.534038
G1 F14896.343
G1 X108.074 Y141.248 E.00307
; LINE_WIDTH: 0.575985
G1 F13738.129
G1 X108.134 Y141.314 E.00333
; LINE_WIDTH: 0.617933
G1 F12747.028
G1 X108.194 Y141.379 E.00359
G1 X108.198 Y141.277 E.00412
; LINE_WIDTH: 0.575985
G1 F13738.129
G1 X108.202 Y141.175 E.00382
; LINE_WIDTH: 0.534038
G1 F14896.343
G1 X108.206 Y141.072 E.00352
; LINE_WIDTH: 0.492091
G1 F15000
G1 X108.209 Y140.97 E.00323
; LINE_WIDTH: 0.449803
G2 X108.195 Y140.764 I-.499 J-.07 E.00596
G1 X108.513 Y140.317 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X76.39 Y140.317 E.85332
G1 X76.254 Y140.26 E.0039
G1 X76.198 Y140.125 E.0039
G1 X76.198 Y62.078 E2.07323
G1 X76.254 Y61.943 E.0039
G1 X76.39 Y61.887 E.0039
G1 X156.52 Y61.887 E2.12859
G1 X156.656 Y61.943 E.0039
G1 X156.712 Y62.078 E.0039
G1 X156.712 Y181.709 E3.17787
G1 X156.656 Y181.845 E.0039
G3 X156.52 Y181.901 I-.136 J-.136 E.004
G1 X115.774 Y181.901 E1.08238
G1 X115.63 Y181.835 E.00422
G1 X115.585 Y181.741 E.00276
G1 X108.523 Y140.376 E1.11473
G1 X115.099 Y181.824 F30000
; LINE_WIDTH: 0.61732
G1 F12760.478
G1 X115.091 Y181.89 E.00265
; LINE_WIDTH: 0.574203
G1 F13783.674
G1 X115.084 Y181.955 E.00245
; LINE_WIDTH: 0.531086
G1 F14985.267
G1 X115.076 Y182.02 E.00226
; LINE_WIDTH: 0.487969
G1 F15000
G1 X115.068 Y182.086 E.00206
; LINE_WIDTH: 0.444852
G1 X115.06 Y182.151 E.00186
; LINE_WIDTH: 0.412112
G1 X115.052 Y182.217 E.00171
G1 X115.108 Y182.499 E.00748
G1 X115.274 Y182.499 E.00431
; LINE_WIDTH: 0.450135
G1 X115.374 Y182.478 E.00293
; LINE_WIDTH: 0.492083
G1 X115.474 Y182.457 E.00323
; LINE_WIDTH: 0.534031
G1 F14896.567
G1 X115.574 Y182.436 E.00352
; LINE_WIDTH: 0.575979
G1 F13738.304
G1 X115.674 Y182.415 E.00382
; LINE_WIDTH: 0.617926
G1 F12747.165
G1 X115.774 Y182.394 E.00412
G1 X115.7 Y182.345 E.00359
; LINE_WIDTH: 0.575979
G1 F13738.304
G1 X115.625 Y182.297 E.00333
; LINE_WIDTH: 0.534031
G1 F14896.567
G1 X115.55 Y182.249 E.00307
; LINE_WIDTH: 0.492083
G1 F15000
G1 X115.475 Y182.201 E.00281
; LINE_WIDTH: 0.450135
G1 X115.4 Y182.152 E.00255
; LINE_WIDTH: 0.450133
G1 X115.348 Y182.095 E.00221
; LINE_WIDTH: 0.492076
G1 X115.296 Y182.039 E.00243
; LINE_WIDTH: 0.53402
G1 F14896.897
G1 X115.244 Y181.982 E.00265
; LINE_WIDTH: 0.575963
G1 F13738.697
G1 X115.192 Y181.925 E.00288
; LINE_WIDTH: 0.596935
G1 F13224.604
G1 X115.14 Y181.868 E.00299
G1 X115.099 Y181.824 F30000
; LINE_WIDTH: 0.638878
G1 F12303.807
G1 X108.204 Y141.438 E1.70947
; WIPE_START
G1 F24000
G1 X108.541 Y143.41 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X114.471 Y148.215 Z14.85 F30000
G1 X156.64 Y182.389 Z14.85
G1 Z14.45
G1 E.8 F1800
; LINE_WIDTH: 0.638931
G1 F12302.74
G1 X115.834 Y182.394 E1.70273
G1 X157.2 Y181.828 F30000
; LINE_WIDTH: 0.625011
G1 F12593.709
G1 X157.135 Y181.903 E.00405
; LINE_WIDTH: 0.576486
G1 F13725.404
G1 X157.07 Y181.978 E.00371
; LINE_WIDTH: 0.52796
G1 F15000
G1 X157.005 Y182.053 E.00338
; LINE_WIDTH: 0.479434
G1 X156.94 Y182.128 E.00305
; LINE_WIDTH: 0.479434
G1 X156.865 Y182.193 E.00305
; LINE_WIDTH: 0.527961
G1 X156.79 Y182.258 E.00338
; LINE_WIDTH: 0.576487
G1 F13725.373
G1 X156.715 Y182.324 E.00371
; LINE_WIDTH: 0.625013
G1 F12593.671
G1 X156.64 Y182.389 E.00405
G1 X156.752 Y182.413 E.00467
; LINE_WIDTH: 0.576487
G1 F13725.373
G1 X156.864 Y182.437 E.00429
; LINE_WIDTH: 0.527961
G1 F15000
G1 X156.976 Y182.461 E.0039
; LINE_WIDTH: 0.460386
G2 X157.297 Y182.486 I.217 J-.73 E.00953
G1 X157.297 Y182.276 E.00615
; LINE_WIDTH: 0.479434
G1 X157.276 Y182.179 E.00306
; LINE_WIDTH: 0.52796
G1 X157.255 Y182.082 E.00339
; LINE_WIDTH: 0.576486
G1 F13725.404
G1 X157.234 Y181.984 E.00373
; LINE_WIDTH: 0.600749
G1 F13135.225
G1 X157.213 Y181.887 E.00389
; CHANGE_LAYER
; Z_HEIGHT: 14.62
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X157.234 Y181.984 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 86/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L86
M991 S0 P85 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z14.85 I1.011 J-.678 P1  F30000
G1 X76.995 Y62.285 Z14.85
G1 Z14.62
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X156.314 Y62.285 E2.27184
G1 X156.314 Y181.502 E3.41461
G1 X115.949 Y181.502 E1.15613
G1 X108.849 Y139.918 E1.20829
G1 X76.597 Y139.918 E.92378
G1 X76.597 Y62.285 E2.22356
G1 X76.935 Y62.285 E.0097
G1 X76.995 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.915 Y62.684 E2.09644
G1 X155.915 Y181.104 E3.14572
G1 X116.285 Y181.104 E1.05274
G1 X109.185 Y139.52 E1.12063
G1 X76.995 Y139.52 E.8551
G1 X76.995 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.995 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.572 Y69.927 Z15.02 F30000
G1 X107.315 Y141.701 Z15.02
G1 Z14.62
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.814 Y141.701 E.93091
G1 X74.814 Y60.502 E2.3257
G1 X158.097 Y60.502 E2.38539
G1 X158.097 Y183.285 E3.51675
G1 X114.445 Y183.285 E1.25028
G1 X107.35 Y141.731 E1.20742
G1 X107.009 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.415 Y142.1 E.86581
G1 X74.415 Y60.104 E2.17814
G1 X158.495 Y60.104 E2.23351
G1 X158.495 Y183.684 E3.28279
G1 X114.108 Y183.684 E1.1791
G1 X107.019 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.019 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X109.186 Y135.761 Z15.02 F30000
G1 X157.205 Y62.078 Z15.02
G1 Z14.62
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.638896
G1 F12303.44
G1 X157.203 Y181.768 E4.99415
G1 X157.205 Y62.078 F30000
; LINE_WIDTH: 0.615931
G1 F12791.072
G1 X157.228 Y61.937 E.00577
; LINE_WIDTH: 0.569999
G1 F13892.28
G1 X157.251 Y61.795 E.00531
; LINE_WIDTH: 0.524068
G1 F15000
G1 X157.274 Y61.653 E.00485
; LINE_WIDTH: 0.464517
G2 X157.297 Y61.302 I-1.073 J-.246 E.01048
; LINE_WIDTH: 0.478137
G1 X157.103 Y61.325 E.00598
; LINE_WIDTH: 0.524069
G1 X156.909 Y61.348 E.0066
; LINE_WIDTH: 0.570002
G1 F13892.215
G1 X156.715 Y61.371 E.00722
; LINE_WIDTH: 0.615934
G1 F12790.995
G1 X156.521 Y61.394 E.00785
G1 X156.625 Y61.46 E.00498
; LINE_WIDTH: 0.570002
G1 F13892.215
G1 X156.73 Y61.527 E.00458
; LINE_WIDTH: 0.524069
G1 F15000
G1 X156.835 Y61.593 E.00419
; LINE_WIDTH: 0.478137
G1 X156.94 Y61.659 E.00379
; LINE_WIDTH: 0.478136
G1 X156.998 Y61.751 E.00334
; LINE_WIDTH: 0.524068
G1 X157.056 Y61.844 E.00368
; LINE_WIDTH: 0.569999
G1 F13892.28
G1 X157.115 Y61.936 E.00403
; LINE_WIDTH: 0.592965
G1 F13318.954
G1 X157.173 Y62.028 E.0042
G1 X76.271 Y61.399 F30000
; LINE_WIDTH: 0.638916
G1 F12303.042
G1 X156.461 Y61.394 E3.34609
G1 X75.705 Y62.078 F30000
; LINE_WIDTH: 0.615936
G1 F12790.953
G1 X75.772 Y61.974 E.00498
; LINE_WIDTH: 0.570003
G1 F13892.173
G1 X75.838 Y61.869 E.00458
; LINE_WIDTH: 0.52407
G1 F15000
G1 X75.904 Y61.764 E.00419
; LINE_WIDTH: 0.478138
G1 X75.971 Y61.659 E.00379
; LINE_WIDTH: 0.479434
G1 X76.046 Y61.594 E.00305
; LINE_WIDTH: 0.527961
G1 X76.121 Y61.529 E.00338
; LINE_WIDTH: 0.576487
G1 F13725.373
G1 X76.196 Y61.464 E.00371
; LINE_WIDTH: 0.625013
G1 F12593.671
G1 X76.271 Y61.399 E.00405
G1 X76.159 Y61.375 E.00467
; LINE_WIDTH: 0.576487
G1 F13725.373
G1 X76.047 Y61.35 E.00429
; LINE_WIDTH: 0.527961
G1 F15000
G1 X75.935 Y61.326 E.0039
; LINE_WIDTH: 0.463755
G2 X75.613 Y61.302 I-.217 J.73 E.00961
; LINE_WIDTH: 0.478138
G1 X75.635 Y61.481 E.00552
; LINE_WIDTH: 0.52407
G1 X75.656 Y61.66 E.0061
; LINE_WIDTH: 0.570003
G1 F13892.173
G1 X75.677 Y61.84 E.00667
; LINE_WIDTH: 0.59297
G1 F13318.839
G1 X75.698 Y62.019 E.00696
G1 X75.71 Y140.244 F30000
; LINE_WIDTH: 0.638918
G1 F12302.992
G1 X75.705 Y62.138 E3.25913
G1 X76.39 Y140.81 F30000
; LINE_WIDTH: 0.615934
G1 F12790.992
G1 X76.285 Y140.743 E.00498
; LINE_WIDTH: 0.570002
G1 F13892.206
G1 X76.18 Y140.677 E.00458
; LINE_WIDTH: 0.52407
G1 F15000
G1 X76.076 Y140.61 E.00419
; LINE_WIDTH: 0.478137
G1 X75.971 Y140.544 E.00379
; LINE_WIDTH: 0.479435
G1 X75.906 Y140.469 E.00305
; LINE_WIDTH: 0.527961
G1 X75.841 Y140.394 E.00338
; LINE_WIDTH: 0.576488
G1 F13725.34
G1 X75.776 Y140.319 E.00371
; LINE_WIDTH: 0.625015
G1 F12593.633
G1 X75.71 Y140.244 E.00405
G1 X75.686 Y140.356 E.00467
; LINE_WIDTH: 0.576488
G1 F13725.34
G1 X75.662 Y140.468 E.00429
; LINE_WIDTH: 0.527961
G1 F15000
G1 X75.638 Y140.58 E.0039
; LINE_WIDTH: 0.463755
G2 X75.613 Y140.901 I.73 J.217 E.00961
; LINE_WIDTH: 0.478137
G1 X75.793 Y140.88 E.00552
; LINE_WIDTH: 0.52407
G1 X75.972 Y140.859 E.0061
; LINE_WIDTH: 0.570002
G1 F13892.206
G1 X76.151 Y140.838 E.00667
; LINE_WIDTH: 0.592968
G1 F13318.875
G1 X76.33 Y140.817 E.00696
G1 X107.643 Y141.348 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X107.708 Y141.462 E.0035
G1 X114.781 Y182.887 E1.11633
G1 X157.698 Y182.887 E1.14006
G1 X157.698 Y60.901 E3.24044
G1 X75.212 Y60.901 E2.19116
G1 X75.212 Y141.303 E2.13579
G1 X107.519 Y141.303 E.8582
G1 X107.587 Y141.327 E.0019
G1 X107.519 Y140.81 F30000
; LINE_WIDTH: 0.638898
G1 F12303.4
G1 X76.45 Y140.81 E1.2964
G1 X108.186 Y140.705 F30000
; LINE_WIDTH: 0.42917
G1 F15000
G1 X108.02 Y140.705 E.00451
; LINE_WIDTH: 0.450143
G1 X107.92 Y140.726 E.00293
; LINE_WIDTH: 0.492089
G1 X107.82 Y140.747 E.00323
; LINE_WIDTH: 0.534034
G1 F14896.462
G1 X107.72 Y140.768 E.00352
; LINE_WIDTH: 0.57598
G1 F13738.271
G1 X107.619 Y140.789 E.00382
; LINE_WIDTH: 0.617926
G1 F12747.186
G1 X107.519 Y140.81 E.00412
G1 X107.594 Y140.858 E.00359
; LINE_WIDTH: 0.57598
G1 F13738.271
G1 X107.669 Y140.906 E.00333
; LINE_WIDTH: 0.534034
G1 F14896.462
G1 X107.744 Y140.955 E.00307
; LINE_WIDTH: 0.492089
G1 F15000
G1 X107.818 Y141.003 E.00281
; LINE_WIDTH: 0.450143
G1 X107.893 Y141.051 E.00255
; LINE_WIDTH: 0.450144
G1 X107.953 Y141.117 E.00255
; LINE_WIDTH: 0.492091
G1 X108.014 Y141.182 E.00281
; LINE_WIDTH: 0.534038
G1 F14896.343
G1 X108.074 Y141.248 E.00307
; LINE_WIDTH: 0.575985
G1 F13738.129
G1 X108.134 Y141.314 E.00333
; LINE_WIDTH: 0.617933
G1 F12747.028
G1 X108.194 Y141.379 E.00359
G1 X108.198 Y141.277 E.00412
; LINE_WIDTH: 0.575985
G1 F13738.129
G1 X108.202 Y141.175 E.00382
; LINE_WIDTH: 0.534038
G1 F14896.343
G1 X108.206 Y141.072 E.00352
; LINE_WIDTH: 0.492091
G1 F15000
G1 X108.21 Y140.97 E.00323
; LINE_WIDTH: 0.449803
G2 X108.196 Y140.764 I-.499 J-.07 E.00596
G1 X108.513 Y140.317 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X76.39 Y140.317 E.85332
G1 X76.254 Y140.26 E.0039
G1 X76.198 Y140.125 E.0039
G1 X76.198 Y62.078 E2.07323
G1 X76.254 Y61.943 E.0039
G1 X76.39 Y61.887 E.0039
G1 X156.521 Y61.887 E2.12859
G1 X156.656 Y61.943 E.0039
G1 X156.712 Y62.078 E.0039
G1 X156.712 Y181.709 E3.17787
G1 X156.656 Y181.845 E.0039
G1 X156.521 Y181.901 E.0039
G1 X115.775 Y181.901 E1.08238
G1 X115.63 Y181.835 E.00422
G1 X115.586 Y181.741 E.00276
G1 X108.523 Y140.376 E1.11473
G1 X115.1 Y181.824 F30000
; LINE_WIDTH: 0.617318
G1 F12760.518
G1 X115.092 Y181.89 E.00265
; LINE_WIDTH: 0.574201
G1 F13783.712
G1 X115.084 Y181.955 E.00245
; LINE_WIDTH: 0.531085
G1 F14985.3
G1 X115.076 Y182.02 E.00226
; LINE_WIDTH: 0.487968
G1 F15000
G1 X115.068 Y182.086 E.00206
; LINE_WIDTH: 0.444851
G1 X115.06 Y182.151 E.00186
; LINE_WIDTH: 0.412112
G1 X115.052 Y182.217 E.00171
G1 X115.108 Y182.499 E.00748
G1 X115.274 Y182.499 E.00431
; LINE_WIDTH: 0.450135
G1 X115.374 Y182.478 E.00293
; LINE_WIDTH: 0.492083
G1 X115.474 Y182.457 E.00323
; LINE_WIDTH: 0.534031
G1 F14896.567
G1 X115.574 Y182.436 E.00352
; LINE_WIDTH: 0.575979
G1 F13738.304
G1 X115.674 Y182.415 E.00382
; LINE_WIDTH: 0.617926
G1 F12747.165
G1 X115.775 Y182.394 E.00412
G1 X115.7 Y182.345 E.00359
; LINE_WIDTH: 0.575979
G1 F13738.304
G1 X115.625 Y182.297 E.00333
; LINE_WIDTH: 0.534031
G1 F14896.567
G1 X115.55 Y182.249 E.00307
; LINE_WIDTH: 0.492083
G1 F15000
G1 X115.475 Y182.201 E.00281
; LINE_WIDTH: 0.450135
G1 X115.401 Y182.152 E.00255
; LINE_WIDTH: 0.450133
G1 X115.349 Y182.095 E.00221
; LINE_WIDTH: 0.492076
G1 X115.296 Y182.039 E.00243
; LINE_WIDTH: 0.534019
G1 F14896.927
G1 X115.244 Y181.982 E.00265
; LINE_WIDTH: 0.575962
G1 F13738.732
G1 X115.192 Y181.925 E.00288
; LINE_WIDTH: 0.596933
G1 F13224.644
G1 X115.14 Y181.868 E.00299
G1 X115.1 Y181.824 F30000
; LINE_WIDTH: 0.638876
G1 F12303.849
G1 X108.204 Y141.438 E1.70946
; WIPE_START
G1 F24000
G1 X108.541 Y143.41 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X114.471 Y148.215 Z15.02 F30000
M73 P96 R1
G1 X156.64 Y182.389 Z15.02
G1 Z14.62
G1 E.8 F1800
; LINE_WIDTH: 0.638931
G1 F12302.74
G1 X115.835 Y182.394 E1.70273
G1 X157.2 Y181.828 F30000
; LINE_WIDTH: 0.62501
G1 F12593.749
G1 X157.135 Y181.903 E.00405
; LINE_WIDTH: 0.576484
G1 F13725.445
G1 X157.07 Y181.978 E.00371
; LINE_WIDTH: 0.527959
G1 F15000
G1 X157.005 Y182.053 E.00338
; LINE_WIDTH: 0.479433
G1 X156.94 Y182.128 E.00305
; LINE_WIDTH: 0.479434
G1 X156.865 Y182.193 E.00305
; LINE_WIDTH: 0.52796
G1 X156.79 Y182.258 E.00338
; LINE_WIDTH: 0.576487
G1 F13725.382
G1 X156.715 Y182.324 E.00371
; LINE_WIDTH: 0.625013
G1 F12593.675
G1 X156.64 Y182.389 E.00405
G1 X156.752 Y182.413 E.00467
; LINE_WIDTH: 0.576487
G1 F13725.382
G1 X156.864 Y182.437 E.00429
; LINE_WIDTH: 0.52796
G1 F15000
G1 X156.976 Y182.461 E.0039
; LINE_WIDTH: 0.460385
G2 X157.297 Y182.486 I.217 J-.73 E.00953
G1 X157.297 Y182.276 E.00615
; LINE_WIDTH: 0.479433
G1 X157.276 Y182.179 E.00306
; LINE_WIDTH: 0.527959
G1 X157.255 Y182.082 E.00339
; LINE_WIDTH: 0.576484
G1 F13725.445
G1 X157.234 Y181.984 E.00373
; LINE_WIDTH: 0.600747
G1 F13135.267
G1 X157.213 Y181.887 E.00389
; CHANGE_LAYER
; Z_HEIGHT: 14.79
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X157.234 Y181.984 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 87/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L87
M991 S0 P86 ;notify layer change
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z15.02 I1.011 J-.678 P1  F30000
G1 X76.995 Y62.285 Z15.02
G1 Z14.79
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X156.314 Y62.285 E2.27184
G1 X156.314 Y181.502 E3.41461
G1 X115.949 Y181.502 E1.15613
G1 X108.849 Y139.918 E1.20829
G1 X76.597 Y139.918 E.92378
G1 X76.597 Y62.285 E2.22356
G1 X76.935 Y62.285 E.0097
G1 X76.995 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.915 Y62.684 E2.09644
G1 X155.915 Y181.104 E3.14572
G1 X116.285 Y181.104 E1.05274
G1 X109.186 Y139.52 E1.12063
G1 X76.995 Y139.52 E.8551
G1 X76.995 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.995 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.572 Y69.927 Z15.19 F30000
G1 X107.315 Y141.701 Z15.19
G1 Z14.79
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X74.814 Y141.701 E.93091
G1 X74.814 Y60.502 E2.3257
G1 X158.097 Y60.502 E2.38539
G1 X158.097 Y183.285 E3.51675
G1 X114.445 Y183.285 E1.25028
G1 X107.35 Y141.731 E1.20742
G1 X107.009 Y142.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X74.415 Y142.1 E.86581
G1 X74.415 Y60.104 E2.17814
G1 X158.495 Y60.104 E2.23351
G1 X158.495 Y183.684 E3.28279
G1 X114.109 Y183.684 E1.1791
G1 X107.019 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.019 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X109.186 Y135.761 Z15.19 F30000
G1 X157.205 Y62.078 Z15.19
G1 Z14.79
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.638896
G1 F12303.44
G1 X157.203 Y181.768 E4.99415
G1 X157.205 Y62.078 F30000
; LINE_WIDTH: 0.615931
G1 F12791.072
G1 X157.228 Y61.937 E.00577
; LINE_WIDTH: 0.569999
G1 F13892.28
G1 X157.251 Y61.795 E.00531
; LINE_WIDTH: 0.524068
G1 F15000
G1 X157.274 Y61.653 E.00485
; LINE_WIDTH: 0.464517
G2 X157.297 Y61.302 I-1.073 J-.246 E.01048
; LINE_WIDTH: 0.478137
G1 X157.103 Y61.325 E.00598
; LINE_WIDTH: 0.524069
G1 X156.909 Y61.348 E.0066
; LINE_WIDTH: 0.570002
G1 F13892.215
G1 X156.715 Y61.371 E.00722
; LINE_WIDTH: 0.615934
G1 F12790.995
G1 X156.521 Y61.394 E.00785
G1 X156.626 Y61.46 E.00498
; LINE_WIDTH: 0.570002
G1 F13892.215
G1 X156.73 Y61.527 E.00458
; LINE_WIDTH: 0.524069
G1 F15000
M73 P97 R1
G1 X156.835 Y61.593 E.00419
; LINE_WIDTH: 0.478137
G1 X156.94 Y61.659 E.00379
; LINE_WIDTH: 0.478136
G1 X156.998 Y61.751 E.00334
; LINE_WIDTH: 0.524068
G1 X157.057 Y61.844 E.00368
; LINE_WIDTH: 0.569999
G1 F13892.28
G1 X157.115 Y61.936 E.00403
; LINE_WIDTH: 0.592965
G1 F13318.954
G1 X157.173 Y62.028 E.0042
G1 X76.271 Y61.399 F30000
; LINE_WIDTH: 0.638916
G1 F12303.042
G1 X156.461 Y61.394 E3.34609
G1 X75.705 Y62.078 F30000
; LINE_WIDTH: 0.615936
G1 F12790.953
G1 X75.772 Y61.974 E.00498
; LINE_WIDTH: 0.570003
G1 F13892.173
G1 X75.838 Y61.869 E.00458
; LINE_WIDTH: 0.52407
G1 F15000
G1 X75.905 Y61.764 E.00419
; LINE_WIDTH: 0.478138
G1 X75.971 Y61.659 E.00379
; LINE_WIDTH: 0.479434
G1 X76.046 Y61.594 E.00305
; LINE_WIDTH: 0.527961
G1 X76.121 Y61.529 E.00338
; LINE_WIDTH: 0.576487
G1 F13725.373
G1 X76.196 Y61.464 E.00371
; LINE_WIDTH: 0.625013
G1 F12593.671
G1 X76.271 Y61.399 E.00405
G1 X76.159 Y61.375 E.00467
; LINE_WIDTH: 0.576487
G1 F13725.373
G1 X76.047 Y61.35 E.00429
; LINE_WIDTH: 0.527961
G1 F15000
G1 X75.935 Y61.326 E.0039
; LINE_WIDTH: 0.463755
G2 X75.614 Y61.302 I-.217 J.73 E.00961
; LINE_WIDTH: 0.478138
G1 X75.635 Y61.481 E.00552
; LINE_WIDTH: 0.52407
G1 X75.656 Y61.66 E.0061
; LINE_WIDTH: 0.570003
G1 F13892.173
G1 X75.677 Y61.84 E.00667
; LINE_WIDTH: 0.59297
G1 F13318.839
G1 X75.698 Y62.019 E.00696
G1 X75.711 Y140.244 F30000
; LINE_WIDTH: 0.638918
G1 F12302.992
G1 X75.705 Y62.138 E3.25913
G1 X76.39 Y140.81 F30000
; LINE_WIDTH: 0.615934
G1 F12790.992
G1 X76.285 Y140.743 E.00498
; LINE_WIDTH: 0.570002
G1 F13892.206
G1 X76.181 Y140.677 E.00458
; LINE_WIDTH: 0.52407
G1 F15000
G1 X76.076 Y140.61 E.00419
; LINE_WIDTH: 0.478137
G1 X75.971 Y140.544 E.00379
; LINE_WIDTH: 0.479435
G1 X75.906 Y140.469 E.00305
; LINE_WIDTH: 0.527961
G1 X75.841 Y140.394 E.00338
; LINE_WIDTH: 0.576488
G1 F13725.34
G1 X75.776 Y140.319 E.00371
; LINE_WIDTH: 0.625015
G1 F12593.633
G1 X75.711 Y140.244 E.00405
G1 X75.686 Y140.356 E.00467
; LINE_WIDTH: 0.576488
G1 F13725.34
G1 X75.662 Y140.468 E.00429
; LINE_WIDTH: 0.527961
G1 F15000
G1 X75.638 Y140.58 E.0039
; LINE_WIDTH: 0.463755
G2 X75.614 Y140.901 I.73 J.217 E.00961
; LINE_WIDTH: 0.478137
G1 X75.793 Y140.88 E.00552
; LINE_WIDTH: 0.52407
G1 X75.972 Y140.859 E.0061
; LINE_WIDTH: 0.570002
G1 F13892.206
G1 X76.151 Y140.838 E.00667
; LINE_WIDTH: 0.592968
G1 F13318.875
G1 X76.331 Y140.817 E.00696
G1 X107.643 Y141.348 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X107.708 Y141.462 E.0035
G1 X114.781 Y182.887 E1.11633
G1 X157.698 Y182.887 E1.14006
G1 X157.698 Y60.901 E3.24044
G1 X75.212 Y60.901 E2.19116
G1 X75.212 Y141.303 E2.13579
G1 X107.519 Y141.303 E.8582
G1 X107.587 Y141.327 E.0019
G1 X107.519 Y140.81 F30000
; LINE_WIDTH: 0.638898
G1 F12303.4
G1 X76.45 Y140.81 E1.2964
G1 X108.186 Y140.705 F30000
; LINE_WIDTH: 0.42917
G1 F15000
G1 X108.02 Y140.705 E.00451
; LINE_WIDTH: 0.450143
G1 X107.92 Y140.726 E.00293
; LINE_WIDTH: 0.492089
G1 X107.82 Y140.747 E.00323
; LINE_WIDTH: 0.534034
G1 F14896.462
G1 X107.72 Y140.768 E.00352
; LINE_WIDTH: 0.57598
G1 F13738.271
G1 X107.62 Y140.789 E.00382
; LINE_WIDTH: 0.617926
G1 F12747.186
G1 X107.519 Y140.81 E.00412
G1 X107.594 Y140.858 E.00359
; LINE_WIDTH: 0.57598
G1 F13738.271
G1 X107.669 Y140.906 E.00333
; LINE_WIDTH: 0.534034
G1 F14896.462
G1 X107.744 Y140.955 E.00307
; LINE_WIDTH: 0.492089
G1 F15000
G1 X107.819 Y141.003 E.00281
; LINE_WIDTH: 0.450143
G1 X107.893 Y141.051 E.00255
; LINE_WIDTH: 0.450144
G1 X107.954 Y141.117 E.00255
; LINE_WIDTH: 0.492091
G1 X108.014 Y141.182 E.00281
; LINE_WIDTH: 0.534038
G1 F14896.343
G1 X108.074 Y141.248 E.00307
; LINE_WIDTH: 0.575985
G1 F13738.129
G1 X108.134 Y141.314 E.00333
; LINE_WIDTH: 0.617933
G1 F12747.028
G1 X108.194 Y141.379 E.00359
G1 X108.198 Y141.277 E.00412
; LINE_WIDTH: 0.575985
G1 F13738.129
G1 X108.202 Y141.175 E.00382
; LINE_WIDTH: 0.534038
G1 F14896.343
G1 X108.206 Y141.072 E.00352
; LINE_WIDTH: 0.492091
G1 F15000
G1 X108.21 Y140.97 E.00323
; LINE_WIDTH: 0.449803
G2 X108.196 Y140.764 I-.499 J-.07 E.00596
G1 X108.513 Y140.317 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X76.39 Y140.317 E.85332
G1 X76.255 Y140.26 E.0039
G1 X76.198 Y140.125 E.0039
G1 X76.198 Y62.078 E2.07323
G1 X76.255 Y61.943 E.0039
G1 X76.39 Y61.887 E.0039
G1 X156.521 Y61.887 E2.12859
G1 X156.656 Y61.943 E.0039
G1 X156.712 Y62.078 E.0039
G1 X156.712 Y181.709 E3.17787
G1 X156.656 Y181.845 E.0039
G1 X156.521 Y181.901 E.0039
G1 X115.775 Y181.901 E1.08238
G1 X115.63 Y181.835 E.00422
G1 X115.586 Y181.741 E.00276
G1 X108.523 Y140.376 E1.11473
G1 X115.1 Y181.824 F30000
; LINE_WIDTH: 0.617318
G1 F12760.518
G1 X115.092 Y181.89 E.00265
; LINE_WIDTH: 0.574201
G1 F13783.712
G1 X115.084 Y181.955 E.00245
; LINE_WIDTH: 0.531085
G1 F14985.3
G1 X115.076 Y182.02 E.00226
; LINE_WIDTH: 0.487968
G1 F15000
G1 X115.068 Y182.086 E.00206
; LINE_WIDTH: 0.444851
G1 X115.06 Y182.151 E.00186
; LINE_WIDTH: 0.412112
G1 X115.052 Y182.217 E.00171
G1 X115.108 Y182.499 E.00748
G1 X115.274 Y182.499 E.00431
; LINE_WIDTH: 0.450135
G1 X115.374 Y182.478 E.00293
; LINE_WIDTH: 0.492083
G1 X115.474 Y182.457 E.00323
; LINE_WIDTH: 0.534031
G1 F14896.567
G1 X115.574 Y182.436 E.00352
; LINE_WIDTH: 0.575979
G1 F13738.304
G1 X115.675 Y182.415 E.00382
; LINE_WIDTH: 0.617926
G1 F12747.165
G1 X115.775 Y182.394 E.00412
G1 X115.7 Y182.345 E.00359
; LINE_WIDTH: 0.575979
G1 F13738.304
G1 X115.625 Y182.297 E.00333
; LINE_WIDTH: 0.534031
G1 F14896.567
G1 X115.55 Y182.249 E.00307
; LINE_WIDTH: 0.492083
G1 F15000
G1 X115.476 Y182.201 E.00281
; LINE_WIDTH: 0.450135
G1 X115.401 Y182.152 E.00255
; LINE_WIDTH: 0.450133
G1 X115.349 Y182.095 E.00221
; LINE_WIDTH: 0.492076
G1 X115.297 Y182.039 E.00243
; LINE_WIDTH: 0.534019
G1 F14896.927
G1 X115.244 Y181.982 E.00265
; LINE_WIDTH: 0.575962
G1 F13738.732
G1 X115.192 Y181.925 E.00288
; LINE_WIDTH: 0.596933
G1 F13224.644
G1 X115.14 Y181.868 E.00299
G1 X115.1 Y181.824 F30000
; LINE_WIDTH: 0.638876
G1 F12303.849
G1 X108.205 Y141.438 E1.70946
; WIPE_START
G1 F24000
G1 X108.541 Y143.41 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X114.471 Y148.215 Z15.19 F30000
G1 X156.64 Y182.389 Z15.19
G1 Z14.79
G1 E.8 F1800
; LINE_WIDTH: 0.638931
G1 F12302.74
G1 X115.835 Y182.394 E1.70273
G1 X157.2 Y181.828 F30000
; LINE_WIDTH: 0.62501
G1 F12593.749
G1 X157.135 Y181.903 E.00405
; LINE_WIDTH: 0.576484
G1 F13725.445
G1 X157.07 Y181.978 E.00371
; LINE_WIDTH: 0.527959
G1 F15000
G1 X157.005 Y182.053 E.00338
; LINE_WIDTH: 0.479433
G1 X156.94 Y182.128 E.00305
; LINE_WIDTH: 0.479434
G1 X156.865 Y182.193 E.00305
; LINE_WIDTH: 0.52796
G1 X156.79 Y182.258 E.00338
; LINE_WIDTH: 0.576487
G1 F13725.382
G1 X156.715 Y182.324 E.00371
; LINE_WIDTH: 0.625013
G1 F12593.675
G1 X156.64 Y182.389 E.00405
G1 X156.752 Y182.413 E.00467
; LINE_WIDTH: 0.576487
G1 F13725.382
G1 X156.864 Y182.437 E.00429
; LINE_WIDTH: 0.52796
G1 F15000
G1 X156.976 Y182.461 E.0039
; LINE_WIDTH: 0.460385
G2 X157.297 Y182.486 I.217 J-.73 E.00953
G1 X157.297 Y182.276 E.00615
; LINE_WIDTH: 0.479433
G1 X157.276 Y182.179 E.00306
; LINE_WIDTH: 0.527959
G1 X157.255 Y182.082 E.00339
; LINE_WIDTH: 0.576484
G1 F13725.445
G1 X157.234 Y181.984 E.00373
; LINE_WIDTH: 0.600747
G1 F13135.267
G1 X157.213 Y181.887 E.00389
; CHANGE_LAYER
; Z_HEIGHT: 14.96
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X157.234 Y181.984 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 88/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L88
M991 S0 P87 ;notify layer change
M106 S237.15
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z15.19 I1.011 J-.678 P1  F30000
G1 X76.996 Y62.285 Z15.19
G1 Z14.96
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F17923.694
G1 X76.597 Y62.285 E.01141
G1 X76.597 Y139.918 E2.22356
G1 X108.85 Y139.918 E.92378
G1 X115.118 Y176.632 E1.06678
G1 X114.241 Y176.707 E.02521
G1 X114.241 Y180.739 E.11551
G1 X114.014 Y180.758 E.00653
G1 X107.345 Y141.701 E1.13487
G1 X74.814 Y141.701 E.93176
G1 X74.814 Y60.502 E2.3257
G1 X114.24 Y60.502 E1.12925
G1 X114.241 Y61.407 E.02593
G1 X114.241 Y62.285 E.02514
G1 X77.056 Y62.285 E1.06506
G1 X76.996 Y62.684 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X155.916 Y62.684 E2.09644
G1 X155.916 Y181.104 E3.14572
G1 X116.286 Y181.104 E1.05274
G1 X109.186 Y139.52 E1.12063
G1 X76.996 Y139.52 E.8551
G1 X76.996 Y62.744 E2.03948
M204 S10000
; WIPE_START
G1 F24000
G1 X78.996 Y62.742 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.536 Y69.939 Z15.36 F30000
G1 X107.009 Y142.1 Z15.36
G1 Z14.96
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X74.416 Y142.1 E.86581
G1 X74.416 Y60.104 E2.17814
G1 X158.496 Y60.104 E2.23351
G1 X158.496 Y183.684 E3.28279
G1 X114.109 Y183.684 E1.1791
G1 X107.019 Y142.159 E1.11903
M204 S10000
; WIPE_START
G1 F24000
G1 X105.019 Y142.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X106.902 Y149.552 Z15.36 F30000
G1 X113.77 Y176.539 Z15.36
G1 Z14.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.474627
G1 F15000
G1 X113.797 Y176.852 E.00954
; LINE_WIDTH: 0.450618
G1 X113.823 Y177.165 E.00902
; LINE_WIDTH: 0.4026
G1 X113.85 Y177.478 E.00797
; LINE_WIDTH: 0.354582
G1 X113.876 Y177.792 E.00693
; LINE_WIDTH: 0.306564
G1 X113.903 Y178.105 E.00588
; LINE_WIDTH: 0.258546
G1 X113.93 Y178.418 E.00483
; LINE_WIDTH: 0.210528
G1 X113.956 Y178.731 E.00379
; LINE_WIDTH: 0.16251
G1 X113.983 Y179.044 E.00274
; LINE_WIDTH: 0.114492
G1 X114.009 Y179.358 E.0017
G1 X114.144 Y180.947 F30000
; LINE_WIDTH: 0.536284
G1 F14829.403
G1 X114.171 Y181.265 E.01102
; LINE_WIDTH: 0.513226
G1 F15000
G1 X114.198 Y181.582 E.01051
; LINE_WIDTH: 0.46711
G1 X114.225 Y181.899 E.00949
; LINE_WIDTH: 0.420995
G1 X114.251 Y182.216 E.00848
; LINE_WIDTH: 0.374879
G1 X114.278 Y182.533 E.00746
; LINE_WIDTH: 0.328763
G1 X114.305 Y182.85 E.00644
; LINE_WIDTH: 0.282647
G1 X114.332 Y183.167 E.00543
; LINE_WIDTH: 0.236531
G1 X114.359 Y183.485 E.00441
; WIPE_START
G1 F24000
G1 X114.332 Y183.167 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X121.964 Y183.116 Z15.36 F30000
G1 X158.285 Y182.873 Z15.36
G1 Z14.96
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.685 Y183.473 E.02254
G1 X157.142 Y183.473
G1 X158.285 Y182.33 E.04292
G1 X158.285 Y181.788
G1 X156.6 Y183.473 E.0633
G1 X156.057 Y183.473
G1 X158.285 Y181.246 E.08367
G1 X158.285 Y180.703
G1 X155.515 Y183.473 E.10405
G1 X154.973 Y183.473
G1 X158.285 Y180.161 E.12442
G1 X158.285 Y179.618
G1 X154.43 Y183.473 E.1448
G1 X153.888 Y183.473
G1 X156.046 Y181.315 E.08108
G1 X155.504 Y181.315
G1 X153.346 Y183.473 E.08108
G1 X152.803 Y183.473
G1 X154.961 Y181.315 E.08108
G1 X154.419 Y181.315
G1 X152.261 Y183.473 E.08108
G1 X151.718 Y183.473
G1 X153.877 Y181.315 E.08108
G1 X153.334 Y181.315
G1 X151.176 Y183.473 E.08108
G1 X150.634 Y183.473
G1 X152.792 Y181.315 E.08108
G1 X152.249 Y181.315
G1 X150.091 Y183.473 E.08108
G1 X149.549 Y183.473
G1 X151.707 Y181.315 E.08108
G1 X151.165 Y181.315
G1 X149.007 Y183.473 E.08108
G1 X148.464 Y183.473
G1 X150.622 Y181.315 E.08108
G1 X150.08 Y181.315
G1 X147.922 Y183.473 E.08108
G1 X147.379 Y183.473
G1 X149.538 Y181.315 E.08108
G1 X148.995 Y181.315
G1 X146.837 Y183.473 E.08108
G1 X146.295 Y183.473
G1 X148.453 Y181.315 E.08108
G1 X147.91 Y181.315
G1 X145.752 Y183.473 E.08108
G1 X145.21 Y183.473
G1 X147.368 Y181.315 E.08108
G1 X146.826 Y181.315
G1 X144.668 Y183.473 E.08108
G1 X144.125 Y183.473
G1 X146.283 Y181.315 E.08108
G1 X145.741 Y181.315
G1 X143.583 Y183.473 E.08108
G1 X143.04 Y183.473
G1 X145.199 Y181.315 E.08108
G1 X144.656 Y181.315
G1 X142.498 Y183.473 E.08108
G1 X141.956 Y183.473
G1 X144.114 Y181.315 E.08108
G1 X143.571 Y181.315
G1 X141.413 Y183.473 E.08108
G1 X140.871 Y183.473
G1 X143.029 Y181.315 E.08108
G1 X142.487 Y181.315
G1 X140.329 Y183.473 E.08108
G1 X139.786 Y183.473
G1 X141.944 Y181.315 E.08108
G1 X141.402 Y181.315
G1 X139.244 Y183.473 E.08108
G1 X138.701 Y183.473
G1 X140.86 Y181.315 E.08108
G1 X140.317 Y181.315
G1 X138.159 Y183.473 E.08108
G1 X137.617 Y183.473
G1 X139.775 Y181.315 E.08108
G1 X139.232 Y181.315
G1 X137.074 Y183.473 E.08108
G1 X136.532 Y183.473
G1 X138.69 Y181.315 E.08108
G1 X138.148 Y181.315
G1 X135.99 Y183.473 E.08108
G1 X135.447 Y183.473
G1 X137.605 Y181.315 E.08108
G1 X137.063 Y181.315
G1 X134.905 Y183.473 E.08108
G1 X134.362 Y183.473
G1 X136.521 Y181.315 E.08108
G1 X135.978 Y181.315
G1 X133.82 Y183.473 E.08108
G1 X133.278 Y183.473
G1 X135.436 Y181.315 E.08108
G1 X134.893 Y181.315
G1 X132.735 Y183.473 E.08108
G1 X132.193 Y183.473
G1 X134.351 Y181.315 E.08108
G1 X133.809 Y181.315
G1 X131.651 Y183.473 E.08108
G1 X131.108 Y183.473
G1 X133.266 Y181.315 E.08108
G1 X132.724 Y181.315
G1 X130.566 Y183.473 E.08108
G1 X130.023 Y183.473
G1 X132.182 Y181.315 E.08108
G1 X131.639 Y181.315
G1 X129.481 Y183.473 E.08108
G1 X128.939 Y183.473
G1 X131.097 Y181.315 E.08108
G1 X130.554 Y181.315
G1 X128.396 Y183.473 E.08108
G1 X127.854 Y183.473
G1 X130.012 Y181.315 E.08108
G1 X129.47 Y181.315
G1 X127.312 Y183.473 E.08108
G1 X126.769 Y183.473
G1 X128.927 Y181.315 E.08108
G1 X128.385 Y181.315
G1 X126.227 Y183.473 E.08108
G1 X125.684 Y183.473
G1 X127.843 Y181.315 E.08108
G1 X127.3 Y181.315
G1 X125.142 Y183.473 E.08108
G1 X124.6 Y183.473
G1 X126.758 Y181.315 E.08108
G1 X126.215 Y181.315
G1 X124.057 Y183.473 E.08108
G1 X123.515 Y183.473
G1 X125.673 Y181.315 E.08108
G1 X125.131 Y181.315
G1 X122.973 Y183.473 E.08108
G1 X122.43 Y183.473
G1 X124.588 Y181.315 E.08108
G1 X124.046 Y181.315
G1 X121.888 Y183.473 E.08108
G1 X121.345 Y183.473
G1 X123.504 Y181.315 E.08108
G1 X122.961 Y181.315
G1 X120.803 Y183.473 E.08108
G1 X120.261 Y183.473
G1 X122.419 Y181.315 E.08108
G1 X121.876 Y181.315
G1 X119.718 Y183.473 E.08108
G1 X119.176 Y183.473
G1 X121.334 Y181.315 E.08108
G1 X120.792 Y181.315
G1 X118.634 Y183.473 E.08108
G1 X118.091 Y183.473
G1 X120.249 Y181.315 E.08108
G1 X119.707 Y181.315
G1 X117.549 Y183.473 E.08108
G1 X117.006 Y183.473
G1 X119.165 Y181.315 E.08108
G1 X118.622 Y181.315
G1 X116.464 Y183.473 E.08108
G1 X115.922 Y183.473
G1 X118.08 Y181.315 E.08108
G1 X117.537 Y181.315
G1 X115.379 Y183.473 E.08108
G1 X114.837 Y183.473
G1 X116.995 Y181.315 E.08108
G1 X116.453 Y181.315
G1 X114.467 Y183.301 E.07461
G1 X114.467 Y182.758
G1 X116.079 Y181.146 E.06056
G1 X116 Y180.683
G1 X114.467 Y182.216 E.05759
G1 X114.467 Y181.674
G1 X115.921 Y180.22 E.05462
G1 X115.841 Y179.756
G1 X114.467 Y181.131 E.05165
G1 X114.467 Y180.589
G1 X115.762 Y179.293 E.04868
G1 X115.683 Y178.83
G1 X114.467 Y180.046 E.04571
G1 X114.467 Y179.504
G1 X115.604 Y178.367 E.04274
G1 X115.525 Y177.903
G1 X114.467 Y178.962 E.03976
G1 X114.467 Y178.419
G1 X115.446 Y177.44 E.03679
G1 X115.367 Y176.977
G1 X114.467 Y177.877 E.03382
G1 X114.467 Y177.335
G1 X114.926 Y176.875 E.01726
M204 S10000
; WIPE_START
G1 F24000
G1 X114.467 Y177.335 E-.24691
G1 X114.467 Y177.877 E-.2061
G1 X115.038 Y177.306 E-.30699
; WIPE_END
G1 E-.04 F1800
G1 X122.636 Y178.032 Z15.36 F30000
G1 X156.127 Y181.234 Z15.36
G1 Z14.96
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X158.285 Y179.076 E.08108
G1 X158.285 Y178.534
G1 X156.127 Y180.692 E.08108
G1 X156.127 Y180.149
G1 X158.285 Y177.991 E.08108
G1 X158.285 Y177.449
G1 X156.127 Y179.607 E.08108
G1 X156.127 Y179.065
G1 X158.285 Y176.907 E.08108
G1 X158.285 Y176.364
G1 X156.127 Y178.522 E.08108
G1 X156.127 Y177.98
G1 X158.285 Y175.822 E.08108
G1 X158.285 Y175.279
G1 X156.127 Y177.438 E.08108
G1 X156.127 Y176.895
G1 X158.285 Y174.737 E.08108
G1 X158.285 Y174.195
G1 X156.127 Y176.353 E.08108
G1 X156.127 Y175.81
G1 X158.285 Y173.652 E.08108
G1 X158.285 Y173.11
G1 X156.127 Y175.268 E.08108
G1 X156.127 Y174.726
G1 X158.285 Y172.568 E.08108
G1 X158.285 Y172.025
G1 X156.127 Y174.183 E.08108
G1 X156.127 Y173.641
G1 X158.285 Y171.483 E.08108
G1 X158.285 Y170.94
G1 X156.127 Y173.099 E.08108
G1 X156.127 Y172.556
G1 X158.285 Y170.398 E.08108
G1 X158.285 Y169.856
G1 X156.127 Y172.014 E.08108
G1 X156.127 Y171.471
G1 X158.285 Y169.313 E.08108
G1 X158.285 Y168.771
G1 X156.127 Y170.929 E.08108
G1 X156.127 Y170.387
G1 X158.285 Y168.229 E.08108
G1 X158.285 Y167.686
G1 X156.127 Y169.844 E.08108
G1 X156.127 Y169.302
G1 X158.285 Y167.144 E.08108
G1 X158.285 Y166.601
G1 X156.127 Y168.76 E.08108
G1 X156.127 Y168.217
G1 X158.285 Y166.059 E.08108
G1 X158.285 Y165.517
G1 X156.127 Y167.675 E.08108
G1 X156.127 Y167.132
G1 X158.285 Y164.974 E.08108
G1 X158.285 Y164.432
G1 X156.127 Y166.59 E.08108
G1 X156.127 Y166.048
G1 X158.285 Y163.89 E.08108
G1 X158.285 Y163.347
G1 X156.127 Y165.505 E.08108
G1 X156.127 Y164.963
G1 X158.285 Y162.805 E.08108
G1 X158.285 Y162.262
G1 X156.127 Y164.421 E.08108
G1 X156.127 Y163.878
G1 X158.285 Y161.72 E.08108
G1 X158.285 Y161.178
G1 X156.127 Y163.336 E.08108
G1 X156.127 Y162.793
G1 X158.285 Y160.635 E.08108
G1 X158.285 Y160.093
G1 X156.127 Y162.251 E.08107
G1 X156.127 Y161.709
G1 X158.285 Y159.551 E.08108
G1 X158.285 Y159.008
G1 X156.127 Y161.166 E.08108
G1 X156.127 Y160.624
G1 X158.285 Y158.466 E.08107
G1 X158.285 Y157.923
G1 X156.127 Y160.082 E.08108
G1 X156.127 Y159.539
G1 X158.285 Y157.381 E.08108
G1 X158.285 Y156.839
G1 X156.127 Y158.997 E.08108
G1 X156.127 Y158.454
G1 X158.285 Y156.296 E.08108
G1 X158.285 Y155.754
G1 X156.127 Y157.912 E.08107
G1 X156.127 Y157.37
G1 X158.285 Y155.212 E.08107
G1 X158.285 Y154.669
G1 X156.127 Y156.827 E.08107
G1 X156.127 Y156.285
G1 X158.285 Y154.127 E.08108
G1 X158.285 Y153.584
G1 X156.127 Y155.743 E.08108
G1 X156.127 Y155.2
G1 X158.285 Y153.042 E.08108
G1 X158.285 Y152.5
G1 X156.127 Y154.658 E.08108
G1 X156.127 Y154.115
G1 X158.285 Y151.957 E.08108
G1 X158.285 Y151.415
G1 X156.127 Y153.573 E.08108
G1 X156.127 Y153.031
G1 X158.285 Y150.873 E.08108
G1 X158.285 Y150.33
G1 X156.127 Y152.488 E.08108
G1 X156.127 Y151.946
G1 X158.285 Y149.788 E.08108
G1 X158.285 Y149.245
G1 X156.127 Y151.404 E.08108
G1 X156.127 Y150.861
G1 X158.285 Y148.703 E.08108
G1 X158.285 Y148.161
G1 X156.127 Y150.319 E.08108
G1 X156.127 Y149.776
G1 X158.285 Y147.618 E.08108
G1 X158.285 Y147.076
G1 X156.127 Y149.234 E.08108
G1 X156.127 Y148.692
G1 X158.285 Y146.534 E.08108
G1 X158.285 Y145.991
G1 X156.127 Y148.149 E.08108
G1 X156.127 Y147.607
G1 X158.285 Y145.449 E.08108
G1 X158.285 Y144.906
G1 X156.127 Y147.065 E.08108
G1 X156.127 Y146.522
G1 X158.285 Y144.364 E.08108
G1 X158.285 Y143.822
G1 X156.127 Y145.98 E.08108
G1 X156.127 Y145.437
G1 X158.285 Y143.279 E.08108
G1 X158.285 Y142.737
G1 X156.127 Y144.895 E.08108
G1 X156.127 Y144.353
G1 X158.285 Y142.195 E.08108
G1 X158.285 Y141.652
G1 X156.127 Y143.81 E.08108
G1 X156.127 Y143.268
G1 X158.285 Y141.11 E.08108
G1 X158.285 Y140.567
G1 X156.127 Y142.726 E.08108
G1 X156.127 Y142.183
G1 X158.285 Y140.025 E.08108
G1 X158.285 Y139.483
G1 X156.127 Y141.641 E.08108
G1 X156.127 Y141.098
G1 X158.285 Y138.94 E.08108
G1 X158.285 Y138.398
G1 X156.127 Y140.556 E.08108
G1 X156.127 Y140.014
G1 X158.285 Y137.856 E.08108
G1 X158.285 Y137.313
G1 X156.127 Y139.471 E.08108
G1 X156.127 Y138.929
G1 X158.285 Y136.771 E.08108
G1 X158.285 Y136.228
G1 X156.127 Y138.387 E.08108
G1 X156.127 Y137.844
G1 X158.285 Y135.686 E.08108
G1 X158.285 Y135.144
G1 X156.127 Y137.302 E.08108
G1 X156.127 Y136.759
G1 X158.285 Y134.601 E.08107
G1 X158.285 Y134.059
G1 X156.127 Y136.217 E.08108
G1 X156.127 Y135.675
G1 X158.285 Y133.517 E.08108
G1 X158.285 Y132.974
G1 X156.127 Y135.132 E.08108
G1 X156.127 Y134.59
G1 X158.285 Y132.432 E.08108
G1 X158.285 Y131.889
G1 X156.127 Y134.048 E.08108
G1 X156.127 Y133.505
G1 X158.285 Y131.347 E.08108
G1 X158.285 Y130.805
G1 X156.127 Y132.963 E.08108
G1 X156.127 Y132.42
G1 X158.285 Y130.262 E.08108
G1 X158.285 Y129.72
G1 X156.127 Y131.878 E.08108
G1 X156.127 Y131.336
G1 X158.285 Y129.178 E.08107
G1 X158.285 Y128.635
G1 X156.127 Y130.793 E.08108
G1 X156.127 Y130.251
G1 X158.285 Y128.093 E.08108
G1 X158.285 Y127.55
G1 X156.127 Y129.709 E.08108
G1 X156.127 Y129.166
G1 X158.285 Y127.008 E.08108
G1 X158.285 Y126.466
G1 X156.127 Y128.624 E.08108
G1 X156.127 Y128.081
G1 X158.285 Y125.923 E.08107
G1 X158.285 Y125.381
G1 X156.127 Y127.539 E.08107
G1 X156.127 Y126.997
G1 X158.285 Y124.839 E.08108
G1 X158.285 Y124.296
G1 X156.127 Y126.454 E.08108
G1 X156.127 Y125.912
G1 X158.285 Y123.754 E.08108
G1 X158.285 Y123.211
G1 X156.127 Y125.37 E.08108
G1 X156.127 Y124.827
G1 X158.285 Y122.669 E.08108
G1 X158.285 Y122.127
G1 X156.127 Y124.285 E.08108
G1 X156.127 Y123.742
G1 X158.285 Y121.584 E.08108
G1 X158.285 Y121.042
G1 X156.127 Y123.2 E.08108
G1 X156.127 Y122.658
G1 X158.285 Y120.5 E.08108
G1 X158.285 Y119.957
G1 X156.127 Y122.115 E.08108
G1 X156.127 Y121.573
G1 X158.285 Y119.415 E.08108
G1 X158.285 Y118.872
G1 X156.127 Y121.031 E.08108
G1 X156.127 Y120.488
G1 X158.285 Y118.33 E.08108
G1 X158.285 Y117.788
G1 X156.127 Y119.946 E.08108
G1 X156.127 Y119.403
G1 X158.285 Y117.245 E.08108
G1 X158.285 Y116.703
G1 X156.127 Y118.861 E.08108
G1 X156.127 Y118.319
G1 X158.285 Y116.161 E.08108
G1 X158.285 Y115.618
G1 X156.127 Y117.776 E.08108
G1 X156.127 Y117.234
G1 X158.285 Y115.076 E.08108
G1 X158.285 Y114.533
G1 X156.127 Y116.692 E.08108
G1 X156.127 Y116.149
G1 X158.285 Y113.991 E.08108
G1 X158.285 Y113.449
G1 X156.127 Y115.607 E.08108
G1 X156.127 Y115.064
G1 X158.285 Y112.906 E.08108
G1 X158.285 Y112.364
G1 X156.127 Y114.522 E.08108
G1 X156.127 Y113.98
G1 X158.285 Y111.822 E.08108
G1 X158.285 Y111.279
G1 X156.127 Y113.437 E.08108
G1 X156.127 Y112.895
G1 X158.285 Y110.737 E.08108
G1 X158.285 Y110.194
G1 X156.127 Y112.353 E.08108
M73 P98 R1
G1 X156.127 Y111.81
G1 X158.285 Y109.652 E.08108
G1 X158.285 Y109.11
G1 X156.127 Y111.268 E.08108
G1 X156.127 Y110.725
G1 X158.285 Y108.567 E.08108
G1 X158.285 Y108.025
G1 X156.127 Y110.183 E.08108
G1 X156.127 Y109.641
G1 X158.285 Y107.483 E.08108
G1 X158.285 Y106.94
G1 X156.127 Y109.098 E.08108
G1 X156.127 Y108.556
G1 X158.285 Y106.398 E.08108
G1 X158.285 Y105.855
G1 X156.127 Y108.014 E.08108
G1 X156.127 Y107.471
G1 X158.285 Y105.313 E.08108
G1 X158.285 Y104.771
G1 X156.127 Y106.929 E.08108
G1 X156.127 Y106.386
G1 X158.285 Y104.228 E.08108
G1 X158.285 Y103.686
G1 X156.127 Y105.844 E.08108
G1 X156.127 Y105.302
G1 X158.285 Y103.144 E.08108
G1 X158.285 Y102.601
G1 X156.127 Y104.759 E.08108
G1 X156.127 Y104.217
G1 X158.285 Y102.059 E.08108
G1 X158.285 Y101.516
G1 X156.127 Y103.675 E.08108
G1 X156.127 Y103.132
G1 X158.285 Y100.974 E.08108
G1 X158.285 Y100.432
G1 X156.127 Y102.59 E.08107
G1 X156.127 Y102.048
G1 X158.285 Y99.889 E.08107
G1 X158.285 Y99.347
G1 X156.127 Y101.505 E.08108
G1 X156.127 Y100.963
G1 X158.285 Y98.805 E.08108
G1 X158.285 Y98.262
G1 X156.127 Y100.42 E.08108
G1 X156.127 Y99.878
G1 X158.285 Y97.72 E.08108
G1 X158.285 Y97.177
G1 X156.127 Y99.336 E.08108
G1 X156.127 Y98.793
G1 X158.285 Y96.635 E.08108
G1 X158.285 Y96.093
G1 X156.127 Y98.251 E.08108
G1 X156.127 Y97.709
G1 X158.285 Y95.55 E.08108
G1 X158.285 Y95.008
G1 X156.127 Y97.166 E.08108
G1 X156.127 Y96.624
G1 X158.285 Y94.466 E.08108
G1 X158.285 Y93.923
G1 X156.127 Y96.081 E.08108
G1 X156.127 Y95.539
G1 X158.285 Y93.381 E.08108
G1 X158.285 Y92.838
G1 X156.127 Y94.997 E.08108
G1 X156.127 Y94.454
G1 X158.285 Y92.296 E.08108
G1 X158.285 Y91.754
G1 X156.127 Y93.912 E.08108
G1 X156.127 Y93.37
G1 X158.285 Y91.211 E.08108
G1 X158.285 Y90.669
G1 X156.127 Y92.827 E.08108
G1 X156.127 Y92.285
G1 X158.285 Y90.127 E.08108
G1 X158.285 Y89.584
G1 X156.127 Y91.742 E.08108
G1 X156.127 Y91.2
G1 X158.285 Y89.042 E.08108
G1 X158.285 Y88.499
G1 X156.127 Y90.658 E.08108
G1 X156.127 Y90.115
G1 X158.285 Y87.957 E.08108
G1 X158.285 Y87.415
G1 X156.127 Y89.573 E.08108
G1 X156.127 Y89.031
G1 X158.285 Y86.872 E.08108
G1 X158.285 Y86.33
G1 X156.127 Y88.488 E.08108
G1 X156.127 Y87.946
G1 X158.285 Y85.788 E.08108
G1 X158.285 Y85.245
G1 X156.127 Y87.403 E.08108
G1 X156.127 Y86.861
G1 X158.285 Y84.703 E.08108
G1 X158.285 Y84.16
G1 X156.127 Y86.319 E.08108
G1 X156.127 Y85.776
G1 X158.285 Y83.618 E.08108
G1 X158.285 Y83.076
G1 X156.127 Y85.234 E.08108
G1 X156.127 Y84.692
G1 X158.285 Y82.533 E.08108
G1 X158.285 Y81.991
G1 X156.127 Y84.149 E.08108
G1 X156.127 Y83.607
G1 X158.285 Y81.449 E.08108
G1 X158.285 Y80.906
G1 X156.127 Y83.064 E.08108
G1 X156.127 Y82.522
G1 X158.285 Y80.364 E.08108
G1 X158.285 Y79.822
G1 X156.127 Y81.98 E.08108
G1 X156.127 Y81.437
G1 X158.285 Y79.279 E.08108
G1 X158.285 Y78.737
G1 X156.127 Y80.895 E.08108
G1 X156.127 Y80.353
G1 X158.285 Y78.194 E.08108
G1 X158.285 Y77.652
G1 X156.127 Y79.81 E.08108
G1 X156.127 Y79.268
G1 X158.285 Y77.11 E.08108
G1 X158.285 Y76.567
G1 X156.127 Y78.725 E.08108
G1 X156.127 Y78.183
G1 X158.285 Y76.025 E.08108
G1 X158.285 Y75.483
G1 X156.127 Y77.641 E.08108
G1 X156.127 Y77.098
G1 X158.285 Y74.94 E.08108
G1 X158.285 Y74.398
G1 X156.127 Y76.556 E.08107
G1 X156.127 Y76.014
G1 X158.285 Y73.855 E.08108
G1 X158.285 Y73.313
G1 X156.127 Y75.471 E.08108
G1 X156.127 Y74.929
G1 X158.285 Y72.771 E.08108
G1 X158.285 Y72.228
G1 X156.127 Y74.386 E.08108
G1 X156.127 Y73.844
G1 X158.285 Y71.686 E.08108
G1 X158.285 Y71.144
G1 X156.127 Y73.302 E.08108
G1 X156.127 Y72.759
G1 X158.285 Y70.601 E.08107
G1 X158.285 Y70.059
G1 X156.127 Y72.217 E.08108
G1 X156.127 Y71.675
G1 X158.285 Y69.516 E.08108
G1 X158.285 Y68.974
G1 X156.127 Y71.132 E.08108
G1 X156.127 Y70.59
G1 X158.285 Y68.432 E.08108
G1 X158.285 Y67.889
G1 X156.127 Y70.047 E.08108
G1 X156.127 Y69.505
G1 X158.285 Y67.347 E.08108
G1 X158.285 Y66.805
G1 X156.127 Y68.963 E.08108
G1 X156.127 Y68.42
G1 X158.285 Y66.262 E.08108
G1 X158.285 Y65.72
G1 X156.127 Y67.878 E.08108
G1 X156.127 Y67.336
G1 X158.285 Y65.177 E.08108
G1 X158.285 Y64.635
G1 X156.127 Y66.793 E.08108
G1 X156.127 Y66.251
G1 X158.285 Y64.093 E.08108
G1 X158.285 Y63.55
G1 X156.127 Y65.708 E.08108
G1 X156.127 Y65.166
G1 X158.285 Y63.008 E.08108
G1 X158.285 Y62.466
G1 X156.127 Y64.624 E.08108
G1 X156.127 Y64.081
G1 X158.285 Y61.923 E.08108
G1 X158.285 Y61.381
G1 X156.127 Y63.539 E.08108
G1 X156.127 Y62.997
G1 X158.285 Y60.838 E.08108
G1 X158.266 Y60.315
G1 X156.108 Y62.473 E.08108
G1 X155.565 Y62.473
G1 X157.724 Y60.315 E.08108
G1 X157.181 Y60.315
G1 X155.023 Y62.473 E.08108
G1 X154.481 Y62.473
G1 X156.639 Y60.315 E.08108
G1 X156.096 Y60.315
G1 X153.938 Y62.473 E.08108
G1 X153.396 Y62.473
G1 X155.554 Y60.315 E.08108
G1 X155.012 Y60.315
G1 X152.854 Y62.473 E.08108
G1 X152.311 Y62.473
G1 X154.469 Y60.315 E.08108
G1 X153.927 Y60.315
G1 X151.769 Y62.473 E.08108
G1 X151.226 Y62.473
G1 X153.385 Y60.315 E.08108
G1 X152.842 Y60.315
G1 X150.684 Y62.473 E.08108
G1 X150.142 Y62.473
G1 X152.3 Y60.315 E.08108
G1 X151.757 Y60.315
G1 X149.599 Y62.473 E.08108
G1 X149.057 Y62.473
G1 X151.215 Y60.315 E.08108
G1 X150.673 Y60.315
G1 X148.515 Y62.473 E.08108
G1 X147.972 Y62.473
G1 X150.13 Y60.315 E.08108
G1 X149.588 Y60.315
G1 X147.43 Y62.473 E.08108
G1 X146.887 Y62.473
G1 X149.046 Y60.315 E.08108
G1 X148.503 Y60.315
G1 X146.345 Y62.473 E.08108
G1 X145.803 Y62.473
G1 X147.961 Y60.315 E.08108
G1 X147.418 Y60.315
G1 X145.26 Y62.473 E.08108
G1 X144.718 Y62.473
G1 X146.876 Y60.315 E.08108
G1 X146.334 Y60.315
G1 X144.176 Y62.473 E.08108
G1 X143.633 Y62.473
G1 X145.791 Y60.315 E.08108
G1 X145.249 Y60.315
G1 X143.091 Y62.473 E.08108
G1 X142.548 Y62.473
G1 X144.707 Y60.315 E.08108
G1 X144.164 Y60.315
G1 X142.006 Y62.473 E.08108
G1 X141.464 Y62.473
G1 X143.622 Y60.315 E.08108
G1 X143.079 Y60.315
G1 X140.921 Y62.473 E.08108
G1 X140.379 Y62.473
G1 X142.537 Y60.315 E.08108
G1 X141.995 Y60.315
G1 X139.837 Y62.473 E.08108
G1 X139.294 Y62.473
G1 X141.452 Y60.315 E.08108
G1 X140.91 Y60.315
G1 X138.752 Y62.473 E.08108
G1 X138.209 Y62.473
G1 X140.368 Y60.315 E.08108
G1 X139.825 Y60.315
G1 X137.667 Y62.473 E.08108
G1 X137.125 Y62.473
G1 X139.283 Y60.315 E.08108
G1 X138.74 Y60.315
G1 X136.582 Y62.473 E.08108
G1 X136.04 Y62.473
G1 X138.198 Y60.315 E.08108
G1 X137.656 Y60.315
G1 X135.498 Y62.473 E.08108
G1 X134.955 Y62.473
G1 X137.113 Y60.315 E.08108
G1 X136.571 Y60.315
G1 X134.413 Y62.473 E.08108
G1 X133.87 Y62.473
G1 X136.029 Y60.315 E.08108
G1 X135.486 Y60.315
G1 X133.328 Y62.473 E.08108
G1 X132.786 Y62.473
G1 X134.944 Y60.315 E.08108
G1 X134.401 Y60.315
G1 X132.243 Y62.473 E.08108
G1 X131.701 Y62.473
G1 X133.859 Y60.315 E.08108
G1 X133.317 Y60.315
G1 X131.159 Y62.473 E.08108
G1 X130.616 Y62.473
G1 X132.774 Y60.315 E.08108
G1 X132.232 Y60.315
G1 X130.074 Y62.473 E.08108
G1 X129.531 Y62.473
G1 X131.69 Y60.315 E.08108
G1 X131.147 Y60.315
G1 X128.989 Y62.473 E.08108
G1 X128.447 Y62.473
G1 X130.605 Y60.315 E.08108
G1 X130.062 Y60.315
G1 X127.904 Y62.473 E.08108
G1 X127.362 Y62.473
G1 X129.52 Y60.315 E.08108
G1 X128.978 Y60.315
G1 X126.82 Y62.473 E.08108
G1 X126.277 Y62.473
G1 X128.435 Y60.315 E.08108
G1 X127.893 Y60.315
G1 X125.735 Y62.473 E.08108
G1 X125.192 Y62.473
G1 X127.351 Y60.315 E.08108
G1 X126.808 Y60.315
G1 X124.65 Y62.473 E.08108
G1 X124.108 Y62.473
G1 X126.266 Y60.315 E.08108
G1 X125.723 Y60.315
G1 X123.565 Y62.473 E.08108
G1 X123.023 Y62.473
G1 X125.181 Y60.315 E.08108
G1 X124.639 Y60.315
G1 X122.481 Y62.473 E.08108
G1 X121.938 Y62.473
G1 X124.096 Y60.315 E.08108
G1 X123.554 Y60.315
G1 X121.396 Y62.473 E.08108
G1 X120.853 Y62.473
G1 X123.012 Y60.315 E.08108
G1 X122.469 Y60.315
G1 X120.311 Y62.473 E.08108
G1 X119.769 Y62.473
G1 X121.927 Y60.315 E.08108
G1 X121.384 Y60.315
G1 X119.226 Y62.473 E.08108
G1 X118.684 Y62.473
G1 X120.842 Y60.315 E.08108
G1 X120.3 Y60.315
G1 X118.142 Y62.473 E.08108
G1 X117.599 Y62.473
G1 X119.757 Y60.315 E.08108
G1 X119.215 Y60.315
G1 X117.057 Y62.473 E.08108
G1 X116.514 Y62.473
G1 X118.673 Y60.315 E.08108
G1 X118.13 Y60.315
G1 X115.972 Y62.473 E.08108
G1 X115.43 Y62.473
G1 X117.588 Y60.315 E.08108
G1 X117.045 Y60.315
G1 X114.887 Y62.473 E.08108
G1 X114.467 Y62.351
G1 X116.503 Y60.315 E.0765
G1 X115.961 Y60.315
G1 X114.467 Y61.809 E.05613
G1 X114.467 Y61.266
G1 X115.418 Y60.315 E.03576
G1 X114.876 Y60.315
G1 X114.466 Y60.724 E.01539
M204 S10000
; WIPE_START
G1 F24000
G1 X114.876 Y60.315 E-.2201
G1 X115.418 Y60.315 E-.2061
G1 X114.797 Y60.936 E-.3338
; WIPE_END
G1 E-.04 F1800
G1 X114.799 Y68.568 Z15.36 F30000
G1 X114.823 Y183.459 Z15.36
G1 Z14.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.101754
G1 F15000
G1 X114.447 Y183.459 E.0017
; WIPE_START
G1 F24000
G1 X114.823 Y183.459 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X114.731 Y175.827 Z15.36 F30000
M73 P98 R0
G1 X113.349 Y61.394 Z15.36
G1 Z14.96
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.6389
G1 F12303.358
G1 X76.331 Y61.396 E1.54462
G1 X75.706 Y62.078 F30000
; LINE_WIDTH: 0.615936
G1 F12790.953
G1 X75.772 Y61.974 E.00498
; LINE_WIDTH: 0.570003
G1 F13892.173
G1 X75.838 Y61.869 E.00458
; LINE_WIDTH: 0.52407
G1 F15000
G1 X75.905 Y61.764 E.00419
; LINE_WIDTH: 0.478138
G1 X75.971 Y61.659 E.00379
; LINE_WIDTH: 0.479434
G1 X76.046 Y61.594 E.00305
; LINE_WIDTH: 0.527961
G1 X76.121 Y61.529 E.00338
; LINE_WIDTH: 0.576487
G1 F13725.373
G1 X76.196 Y61.464 E.00371
; LINE_WIDTH: 0.625013
G1 F12593.671
G1 X76.271 Y61.399 E.00405
G1 X76.159 Y61.375 E.00467
; LINE_WIDTH: 0.576487
G1 F13725.373
G1 X76.047 Y61.35 E.00429
; LINE_WIDTH: 0.527961
G1 F15000
G1 X75.935 Y61.326 E.0039
; LINE_WIDTH: 0.463755
G2 X75.614 Y61.302 I-.217 J.73 E.00961
; LINE_WIDTH: 0.478138
G1 X75.635 Y61.481 E.00552
; LINE_WIDTH: 0.52407
G1 X75.656 Y61.66 E.0061
; LINE_WIDTH: 0.570003
G1 F13892.173
G1 X75.677 Y61.84 E.00667
; LINE_WIDTH: 0.59297
G1 F13318.839
G1 X75.698 Y62.019 E.00696
G1 X75.706 Y62.078 F30000
; LINE_WIDTH: 0.638902
G1 F12303.318
G1 X75.708 Y140.184 E3.25905
G1 X76.39 Y140.81 F30000
; LINE_WIDTH: 0.6389
G1 F12303.358
G1 X107.46 Y140.81 E1.2964
G1 X76.39 Y140.81 F30000
; LINE_WIDTH: 0.615934
G1 F12790.992
G1 X76.285 Y140.743 E.00498
; LINE_WIDTH: 0.570002
G1 F13892.206
G1 X76.181 Y140.677 E.00458
; LINE_WIDTH: 0.52407
G1 F15000
G1 X76.076 Y140.61 E.00419
; LINE_WIDTH: 0.478137
G1 X75.971 Y140.544 E.00379
; LINE_WIDTH: 0.479435
G1 X75.906 Y140.469 E.00305
; LINE_WIDTH: 0.527961
G1 X75.841 Y140.394 E.00338
; LINE_WIDTH: 0.576488
G1 F13725.34
G1 X75.776 Y140.319 E.00371
; LINE_WIDTH: 0.625015
G1 F12593.633
G1 X75.711 Y140.244 E.00405
G1 X75.686 Y140.356 E.00467
; LINE_WIDTH: 0.576488
G1 F13725.34
G1 X75.662 Y140.468 E.00429
; LINE_WIDTH: 0.527961
G1 F15000
G1 X75.638 Y140.58 E.0039
; LINE_WIDTH: 0.463755
G2 X75.614 Y140.901 I.73 J.217 E.00961
; LINE_WIDTH: 0.478137
G1 X75.793 Y140.88 E.00552
; LINE_WIDTH: 0.52407
G1 X75.972 Y140.859 E.0061
; LINE_WIDTH: 0.570002
G1 F13892.206
G1 X76.151 Y140.838 E.00667
; LINE_WIDTH: 0.592968
G1 F13318.875
G1 X76.331 Y140.817 E.00696
G1 X108.195 Y141.379 F30000
; LINE_WIDTH: 0.638906
G1 F12303.235
G1 X114.031 Y175.562 E1.44698
G1 X108.186 Y140.705 F30000
; LINE_WIDTH: 0.42917
G1 F15000
G1 X108.02 Y140.705 E.00451
; LINE_WIDTH: 0.450143
G1 X107.92 Y140.726 E.00293
; LINE_WIDTH: 0.492089
G1 X107.82 Y140.747 E.00323
; LINE_WIDTH: 0.534034
G1 F14896.462
G1 X107.72 Y140.768 E.00352
; LINE_WIDTH: 0.57598
G1 F13738.271
G1 X107.62 Y140.789 E.00382
; LINE_WIDTH: 0.617926
G1 F12747.186
G1 X107.52 Y140.81 E.00412
G1 X107.594 Y140.858 E.00359
; LINE_WIDTH: 0.57598
G1 F13738.271
G1 X107.669 Y140.906 E.00333
; LINE_WIDTH: 0.534034
G1 F14896.462
G1 X107.744 Y140.955 E.00307
; LINE_WIDTH: 0.492089
G1 F15000
G1 X107.819 Y141.003 E.00281
; LINE_WIDTH: 0.450143
G1 X107.894 Y141.051 E.00255
; LINE_WIDTH: 0.450144
G1 X107.954 Y141.117 E.00255
; LINE_WIDTH: 0.492091
G1 X108.014 Y141.182 E.00281
; LINE_WIDTH: 0.534038
G1 F14896.343
G1 X108.074 Y141.248 E.00307
; LINE_WIDTH: 0.575985
G1 F13738.129
G1 X108.134 Y141.314 E.00333
; LINE_WIDTH: 0.617933
G1 F12747.028
G1 X108.195 Y141.379 E.00359
G1 X108.198 Y141.277 E.00412
; LINE_WIDTH: 0.575985
G1 F13738.129
G1 X108.202 Y141.175 E.00382
; LINE_WIDTH: 0.534038
G1 F14896.343
G1 X108.206 Y141.072 E.00352
; LINE_WIDTH: 0.492091
G1 F15000
G1 X108.21 Y140.97 E.00323
; LINE_WIDTH: 0.449803
G2 X108.196 Y140.764 I-.499 J-.07 E.00596
G1 X108.513 Y140.317 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X76.39 Y140.317 E.85332
G1 X76.255 Y140.26 E.0039
G1 X76.199 Y140.125 E.0039
G1 X76.199 Y62.078 E2.07323
G1 X76.255 Y61.943 E.0039
G1 X76.39 Y61.887 E.0039
G1 X113.842 Y61.887 E.99487
G1 X113.842 Y60.901 E.02619
G1 X75.213 Y60.901 E1.02615
G1 X75.213 Y141.303 E2.13579
G1 X107.52 Y141.303 E.8582
G3 X107.709 Y141.462 I0 J.192 E.00714
G1 X113.631 Y176.151 E.9348
G1 X114.179 Y176.104 E.01461
G1 X114.254 Y176.167 E.00259
G1 X114.575 Y175.818 E.0126
G1 X108.523 Y140.376 E.95511
; CHANGE_LAYER
; Z_HEIGHT: 15.13
; LAYER_HEIGHT: 0.17
; WIPE_START
G1 F24000
G1 X108.86 Y142.347 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
; layer num/total_layer_count: 89/89
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L89
M991 S0 P88 ;notify layer change
M106 S252.45
; start printing object, unique label id: 164
M624 AQAAAAAAAAA=
G17
G3 Z15.36 I1.13 J-.452 P1  F30000
G1 X76.996 Y62.684 Z15.36
G1 Z15.13
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X76.996 Y139.52 E2.04107
G1 X109.186 Y139.52 E.8551
G1 X115.115 Y174.25 E.93593
G1 X115.116 Y183.684 E.2506
G1 X114.109 Y183.684 E.02674
G1 X107.009 Y142.1 E1.12063
G1 X74.416 Y142.1 E.86581
G1 X74.416 Y60.104 E2.17814
G1 X115.115 Y60.104 E1.08114
G1 X115.115 Y61.407 E.03463
G1 X115.116 Y62.684 E.03391
G1 X77.056 Y62.684 E1.01103
M204 S10000
; WIPE_START
G1 F24000
G1 X77.054 Y64.684 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X84.649 Y63.929 Z15.53 F30000
G1 X114.904 Y60.925 Z15.53
G1 Z15.13
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X114.295 Y60.315 E.02291
G1 X113.752 Y60.315
G1 X114.905 Y61.467 E.04329
G1 X114.905 Y62.01
G1 X113.21 Y60.315 E.06367
G1 X112.667 Y60.315
G1 X114.826 Y62.473 E.08108
G1 X114.283 Y62.473
G1 X112.125 Y60.315 E.08108
G1 X111.583 Y60.315
G1 X113.741 Y62.473 E.08108
G1 X113.198 Y62.473
G1 X111.04 Y60.315 E.08108
G1 X110.498 Y60.315
G1 X112.656 Y62.473 E.08108
G1 X112.114 Y62.473
G1 X109.956 Y60.315 E.08108
G1 X109.413 Y60.315
G1 X111.571 Y62.473 E.08108
G1 X111.029 Y62.473
G1 X108.871 Y60.315 E.08108
G1 X108.328 Y60.315
G1 X110.487 Y62.473 E.08108
G1 X109.944 Y62.473
G1 X107.786 Y60.315 E.08108
G1 X107.244 Y60.315
G1 X109.402 Y62.473 E.08108
G1 X108.859 Y62.473
G1 X106.701 Y60.315 E.08108
G1 X106.159 Y60.315
G1 X108.317 Y62.473 E.08108
G1 X107.775 Y62.473
G1 X105.617 Y60.315 E.08108
G1 X105.074 Y60.315
G1 X107.232 Y62.473 E.08108
G1 X106.69 Y62.473
G1 X104.532 Y60.315 E.08108
G1 X103.989 Y60.315
G1 X106.148 Y62.473 E.08108
G1 X105.605 Y62.473
G1 X103.447 Y60.315 E.08108
G1 X102.905 Y60.315
G1 X105.063 Y62.473 E.08108
G1 X104.52 Y62.473
G1 X102.362 Y60.315 E.08108
G1 X101.82 Y60.315
G1 X103.978 Y62.473 E.08108
G1 X103.436 Y62.473
G1 X101.278 Y60.315 E.08108
G1 X100.735 Y60.315
G1 X102.893 Y62.473 E.08108
G1 X102.351 Y62.473
G1 X100.193 Y60.315 E.08108
G1 X99.65 Y60.315
G1 X101.809 Y62.473 E.08108
G1 X101.266 Y62.473
G1 X99.108 Y60.315 E.08108
G1 X98.566 Y60.315
G1 X100.724 Y62.473 E.08108
G1 X100.181 Y62.473
G1 X98.023 Y60.315 E.08108
G1 X97.481 Y60.315
G1 X99.639 Y62.473 E.08108
G1 X99.097 Y62.473
G1 X96.939 Y60.315 E.08108
G1 X96.396 Y60.315
G1 X98.554 Y62.473 E.08108
G1 X98.012 Y62.473
G1 X95.854 Y60.315 E.08108
G1 X95.311 Y60.315
G1 X97.47 Y62.473 E.08108
G1 X96.927 Y62.473
G1 X94.769 Y60.315 E.08108
G1 X94.227 Y60.315
G1 X96.385 Y62.473 E.08108
G1 X95.842 Y62.473
G1 X93.684 Y60.315 E.08108
G1 X93.142 Y60.315
G1 X95.3 Y62.473 E.08108
G1 X94.758 Y62.473
G1 X92.6 Y60.315 E.08108
G1 X92.057 Y60.315
G1 X94.215 Y62.473 E.08108
G1 X93.673 Y62.473
G1 X91.515 Y60.315 E.08108
G1 X90.972 Y60.315
G1 X93.131 Y62.473 E.08108
G1 X92.588 Y62.473
G1 X90.43 Y60.315 E.08108
G1 X89.888 Y60.315
G1 X92.046 Y62.473 E.08108
G1 X91.503 Y62.473
G1 X89.345 Y60.315 E.08108
G1 X88.803 Y60.315
G1 X90.961 Y62.473 E.08108
G1 X90.419 Y62.473
G1 X88.261 Y60.315 E.08108
G1 X87.718 Y60.315
G1 X89.876 Y62.473 E.08108
G1 X89.334 Y62.473
G1 X87.176 Y60.315 E.08108
G1 X86.633 Y60.315
G1 X88.792 Y62.473 E.08108
G1 X88.249 Y62.473
G1 X86.091 Y60.315 E.08108
G1 X85.549 Y60.315
G1 X87.707 Y62.473 E.08108
G1 X87.164 Y62.473
G1 X85.006 Y60.315 E.08108
G1 X84.464 Y60.315
G1 X86.622 Y62.473 E.08108
G1 X86.08 Y62.473
G1 X83.922 Y60.315 E.08108
G1 X83.379 Y60.315
G1 X85.537 Y62.473 E.08108
G1 X84.995 Y62.473
G1 X82.837 Y60.315 E.08108
G1 X82.294 Y60.315
G1 X84.453 Y62.473 E.08108
G1 X83.91 Y62.473
G1 X81.752 Y60.315 E.08108
G1 X81.21 Y60.315
G1 X83.368 Y62.473 E.08108
G1 X82.825 Y62.473
G1 X80.667 Y60.315 E.08108
G1 X80.125 Y60.315
G1 X82.283 Y62.473 E.08108
G1 X81.741 Y62.473
G1 X79.583 Y60.315 E.08108
G1 X79.04 Y60.315
G1 X81.198 Y62.473 E.08108
G1 X80.656 Y62.473
G1 X78.498 Y60.315 E.08108
G1 X77.955 Y60.315
G1 X80.114 Y62.473 E.08108
G1 X79.571 Y62.473
G1 X77.413 Y60.315 E.08108
G1 X76.871 Y60.315
G1 X79.029 Y62.473 E.08108
G1 X78.486 Y62.473
G1 X76.328 Y60.315 E.08108
G1 X75.786 Y60.315
G1 X77.944 Y62.473 E.08108
G1 X77.402 Y62.473
G1 X75.244 Y60.315 E.08108
G1 X74.701 Y60.315
G1 X76.859 Y62.473 E.08108
G1 X76.785 Y62.941
G1 X74.627 Y60.783 E.08108
G1 X74.627 Y61.325
G1 X76.785 Y63.483 E.08108
G1 X76.785 Y64.025
G1 X74.627 Y61.867 E.08108
G1 X74.627 Y62.41
G1 X76.785 Y64.568 E.08108
G1 X76.785 Y65.11
G1 X74.627 Y62.952 E.08108
G1 X74.627 Y63.494
G1 X76.785 Y65.653 E.08108
G1 X76.785 Y66.195
G1 X74.627 Y64.037 E.08108
G1 X74.627 Y64.579
G1 X76.785 Y66.737 E.08108
G1 X76.785 Y67.28
G1 X74.627 Y65.122 E.08108
G1 X74.627 Y65.664
G1 X76.785 Y67.822 E.08108
G1 X76.785 Y68.364
G1 X74.627 Y66.206 E.08108
G1 X74.627 Y66.749
G1 X76.785 Y68.907 E.08108
G1 X76.785 Y69.449
G1 X74.627 Y67.291 E.08108
G1 X74.627 Y67.833
G1 X76.785 Y69.992 E.08108
G1 X76.785 Y70.534
G1 X74.627 Y68.376 E.08108
G1 X74.627 Y68.918
G1 X76.785 Y71.076 E.08108
G1 X76.785 Y71.619
G1 X74.627 Y69.461 E.08108
G1 X74.627 Y70.003
G1 X76.785 Y72.161 E.08108
G1 X76.785 Y72.703
G1 X74.627 Y70.545 E.08108
G1 X74.627 Y71.088
G1 X76.785 Y73.246 E.08108
G1 X76.785 Y73.788
G1 X74.627 Y71.63 E.08108
G1 X74.627 Y72.172
G1 X76.785 Y74.331 E.08108
G1 X76.785 Y74.873
G1 X74.627 Y72.715 E.08108
G1 X74.627 Y73.257
G1 X76.785 Y75.415 E.08108
G1 X76.785 Y75.958
G1 X74.627 Y73.8 E.08108
G1 X74.627 Y74.342
G1 X76.785 Y76.5 E.08108
G1 X76.785 Y77.042
G1 X74.627 Y74.884 E.08108
G1 X74.627 Y75.427
G1 X76.785 Y77.585 E.08108
G1 X76.785 Y78.127
G1 X74.627 Y75.969 E.08108
G1 X74.627 Y76.511
G1 X76.785 Y78.67 E.08108
G1 X76.785 Y79.212
G1 X74.627 Y77.054 E.08108
G1 X74.627 Y77.596
G1 X76.785 Y79.754 E.08108
G1 X76.785 Y80.297
G1 X74.627 Y78.139 E.08108
G1 X74.627 Y78.681
G1 X76.785 Y80.839 E.08108
G1 X76.785 Y81.381
G1 X74.627 Y79.223 E.08108
G1 X74.627 Y79.766
G1 X76.785 Y81.924 E.08108
G1 X76.785 Y82.466
G1 X74.627 Y80.308 E.08108
G1 X74.627 Y80.85
G1 X76.785 Y83.009 E.08108
G1 X76.785 Y83.551
G1 X74.627 Y81.393 E.08108
G1 X74.627 Y81.935
G1 X76.785 Y84.093 E.08108
G1 X76.785 Y84.636
G1 X74.627 Y82.478 E.08108
G1 X74.627 Y83.02
G1 X76.785 Y85.178 E.08108
G1 X76.785 Y85.72
G1 X74.627 Y83.562 E.08108
G1 X74.627 Y84.105
G1 X76.785 Y86.263 E.08108
G1 X76.785 Y86.805
G1 X74.627 Y84.647 E.08108
G1 X74.627 Y85.189
G1 X76.785 Y87.348 E.08108
G1 X76.785 Y87.89
G1 X74.627 Y85.732 E.08108
G1 X74.627 Y86.274
G1 X76.785 Y88.432 E.08108
G1 X76.785 Y88.975
G1 X74.627 Y86.817 E.08108
G1 X74.627 Y87.359
G1 X76.785 Y89.517 E.08108
G1 X76.785 Y90.059
G1 X74.627 Y87.901 E.08108
G1 X74.627 Y88.444
G1 X76.785 Y90.602 E.08108
G1 X76.785 Y91.144
G1 X74.627 Y88.986 E.08108
G1 X74.627 Y89.528
G1 X76.785 Y91.687 E.08108
G1 X76.785 Y92.229
G1 X74.627 Y90.071 E.08108
G1 X74.627 Y90.613
G1 X76.785 Y92.771 E.08108
G1 X76.785 Y93.314
G1 X74.627 Y91.156 E.08108
G1 X74.627 Y91.698
G1 X76.785 Y93.856 E.08108
G1 X76.785 Y94.398
G1 X74.627 Y92.24 E.08108
G1 X74.627 Y92.783
G1 X76.785 Y94.941 E.08108
G1 X76.785 Y95.483
G1 X74.627 Y93.325 E.08108
G1 X74.627 Y93.867
G1 X76.785 Y96.026 E.08108
G1 X76.785 Y96.568
G1 X74.627 Y94.41 E.08108
G1 X74.627 Y94.952
G1 X76.785 Y97.11 E.08108
G1 X76.785 Y97.653
G1 X74.627 Y95.495 E.08108
G1 X74.627 Y96.037
G1 X76.785 Y98.195 E.08108
G1 X76.785 Y98.737
G1 X74.627 Y96.579 E.08108
G1 X74.627 Y97.122
G1 X76.785 Y99.28 E.08108
G1 X76.785 Y99.822
G1 X74.627 Y97.664 E.08108
G1 X74.627 Y98.206
G1 X76.785 Y100.365 E.08108
G1 X76.785 Y100.907
G1 X74.627 Y98.749 E.08108
G1 X74.627 Y99.291
G1 X76.785 Y101.449 E.08108
G1 X76.785 Y101.992
G1 X74.627 Y99.834 E.08108
G1 X74.627 Y100.376
G1 X76.785 Y102.534 E.08108
G1 X76.785 Y103.076
G1 X74.627 Y100.918 E.08108
G1 X74.627 Y101.461
G1 X76.785 Y103.619 E.08108
G1 X76.785 Y104.161
G1 X74.627 Y102.003 E.08108
G1 X74.627 Y102.545
G1 X76.785 Y104.704 E.08108
G1 X76.785 Y105.246
G1 X74.627 Y103.088 E.08108
G1 X74.627 Y103.63
G1 X76.785 Y105.788 E.08108
G1 X76.785 Y106.331
G1 X74.627 Y104.173 E.08108
G1 X74.627 Y104.715
G1 X76.785 Y106.873 E.08108
G1 X76.785 Y107.415
G1 X74.627 Y105.257 E.08108
G1 X74.627 Y105.8
G1 X76.785 Y107.958 E.08108
G1 X76.785 Y108.5
G1 X74.627 Y106.342 E.08108
G1 X74.627 Y106.884
G1 X76.785 Y109.043 E.08108
G1 X76.785 Y109.585
G1 X74.627 Y107.427 E.08108
G1 X74.627 Y107.969
G1 X76.785 Y110.127 E.08108
G1 X76.785 Y110.67
G1 X74.627 Y108.512 E.08108
G1 X74.627 Y109.054
G1 X76.785 Y111.212 E.08108
G1 X76.785 Y111.754
G1 X74.627 Y109.596 E.08108
G1 X74.627 Y110.139
G1 X76.785 Y112.297 E.08108
G1 X76.785 Y112.839
M73 P99 R0
G1 X74.627 Y110.681 E.08108
G1 X74.627 Y111.223
G1 X76.785 Y113.382 E.08108
G1 X76.785 Y113.924
G1 X74.627 Y111.766 E.08108
G1 X74.627 Y112.308
G1 X76.785 Y114.466 E.08108
G1 X76.785 Y115.009
G1 X74.627 Y112.851 E.08108
G1 X74.627 Y113.393
G1 X76.785 Y115.551 E.08108
G1 X76.785 Y116.093
G1 X74.627 Y113.935 E.08108
G1 X74.627 Y114.478
G1 X76.785 Y116.636 E.08108
G1 X76.785 Y117.178
G1 X74.627 Y115.02 E.08108
G1 X74.627 Y115.562
G1 X76.785 Y117.721 E.08108
G1 X76.785 Y118.263
G1 X74.627 Y116.105 E.08108
G1 X74.627 Y116.647
G1 X76.785 Y118.805 E.08108
G1 X76.785 Y119.348
G1 X74.627 Y117.19 E.08108
G1 X74.627 Y117.732
G1 X76.785 Y119.89 E.08108
G1 X76.785 Y120.432
G1 X74.627 Y118.274 E.08108
G1 X74.627 Y118.817
G1 X76.785 Y120.975 E.08108
G1 X76.785 Y121.517
G1 X74.627 Y119.359 E.08108
G1 X74.627 Y119.901
G1 X76.785 Y122.06 E.08108
G1 X76.785 Y122.602
G1 X74.627 Y120.444 E.08108
G1 X74.627 Y120.986
G1 X76.785 Y123.144 E.08108
G1 X76.785 Y123.687
G1 X74.627 Y121.529 E.08108
G1 X74.627 Y122.071
G1 X76.785 Y124.229 E.08108
G1 X76.785 Y124.771
G1 X74.627 Y122.613 E.08108
G1 X74.627 Y123.156
G1 X76.785 Y125.314 E.08108
G1 X76.785 Y125.856
G1 X74.627 Y123.698 E.08108
G1 X74.627 Y124.24
G1 X76.785 Y126.399 E.08108
G1 X76.785 Y126.941
G1 X74.627 Y124.783 E.08108
G1 X74.627 Y125.325
G1 X76.785 Y127.483 E.08108
G1 X76.785 Y128.026
G1 X74.627 Y125.868 E.08108
G1 X74.627 Y126.41
G1 X76.785 Y128.568 E.08108
G1 X76.785 Y129.11
G1 X74.627 Y126.952 E.08108
G1 X74.627 Y127.495
G1 X76.785 Y129.653 E.08108
G1 X76.785 Y130.195
G1 X74.627 Y128.037 E.08108
G1 X74.627 Y128.579
G1 X76.785 Y130.738 E.08108
G1 X76.785 Y131.28
G1 X74.627 Y129.122 E.08108
G1 X74.627 Y129.664
G1 X76.785 Y131.822 E.08108
G1 X76.785 Y132.365
G1 X74.627 Y130.207 E.08108
G1 X74.627 Y130.749
G1 X76.785 Y132.907 E.08108
G1 X76.785 Y133.449
G1 X74.627 Y131.291 E.08108
G1 X74.627 Y131.834
G1 X76.785 Y133.992 E.08108
G1 X76.785 Y134.534
G1 X74.627 Y132.376 E.08108
G1 X74.627 Y132.918
G1 X76.785 Y135.077 E.08108
G1 X76.785 Y135.619
G1 X74.627 Y133.461 E.08108
G1 X74.627 Y134.003
G1 X76.785 Y136.161 E.08108
G1 X76.785 Y136.704
G1 X74.627 Y134.546 E.08108
G1 X74.627 Y135.088
G1 X76.785 Y137.246 E.08108
G1 X76.785 Y137.788
G1 X74.627 Y135.63 E.08108
G1 X74.627 Y136.173
G1 X76.785 Y138.331 E.08108
G1 X76.785 Y138.873
G1 X74.627 Y136.715 E.08108
G1 X74.627 Y137.257
G1 X76.785 Y139.416 E.08108
M204 S10000
; WIPE_START
G1 F24000
G1 X75.371 Y138.001 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X82.993 Y138.398 Z15.53 F30000
G1 X108.558 Y139.731 Z15.53
G1 Z15.13
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X109.101 Y140.274 E.02041
G1 X109.212 Y140.928
G1 X108.015 Y139.731 E.04498
G1 X107.473 Y139.731
G1 X109.324 Y141.582 E.06955
G1 X109.436 Y142.236
G1 X106.93 Y139.731 E.09412
G1 X106.388 Y139.731
G1 X109.547 Y142.89 E.11869
G1 X109.659 Y143.544
G1 X105.846 Y139.731 E.14326
G1 X105.303 Y139.731
G1 X109.771 Y144.198 E.16783
G1 X109.882 Y144.852
G1 X107.242 Y142.212 E.09918
G1 X107.354 Y142.866
G1 X109.994 Y145.506 E.09918
G1 X110.106 Y146.16
G1 X107.466 Y143.52 E.09918
G1 X107.577 Y144.174
G1 X110.217 Y146.814 E.09918
G1 X110.329 Y147.468
G1 X107.689 Y144.828 E.09918
G1 X107.801 Y145.482
G1 X110.441 Y148.122 E.09918
G1 X110.552 Y148.776
G1 X107.912 Y146.136 E.09918
G1 X108.024 Y146.79
G1 X110.664 Y149.43 E.09918
G1 X110.776 Y150.084
G1 X108.136 Y147.444 E.09918
G1 X108.247 Y148.098
G1 X110.887 Y150.738 E.09918
G1 X110.999 Y151.392
G1 X108.359 Y148.752 E.09918
G1 X108.471 Y149.406
G1 X111.111 Y152.046 E.09918
G1 X111.222 Y152.7
G1 X108.582 Y150.06 E.09918
G1 X108.694 Y150.714
G1 X111.334 Y153.355 E.09918
G1 X111.446 Y154.009
G1 X108.806 Y151.368 E.09918
G1 X108.917 Y152.023
G1 X111.557 Y154.663 E.09918
G1 X111.669 Y155.317
G1 X109.029 Y152.677 E.09918
G1 X109.141 Y153.331
G1 X111.781 Y155.971 E.09918
G1 X111.892 Y156.625
G1 X109.252 Y153.985 E.09918
G1 X109.364 Y154.639
G1 X112.004 Y157.279 E.09918
G1 X112.116 Y157.933
G1 X109.476 Y155.293 E.09918
G1 X109.587 Y155.947
G1 X112.227 Y158.587 E.09918
G1 X112.339 Y159.241
G1 X109.699 Y156.601 E.09918
G1 X109.811 Y157.255
G1 X112.451 Y159.895 E.09918
G1 X112.562 Y160.549
G1 X109.922 Y157.909 E.09918
G1 X110.034 Y158.563
G1 X112.674 Y161.203 E.09918
G1 X112.786 Y161.857
G1 X110.146 Y159.217 E.09918
G1 X110.257 Y159.871
G1 X112.897 Y162.511 E.09918
G1 X113.009 Y163.165
G1 X110.369 Y160.525 E.09918
G1 X110.481 Y161.179
G1 X113.121 Y163.819 E.09918
G1 X113.232 Y164.473
G1 X110.592 Y161.833 E.09918
G1 X110.704 Y162.487
G1 X113.344 Y165.127 E.09918
G1 X113.456 Y165.781
G1 X110.816 Y163.141 E.09918
G1 X110.927 Y163.795
G1 X113.567 Y166.435 E.09918
G1 X113.679 Y167.089
G1 X111.039 Y164.449 E.09918
G1 X111.151 Y165.103
G1 X113.791 Y167.743 E.09918
G1 X113.902 Y168.397
G1 X111.262 Y165.757 E.09918
G1 X111.374 Y166.411
G1 X114.014 Y169.052 E.09918
G1 X114.126 Y169.706
G1 X111.486 Y167.065 E.09918
G1 X111.597 Y167.719
G1 X114.237 Y170.36 E.09918
G1 X114.349 Y171.014
G1 X111.709 Y168.374 E.09918
G1 X111.821 Y169.028
G1 X114.461 Y171.668 E.09918
G1 X114.572 Y172.322
G1 X111.932 Y169.682 E.09918
G1 X112.044 Y170.336
G1 X114.684 Y172.976 E.09918
G1 X114.796 Y173.63
G1 X112.156 Y170.99 E.09918
G1 X112.267 Y171.644
G1 X114.905 Y174.281 E.09908
G1 X114.905 Y174.823
G1 X112.379 Y172.298 E.09488
G1 X112.491 Y172.952
G1 X114.905 Y175.366 E.09069
G1 X114.905 Y175.908
G1 X112.602 Y173.606 E.08649
G1 X112.714 Y174.26
G1 X114.905 Y176.451 E.0823
G1 X114.905 Y176.993
G1 X112.826 Y174.914 E.0781
G1 X112.937 Y175.568
G1 X114.905 Y177.535 E.07391
G1 X114.905 Y178.078
G1 X113.049 Y176.222 E.06972
G1 X113.161 Y176.876
G1 X114.905 Y178.62 E.06552
G1 X114.905 Y179.163
G1 X113.272 Y177.53 E.06133
G1 X113.384 Y178.184
G1 X114.905 Y179.705 E.05713
G1 X114.905 Y180.247
G1 X113.496 Y178.838 E.05294
G1 X113.607 Y179.492
G1 X114.905 Y180.79 E.04874
G1 X114.905 Y181.332
G1 X113.719 Y180.146 E.04455
G1 X113.831 Y180.8
G1 X114.905 Y181.874 E.04035
G1 X114.905 Y182.417
G1 X113.942 Y181.454 E.03616
G1 X114.054 Y182.108
G1 X114.905 Y182.959 E.03196
G1 X114.876 Y183.473
G1 X114.166 Y182.762 E.02669
M204 S10000
; WIPE_START
G1 F24000
G1 X114.876 Y183.473 E-.38178
G1 X114.905 Y182.959 E-.19549
G1 X114.565 Y182.619 E-.18273
; WIPE_END
G1 E-.04 F1800
G1 X113.157 Y175.118 Z15.53 F30000
G1 X106.919 Y141.889 Z15.53
G1 Z15.13
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X104.761 Y139.731 E.08108
G1 X104.219 Y139.731
G1 X106.377 Y141.889 E.08108
G1 X105.834 Y141.889
G1 X103.676 Y139.731 E.08108
G1 X103.134 Y139.731
G1 X105.292 Y141.889 E.08108
G1 X104.75 Y141.889
G1 X102.591 Y139.731 E.08108
G1 X102.049 Y139.731
G1 X104.207 Y141.889 E.08108
G1 X103.665 Y141.889
G1 X101.507 Y139.731 E.08108
G1 X100.964 Y139.731
G1 X103.122 Y141.889 E.08108
G1 X102.58 Y141.889
G1 X100.422 Y139.731 E.08108
G1 X99.88 Y139.731
G1 X102.038 Y141.889 E.08108
G1 X101.495 Y141.889
G1 X99.337 Y139.731 E.08108
G1 X98.795 Y139.731
G1 X100.953 Y141.889 E.08108
G1 X100.411 Y141.889
G1 X98.252 Y139.731 E.08108
G1 X97.71 Y139.731
G1 X99.868 Y141.889 E.08108
G1 X99.326 Y141.889
G1 X97.168 Y139.731 E.08108
G1 X96.625 Y139.731
G1 X98.783 Y141.889 E.08108
G1 X98.241 Y141.889
G1 X96.083 Y139.731 E.08108
G1 X95.541 Y139.731
G1 X97.699 Y141.889 E.08108
G1 X97.156 Y141.889
G1 X94.998 Y139.731 E.08108
G1 X94.456 Y139.731
G1 X96.614 Y141.889 E.08108
G1 X96.072 Y141.889
G1 X93.913 Y139.731 E.08108
G1 X93.371 Y139.731
G1 X95.529 Y141.889 E.08108
G1 X94.987 Y141.889
G1 X92.829 Y139.731 E.08108
G1 X92.286 Y139.731
G1 X94.444 Y141.889 E.08108
G1 X93.902 Y141.889
G1 X91.744 Y139.731 E.08108
G1 X91.202 Y139.731
G1 X93.36 Y141.889 E.08108
G1 X92.817 Y141.889
G1 X90.659 Y139.731 E.08108
G1 X90.117 Y139.731
G1 X92.275 Y141.889 E.08108
G1 X91.733 Y141.889
G1 X89.574 Y139.731 E.08108
G1 X89.032 Y139.731
G1 X91.19 Y141.889 E.08108
G1 X90.648 Y141.889
G1 X88.49 Y139.731 E.08108
G1 X87.947 Y139.731
G1 X90.105 Y141.889 E.08108
G1 X89.563 Y141.889
G1 X87.405 Y139.731 E.08108
G1 X86.863 Y139.731
G1 X89.021 Y141.889 E.08108
G1 X88.478 Y141.889
G1 X86.32 Y139.731 E.08108
G1 X85.778 Y139.731
G1 X87.936 Y141.889 E.08108
G1 X87.394 Y141.889
G1 X85.235 Y139.731 E.08108
G1 X84.693 Y139.731
G1 X86.851 Y141.889 E.08108
G1 X86.309 Y141.889
G1 X84.151 Y139.731 E.08108
G1 X83.608 Y139.731
G1 X85.766 Y141.889 E.08108
G1 X85.224 Y141.889
G1 X83.066 Y139.731 E.08108
G1 X82.524 Y139.731
G1 X84.682 Y141.889 E.08108
G1 X84.139 Y141.889
G1 X81.981 Y139.731 E.08108
G1 X81.439 Y139.731
G1 X83.597 Y141.889 E.08108
G1 X83.055 Y141.889
G1 X80.896 Y139.731 E.08108
G1 X80.354 Y139.731
G1 X82.512 Y141.889 E.08108
G1 X81.97 Y141.889
G1 X79.812 Y139.731 E.08108
G1 X79.269 Y139.731
G1 X81.427 Y141.889 E.08108
G1 X80.885 Y141.889
G1 X78.727 Y139.731 E.08108
G1 X78.185 Y139.731
G1 X80.343 Y141.889 E.08108
G1 X79.8 Y141.889
G1 X77.642 Y139.731 E.08108
G1 X77.1 Y139.731
G1 X79.258 Y141.889 E.08108
G1 X78.716 Y141.889
G1 X74.627 Y137.8 E.15361
G1 X74.627 Y138.342
G1 X78.173 Y141.889 E.13323
G1 X77.631 Y141.889
G1 X74.627 Y138.885 E.11286
G1 X74.627 Y139.427
G1 X77.088 Y141.889 E.09248
G1 X76.546 Y141.889
G1 X74.627 Y139.969 E.07211
G1 X74.627 Y140.512
G1 X76.004 Y141.889 E.05173
G1 X75.461 Y141.889
G1 X74.627 Y141.054 E.03136
M204 S10000
; WIPE_START
G1 F24000
G1 X75.461 Y141.889 E-.44855
G1 X76.004 Y141.889 E-.2061
G1 X75.808 Y141.693 E-.10535
; WIPE_END
G1 E-.04 F1800
G1 X83.44 Y141.768 Z15.53 F30000
G1 X107.187 Y142 Z15.53
G1 Z15.13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0825048
G1 F15000
G1 X107.202 Y141.901 E.00032
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X107.187 Y142 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 164
M625
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; filament end gcode 
M106 P3 S0
;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z15.63 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S3 ;wait for last picture to be taken
M623; end of "timelapse_record_flag"

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z115.13 F600
    G1 Z113.13

M400 P100
M17 R ; restore z current

G90
G1 X128 Y250 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

