class env_config extends uvm_object;

   `uvm_object_utils(env_config)
   
    source_cfg sr_cfg[];

    int no_of_agents;
    int has_scoreboard;
    int has_virtual_seqr;
    
   function new(string name="");
         super.new(name);
   endfunction

endclass
