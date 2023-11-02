module FSM(
	clk,
	N,
	D,
	Q,
	rst,
	Dispense,
	ReturnNickle,
	ReturnDime,
	ReturnTwoDimes,
	S0,
	S1,
	S2,
	S3,
	S4,
	S5,
	S6,
	S7,
	S8,
	S9
);


input wire	clk;
input wire	N;
input wire	D;
input wire	Q;
input wire	rst;
output wire	Dispense;
output wire	ReturnNickle;
output wire	ReturnDime;
output wire	ReturnTwoDimes;

wire	Db;
wire	Nb;
wire	NbDbQb;
wire	Qb;
output reg	S0;
output reg	S1;
output reg	S2;
output reg	S3;
output reg	S4;
output reg	S5;
output reg	S6;
output reg	S7;
output reg	S8;
output reg	S9;
wire	VCC;



assign	Nb =  ~N;

assign	Db =  ~D;

assign	Qb =  ~Q;

assign	NbDbQb = Nb & Db & Qb;

assign	VCC = 1;


always@(posedge clk or negedge VCC or negedge rst)
begin
if (!VCC)
	begin
	S0 <= 0;
	end
else
if (!rst)
	begin
	S0 <= 1;
	end
else
	begin
	S0 <= S0&Nb&Db&Qb|S5|S6|S7|S8|S9;
	end
end




always@(posedge clk or negedge rst or negedge VCC)
begin
if (!rst)
	begin
	S1 <= 0;
	end
else
if (!VCC)
	begin
	S1 <= 1;
	end
else
	begin
	S1 <= S1&Nb&Db&Qb|S0&N;
	end
end


always@(posedge clk or negedge rst or negedge VCC)
begin
if (!rst)
	begin
	S2 <= 0;
	end
else
if (!VCC)
	begin
	S2 <= 1;
	end
else
	begin
	S2 <= S2&Nb&Db&Qb|S1&N|S0&D;
	end
end


always@(posedge clk or negedge rst or negedge VCC)
begin
if (!rst)
	begin
	S3 <= 0;
	end
else
if (!VCC)
	begin
	S3 <= 1;
	end
else
	begin
	S3 <= S3&Nb&Db&Qb|S1&D|S2&N;
	end
end


always@(posedge clk or negedge rst or negedge VCC)
begin
if (!rst)
	begin
	S4 <= 0;
	end
else
if (!VCC)
	begin
	S4 <= 1;
	end
else
	begin
	S4 <= S4&Nb&Db&Qb|S3&N|S2&D;
	end
end


always@(posedge clk or negedge rst or negedge VCC)
begin
if (!rst)
	begin
	S5 <= 0;
	end
else
if (!VCC)
	begin
	S5 <= 1;
	end
else
	begin
	S5 <= S4&N|S3&D|S0&Q;
	end
end



always@(posedge clk or negedge rst or negedge VCC)
begin
if (!rst)
	begin
	S6 <= 0;
	end
else
if (!VCC)
	begin
	S6 <= 1;
	end
else
	begin
	S6 <= S1&Q|S4&D;
	end
end


always@(posedge clk or negedge rst or negedge VCC)
begin
if (!rst)
	begin
	S7 <= 0;
	end
else
if (!VCC)
	begin
	S7 <= 1;
	end
else
	begin
	S7 <= S2&Q;
	end
end


always@(posedge clk or negedge rst or negedge VCC)
begin
if (!rst)
	begin
	S8 <= 0;
	end
else
if (!VCC)
	begin
	S8 <= 1;
	end
else
	begin
	S8 <= S3&Q;
	end
end


always@(posedge clk or negedge rst or negedge VCC)
begin
if (!rst)
	begin
	S9 <= 0;
	end
else
if (!VCC)
	begin
	S9 <= 1;
	end
else
	begin
	S9 <= S4 & Q;
	end
end


assign	ReturnNickle = S6|S8;

assign	ReturnDime = S7|S8;

assign	Dispense = S5|S6|S7|S8|S9;

assign	ReturnTwoDimes = S9;

endmodule
