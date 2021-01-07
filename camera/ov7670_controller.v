module ov7670_controller(clk, resend, config_finished, sioc, siod);
   input           clk;
   input           resend;
   output          config_finished;
   output          sioc;
   inout           siod;

   
   wire [15:0]     command;
   wire            finished;
   wire            taken;
   wire            send;
   parameter [7:0] camera_address = 8'h42;
   
   assign config_finished = finished;
   assign send = (~finished);
   
   
   i2c_sender Inst_i2c_sender(.clk(clk), .taken(taken), .siod_out(siod), .sioc(sioc), .send(send), .id(camera_address), .reg_xhdl0(command[15:8]), .value(command[7:0]));

   
   
   ov7670_registers Inst_ov7670_registers(.clk(clk), .advance(taken), .command(command), .finished(finished), .resend(resend));
   

   
endmodule