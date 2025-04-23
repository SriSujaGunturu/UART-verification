
class monitor extends uvm_monitor;

   `uvm_component_utils(monitor)

   virtual uart_intf.MON_MP vif;

   uvm_analysis_port #(transaction) mon_port;

   source_cfg sr_cfg;
    
   function new(string name="",uvm_component parent);
          super.new(name,parent);
          mon_port=new("mon_port",this);
   endfunction

   function void build_phase(uvm_phase phase);
         super.build_phase(phase);
         if(!uvm_config_db #(source_cfg)::get(this,"","source_cfg",sr_cfg))
                 `uvm_fatal("MONITOR","cannot get sr_cfg")
   endfunction

   function void connect_phase(uvm_phase phase);
         vif=sr_cfg.vif;
   endfunction

   task run_phase(uvm_phase phase);
        transaction trans;
        trans=transaction::type_id::create("trans");
        forever
             collect_data(trans);
   endtask
  
   task collect_data(transaction trans);
      
        @(vif.mon_cb);
        wait(vif.mon_cb.ack_out)

        trans.wr_enb_in=vif.mon_cb.wr_enb_in;
        trans.sel_in=vif.mon_cb.sel_in;
        trans.stb_in=vif.mon_cb.stb_in;
        trans.cyc_in=vif.mon_cb.cyc_in;
        trans.addr_in=vif.mon_cb.addr_in;
        trans.data_in=vif.mon_cb.data_in;
       

        //lcr register
        if(trans.addr_in==3 && trans.wr_enb_in==1)
                 trans.lcr=vif.mon_cb.data_in;
 
        //dlm register
        if(trans.lcr[7]==1 && trans.addr_in==1 && trans.wr_enb_in==1)
                 trans.dlm=vif.mon_cb.data_in;

        //dll register
        if(trans.lcr[7]==1 && trans.addr_in==0 && trans.wr_enb_in==1)
                 trans.dll=vif.mon_cb.data_in;

        //fcr register
        if(trans.lcr[7]==0 && trans.addr_in==2 && trans.wr_enb_in==1)
                 trans.fcr=vif.mon_cb.data_in;

        //ier register
        if(trans.lcr[7]==0 && trans.addr_in==1 && trans.wr_enb_in==1)
                 trans.ier=vif.mon_cb.data_in;

        //thr register
        if(trans.lcr[7]==0 && trans.addr_in==0 && trans.wr_enb_in==1)
                 trans.thr.push_back(vif.mon_cb.data_in);

        //rb register
        if(trans.lcr[7]==0 && trans.addr_in==0 && trans.wr_enb_in==0)
                 trans.rb.push_back(vif.mon_cb.data_out);

        //mcr register
        if(trans.lcr[7]==0 && trans.addr_in==4 && trans.wr_enb_in==1)
                 trans.mcr=vif.mon_cb.data_in;

        //iir register
        if(trans.lcr[7]==0 && trans.addr_in==2 && trans.wr_enb_in==0)
        begin
                 wait(vif.mon_cb.int_out)
                 @(vif.mon_cb);
                 trans.iir=vif.mon_cb.data_out;
        end
        //lcr regsiter	
	if(trans.lcr[7]==0 && trans.addr_in==5 && trans.wr_enb_in==0) begin
		trans.lsr=vif.mon_cb.data_out;
	end
	
       `uvm_info("MONITOR",$sformatf("printing from monitor \n %s",trans.sprint()),UVM_LOW);
        mon_port.write(trans);
   endtask

endclass
