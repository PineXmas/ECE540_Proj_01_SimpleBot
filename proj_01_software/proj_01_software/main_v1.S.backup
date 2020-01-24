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
		$s7 = current motion value
		$s6 = final contents to display onto 7-Seg display
*/

// --------------------------------------------------
// CONSTANTS
// --------------------------------------------------

// time delay for 1Hz, 5Hz and 10Hz
d1 = 100000
d5 = 20000
d10 = 10000

// --------------------------------------------------
// TEXT
// --------------------------------------------------

.globl main

	main:

	# init setup
	move	$s0, $0										# previous motion
	move	$s1, $0										# current motion
	li		$s3, -1										# reset index
	move	$s4, $0										# reset delay time
	move	$s5, $0										# reset compass value = 0
	move	$s6, $0										# contents to display: 0.000
	la		$t0, compass_delay				# compass_delay = 0
	li		$t1, 0xF0F0F0F0
	sw		$t1, 0($t0)
	la		$t0, compass_adjust				# compass_adjust = 0
	sw		$0, 0($t0)
	la		$t0, compass_countdown		# compass_countdown = 0
	sw		$0, 0($t0)

	begin_loop:

// ==================================================
// Decide motion based on the PB
// ==================================================

	# read values of PB
	lui   $12, 0xbf80						# $12 = address of LEDs (0xbf800000)
	addiu $13, $12, 8						# $13 = address of PB
	lw    $10, 0($13)						# read PB: $10 = PB values

	# extract contents of PB 4:0
	move	$s0, $s1							# previous motion = current motion
	andi	$s1, $10, 0x1F				# extract switches 4:0 to $10

// ==================================================
// Decide motion sequence
// ==================================================

	motion_sequence_1:
	li		$t0, 5
	bne		$t0, $s1, motion_sequence_2					# check if motion 1 by compare with 5
	la		$s2, motion_1												# s2 = base address of motion 1 (FORWARD)
	la		$t0, compass_adjust									# compass_adjust = 0
	sw		$0, 0($t0)
	la		$t0, compass_delay									# compass_delay = 0
	sw		$0, 0($t0)
	j			end_decide_sequence
	motion_sequence_2:
	li		$t0, 24
	bne		$t0, $s1, motion_sequence_3					# check if motion 2 by compare with 24
	la		$s2, motion_2												# s2 = base address of motion 2 (REVERSE)
	la		$t0, compass_adjust									# compass_adjust = 0
	sw		$0, 0($t0)
	la		$t0, compass_delay									# compass_delay = 0
	sw		$0, 0($t0)
	j			end_decide_sequence
	motion_sequence_3:
	li		$t0, 1
	beq		$t0, $s1, motion_sequence_3_sure		# check if motion 3 by compare with 1
	li		$t0, 21
	beq		$t0, $s1, motion_sequence_3_sure		# check if motion 3 by compare with 21
	li		$t0, 25
	beq		$t0, $s1, motion_sequence_3_sure		# check if motion 3 by compare with 25
	li		$t0, 16
	bne		$t0, $s1, motion_sequence_4					# check if motion 3 by compare with 16
		motion_sequence_3_sure:
	la		$s2, motion_3												# s2 = base address of motion 3 (LEFT 1X)
	la		$t0, compass_adjust									# compass_adjust = 1
	li		$t1, 1
	sw		$t1, 0($t0)
	la		$t0, compass_delay									# compass_delay = d5 (5Hz)
	li		$t1, d5
	sw		$t1, 0($t0)
	j			end_decide_sequence
	motion_sequence_4:
	li		$t0, 17
	bne		$t0, $s1, motion_sequence_5					# check if motion 4 by compare with 17
	la		$s2, motion_4												# s2 = base address of motion 4 (LEFT 2X)
	la		$t0, compass_adjust									# compass_adjust = 1
	li		$t1, 1
	sw		$t1, 0($t0)
	la		$t0, compass_delay									# compass_delay = d10 (10Hz)
	li		$t1, d10
	sw		$t1, 0($t0)
	j			end_decide_sequence
	motion_sequence_5:
	li		$t0, 4
	beq		$t0, $s1, motion_sequence_5_sure		# check if motion 5 by compare with 4
	li		$t0, 13
	beq		$t0, $s1, motion_sequence_5_sure		# check if motion 5 by compare with 13
	li		$t0, 28
	beq		$t0, $s1, motion_sequence_5_sure		# check if motion 5 by compare with 28
	li		$t0, 8
	bne		$t0, $s1, motion_sequence_6					# check if motion 5 by compare with 8
		motion_sequence_5_sure:
	la		$s2, motion_5												# s2 = base address of motion 5 (RIGHT 1X)
	la		$t0, compass_adjust									# compass_adjust = -1
	li		$t1, -1
	sw		$t1, 0($t0)
	la		$t0, compass_delay									# compass_delay = d5 (5Hz)
	li		$t1, d5
	sw		$t1, 0($t0)
	j			end_decide_sequence
	motion_sequence_6:
	li		$t0, 12
	bne		$t0, $s1, motion_sequence_0					# check if motion 6 by compare with 12
	la		$s2, motion_6												# s2 = base address of motion 6 (RIGHT 2X)
	la		$t0, compass_adjust									# compass_adjust = -1
	li		$t1, -1
	sw		$t1, 0($t0)
	la		$t0, compass_delay									# compass_delay = d10 (10Hz)
	li		$t1, d10
	sw		$t1, 0($t0)
	j			end_decide_sequence
	motion_sequence_0:
	la		$s2, motion_0												# s2 = base address of motion 0 (STOP)
	la		$t0, compass_adjust									# compass_adjust = 0
	sw		$0, 0($t0)
	la		$t0, compass_delay									# compass_delay = 0
	sw		$0, 0($t0)
	end_decide_sequence:

	# reset index if current motion is different from previous motion
	beq		$s0, $s1, animate_motion_sequence		# reset if previous and current motions are different
	li		$s3, -1															# reset index
	move	$s4, $0															# reset countdown for motion
	la		$t0, compass_delay									# reset countdown for compass
	lw		$t0, 0($t0)
	la		$t1, compass_countdown
	sw		$t0, 0($t1)

