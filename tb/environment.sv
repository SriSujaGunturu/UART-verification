class environment extends uvm_env;
 
   `uvm_component_utils(environment)

   agent_top agt_top;
   env_config env_cfg;
   scoreboard sb;
   virtual_seqr v_seqr;
    
   function new(string name="", uvm_component parent);
         super.new(name,parent);
   endfunction

   function void build_phase(uvm_phase phase);
         super.build_phase(phase);
         if(!uvm_config_db #(env_config)::get(this,"","env_config",env_cfg))
                `uvm_fatal("ENV","cannot get env_config")
          agt_top=agent_top::type_id::create("agt_top",this);
          if(env_cfg.has_scoreboard)
                sb=scoreboard::type_id::create("sb",this);
          if(env_cfg.has_virtual_seqr)
                v_seqr=virtual_seqr::type_id::create("v_seqr",this);
   endfunction

   function void connect_phase(uvm_phase phase);
          super.connect_phase(phase);
          if(env_cfg.has_scoreboard) 
          begin
               foreach(agt_top.agt[i])
                    agt_top.agt[i].mon.mon_port.connect(sb.fifo_export[i].analysis_export);
         end
   endfunction 
 
endclass 
