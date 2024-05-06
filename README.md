# Instruction Format 

### Sizes

Instruction: 32 bits

imm: 16 bits

address registers: 3bits

registers: 16 bits

func9: 9 bits

func13: 13 bits

func5: 5 bits

opcode: 5 bits

### Instructions Formats

* Type I: opcode == 00000
  imm + rs1 + rd + func5 + opcode: 32 bits
* Type R: opcode == 01010
  func13 + rs2 + rs1 + rd + func5 + opcode: 32 bits
* Type J: opcode == 11111
  imm + func6 + func5 + opcode: 32 bits

### Run testbenches:

To run a testbench: In this directory run "make t=`<tbname>", where tbname is the component in the testbench, like ula, processor, and16, etc.`

### Operations ALU:

* 0000: AND
* 0001: OR
* 0010: XOR
* 0011: SUM
* 0100: SUB
* 0101: LFT
* 1111: NOP
