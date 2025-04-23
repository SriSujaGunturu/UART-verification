class transaction extends uvm_sequence_item;

   `uvm_object_utils(transaction)

   rand bit rst_in;
   rand bit[2:0] addr_in;
   rand bit[7:0] data_in;
   rand bit wr_enb_in;

   bit [7:0] data_out;
   bit stb_in;
   bit cyc_in;
   bit [3:0]sel_in;

   bit [7:0] ier,iir,fcr,lcr,dll,dlm,msr,mcr,lsr;

   bit [7:0] thr[$];
   bit [7:0] rb[$];
 
   function new(string name="");
          super.new(name);
   endfunction

   function void do_print(uvm_printer printer);

         printer.print_field("addr_in",addr_in,3,UVM_BIN);
         printer.print_field("data_in",data_in,8,UVM_BIN);
         printer.print_field("wr_enb_in",wr_enb_in,1,UVM_BIN);
         printer.print_field("data_out",data_out,8,UVM_BIN);
         foreach(thr[i])
               printer.print_field($sformatf("thr[%0d]",i),thr[i],8,UVM_BIN);
         foreach(rb[i])
               printer.print_field($sformatf("rb[%0d]",i),rb[i],8,UVM_BIN);
        printer.print_field("LCR",lcr,8,UVM_BIN);
        printer.print_field("IER",ier,8,UVM_BIN);
        printer.print_field("IIR",iir,8,UVM_BIN);
        printer.print_field("DLL",dll,8,UVM_BIN);
        printer.print_field("FCR",fcr,8,UVM_BIN);
        printer.print_field("DLM",dlm,8,UVM_BIN);
        printer.print_field("MSR",msr,8,UVM_BIN);
        printer.print_field("MCR",mcr,8,UVM_BIN);
        printer.print_field("LSR",lsr,8,UVM_BIN);

   endfunction

endclass
