class agent_top extends uvm_env;
  
    `uvm_component_utils(agent_top)

     agent agt[];

     env_config env_cfg;
     source_cfg sr_cfg[];

     function new(string name="",uvm_component parent);
             super.new(name,parent);
     endfunction

     function void build_phase(uvm_phase phase);
            super.build_phase(phase);
             if(!uvm_config_db #(env_config)::get(this,"","env_config",env_cfg))
                `uvm_fatal("AGENT_TOP","cannot get env_config")
             agt=new[env_cfg.no_of_agents];
             foreach(agt[i])  begin
                 agt[i]=agent::type_id::create($sformatf("agt[%0d]",i),this);
                 uvm_config_db #(source_cfg)::set(this,$sformatf("agt[%0d]*",i),"source_cfg",env_cfg.sr_cfg[i]);
             end
     endfunction

endclass
           


