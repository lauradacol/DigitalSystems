module Mod (
  input signed [17:0] i,
  output signed [17:0] o
  );

  assign o = i[17] ? -i : i;
  
endmodule