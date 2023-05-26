library ieee;
use work.cpu_lib.all;
use ieee.std_logic_1164.all;

entity C_Control is
    port (
        clk : in std_logic;
        reset : in std_logic;
        opt_reg : in bit16;
        c : in std_logic;
        ready : in std_logic;
        prog_count_out : out std_logic;
        prog_count_in : out std_logic;
        addr_reg_out : out std_logic;
        addr_reg_in : out std_logic;
        out_reg_out : out std_logic;
        out_reg_in : out std_logic;
        shift_opr : out t_shift;
        alu_opr : out t_alu;
        comp_opr : out t_comp;
        opt_reg_in : out std_logic;
        opt_reg_out : out std_logic;
        opt_out : out std_logic;
        reg_opr : out t_reg;
        reg_in : out std_logic;
        reg_out : out std_logic;
        rw : out std_logic;
        vma : out std_logic
    );
end C_Control;

architecture C_Control_Arch of C_Control is
    
    signal current_state, next_state : state;
    
    begin
        process
            begin
                prog_count_out <= '0';
                prog_count_in <= '0';
                addr_reg_out <= '0';
                out_reg_out <= '0';
                out_reg_in <= '0';
                shift_opr <= shftpass;
                alu_opr <= alupass;
                comp_opr <= eq;
                opt_reg_in <= '0';
                opt_reg_out <= '0';
                opt_out <= '0';
                reg_opr <= "000";
                reg_in <= '0';
                reg_out <= '0';
                rw <= '0';
                vma <= '0';

                case current_state is
                    when reset1 =>
                        alu_opr <= zero;
                        shift_opr <= shftpass;
                        next_state <= reset2;
                    when reset2 =>
                        alu_opr <= zero;
                        shift_opr <= shftpass;
                        out_reg_out <= '1';
                        next_state <= reset3;
                    when reset3 =>
                        out_reg_in <= '1';
                        next_state <= reset4;
                    when reset4 =>
                        out_reg_in <= '1';
                        prog_count_out <= '1';
                        addr_reg_out <= '1';
                        next_state <= reset5;
                    when reset5 =>
                        vma <= '1';
                        rw <= '0';
                        next_state <= reset6;
                    when reset6 =>
                        vma <= '1';
                        rw <= '0';
                        if ready = '1' then
                            opt_out <= '1';
                            next_state <= execute;
                        else
                            next_state <= reset6;
                        end if;

                    when execute =>
                        case opt_reg(15 downto 11) is
                            when "00000" => 
                                next_state <= incPc;
                            when "00001" => 
                                reg_opr <= opt_reg(5 downto 3);
                                reg_in <= '1';
                                next_state <= load2;
                            when "00010" => 
                                reg_opr <= opt_reg(2 downto 0);
                                reg_in <= '1';
                                next_state <= store2;
                            when "00011" => --
                                reg_opr <= opt_reg(5 downto 3);
                                reg_in <= '1';
                                alu_opr <= alupass;
                                shift_opr <= shftpass;
                                next_state <= move2;
                            when "00100" => -
                                prog_count_in <= '1';
                                alu_opr <= inc;
                                shift_opr <= shftpass;
                                next_state <= loadI2;
                            when "00101" => -
                                prog_count_in <= '1';
                                alu_opr <= inc;
                                shift_opr <= shftpass;
                                next_state <= braI2;
                            when "00110" => -
                                reg_opr <= opt_reg(5 downto 3);
                                reg_in <= '1';
                                next_state <= bgtI2;
                            when "00111" => ----
                                reg_opr <= opt_reg(2 downto 0);
                                reg_in <= '1';
                                alu_opr <= inc;
                                shift_opr <= shftpass;
                                next_state <= inc2;
                            when OTHERS =>
                                next_state <= incPc;
                        end case;

                    when load2 =>
                        reg_opr <= opt_reg(5 downto 3);
                        reg_in <= '1';
                        addr_reg_out <= '1';
                        next_state <= load3;
                    when load3 =>
                        vma <= '1';
                        rw <= '0';
                        next_state <= load4;
                    when load4 =>
                        vma <= '1';
                        rw <= '0';
                        reg_opr <= opt_reg(2 downto 0);
                        reg_out <= '1';
                        next_state <= incPc;

                    when store2 =>
                        reg_opr <= opt_reg(2 downto 0);
                        reg_in <= '1';
                        addr_reg_out <= '1';
                        next_state <= store3;
                    when store3 =>
                        reg_opr <= opt_reg(5 downto 3);
                        reg_in <= '1';
                        next_state <= store4;
                    when store4 =>
                        reg_opr <= opt_reg(5 downto 3);
                        reg_in <= '1';
                        vma <= '1';
                        rw <= '1';
                        next_state <= incPc;

                    when move2 =>
                        reg_opr <= opt_reg(5 downto 3);
                        reg_in <= '1';
                        alu_opr <= alupass;
                        shift_opr <= shftpass;
                        out_reg_out <= '1';
                        next_state <= move3;
                    when move3 =>
                        out_reg_in <= '1';
                        next_state <= move4;
                    when move4 =>
                        out_reg_in <= '1';
                        reg_opr <= opt_reg(2 downto 0);
                        reg_out <= '1';
                        next_state <= incPc;

                    when loadI2 =>
                        prog_count_in <= '1';
                        alu_opr <= inc;
                        shift_opr <= shftpass;
                        out_reg_out <= '1';
                        next_state <= loadI3;
                    when loadI3 =>
                        out_reg_in <= '1';
                        next_state <= loadI4;
                    when loadI4 =>
                        out_reg_in <= '1';
                        prog_count_out <= '1';
                        addr_reg_out <= '1';
                        next_state <= loadI5;
                    when loadI5 =>
                        vma <= '1';
                        rw <= '0';
                        next_state <= loadI6;
                    when loadI6 =>
                        vma <= '1';
                        rw <= '0';
                        if ready = '1' then
                            reg_opr <= opt_reg(2 downto 0);
                            reg_out <= '1';
                            next_state <= incPc;
                        else
                            next_state <= loadI6;
                        end if;

                    when braI2 =>
                        prog_count_in <= '1';
                        alu_opr <= inc;
                        shift_opr <= shftpass;
                        out_reg_out <= '1';
                        next_state <= braI3;
                    when braI3 =>
                        out_reg_in <= '1';
                        next_state <= braI4;
                    when braI4 =>
                        out_reg_in <= '1';
                        prog_count_out <= '1';
                        addr_reg_out <= '1';
                        next_state <= braI5;
                    when braI5 =>
                        vma <= '1';
                        rw <= '0';
                        next_state <= braI6;
                    when braI6 =>
                        vma <= '1';
                        rw <= '0';
                        if ready = '1' then
                            prog_count_out <= '1';
                            next_state <= loadPc;
                        else
                            next_state <= braI6;
                        end if;

                    when bgtI2 =>
                        reg_opr <= opt_reg(5 downto 3);
                        reg_in <= '1';
                        opt_reg_out <= '1';
                        next_state <= bgtI3;
                    when bgtI3 =>
                        opt_reg_in <= '1';
                        reg_opr <= opt_reg(2 downto 0);
                        reg_in <= '1';
                        comp_opr <= gt;
                        next_state <= bgtI4;
                    when bgtI4 =>
                        opt_reg_in <= '1';
                        reg_opr <= opt_reg(2 downto 0);
                        reg_in <= '1';
                        comp_opr <= gt;
                        if c = '1' then
                            next_state <= bgtI5;
                        else
                            next_state <= incPc;
                        end if;
                    when bgtI5 =>
                        prog_count_in <= '1';
                        alu_opr <= inc;
                        shift_opr <= shftpass;
                        next_state <= bgtI6;
                    when bgtI6 =>
                        prog_count_in <= '1';
                        alu_opr <= inc;
                        shift_opr <= shftpass;
                        out_reg_out <= '1';
                        next_state <= bgtI7;
                    when bgtI7 =>
                        out_reg_in <= '1';
                        next_state <= bgtI8;
                    when bgtI8 =>
                        out_reg_in <= '1';
                        prog_count_out <= '1';
                        addr_reg_out <= '1';
                        next_state <= bgtI9;
                    when bgtI9 =>
                        vma <= '1';
                        rw <= '0';
                        next_state <= bgtI10;
                    when bgtI10 =>
                        vma <= '1';
                        rw <= '0';
                        if ready = '1' then
                            prog_count_out <= '1';
                            next_state <= loadPc;
                        else
                            next_state <= bgtI10;
                        end if;

                    when inc2 =>
                        reg_opr <= opt_reg(2 downto 0);
                        reg_in <= '1';
                        alu_opr <= inc;
                        shift_opr <= shftpass;
                        out_reg_out <= '1';
                        next_state <= inc3;
                    when inc3 =>
                        out_reg_in <= '1';
                        next_state <= inc4;
                    when inc4 =>
                        out_reg_in <= '1';
                        reg_opr <= opt_reg(2 downto 0);
                        reg_out <= '1';
                        next_state <= incPc;

                    when loadPc =>
                        prog_count_in <= '1';
                        next_state <= loadPc2;
                    when loadPc2 =>
                        prog_count_in <= '1';
                        addr_reg_out <= '1';
                        next_state <= loadPc3;
                    when loadPc3 =>
                        vma <= '1';
                        rw <= '0';
                        next_state <= loadPc4;
                    when loadPc4 =>
                        vma <= '1';
                        rw <= '0';
                        if ready = '1' then
                            opt_out <= '1';
                            next_state <= execute;
                        else
                            next_state <= loadPc4;
                        end if;

                    when incPc =>
                        prog_count_in <= '1';
                        alu_opr <= inc;
                        shift_opr <= shftpass;
                        next_state <= incPc2;
                    when incPc2 =>
                        prog_count_in <= '1';
                        alu_opr <= inc;
                        shift_opr <= shftpass;
                        out_reg_out <= '1';
                        next_state <= incPc3;
                    when incPc3 =>
                        out_reg_in <= '1';
                        next_state <= incPc4;
                    when incPc4 =>
                        out_reg_in <= '1';
                        prog_count_out <= '1';
                        addr_reg_out <= '1';
                        next_state <= incPc5;
                    when incPc5 =>
                        vma <= '1';
                        rw <= '0';
                        next_state <= incPc6;
                    when incPc6 =>
                        vma <= '1';
                        rw <= '0';
                        if ready = '1' then
                            opt_out <= '1';
                            next_state <= execute;
                        else
                            next_state <= incPc6;
                        end if;

                    when OTHERS =>
                        next_state <= incPc;
                end case;
            end process;

    process
    begin
        if reset = '1' then
            current_state <= reset1;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

end C_Control_Arch;