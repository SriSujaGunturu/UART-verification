class source_cfg extends uvm_object;

   `uvm_object_utils(source_cfg)
  
    virtual uart_intf vif;
     
    uvm_active_passive_enum is_active=UVM_ACTIVE;

   function new(string name="");
       super.new(name);
   endfunction
  
endclass
