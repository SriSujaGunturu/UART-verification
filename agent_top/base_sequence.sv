class base_sequence extends uvm_sequence #(transaction);

   `uvm_object_utils(base_sequence)

    function new (string name="");
         super.new(name);
    endfunction

endclass


class full_duplex_seq1 extends base_sequence;

   `uvm_object_utils(full_duplex_seq1)

    function new (string name="");
         super.new(name);
    endfunction

    task body();
        req=transaction::type_id::create("req");
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b1000_0000;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0000;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd27;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b0010_0110;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==1; data_in==8'b0000_0110;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0001;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd11;});
        finish_item(req);
        
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==0; data_in==8'b0;});
        finish_item(req);
        get_response(req);
 
       if(req.iir[3:1]==3'b010)        begin
           start_item(req);
           assert(req.randomize() with {addr_in==0; wr_enb_in==0; data_in==8'b0;});
           finish_item(req);
       end

   endtask

endclass

class full_duplex_seq2 extends base_sequence;

   `uvm_object_utils(full_duplex_seq2)

    function new (string name="");
         super.new(name);
    endfunction

    task body();
        req=transaction::type_id::create("req");
        
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b10000000;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0000;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd13;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b0010_0110;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==1; data_in==8'b0000_0110;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0001;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd22;});
        finish_item(req);
        
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==0; data_in==8'b0;});
        finish_item(req);
        get_response(req);

       if(req.iir[3:1]==3'b010)        begin
           start_item(req);
           assert(req.randomize() with {addr_in==0; wr_enb_in==0; data_in==8'b0;});
           finish_item(req);
       end
  
   endtask
endclass


class half_duplex_seq1 extends base_sequence;

   `uvm_object_utils(half_duplex_seq1)

    function new (string name="");
         super.new(name);
    endfunction

    task body();
        req=transaction::type_id::create("req");
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b10000000;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0000;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd27;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b00000001;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==1; data_in==8'b00000110;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b00000001;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd33;});
        finish_item(req);
        
       

   endtask

endclass


class half_duplex_seq2 extends base_sequence;

   `uvm_object_utils(half_duplex_seq2)

    function new (string name="");
         super.new(name);
    endfunction

    task body();
        req=transaction::type_id::create("req");
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b10000000;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b00000000;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd13;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b00000001;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==1; data_in==8'b00000110;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b00000001;});
        finish_item(req);
        
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==0; data_in==8'b0;});
        finish_item(req);
        get_response(req);

       if(req.iir[3:1]==2)        begin
           start_item(req);
           assert(req.randomize() with {addr_in==0; wr_enb_in==0; data_in==8'b0;});
           finish_item(req);
       end

   endtask

endclass


class loop_back_seq1 extends base_sequence;

   `uvm_object_utils(loop_back_seq1)

    function new (string name="");
         super.new(name);
    endfunction

    task body();
        req=transaction::type_id::create("req");
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b10000000;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b00000000;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd27;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b00000011;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==1; data_in==8'b00000110;});
        finish_item(req);
//mcr register
        start_item(req);
        assert(req.randomize() with {addr_in==4; wr_enb_in==1; data_in==8'b0001_0000;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0001;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd44;});
        finish_item(req);
        
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==0; data_in==8'b0;});
        finish_item(req);
        get_response(req);

       if(req.iir[3:1]==2)        begin
           start_item(req);
           assert(req.randomize() with {addr_in==0; wr_enb_in==0; data_in==8'b0;});
           finish_item(req);
       end

   endtask
endclass


class loop_back_seq2 extends base_sequence;

   `uvm_object_utils(loop_back_seq2)

    function new (string name="");
         super.new(name);
    endfunction

    task body();
        req=transaction::type_id::create("req");
//enables DLR register
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b1000_0000;});
        finish_item(req);

//DLR MSB
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0000;});
        finish_item(req);

//DLR LSB
        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd13;});
        finish_item(req);

//Enable normal register
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b0000_0011;});
        finish_item(req);

//reset FIFO
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==1; data_in==8'b0000_0110;});
        finish_item(req);
//mcr register
        start_item(req);
        assert(req.randomize() with {addr_in==4; wr_enb_in==1; data_in==8'b0001_0000;});
        finish_item(req);

//Enable intreupt ier
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0001;});
        finish_item(req);

//sending data to thr
        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd55;});
        finish_item(req);
        

        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==0; data_in==8'b0;});
        finish_item(req);
        get_response(req);

       if(req.iir[3:1]==2)        begin
           start_item(req);
           assert(req.randomize() with {addr_in==0; wr_enb_in==0; data_in==8'b0;});
           finish_item(req);
       end

   endtask

endclass

class parity_error_seq1 extends base_sequence;

   `uvm_object_utils(parity_error_seq1)

    function new (string name="");
         super.new(name);
    endfunction

    task body();
        req=transaction::type_id::create("req");
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b10000000;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b00000000;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd27;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b0001_1011;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==1; data_in==8'b00000110;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0100;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd66;});
        finish_item(req);
        
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==0; data_in==8'b0;});
        finish_item(req);
        get_response(req);

       if(req.iir[3:1]==3)        begin
           start_item(req);
           assert(req.randomize() with {addr_in==5; wr_enb_in==0; data_in==8'b0;});
           finish_item(req);
       end

   endtask

endclass

class parity_error_seq2 extends base_sequence;

   `uvm_object_utils(parity_error_seq2)

    function new (string name="");
         super.new(name);
    endfunction

    task body();
        req=transaction::type_id::create("req");
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b10000000;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b00000000;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd13;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b0000_1011;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==1; data_in==8'b00000110;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0100;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd77;});
        finish_item(req);
        
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==0; data_in==8'b0;});
        finish_item(req);
        get_response(req);

       if(req.iir[3:1]==3)        begin
           start_item(req);
           assert(req.randomize() with {addr_in==5; wr_enb_in==0; data_in==8'b0;});
           finish_item(req);
       end

   endtask

endclass

class framing_error_seq1 extends base_sequence;

   `uvm_object_utils(framing_error_seq1)

    function new (string name="");
         super.new(name);
    endfunction

    task body();
        req=transaction::type_id::create("req");
//enables DLR register
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b1000_0000;});
        finish_item(req);

//DLR MSB
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0000;});
        finish_item(req);

//DLR LSB
        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd27;});
        finish_item(req);

//Enable normal register
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b0000_0011;});
        finish_item(req);

//reset FIFO
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==1; data_in==8'b0000_0110;});
        finish_item(req);

//Enable intreupt ier
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0100;});
        finish_item(req);

