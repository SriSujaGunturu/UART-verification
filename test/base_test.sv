class base_test extends uvm_test;

  `uvm_component_utils(base_test)

   environment env;

   env_config env_cfg;
   source_cfg sr_cfg[];

   int no_of_agents=2;
   int has_scoreboard=1;
   int has_virtual_seqr=1;

   function new(string name="", uvm_component parent);
         super.new(name,parent);
   endfunction

   function void build_phase(uvm_phase phase);
         super.build_phase(phase);

         sr_cfg=new[no_of_agents];

         env=environment::type_id::create("env",this);
         env_cfg=env_config::type_id::create("env_cfg");

         env_cfg.sr_cfg=new[no_of_agents];
         foreach(sr_cfg[i])  
         begin
               sr_cfg[i]=source_cfg::type_id::create($sformatf("sr_cfg[%0d]",i));
               if(!uvm_config_db #(virtual uart_intf)::get(this,"",$sformatf("intf%0d",i),sr_cfg[i].vif))
                     `uvm_fatal("BASE_TEST","cannot get intf")    
               sr_cfg[i].is_active=UVM_ACTIVE;
               env_cfg.sr_cfg[i]=sr_cfg[i];
         end
         env_cfg.no_of_agents=no_of_agents;     
         env_cfg.has_scoreboard=has_scoreboard;
         env_cfg.has_virtual_seqr=has_virtual_seqr;

         uvm_config_db #(env_config)::set(this,"*","env_config",env_cfg);
        
   endfunction

   task run_phase(uvm_phase phase);
       super.run_phase(phase);
       uvm_top.print_topology;
   endtask

endclass


class full_duplex_test extends base_test;

   `uvm_component_utils(full_duplex_test)

    full_duplex_seq1 fd_seq1;
    full_duplex_seq2 fd_seq2;
 
    function new(string name="",uvm_component parent);
              super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);
           super.build_phase(phase);
    endfunction

    task run_phase(uvm_phase phase);
         super.run_phase(phase);
         phase.raise_objection(this);
         fd_seq1=full_duplex_seq1::type_id::create("fd_seq1");
         fd_seq2=full_duplex_seq2::type_id::create("fd_seq2");
         fork
             fd_seq1.start(env.agt_top.agt[0].seqr);
             fd_seq2.start(env.agt_top.agt[1].seqr);
         join
         #40;
         phase.drop_objection(this);
    endtask

endclass           

class half_duplex_test extends base_test;

   `uvm_component_utils(half_duplex_test)

    half_duplex_seq1 hd_seq1;
    half_duplex_seq2 hd_seq2;
 
    function new(string name="",uvm_component parent);
              super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);
           super.build_phase(phase);
    endfunction

    task run_phase(uvm_phase phase);
         super.run_phase(phase);
         phase.raise_objection(this);
         hd_seq1=half_duplex_seq1::type_id::create("hd_seq1");
         hd_seq2=half_duplex_seq2::type_id::create("hd_seq2");
         fork
             hd_seq1.start(env.agt_top.agt[0].seqr);
             hd_seq2.start(env.agt_top.agt[1].seqr);
         join
         #40;
         phase.drop_objection(this);
    endtask
endclass


class loop_back_test extends base_test;

   `uvm_component_utils(loop_back_test)

    loop_back_seq1 lp_seq1;
    loop_back_seq2 lp_seq2;
 
    function new(string name="",uvm_component parent);
              super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);
           super.build_phase(phase);
    endfunction

    task run_phase(uvm_phase phase);
         super.run_phase(phase);
         phase.raise_objection(this);
         lp_seq1=loop_back_seq1::type_id::create("lp_seq1");
         lp_seq2=loop_back_seq2::type_id::create("lp_seq2");
         fork
             lp_seq1.start(env.agt_top.agt[0].seqr);
             lp_seq2.start(env.agt_top.agt[1].seqr);
         join
         #40;
         phase.drop_objection(this);
    endtask

endclass


class parity_error_test extends base_test;

   `uvm_component_utils(parity_error_test)

    parity_error_seq1 pe_seq1;
    parity_error_seq2 pe_seq2;
 
    function new(string name="",uvm_component parent);
              super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);
           super.build_phase(phase);
    endfunction

    task run_phase(uvm_phase phase);
         super.run_phase(phase);
         phase.raise_objection(this);
         pe_seq1=parity_error_seq1::type_id::create("pe_seq1");
         pe_seq2=parity_error_seq2::type_id::create("pe_seq2");
         fork
             pe_seq1.start(env.agt_top.agt[0].seqr);
             pe_seq2.start(env.agt_top.agt[1].seqr);
         join
         #40;
         phase.drop_objection(this);
    endtask

