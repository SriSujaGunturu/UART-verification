class scoreboard extends uvm_scoreboard;

   `uvm_component_utils(scoreboard)

    uvm_tlm_analysis_fifo #(transaction) fifo_export[];

    env_config env_cfg;

    transaction trans1,trans2;

    transaction cov_data;

     int thr1size,thr2size;
     int rb1size,rb2size;


    covergroup trans_signal_cov;
           option.per_instance=1;
           
           DATA: coverpoint cov_data.data_in[7:0] {bins data_in={[1:255]};}
           ADDRESS: coverpoint cov_data.addr_in[2:0] {bins addr_in={[0:7]};}
           WR_ENABLE: coverpoint cov_data.wr_enb_in { bins rd ={0};
                                                      bins wr ={1};}
    endgroup

    covergroup trans_lcr_cov;
           option.per_instance=1;

           CHAR_SIZE: coverpoint cov_data.lcr[1:0] {bins five = {2'b00};
                                                    bins six = {2'b01};
                                                    bins seven= {2'b10};
                                                    bins eight={2'b11};   }

          STOP_BIT: coverpoint cov_data.lcr[2] {bins one = {1'b0};
                                                bins two = {1'b1};   }

          PARITY: coverpoint cov_data.lcr[3] {bins no_parity ={1'b0};
                                              bins parity_en ={1'b1}; }

          EV_ODD_PARITY: coverpoint cov_data.lcr[4] {bins odd={1'b0};
                                                     bins even={1'b1};  }  

          STICK_PARITY: coverpoint cov_data.lcr[5] {bins no_stick_parity={1'b0};
                                                   bins stick_parity={1'b1}; }

          BREAK: coverpoint cov_data.lcr[6] {bins low={1'b0};
                                            bins high={1'b1};  }

          DIV_LCH: coverpoint cov_data.lcr[7] {bins low={1'b0};
                                              bins high={1'b1};  }
 
          LCR_RST: coverpoint cov_data.lcr[7:0] {bins lcr_rst={8'd3};  }

          CHAR_SIZE_X_STOP_BIT_X_EV_ODD_PARITY: cross CHAR_SIZE,STOP_BIT,EV_ODD_PARITY;

    endgroup

    covergroup trans_ier_cov;
        option.per_instance=1;

        RCVD_INT: coverpoint cov_data.ier[0] {bins dis={1'b0};
                                              bins en={1'b1}; }
      
        THRE_INT: coverpoint cov_data.ier[1] {bins dis={1'b0};
                                              bins en={1'b1};  }
       
        LSR_INT: coverpoint cov_data.ier[2] {bins dis={1'b0};
                                             bins en={1'b1};   }
   
   endgroup

   covergroup trans_fcr_cov;
        option.per_instance=1;
         
        RFIFO: coverpoint cov_data.fcr[1] {bins dis={1'b0};
                                           bins clr={1'b1}; }

        TFIFO: coverpoint cov_data.fcr[2] {bins dis={1'b0};
                                           bins clr={1'b1};  }

        TRG_LVL: coverpoint cov_data.fcr[7:6] {bins ones= {2'b00};
                                               bins four= {2'b01};
                                               bins eight={2'b10};
                                               bins fourteen={2'b11};  }
 
   endgroup

   covergroup trans_mcr_cov;
         option.per_instance=1;

         LB: coverpoint cov_data.mcr[4] {bins dis= {1'b0};
                                         bins en= {1'b1};  }
   endgroup

   covergroup trans_iir_cov;
          option.per_instance=1;

          IIR: coverpoint cov_data.iir[3:1] {bins lsr= {3'b011};
                                             bins rdf= {3'b010};
                                             bins ti_o= {3'b110};
                                             bins threm= {3'b001};  }
   endgroup

   covergroup trans_lsr_cov;
          option.per_instance=1;
          
          DATA_READY: coverpoint cov_data.lsr[0] {bins fifoempty= {1'b0};
                                                  bins datarcvd= {1'b1};   }
      
          OVER_RUN: coverpoint cov_data.lsr[1] {bins nooverrun= {1'b0};
                                               bins overrun={1'b1};   }
        
          PARITY_ERROR: coverpoint cov_data.lsr[2] {bins noparityerr= {1'b0};
                                                   bins parityerr={1'b1};   }
         
          BREAK_INT: coverpoint cov_data.lsr[4] {bins nobreakint= {1'b0};
                                                   bins breakont= {1'b1};  }

          FRAME_ERROR: coverpoint cov_data.lsr[3] {bins noframeerr= {1'b0};
                                                   bins frameerr= {1'b1};   }
        
         THR_EMPTY: coverpoint cov_data.lsr[5] {bins thrnotemp= {1'b0};
                                                bins thremp ={1'b1};    }

   endgroup

    function new(string name="",uvm_component parent);
           super.new(name,parent);
           trans_signal_cov=new();
           trans_lcr_cov=new();
           trans_ier_cov=new();
           trans_fcr_cov=new();
           trans_mcr_cov=new();
           trans_iir_cov=new();
           trans_lsr_cov=new();
    endfunction

   function void build_phase(uvm_phase phase);
           super.build_phase(phase);
           if(!uvm_config_db #(env_config)::get(this,"","env_config",env_cfg))
                  `uvm_fatal("SCOREBOARD","cannot get env_cfg")

           fifo_export=new[env_cfg.no_of_agents];
           foreach(fifo_export[i])
                   fifo_export[i]=new($sformatf("fifo_export[%0d]",i),this);

           trans1=transaction::type_id::create("trans1");
           trans2=transaction::type_id::create("trans2");

   endfunction

   task run_phase(uvm_phase phase);
       fork 
         begin
            forever begin
               fifo_export[0].get(trans1);
               cov_data=trans1;
               trans_signal_cov.sample();
               trans_lcr_cov.sample();
               trans_ier_cov.sample();
               trans_fcr_cov.sample();
               trans_mcr_cov.sample();
               trans_iir_cov.sample();
               trans_lsr_cov.sample();
            end
         end
         begin
           forever begin
              fifo_export[1].get(trans2);
               cov_data=trans2;
               trans_signal_cov.sample();
               trans_lcr_cov.sample();
               trans_ier_cov.sample();
               trans_fcr_cov.sample();
               trans_mcr_cov.sample();
               trans_iir_cov.sample();
               trans_lsr_cov.sample();
           end
         end
       join
    endtask

   function void check_phase(uvm_phase phase);
          
          thr1size=trans1.thr.size;
          $display("The size of thr1: %0d",thr1size);
	  $display("Value of thr1: %0p",trans1.thr);
          thr2size=trans2.thr.size;
          $display("The size of thr2: %0d",thr2size);
	  $display("Value of thr2: %0p",trans2.thr);
          rb1size=trans1.rb.size;
          $display("The size of rb1: %0d",rb1size);  
	  $display("Value of rb1: %0p",trans1.rb);
          rb2size=trans2.rb.size;
          $display("The size of rb2= %0d",rb2size);
	  $display("Value of rb2 =%0p",trans2.rb);

