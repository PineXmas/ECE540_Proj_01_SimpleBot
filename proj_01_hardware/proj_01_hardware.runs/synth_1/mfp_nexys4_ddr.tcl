# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/proj_01_hardware.cache/wt [current_project]
set_property parent.project_path D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/proj_01_hardware.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:nexys-a7-100t:part0:1.0 [current_project]
set_property ip_output_repo d:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/proj_01_hardware.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog {
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_const.vh
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_config.vh
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_dsp_const.vh
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_mmu.vh
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/system/mfp_ahb_const.vh
}
read_verilog -library xil_defaultlib {
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/RAMB4K_S16.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/RAMB4K_S2.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/RAMB4K_S8.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/d_wsram_2k2way_xilinx.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/dataram_2k2way_xilinx.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/i_wsram_2k2way_xilinx.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_alu_dsp_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_alu_shft_32bit.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_bistctl.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_biu.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cache_cmp.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cache_mux.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cdmm.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cdmm_ctl.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cdmm_mpustub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_clock_buf.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_clock_nogate.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_clockandlatch.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_clockxnorgate.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cop1_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cop2_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_core.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cp1_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cp2_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cpu.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cpz.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cpz_antitamper_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cpz_eicoffset_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cpz_guest_srs1.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cpz_guest_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cpz_pc.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cpz_pc_top.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cpz_prid.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cpz_root_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cpz_sps_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cpz_srs1.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cpz_watch_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cscramble_scanio_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cscramble_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_cscramble_tpl.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_dc.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_dc_bistctl.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_dcc.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_dcc_fb.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_dcc_mb_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_dcc_parity_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_dcc_spmb_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_dcc_spstub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_dspram_ext_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_edp.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_edp_add_simple.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_edp_buf_misc_pro.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_edp_clz.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_edp_clz_16b.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_edp_clz_4b.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ejt.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ejt_and2.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ejt_area.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ejt_async_rec.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ejt_async_snd.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ejt_brk21.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ejt_bus32mux2.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ejt_dbrk.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ejt_fifo_1r1w_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ejt_gate.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ejt_ibrk.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ejt_mux2.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ejt_pdttcb_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ejt_tap.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ejt_tap_dasam.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ejt_tap_fdc.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ejt_tap_pcsam.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ejt_tck.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ejt_tripsync.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_fpuclk1_nogate.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_gf_mux2.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_glue.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ic.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ic_bistctl.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_icc.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_icc_mb_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_icc_parity_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_icc_spmb_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_icc_spstub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_icc_umips_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_ispram_ext_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_mdl.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_mdl_add_simple.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_mdl_ctl.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_mdl_dp.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_mmuc.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_mpc.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_mpc_ctl.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_mpc_dec.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_mpc_exc.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_rf_reg.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_rf_rngc.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_rf_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_siu.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_siu_int_sync.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_spram_top.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_tlb.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_tlb_collector.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_tlb_cpy.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_tlb_ctl.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_tlb_dtlb.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_tlb_itlb.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_tlb_jtlb16.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_tlb_jtlb16entries.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_tlb_jtlb1entry.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_tlb_jtlb4entries.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_tlb_utlb.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_tlb_utlbentry.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_top.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_udi_custom.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/m14k_udi_scanio_stub.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/system/mfp_ahb.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/system/memories/mfp_ahb_b_ram.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/system/mfp_ahb_gpio.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/system/memories/mfp_ahb_p_ram.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/system/mfp_ahb_withloader.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/system/mfp_ejtag_reset.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/system/mfp_srec_parser.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/system/mfp_srec_parser_to_ahb_lite_bridge.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/system/mfp_sys.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/system/mfp_uart_receiver.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_cregister.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_cregister_c.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_cregister_ngc.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_cregister_s.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_cregister_wide.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_cregister_wide_tlb.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_cregister_wide_utlb.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_latchn.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_mux16.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_mux1hot_10.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_mux1hot_13.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_mux1hot_24.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_mux1hot_3.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_mux1hot_4.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_mux1hot_5.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_mux1hot_6.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_mux1hot_8.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_mux1hot_9.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_mux2.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_mux4.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_mux8.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_register.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_register_c.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_register_ngc.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_register_s.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/mvp_ucregister_wide.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/system/memories/ram_b0.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/system/memories/ram_b1.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/system/memories/ram_b2.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/system/memories/ram_b3.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/system/memories/ram_p0.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/system/memories/ram_p1.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/system/memories/ram_p2.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/system/memories/ram_p3.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/core/tagram_2k2way_xilinx.v
  D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/sources/nexys4_ddr/mfp_nexys4_ddr.v
}
read_ip -quiet d:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/proj_01_hardware.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
set_property used_in_implementation false [get_files -all d:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/proj_01_hardware.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
set_property used_in_implementation false [get_files -all d:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/proj_01_hardware.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
set_property used_in_implementation false [get_files -all d:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/proj_01_hardware.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/proj_01_hardware.srcs/constrs_1/imports/constraints/mfp_nexys4_ddr.xdc
set_property used_in_implementation false [get_files D:/Projects/Code/ECE540_Proj_01_SimpleBot/proj_01_hardware/proj_01_hardware.srcs/constrs_1/imports/constraints/mfp_nexys4_ddr.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top mfp_nexys4_ddr -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef mfp_nexys4_ddr.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file mfp_nexys4_ddr_utilization_synth.rpt -pb mfp_nexys4_ddr_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
