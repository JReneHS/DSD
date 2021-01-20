#-- Lattice Semiconductor Corporation Ltd.
#-- Synplify OEM project file

#device options
set_option -technology MACHXO2
set_option -part LCMXO2_7000HE
set_option -package TG144I
set_option -speed_grade -4

#compilation/mapping options
set_option -symbolic_fsm_compiler true
set_option -resource_sharing true

#use verilog 2001 standard option
set_option -vlog_std v2001

#map options
set_option -frequency 100
set_option -maxfan 1000
set_option -auto_constrain_io 0
set_option -disable_io_insertion false
set_option -retiming false; set_option -pipe true
set_option -force_gsr false
set_option -compiler_compatible 0
set_option -dup false

set_option -default_enum_encoding default

#simulation options


#timing analysis options



#automatic place and route (vendor) options
set_option -write_apr_constraint 1

#synplifyPro options
set_option -fix_gated_and_generated_clocks 1
set_option -update_models_cp 0
set_option -resolve_multiple_driver 0


set_option -seqshift_no_replicate 0

#-- add_file options
add_file -vhdl {C:/lscc/diamond/3.12/cae_library/synthesis/vhdl/machxo2.vhd}
add_file -vhdl -lib "work" {D:/Semestre 2-2020/DSD/Practicas/Proyecto Final Aldair JRene/clk_div_LCD.vhd}
add_file -vhdl -lib "work" {D:/Semestre 2-2020/DSD/Practicas/Proyecto Final Aldair JRene/clk_div_pacman.vhd}
add_file -vhdl -lib "work" {D:/Semestre 2-2020/DSD/Practicas/Proyecto Final Aldair JRene/dec_3_8.vhd}
add_file -vhdl -lib "work" {D:/Semestre 2-2020/DSD/Practicas/Proyecto Final Aldair JRene/LCD.vhd}
add_file -vhdl -lib "work" {D:/Semestre 2-2020/DSD/Practicas/Proyecto Final Aldair JRene/oscilador.vhd}
add_file -vhdl -lib "work" {D:/Semestre 2-2020/DSD/Practicas/Proyecto Final Aldair JRene/pacman_ROM.vhd}
add_file -vhdl -lib "work" {D:/Semestre 2-2020/DSD/Practicas/Proyecto Final Aldair JRene/top_P_Final.vhd}

#-- top module name
set_option -top_module pfinal

#-- set result format/file last
project -result_file {D:/Semestre 2-2020/DSD/Practicas/Proyecto Final Aldair JRene/impl1/Practica_Final_Aldair_Rene_impl1.edi}

#-- error message log file
project -log_file {Practica_Final_Aldair_Rene_impl1.srf}

#-- set any command lines input by customer


#-- run Synplify with 'arrange HDL file'
project -run hdl_info_gen -fileorder
project -run