// ==================================================
// Animate motion sequence
// ==================================================

	animate_motion_sequence:

	# check delay time
	bgt		$s4, $0, count_down_motion_delay		# jump to count down delay time

	# next animation or reset to the 1st animation
	addi	$s3, $s3, 1													# next animation
	sll		$t1, $s3, 2													# t1 = offset (4*index)
	add		$t1, $s2, $t1												# t1 = animation address = base (s2) + offset (s3)
	lw		$s7, 0($t1)													# s7 = animation value
	li		$t0, 64															# check end-of-sequence by comparing s7 with 64
	bne		$s7, $t0, update_motion_delay				# skip reset if not end-of-sequence

	# reset to the 1st animation
	move	$s3, $0															# reset index to the 1st animation (s3 = 0)
	sll		$t1, $s3, 2													# t1 = offset (4*index)
	add		$t1, $s2, $t1												# t1 = animation address = base (s2) + offset (s3)
	lw		$s7, 0($t1)													# s7 = animation value

	update_motion_delay:

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

	# check compass countdown: if run out of delay time
	la		$t0, compass_countdown
	lw		$t0, 0($t0)
	bgt		$t0, $0, count_down_compass_delay		# jump to compass count down
	la		$t0, compass_delay									# reset countdown for compass
	lw		$t0, 0($t0)
	la		$t1, compass_countdown
	sw		$t0, 0($t1)

	# adjust compass value: +1/-1 or 0 based on the t6
	la		$t0, compass_adjust
	lw		$t0, 0($t0)
	add		$s5, $s5, $t0

	# check compass value out of bound
	blt		$s5, $0, compass_less_than_0				# check less than 0
	li		$t0, 359
	bgt		$s5, $t0, compass_greater_than_359	# check greater than 359
	j display

	compass_greater_than_359:
	move	$s5, $0
	j display

	compass_less_than_0:
	li		$s5, 359														# compass value = 359
	j display

	count_down_compass_delay:
	la		$t0, compass_countdown							# count down by -1
	lw		$t1, 0($t0)
	addi	$t1, $t1, -1
	sw		$t1, 0($t0)

// ==================================================
// Display onto the 7-Seq
// ==================================================

	display:

	# split compass values to 3 digits & write to 24 least bits in s6
	li		$t2, 10											# t2 = 10
	move	$s6, $0											# s6 = 0
	li		$t3, 3											# t3 = 3
	move	$t4, $0											# t4 = 0, used for looping 3 times
	move	$t1, $s5										# t1 = s5
	begin_split:
	rem		$t0, $t1, $t2								# t0 = remainder of division by 10
	div		$t1, $t1, $t2								# t1 = quotient of division by 10
	sll		$t0, $t0, 24								# move remainder to 8 most bits
	or		$s6, $s6, $t0								# write rem[8 most bits] to s6[8 most bits]
	srl		$s6, $s6, 8									# shift right s6 8 bits, to save 8 most bits for the next remainder
	addi	$t4, $t4, 1									# t4++
	bne		$t4, $t3, begin_split				# repeat 3 times (t3 == 3)
	end_split:

	# write motion value (8 least sig. bits) in s7 to the most sig. bits in s6
	sll		$t0, $s7, 24
	or		$s6, $s6, $t0								# the 24 least bits are now 0, which is ready for overwriting the compass value onto

	# update contents to the 7-Seg Display
	li   	$12, 0xbf700008							# $12 = address of Digits 3:0 (0xbf700008)
	sw		$s6, 0($12)

	# repeat the loop
	beq		$0, $0, begin_loop
	nop

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
	compass_countdown: .word 0
	compass_delay: .word 0
	compass_adjust: .word 0