//time out        
          if(trans1.fcr[7:6]!=trans2.fcr[7:6])
          begin
               if(trans1.iir[3:1]==6)
	        	`uvm_info(get_type_name(),$sformatf("\n\n TIME OUT IN UART1 SUCCESSFUL \n"),UVM_LOW)
               if(trans2.iir[3:1]==6)
		        `uvm_info(get_type_name(),$sformatf("\n\n TIME OUT IN UART2 SUCCESSFUL \n"),UVM_LOW)
               
	      `uvm_info(get_type_name(),$sformatf(" \n FROM SB UART_1: \n%s \n FROM SB UART_2: \n%s", trans1.sprint(), trans2.sprint()),UVM_MEDIUM)
          end
//thr empty
          else if(trans1.ier[1]==1  && trans1.iir[3:1]==1 && trans1.lsr[5]==1 && trans2.ier[1]==1  && trans2.iir[3:1]==1 && trans2.lsr[5]==1) begin
		`uvm_info(get_type_name(),$sformatf("\n\n THR EMPTY SUCCESSFUL \n"),UVM_LOW)
		`uvm_info(get_type_name(),$sformatf(" \n FROM SB UART_1: \n%s \n FROM SB UART_2: \n%s", trans1.sprint(), trans2.sprint()),UVM_MEDIUM)
	  end
// Full duplex
          else if(thr1size!=0 && thr2size!=0 && trans1.thr==trans2.rb  && trans2.thr==trans1.rb) begin
		`uvm_info(get_type_name(),$sformatf("\n\n FULL_DUPLEX SUCCESSFUL \n"),UVM_LOW)
		`uvm_info(get_type_name(),$sformatf(" \n FROM SB UART_1: \n%s \n FROM SB UART_2: \n%s", trans1.sprint(), trans2.sprint()),UVM_MEDIUM)
	  end

//Half duplex    
          else if(thr1size!=0 && thr2size==0 && trans1.thr==trans2.rb) 
          begin
		`uvm_info(get_type_name(),$sformatf("\n\n HALF_DUPLEX SUCCESSFUL \n"),UVM_LOW)
		`uvm_info(get_type_name(),$sformatf(" \n FROM SB UART_1: \n%s \n FROM SB UART_2: \n%s", trans1.sprint(), trans2.sprint()),UVM_MEDIUM)
          end
//Loop back
          else if(trans1.mcr[4]==1 &&  trans1.thr==trans1.rb && trans2.thr==trans2.rb)         
          begin
		`uvm_info(get_type_name(),$sformatf("\n\n LOOP_BACK  SUCCESSFUL \n"),UVM_LOW)
		`uvm_info(get_type_name(),$sformatf(" \n FROM SB UART_1: \n%s \n FROM SB UART_2: \n%s", trans1.sprint(), trans2.sprint()),UVM_MEDIUM)
          end
//parity error
          else if(trans1.lcr[3]==1 && trans1.ier[2]==1 && trans1.iir[3:1]==3 && trans1.lsr[2]==1 && trans2.lcr[3]==1 && trans2.ier[2]==1 && trans2.iir[3:1]==3 && trans2.lsr[2]==1)
          begin
		`uvm_info(get_type_name(),$sformatf("\n\n PARITY_ERROR  SUCCESSFUL \n"),UVM_LOW)
		`uvm_info(get_type_name(),$sformatf(" \n FROM SB UART_1: \n%s \n FROM SB UART_2: \n%s", trans1.sprint(), trans2.sprint()),UVM_MEDIUM)
          end 
//framing error
          else if(trans1.ier[2]==1 && trans1.iir[3:1]==3 && trans1.lsr[3]==1 && trans2.ier[2]==1 && trans2.iir[3:1]==3 && trans2.lsr[3]==1)
          begin
		`uvm_info(get_type_name(),$sformatf("\n\n FRAMING_ERROR  SUCCESSFUL \n"),UVM_LOW)
		`uvm_info(get_type_name(),$sformatf(" \n FROM SB UART_1: \n%s \n FROM SB UART_2: \n%s", trans1.sprint(), trans2.sprint()),UVM_MEDIUM)
          end 
//over run
          else if(trans1.ier[2]==1 && trans1.iir[3:1]==3 && trans1.lsr[1]==1 && trans2.ier[2]==1 && trans2.iir[3:1]==3 && trans2.lsr[1]==1 )
          begin
		`uvm_info(get_type_name(),$sformatf("\n\n OVER RUN  SUCCESSFUL \n"),UVM_LOW)
		`uvm_info(get_type_name(),$sformatf(" \n FROM SB UART_1: \n%s \n FROM SB UART_2: \n%s", trans1.sprint(), trans2.sprint()),UVM_MEDIUM)
          end 
//break intreupt
          else if(trans1.lcr[6]==1 && trans1.iir[3:1]==3 && trans1.lsr[4]==1 && trans1.ier[2]==1 && trans2.iir[3:1]==3 && trans2.lsr[4]==1 && trans2.lcr[6]==1 && trans2.ier[2]==1 )
          begin
		`uvm_info(get_type_name(),$sformatf("\n\n BREAK INTREUPT  SUCCESSFUL \n"),UVM_LOW)
		`uvm_info(get_type_name(),$sformatf(" \n FROM SB UART_1: \n%s \n FROM SB UART_2: \n%s", trans1.sprint(), trans2.sprint()),UVM_MEDIUM)
          end
               
          else begin
		`uvm_info(get_type_name(),$sformatf("\n PROTOCOL FAILED \n"),UVM_LOW);
		`uvm_info(get_type_name(),$sformatf(" \n FROM SB UART_1: \n%s \n FROM SB UART_2: \n%s", trans1.sprint(), trans2.sprint()),UVM_MEDIUM)
          end
   endfunction

endclass
 
    
