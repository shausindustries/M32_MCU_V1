`timescale 1ns / 1ps

module top(of,clk,rst,gpio_pins);
input clk,rst;
inout [31:0] gpio_pins;
output of;

wire we3,we,sel1,sel2,sel3,j,beq,bne,ofs,br6,br7,br8,br9,brval,taken,tc_sig,tp_sig,cnf_sig,
br10,br11,cr5,cr6,cr7,cr8,dr4,dr5,memrd,flush,flush_id,flush_if,br15,zf,
selm,t1,stall,nop,ar3,br16,mispredict,gpio_o,gpio_i,dm_sig,gpio_e,gpio_d,dmw;
wire [2:0]op,br5;
wire [31:0]pc,instr,rdreg1,rdreg2,sim,alres1,alres2,alres3,d_out,m1r,m2r,m3r,pre,comp,cnf,
m4r,m5r,pro1,ar1,ar2,br1,br2,br3,br4,cr1,cr2,cr3,dr1,dr2,btp,opra,oprb,dec_adr,d_mask,
e_mask,dmem_out,gpi_out;
wire [4:0]mr,br12,br13,br14,cr4,dr3;
wire [1:0]sel1mf,sel2mf;
wire [25:0] pro2;

assign brval = beq | bne;
assign pro2 = instr[25:0] << 2;
assign  of = ofs & t1;
assign selm = ((~zf & br15)|(zf & br11));
assign mispredict = br16 ^ selm;
assign flush_id = nop | flush | mispredict;
assign flush_if = j | flush | mispredict;

//Architecture
prog_counter pc1 (.pco(pc),.clk(clk),.pci(m5r),.stl(stall),.rst(rst));
alu_behaviour a2 (.a(pc),.b(32'h00000004),.op(3'b000),.o(alres2));
l_shift l1 (.in(sim),.out(pro1));
alu_behaviour a3 (.a(pro1),.b(ar2),.op(3'b000),.o(alres3));
mux_32 m3 (.a(alres2),.b(btp),.sel(taken),.o(m3r));
mux_32 m4 (.a(m3r),.b(br4),.sel(mispredict),.o(m4r));
mux_32 m5 (.a(m4r),.b({alres2[31:28],pro2,2'b00}),.sel(j),.o(m5r));


ins_mem im1 (.a(pc),.rd(instr));
p_mux p1 (.a(br12),.b(br13),.sel(br7),.o(mr));
reg_file rf1 (.a1(ar1[25:21]),.a2(ar1[20:16]),.a3(dr3),.rd1(rdreg1),
.rd2(rdreg2),.wd3(m2r),.clk(clk),.we3(dr4),.rst(rst));
sign_extend se1 (.in(ar1[15:0]),.out(sim));
mux_32 m1 (.a(br2),.b(br3),.sel(br6),.o(m1r));
alu_behaviour a1 (.a(opra),.b(oprb),.op(br5),.o(alres1),.zf(zf),.of(t1));
data_mem dm1 (.clk(clk),.a(dec_adr),.wd(m2r),.rd(dmem_out),.we(dmw));
mux_32 m2 (.a(dr1),.b(dr2),.sel(dr5),.o(m2r));

//Control Logic
control_unit c1 (.opcode(ar1[31:26]),.funct(ar1[5:0]),.we(we),.we3(we3),.rst(rst),
.sel1(sel1),.sel2(sel2),.sel3(sel3),.j(j),.alc(op),.beq(beq),.bne(bne),.ofs(ofs),.mrd(memrd));

//Pipeline Registers
if_id i1 (.ar1(instr),.ar2(alres2),.clk(clk),.ao1(ar1),.ao2(ar2),.flush(flush_if),.stall(stall),
.ar3(taken),.ao3(ar3),.rst(rst));

id_ex i2 (.br1(rdreg1),.br2(rdreg2),.br3(sim),.br4(alres3),.br5(op),.br6(sel1),.br7(sel3),
.br8(we3),.br9(sel2),.br10(we),.br11(beq),.br12(ar1[20:16]),.br13(ar1[15:11]),
.br14(ar1[25:21]),.br15(bne),.nop(flush_id),.clk(clk),.bo1(br1),.bo2(br2),.bo3(br3),.bo4(br4),
.bo5(br5),.bo6(br6),.bo7(br7),.bo8(br8),.bo9(br9),.bo10(br10),.bo11(br11),.bo12(br12),
.bo13(br13),.bo15(br15),.br16(ar3),.bo16(br16),.rst(rst));

ex_mem i3 (.cr1(alres1),.cr2(br2),.cr3(alres3),.cr4(mr),.cr5(br8),.cr6(br9),.cr7(br10),
.clk(clk),.co1(cr1),.co2(cr2),.co3(cr3),.co4(cr4),.co5(cr5),.co6(cr6),.co7(cr7),.rst(rst));

mem_wb i4 (.dr1(cr1),.dr2(d_out),.dr3(mr),.dr4(cr5),.dr5(cr6),.clk(clk),.do1(dr1),.do2(dr2),
.do3(dr3),.do4(dr4),.do5(dr5),.rst(rst));

//Stall Logic
stall_unit s1 (.rtn(br12),.rs(ar1[25:21]),.rt(ar1[20:16]),.nop(nop),.stall(stall),
.clk(clk),.memr(memrd));

//Fwd logic
fwd_unit f1 (.rd1(cr4),.rd2(dr3),.regw(dr4),.clk(clk),.rs(br14),.rt(br12),.sel1mf(sel1mf),
.sel2mf(sel2mf));
operandmux o1 (.a(br1),.b(m2r),.c(cr1),.sel(sel1mf),.o(opra));
operandmux o2 (.a(m1r),.b(cr1),.c(m2r),.sel(sel2mf),.o(oprb));

//Stat Branch 
sbr_unit su1 (.clk(clk),.bres(selm),.flush(flush));

//Dynamic Branch Prediction
bht b1 (.ind(pc[5:2]),.clk(clk),.val(selm),.br(brval),.bta(alres3),.taken(taken),.btp(btp));

//MCU architecture
and g1 (dmw, dm_sig,cr7);
addr_decoder ad1 (.addr(cr1),.da(dec_adr),.ga(gpio_o),.gina(gpio_i),
.gena(gpio_e),.drina(gpio_d),.dm(dm_sig),.tc(tc_sig),.tp(tp_sig),.t_cnf(cnf_sig));
gpio_out gp1 (.din(m2r),.pin(gpio_pins),.clk(clk),.w(gpio_o),.g_en(e_mask),
.g_dir(d_mask));
gpio_in gp2 (.pin(gpio_pins),.gpi(gpi_out),.clk(clk),.w(gpio_i),.g_en(e_mask),.g_dir(d_mask));
gpio_dir gp3 (.din(m2r),.clk(clk),.dir_mask(d_mask),.w(gpio_d));
gpio_en gp4 (.din(m2r),.clk(clk),.en_mask(e_mask),.w(gpio_e));
mux_32 mx (.a(gpi_out),.b(dmem_out),.sel(dm_sig),.o(d_out));

timer t1 (.pre_scale(pre),.clk(clk),.comp(comp),.en(),.clk_out());
timer_prescale tp1 (.w(tp_sig),.clk(clk),.out(pre),.in(m2r),.rst(rst));
timer_cop tc1 (.w(tc_sig),.clk(clk),.in(m2r),.out(comp),.rst(rst));
timer_config tc2 (.clk(clk),.w(cnf_sig),.rst(rst),.in(m2r),.out(cnf));
endmodule