endclass

class framing_error_test extends base_test;

   `uvm_component_utils(framing_error_test)

    framing_error_seq1 fe_seq1;
    framing_error_seq2 fe_seq2;
 
    function new(string name="",uvm_component parent);
              super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);
           super.build_phase(phase);
    endfunction

    task run_phase(uvm_phase phase);
         super.run_phase(phase);
         phase.raise_objection(this);
         fe_seq1=framing_error_seq1::type_id::create("fe_seq1");
         fe_seq2=framing_error_seq2::type_id::create("fe_seq2");
         fork
             fe_seq1.start(env.agt_top.agt[0].seqr);
             fe_seq2.start(env.agt_top.agt[1].seqr);
         join
         #40;
         phase.drop_objection(this);
    endtask

endclass

class over_run_test extends base_test;

   `uvm_component_utils(over_run_test)

    over_run_seq1 or_seq1;
    over_run_seq2 or_seq2;
 
    function new(string name="",uvm_component parent);
              super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);
           super.build_phase(phase);
    endfunction

    task run_phase(uvm_phase phase);
         super.run_phase(phase);
         phase.raise_objection(this);
         or_seq1=over_run_seq1::type_id::create("or_seq1");
         or_seq2=over_run_seq2::type_id::create("or_seq2");
         fork
             or_seq1.start(env.agt_top.agt[0].seqr);
             or_seq2.start(env.agt_top.agt[1].seqr);
         join
         #40;
         phase.drop_objection(this);
    endtask

endclass

class break_intreupt_test extends base_test;

   `uvm_component_utils(break_intreupt_test)

    break_intreupt_seq1 bi_seq1;
    break_intreupt_seq2 bi_seq2;
 
    function new(string name="",uvm_component parent);
              super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);
           super.build_phase(phase);
    endfunction

    task run_phase(uvm_phase phase);
         super.run_phase(phase);
         phase.raise_objection(this);
         bi_seq1=break_intreupt_seq1::type_id::create("bi_seq1");
         bi_seq2=break_intreupt_seq2::type_id::create("bi_seq2");
         fork
             bi_seq1.start(env.agt_top.agt[0].seqr);
             bi_seq2.start(env.agt_top.agt[1].seqr);
         join
         #40;
         phase.drop_objection(this);
    endtask

endclass

class time_out_test extends base_test;

   `uvm_component_utils(time_out_test)

    time_out_seq1 to_seq1;
    time_out_seq2 to_seq2;
 
    function new(string name="",uvm_component parent);
              super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);
           super.build_phase(phase);
    endfunction

    task run_phase(uvm_phase phase);
         super.run_phase(phase);
         phase.raise_objection(this);
         to_seq1=time_out_seq1::type_id::create("to_seq1");
         to_seq2=time_out_seq2::type_id::create("to_seq2");
         fork
             to_seq1.start(env.agt_top.agt[0].seqr);
             to_seq2.start(env.agt_top.agt[1].seqr);
         join
         #40;
         phase.drop_objection(this);
    endtask

endclass

class thr_empty_test extends base_test;

   `uvm_component_utils(thr_empty_test)

    thr_empty_seq1 te_seq1;
    thr_empty_seq2 te_seq2;
 
    function new(string name="",uvm_component parent);
              super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);
           super.build_phase(phase);
    endfunction

    task run_phase(uvm_phase phase);
         super.run_phase(phase);
         phase.raise_objection(this);
         te_seq1=thr_empty_seq1::type_id::create("te_seq1");
         te_seq2=thr_empty_seq2::type_id::create("te_seq2");
         fork
             te_seq1.start(env.agt_top.agt[0].seqr);
             te_seq2.start(env.agt_top.agt[1].seqr);
         join
         #40;
         phase.drop_objection(this);
    endtask

endclass

