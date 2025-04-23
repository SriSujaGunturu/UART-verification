class agent extends uvm_agent;

   `uvm_component_utils(agent)

   source_cfg sr_cfg;
   driver drv;
   monitor mon;
   sequencer seqr;   
 
   function new(string name="", uvm_component parent);
         super.new(name,parent);
   endfunction

   function void build_phase(uvm_phase phase);
         super.build_phase(phase);
          if(!uvm_config_db #(source_cfg)::get(this,"","source_cfg",sr_cfg))
                 `uvm_fatal("AGENT_TOP","cannot get sr_cfg")
          mon=monitor::type_id::create("mon",this);
          if(sr_cfg.is_active==UVM_ACTIVE)   begin
                  drv=driver::type_id::create("drv",this);               
                  seqr=sequencer::type_id::create("seqr",this);
          end
   endfunction

   function void connect_phase(uvm_phase phase);
       if(sr_cfg.is_active==UVM_ACTIVE)
            drv.seq_item_port.connect(seqr.seq_item_export);
   endfunction

endclass

