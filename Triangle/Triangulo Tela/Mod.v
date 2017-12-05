module Mod (
  input signed [0:20] i,
  output signed [0:20] o
  );

  assign o = i[20] ? -i : i;
endmodule