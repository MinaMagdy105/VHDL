library ieee;
use work.cpu_lib.all;
use ieee.std_logic_1164.all;

entity CPU is
    port (
        clk, reset, ready : in std_logic;
        addr : out bit16;
        rw, vma : out std_logic;
        data : inout bit16
    );
end CPU;

architecture CPU_Arch of CPU is

    component alu
        port (
            a, b : in bit16;
            opr : in t_alu;
            c : out bit16
        );
    end component;

    component comp
        port (
            a, b : in bit16;
            opr : in t_comp;
            c : out std_logic
        );
    end component;

    component shift
        port (
            a : in bit16;
            opr : in t_shift;
            y : out bit16
        );
    end component;

    component reg
        port (
            a : in bit16;
            clk : in std_logic;
            q : out bit16
        );
    end component;

    component trireg
        port (
            a : in bit16;
            en : in std_logic;
            clk : in std_logic;
            q : out bit16
        );
    end component;

    component regarray
        port (
            data : in bit16;
            opr : in t_reg;
            en : in std_logic;
            clk : in std_logic;
            q : out bit16
        );
    end component;

    component control
        port (
            clk : in std_logic;
            reset : in std_logic;
            instrReg : in bit16;
            c : in std_logic;
            ready : in std_logic;
            progCntrWr : out std_logic;
            progCntrRd : out std_logic;
            addrRegWr : out std_logic;
            outRegWr : out std_logic;
            outRegRd : out std_logic;
            shiftopr : out t_shift;
            aluopr : out t_alu;
            compopr : out t_comp;
            opRegRd : out std_logic;
            opRegWr : out std_logic;
            instrWr : out std_logic;
            regopr : out t_reg;
            regRd : out std_logic;
            regWr : out std_logic;
            rw : out std_logic;
            vma : out std_logic
        );
    end component;

    signal regopr : t_reg;
    signal aluopr : t_alu;
    signal compopr : t_comp;
    signal shiftopr : t_shift;
    signal opData, aluout, shiftout, instrregout : bit16;
    signal regRd, regWr, opRegRd, opRegWr, outRegRd, outRegWr, addrRegWr, instrRegWr, progCntrRd, progCntrWr, c : std_logic;
    
    begin

        alUnit : alu port MAP(data, opData, aluopr, aluout);
        shiftUnit : shift port MAP(aluout, shiftopr, shiftout);
        compUnit : comp port MAP(opData, data, compopr, c);
        controlUnit : control port MAP(clk, reset, instrRegout, c, ready, progCntrWr, progCntrRd, addrRegWr, outRegWr, outRegRd, shiftopr, aluopr, compopr, opRegRd, opRegWr, instrRegWr, regopr, regRd, regWr, rw, vma);
        addrReg : reg port MAP(data, addrRegWr, addr);
        instrReg : reg port MAP(data, instrRegWr, instrRegout);
        opRg : trireg port MAP(data, opRegRd, opRegWr, opData);
        outReg : trireg port MAP(shiftout, outRegRd, outRegWr, data);
        progCntr : trireg port MAP(data, progCntrRd, progCntrWr, data);
        registersArray : regarray port MAP(data, regopr, regRd, regWr, data);
end CPU_Arch;