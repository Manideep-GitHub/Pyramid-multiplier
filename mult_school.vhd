

function MULT_SCHOOL(MULTIPLICAND: STD_LOGIC_VECTOR; MULTIPLIER: STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
variable RESULT: STD_LOGIC_VECTOR(MULTIPLICAND'length + MULTIPLIER'length - 1 downto 0);    
variable HIGH_LEVEL_RESULT : STD_LOGIC_VECTOR(MULTIPLICAND'length + MULTIPLIER'length - 2 downto 0);
variable NEW_MR : STD_LOGIC_VECTOR(MULTIPLIER'length - 2 downto 0);

begin
  NEW_MR := MULTIPLIER(MULTIPLIER'high downto 1);

  if MULTIPLIER'length = 2 then
    if MULTIPLIER(1) = '1' and MULTIPLIER(0) = '1' then
      RESULT := ('0' & MULTIPLICAND + MULTIPLICAND(MULTIPLICAND'high downto 1)) & MULTIPLICAND(0);
    elsif MULTIPLIER(1) = '1' then
      RESULT := '0' & MULTIPLICAND & '0';
    elsif MULTIPLIER(0) = '1' then
      RESULT := "00" & MULTIPLICAND;
    else 
      RESULT := (others => '0');
    end if;
  else
    HIGH_LEVEL_RESULT := MULT_SCHOOL(MULTIPLICAND, NEW_MR);
    if MULTIPLIER(0) = '1' then
      RESULT := (HIGH_LEVEL_RESULT(HIGH_LEVEL_RESULT'high downto 0) + MULTIPLICAND(MULTIPLICAND'high downto 1)) & MULTIPLICAND(0);
    else
      RESULT := HIGH_LEVEL_RESULT & '0';
    end if;
  end if;
  
  return RESULT;
  
end MULT_SCHOOL;
