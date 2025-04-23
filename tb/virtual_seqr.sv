class virtual_seqr extends uvm_sequencer #(uvm_sequence_item);

  `uvm_component_utils(virtual_seqr)

   env_config env_cfg;
   sequencer seqr[];

   function new(string name="",uvm_component parent=null);
         super.new(name,parent);
   endfunction

   function void build_phase(uvm_phase phase);
         if(!uvm_config_db #(env_config)::get(this,"","env_config",env_cfg))
              `uvm_fatal("VIRTUAL SEQR","cannot get env_cfg")
         seqr=new[env_cfg.no_of_agents];
   endfunction

endclass