//sending data to thr
        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd88;});
        finish_item(req);
        

        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==0; data_in==8'b0;});
        finish_item(req);
        get_response(req);

       if(req.iir[3:1]==3)        begin
           start_item(req);
           assert(req.randomize() with {addr_in==5; wr_enb_in==0; data_in==8'b0;});
           finish_item(req);
       end

   endtask

endclass


class framing_error_seq2 extends base_sequence;

   `uvm_object_utils(framing_error_seq2)

    function new (string name="");
         super.new(name);
    endfunction

    task body();
        req=transaction::type_id::create("req");
//enables DLR register
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b1000_0000;});
        finish_item(req);

//DLR MSB
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0000;});
        finish_item(req);

//DLR LSB
        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd13;});
        finish_item(req);

//Enable normal register
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b0000_0000;});
        finish_item(req);

//reset FIFO
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==1; data_in==8'b0000_0110;});
        finish_item(req);

//Enable intreupt ier
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0100;});
        finish_item(req);

//sending data to thr
        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd99;});
        finish_item(req);

        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==0; data_in==8'b0;});
        finish_item(req);
        get_response(req);

       if(req.iir[3:1]==3)        begin
           start_item(req);
           assert(req.randomize() with {addr_in==5; wr_enb_in==0; data_in==8'b0;});
           finish_item(req);
       end
        
   endtask

endclass

class over_run_seq1 extends base_sequence;

   `uvm_object_utils(over_run_seq1)

    function new (string name="");
         super.new(name);
    endfunction

    task body();
        req=transaction::type_id::create("req");
//enables DLR register
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b1000_0000;});
        finish_item(req);

//DLR MSB
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0000;});
        finish_item(req);

//DLR LSB
        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd27;});
        finish_item(req);

