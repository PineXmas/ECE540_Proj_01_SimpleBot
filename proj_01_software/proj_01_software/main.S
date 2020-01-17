/*
 * Student: Thong Doan
 *
 * main.S for microAptiv_UP MIPS core running on Nexys4 DDR
 * FPGA target board
 *
 * Description:
 * Simulate motion of a robot on Nexys4 DDR FPGA boa
 */

# $12 = address of switches, $13 = address offset of switches
# $10 = switch values 
.globl main
  
main:
	# read value of switch 0
	lui   $12, 0xbf80			# $12 = address of LEDs (0xbf800000)
	addiu $13, $12, 4			# $13 = address of switches
	lw    $10, 0($13)			# read switches: $10 = switch values
	andi	$10, $10, 0x00000001	# $10 = extract value of switch 0 (LSB)

	# read value of digits 3:0
	lui   $12, 0xbf70			# $12 = address of Digits 3:0 (0xbf700000)
	lw		$11, 0($12)			# $11 = contents of Digits 3:0

	# assign SW 0 to Digit 0 w/o changing other Digits
	or		$11, $11, $10		# $11 = Digits[3:0] OR SW[0]

	# write the modified contents back to the Digits 3:0
	sw		$11, 0($12)
	beq		$0, $0, main		# repeat

/*
	sw    $10, 0($12)    # write switch values to LEDs
	beq   $0, $0, readIO # repeat
	nop                  # branch delay slot
*/
