/*
 * Student: Thong Doan
 *
 * main.S for microAptiv_UP MIPS core running on Nexys4 DDR
 * FPGA target board
 *
 * Description:
 * Simulate motion of a robot on Nexys4 DDR FPGA boa
 */

/*
	Notes:
		$12 = address of switches, $13 = address offset of switches
		$10 = switch values
		$s0 ($s1) = robot prev (current) motion:
			0: stop
			1: forward
			2: reverse
			3: left 1X
			4: left 2X
			5: right 1X
			6: right 2X
		$s2 = base address of the motion sequence
		$s3 = current index in the motion sequence
		$s4 = current delay time left, 0 will increase the motion index, which is $s1
		$s5 = current compass value
		$s6 = final contents to display onto 7-Seg display
*/

// --------------------------------------------------
// CONSTANTS
// --------------------------------------------------

// time delay for 1Hz, 5Hz and 10Hz
d1 = 1000
d5 = 200
d10 = 100

// --------------------------------------------------
// DATA
// --------------------------------------------------
.data
	motion_0: .word 22, 0, 64
	motion_1: .word 16, d1, 28, d1, 64
	motion_2: .word 19, d1, 28, d1, 64
	motion_3: .word 17, d5 , 16, d5 , 21, d5 , 20, d5 , 19, d5 , 18, d5 , 64
	motion_4: .word 17, d10, 16, d10, 21, d10, 20, d10, 19, d10, 18, d10, 64
	motion_5: .word 17, d5 , 18, d5 , 19, d5 , 20, d5 , 21, d5 , 16, d5 , 64
	motion_6: .word 17, d10, 18, d10, 19, d10, 20, d10, 21, d10, 16, d10, 64

// --------------------------------------------------
// TEXT
// --------------------------------------------------

.globl main

	main:

	# init setup
	move	$s0, $0		# previous motion
	move	$s1, $0		# current motion
	move	$s6, $0		# contents to display: 0.000

	begin_loop:

// ==================================================
// Decide motion based on the SW
// ==================================================

	# read values of switches
	lui   $12, 0xbf80						# $12 = address of LEDs (0xbf800000)
	addiu $13, $12, 4						# $13 = address of switches
	lw    $10, 0($13)						# read switches: $10 = switch values

	# display motion number on the "compass" section
	move	$s0, $s1							# previous motion = current motion
	andi	$s1, $10, 0x1F				# extract switches 4:0 to $10
	li   	$12, 0xbf700008				# $12 = address of Digits 3:0 (0xbf700008)
	sw		$s1, 0($12)

// ==================================================
// Decide motion sequence
// ==================================================

	motion_sequence_0:
	li		$t0, 0
	bne		$t0, $s1, motion_sequence_1
	la		$s2, motion_0
	j			end_decide_sequence
	motion_sequence_1:
	li		$t0, 1
	bne		$t0, $s1, motion_sequence_2
	la		$s2, motion_1
	j			end_decide_sequence
	motion_sequence_2:
	li		$t0, 2
	bne		$t0, $s1, motion_sequence_3
	la		$s2, motion_2
	j			end_decide_sequence
	motion_sequence_3:
	li		$t0, 3
	bne		$t0, $s1, motion_sequence_4
	la		$s2, motion_3
	j			end_decide_sequence
	motion_sequence_4:
	li		$t0, 4
	bne		$t0, $s1, motion_sequence_5
	la		$s2, motion_4
	j			end_decide_sequence
	motion_sequence_5:
	li		$t0, 5
	bne		$t0, $s1, motion_sequence_6
	la		$s2, motion_5
	j			end_decide_sequence
	motion_sequence_6:
	la		$s2, motion_6
	end_decide_sequence:

	# reset index if current motion is different from previous motion
	beq		$s0, $s1, animate_motion_sequence		# reset if 2 different motions
	move	$s3, $0															# reset index
	move	$s4, $0															# reset delay time

// ==================================================
// Animate motion sequence
// ==================================================

	animate_motion_sequence:

	# check delay time
	bgt		$s4, $0, count_down_motion_delay		# jump to count down delay time

	# next animation or reset to the 1st animation
	addi	$s3, $s3, 1													# next animation
	li		$t0, 64															# check end-of-sequence by compare with 64
	bne		$s3, $t0, update_motion_animation		# skip reset if not end-of-sequence
	move	$s3, $0															# reset to the 1st animation

	update_motion_animation:

	# update new animation
	sll		$t1, $s3, 2													# t1 = offset (4*index)
	add		$t1, $s2, $t1												# t1 = animation address = base + offset
	lw		$t0, 0($t1)													# t0 = animation value
	sll		$t0, $t0, 24												# store to the most sig. byte in s6
	and		$s6, $s6, 0x00FFFFFF
	or		$s6, $s6, $t0

	# update new delay time
	addi	$s3, $s3, 1													# next word, supposed to be a delay time
	sll		$t1, $s3, 2													# offset = 4*index
	add		$t1, $s2, $t1												# address = base + offset
	lw		$s4, 0($t1)													# s4 = delay time
	j animate_compass													# skip count-down & go to animate compass

	count_down_motion_delay:
	addi	$s4, $s4, -1

// ==================================================
// Animate compass
// ==================================================

	animate_compass:
	move	$s1, $s5		# compass value = motion number, for now
	j display

// ==================================================
// Display onto the 7-Seq
// ==================================================

	display:

	# not implemented yet

	beq		$0, $0, begin_loop					# repeat
	nop


