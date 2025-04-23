class virtual_seq extends uvm_sequence #(uvm_sequence_item);

   `uvm_object_utils(virtual_seq)

   virtual_seqr v_seqr;
   env_config env_cfg;
   sequencer seqr[];

   function new(string name="");
       super.new(name);
   endfunction

   task body();
       if(!uvm_config_db #(env_config)::get(null,get_full_name(),"env_config",env_cfg))
                `uvm_fatal("VIRTUAL SEQ","cannot get env_cfg")
       seqr=new[env_cfg.no_of_agents];
       $cast(v_seqr,m_sequencer);
       foreach(seqr[i])
            seqr[i]=v_seqr.seqr[i];
   endtask

endclass


