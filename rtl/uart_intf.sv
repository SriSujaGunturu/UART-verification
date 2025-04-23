interface uart_intf(input bit clk);

    logic rst_in;
    logic [2:0] addr_in;
    logic [7:0] data_in;
    logic [7:0] data_out;
    logic [3:0] sel_in;
    logic stb_in;
    logic cyc_in;
    logic wr_enb_in;
    logic ack_out;
    logic int_out;

    clocking drv_cb@(posedge clk);
         default input #2 output #0;     
         output rst_in;
         output addr_in;
         output data_in;
         input  data_out;
         output sel_in;
         output stb_in;
         output cyc_in;
         output wr_enb_in;
         input ack_out;
         input int_out;
    endclocking

    clocking mon_cb@(posedge clk);
         default input #2 output #0;     
         input rst_in;
         input addr_in;
         input data_in;
         input data_out;
         input sel_in;
         input stb_in;
         input cyc_in;
         input wr_enb_in;
         input ack_out;
         input int_out; 
    endclocking

    modport DRV_MP(clocking drv_cb);
    modport MON_MP(clocking mon_cb);

endinterface
