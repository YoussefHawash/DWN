read_verilog {c:/Users/youse/Downloads/hw/jsc_sm10.v}
synth_design -top dwn_top -part xc7a200tffg1156-2 -mode out_of_context -flatten_hierarchy rebuilt
create_clock -name clk -period 4.0 [get_ports clk]
report_utilization -file {c:/Users/youse/Downloads/hw/vivado/jsc_sm10/synth_util.txt}
report_timing_summary -file {c:/Users/youse/Downloads/hw/vivado/jsc_sm10/synth_timing.txt}
set stage synth
if {1} {
    opt_design
    place_design
    route_design
    report_utilization -file {c:/Users/youse/Downloads/hw/vivado/jsc_sm10/impl_util.txt}
    report_timing_summary -file {c:/Users/youse/Downloads/hw/vivado/jsc_sm10/impl_timing.txt}
    set stage impl
}
set p [get_timing_paths -max_paths 1 -nworst 1 -setup]
set wns nan
if {[llength $p]} { set wns [get_property SLACK $p] }
set f [open {c:/Users/youse/Downloads/hw/vivado/jsc_sm10/wns.txt} w]
puts $f "$stage $wns"
close $f
