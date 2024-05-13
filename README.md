# Instruction Format

### Sizes

Instruction: 16 bits

imm: 6 bits

address registers: 3 bits

registers: 16 bits

opcode: 2 bits

### Instructions Formats

* Type I: opcode == 00
  imm + func5 + rd + opcode: 16 bits
* Type R: opcode == 01
  func8 + rs1 + rd  + opcode: 16 bits
* Type J: opcode == 10
  imm + func8 + opcode: 16 bits
* Type L opcode == 11
  imm +  func5 + rd + opcode: 16 bits

### Instructions:

* LD rd, const(8bits));
* LDU rd, const(8bits))
* LDA const(8bits));
* LDAU const(8bits));

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
