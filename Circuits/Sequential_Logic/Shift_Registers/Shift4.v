module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 

    // always @(posedge clk or posedge areset or posedge load or posedge ena) begin
    //     if(areset)
    //         q <= 0;
    //     else if (load)
    //         q <= data;
    //     else if (ena)
    //         q <= {1'b0, q[2:0]};
    //     else
    //         ;
    // end


    always @(posedge clk or posedge areset) begin
      if (areset) begin
        q <= 0;
      end
      else if(load) begin
        q <= data;
      end
      else if (ena) begin
        q <= {1'b0, q[3:1]};
      end
      else begin
      ;
      end

      // if (areset) begin
      //   q <= 0;
      // end
      // else
      // ;
    end

    // always @(posedge areset) begin
      // q <= 0;
    // end
endmodule