//Enable normal register
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b0000_0011;});
        finish_item(req);

//reset FIFO
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==1; data_in==8'b1000_0110;});
        finish_item(req);

//Enable intreupt ier
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0100;});
        finish_item(req);

//sending data to thr
        repeat(20) begin
            start_item(req);
            assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd9;});
            finish_item(req);
        end

//receving data
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==0; data_in==8'b0;});
        finish_item(req);
        get_response(req);

       if(req.iir[3:1]==3)        begin
           start_item(req);
           assert(req.randomize() with {addr_in==5; wr_enb_in==0; data_in==8'b0;});
           finish_item(req);
       end

   endtask

endclass


class over_run_seq2 extends base_sequence;

   `uvm_object_utils(over_run_seq2)

    function new (string name="");
         super.new(name);
    endfunction

    task body();
        req=transaction::type_id::create("req");
//enables DLR register
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b1000_0000;});
        finish_item(req);

//DLR MSB
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0000;});
        finish_item(req);

//DLR LSB
        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd13;});
        finish_item(req);

//Enable normal register
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b0000_0011;});
        finish_item(req);

//reset FIFO
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==1; data_in==8'b1000_0110;});
        finish_item(req);

//Enable intreupt ier
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0100;});
        finish_item(req);

//sending data to thr
        repeat(20) begin
            start_item(req);
            assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd8;});
            finish_item(req);
        end
//receving data
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==0; data_in==8'b0;});
        finish_item(req);
        get_response(req);

       if(req.iir[3:1]==3)        begin
           start_item(req);
           assert(req.randomize() with {addr_in==5; wr_enb_in==0; data_in==8'b0;});
           finish_item(req);
       end
        
   endtask

endclass


class break_intreupt_seq1 extends base_sequence;

   `uvm_object_utils(break_intreupt_seq1)

    function new (string name="");
         super.new(name);
    endfunction

    task body();
        req=transaction::type_id::create("req");
//enables DLR register
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b1000_0000;});
        finish_item(req);

//DLR MSB
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0000;});
        finish_item(req);

//DLR LSB
        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd27;});
        finish_item(req);

//Enable normal register LCR
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b0100_0011;});
        finish_item(req);

//reset FIFO
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==1; data_in==8'b0000_0110;});
        finish_item(req);

//Enable intreupt ier
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0100;});
        finish_item(req);

//sending data to thr
            start_item(req);
            assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd6;});
            finish_item(req);
//receving data
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==0; data_in==8'b0;});
        finish_item(req);
        get_response(req);

       if(req.iir[3:1]==3)        begin
           start_item(req);
           assert(req.randomize() with {addr_in==5; wr_enb_in==0; data_in==8'b0;});
           finish_item(req);
       end
        
   endtask
endclass

class break_intreupt_seq2 extends base_sequence;

   `uvm_object_utils(break_intreupt_seq2)

    function new (string name="");
         super.new(name);
    endfunction

    task body();
        req=transaction::type_id::create("req");
//enables DLR register
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b1000_0000;});
        finish_item(req);

//DLR MSB
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0000;});
        finish_item(req);

//DLR LSB
        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd13;});
        finish_item(req);

//Enable normal register LCR
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b0100_0011;});
        finish_item(req);

//reset FIFO
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==1; data_in==8'b0000_0110;});
        finish_item(req);

//Enable intreupt ier
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0100;});
        finish_item(req);

//sending data to thr
            start_item(req);
            assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd7;});
            finish_item(req);
//receving data
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==0; data_in==8'b0;});
        finish_item(req);
        get_response(req);

       if(req.iir[3:1]==3)        begin
           start_item(req);
           assert(req.randomize() with {addr_in==5; wr_enb_in==0; data_in==8'b0;});
           finish_item(req);
       end
        
   endtask
endclass


class time_out_seq1 extends base_sequence;

   `uvm_object_utils(time_out_seq1)

    function new (string name="");
         super.new(name);
    endfunction

    task body();
        req=transaction::type_id::create("req");
//enables DLR register
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b1000_0000;});
        finish_item(req);

//DLR MSB
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0000;});
        finish_item(req);

//DLR LSB
        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd27;});
        finish_item(req);

