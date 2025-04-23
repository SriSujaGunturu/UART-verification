`include "timescale.v"
module top;

   import uvm_pkg::*;
   import final_pkg::*;

   bit clk1;
   bit clk2;
   wire tx,rx;

  
   always #20 clk2=~clk2;
   always #10 clk1=~clk1;
     

   uart_intf intf0(clk1);
   uart_intf intf1(clk2);

   uart_top DUT1(.wb_clk_i(clk1),
                 .wb_rst_i(intf0.rst_in),
                 .wb_adr_i(intf0.addr_in),
                 .wb_dat_i(intf0.data_in),
                 .wb_dat_o(intf0.data_out),
                 .wb_we_i(intf0.wr_enb_in),
                 .wb_stb_i(intf0.stb_in),
                 .wb_cyc_i(intf0.cyc_in),
                 .wb_ack_o(intf0.ack_out),
                 .wb_sel_i(intf0.sel_in),
                 .int_o(intf0.int_out),
                 .stx_pad_o(tx),
                 .srx_pad_i(rx));

   uart_top DUT2(.wb_clk_i(clk2),
                 .wb_rst_i(intf1.rst_in),
                 .wb_adr_i(intf1.addr_in),
                 .wb_dat_i(intf1.data_in),
                 .wb_dat_o(intf1.data_out),
                 .wb_we_i(intf1.wr_enb_in),
                 .wb_stb_i(intf1.stb_in),
                 .wb_cyc_i(intf1.cyc_in),
                 .wb_ack_o(intf1.ack_out),
                 .wb_sel_i(intf1.sel_in),
                 .int_o(intf1.int_out),
                 .stx_pad_o(rx),
                 .srx_pad_i(tx));


   initial begin

      `ifdef VCS
          $fsdbDumpvars(0,top);
          `endif

      uvm_config_db #(virtual uart_intf)::set(null,"*","intf0",intf0);
      uvm_config_db #(virtual uart_intf)::set(null,"*","intf1",intf1);

      run_test();
   end
endmodule
