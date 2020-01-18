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
	# read values of switches
	lui   $12, 0xbf80						# $12 = address of LEDs (0xbf800000)
	addiu $13, $12, 4						# $13 = address of switches
	lw    $10, 0($13)						# read switches: $10 = switch values

	# extract switches 4:0 to $10
	andi	$10, $10, 0x1F

	# assign SW 0 to Digit 0 and set others to 0'
	li   	$12, 0xbf700008				# $12 = address of Digits 3:0 (0xbf700008)
	sw		$10, 0($12)
	beq		$0, $0, main					# repeat

	nop

/*
	sw    $10, 0($12)    # write switch values to LEDs
	beq   $0, $0, readIO # repeat
	nop                  # branch delay slot
*/