//Enable normal register LCR
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b0000_0011;});
        finish_item(req);

//reset FIFO FCR
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==1; data_in==8'b1100_0110;});
        finish_item(req);

//Enable intreupt ier
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0101;});
        finish_item(req);

//sending data to thr
            start_item(req);
            assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd7;});
            finish_item(req);
//receving data
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==0; data_in==8'b0;});
        finish_item(req);
        get_response(req);

       if(req.iir[3:1]==6)        begin
           start_item(req);
           assert(req.randomize() with {addr_in==0; wr_enb_in==0; data_in==8'b0;});
           finish_item(req);
       end
        
   endtask
endclass


class time_out_seq2 extends base_sequence;

   `uvm_object_utils(time_out_seq2)

    function new (string name="");
         super.new(name);
    endfunction

    task body();
        req=transaction::type_id::create("req");
//enables DLR register
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b1000_0000;});
        finish_item(req);

//DLR MSB
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0000;});
        finish_item(req);

//DLR LSB
        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd13;});
        finish_item(req);

//Enable normal register LCR
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b0000_0011;});
        finish_item(req);

//reset FIFO FCR
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==1; data_in==8'b0100_0110;});
        finish_item(req);

//Enable intreupt ier
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0101;});
        finish_item(req);

//sending data to thr
            start_item(req);
            assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd6;});
            finish_item(req);
//receving data
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==0; data_in==8'b0;});
        finish_item(req);
        get_response(req);

       if(req.iir[3:1]==6)        begin
           start_item(req);
           assert(req.randomize() with {addr_in==0; wr_enb_in==0; data_in==8'b0;});
           finish_item(req);
       end
        
   endtask
endclass

class thr_empty_seq1 extends base_sequence;

   `uvm_object_utils(thr_empty_seq1)

    function new (string name="");
         super.new(name);
    endfunction

    task body();
        req=transaction::type_id::create("req");
//enables DLR register
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b1000_0000;});
        finish_item(req);

//DLR MSB
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0000;});
        finish_item(req);

//DLR LSB
        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd27;});
        finish_item(req);

//Enable normal register LCR
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b0000_0011;});
        finish_item(req);

//reset FIFO
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==1; data_in==8'b0000_0110;});
        finish_item(req);

//Enable intreupt ier
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0010;});
        finish_item(req);

//sending data to thr
            start_item(req);
            assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd5;});
            finish_item(req);
//receving data
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==0; data_in==8'b0;});
        finish_item(req);
        get_response(req);

       if(req.iir[3:1]==1)        begin
           start_item(req);
           assert(req.randomize() with {addr_in==5; wr_enb_in==0; data_in==8'b0;});
           finish_item(req);
       end
        
   endtask
endclass

class thr_empty_seq2 extends base_sequence;

   `uvm_object_utils(thr_empty_seq2)

    function new (string name="");
         super.new(name);
    endfunction

    task body();
        req=transaction::type_id::create("req");
//enables DLR register
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b1000_0000;});
        finish_item(req);

//DLR MSB
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0000;});
        finish_item(req);

//DLR LSB
        start_item(req);
        assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd13;});
        finish_item(req);

//Enable normal register LCR
        start_item(req);
        assert(req.randomize() with {addr_in==3; wr_enb_in==1; data_in==8'b0000_0011;});
        finish_item(req);

//reset FIFO
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==1; data_in==8'b0000_0110;});
        finish_item(req);

//Enable intreupt ier
        start_item(req);
        assert(req.randomize() with {addr_in==1; wr_enb_in==1; data_in==8'b0000_0010;});
        finish_item(req);

//sending data to thr
            start_item(req);
            assert(req.randomize() with {addr_in==0; wr_enb_in==1; data_in==8'd4;});
            finish_item(req);
//receving data
        start_item(req);
        assert(req.randomize() with {addr_in==2; wr_enb_in==0; data_in==8'b0;});
        finish_item(req);
        get_response(req);

       if(req.iir[3:1]==1)        begin
           start_item(req);
           assert(req.randomize() with {addr_in==5; wr_enb_in==0; data_in==8'b0;});
           finish_item(req);
       end
        
   endtask
endclass

