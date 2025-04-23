
class driver extends uvm_driver #(transaction);

   `uvm_component_utils(driver)

   virtual uart_intf.DRV_MP vif;

   source_cfg sr_cfg;
    
   function new(string name="",uvm_component parent);
          super.new(name,parent);
   endfunction

   function void build_phase (uvm_phase phase);
          super.build_phase(phase);
          if(!uvm_config_db #(source_cfg)::get(this,"","source_cfg",sr_cfg))
                   `uvm_fatal("DRIVER","cannot get sr_cfg")
   endfunction

   function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        vif=sr_cfg.vif;
   endfunction

   task run_phase(uvm_phase phase);
            @(vif.drv_cb);
            vif.drv_cb.rst_in<=1'b0;
            @(vif.drv_cb);
            vif.drv_cb.rst_in<=1'b1;
            vif.drv_cb.stb_in<=1'b0;
            vif.drv_cb.cyc_in<=1'b0;
            @(vif.drv_cb);
            vif.drv_cb.rst_in<=1'b0;
            forever begin
                  seq_item_port.get_next_item(req);
                  send_to_dut(req);
                  seq_item_port.item_done();
           end
   endtask

   task send_to_dut(transaction req);
           
            @(vif.drv_cb);
            vif.drv_cb.stb_in<=1'b1;
            vif.drv_cb.cyc_in<=1'b1;
            vif.drv_cb.sel_in<=4'b0001;
            vif.drv_cb.wr_enb_in<=req.wr_enb_in;
            vif.drv_cb.addr_in<=req.addr_in;
            vif.drv_cb.data_in<=req.data_in;
//                  `uvm_info("DRIVER",$sformatf("printing from driver \n %s",req.sprint()),UVM_LOW);

            wait(vif.drv_cb.ack_out)
            vif.drv_cb.stb_in<=1'b0;
            vif.drv_cb.cyc_in<=1'b0;

           if(req.addr_in==2 && req.wr_enb_in==0)
              begin
                  wait(vif.drv_cb.int_out)
                  repeat(2)       @(vif.drv_cb);
                  req.iir=vif.drv_cb.data_out;
                  seq_item_port.put_response(req);
                  `uvm_info("DRIVER",$sformatf("printing from driver \n %s",req.sprint()),UVM_LOW);
              end
   endtask         

endclass
