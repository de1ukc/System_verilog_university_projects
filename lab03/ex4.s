.globl iterative
.globl recursive

.data
n: .word 364  # степень двойки
m: .word 2


.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, tester

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

tester:
    # YOUR CODE HERE
     # вызвать итеративную и рекурсивные функции, сравнить ответ и вернуть результат, если совпал. иначе вернуть -1.
    # BEGIN PROLOGUE
    addi sp, sp, -8
    sw ra, 0(sp)
    sw a0, 4(sp)
    
        addi sp, sp, -4
        sw a0, 8(sp)
    jal ra, iterative
    add t4, zero , a0 # результат итеративной
    
    						addi a1, x0, 'I'
                            addi a0, x0, 11
                            ecall # Print newline
                            
                            addi a1, t4, 0
                            addi a0, x0, 1
                            ecall # Print Result
                            
                            addi a1, x0, '\n'
                            addi a0, x0, 11
                            ecall # Print newline
        lw a0, 8(sp)
        addi sp, sp, 4
    
        addi sp, sp, -4
        sw a0, 8(sp)
    jal ra, recursive
    add t6, zero , a0 # результат рекурсивной
    							addi a1, x0, 'R'
                                addi a0, x0, 11
                                ecall # Print newline

                                addi a1, t6, 0
                                addi a0, x0, 1
                                ecall # Print Result

                                addi a1, x0, '\n'
                                addi a0, x0, 11
                                ecall # Print newline
    	lw a0, 8(sp)
        addi sp, sp, 4
    
    #END and clear memory
    lw ra, 0(sp)
    lw a0, 4(sp)
    addi sp, sp, 8
    
    beq t4,t6 , equal
    
    not_equal:
    addi a0, zero, -1
    jalr zero , ra, 0
    
    equal:
    addi a0, zero, 1
    jalr zero , ra, 0  # так что ли надо писать? до этого было jalr zero, 0(ra)
    
   
iterative:
    # BEGIN PROLOGUE
    addi sp, sp, -4
    sw ra, 0(sp)
    
    addi t0,zero,1   # если на входе единица выходим
    beq a0,t0,exit_null
    
    beq a0, zero, exit_null  # если нулю, выходим
    
    addi t3, zero, 2
    loop:
        div t0, a0, t3
        rem t1, a0, t3
        bne t1, zero, mod_check
        div a0,a0, t3
        jal loop
    
    
     mod_check:
    	 addi t5, zero, 1
    	 beq a0,t5, true
     	 jal exit_null
     
     true:
     	lw ra, 0(sp)
    	addi sp, sp, 4
        addi a0, zero, 1
        jalr zero , ra, 0
     
     exit_null:
        lw ra, 0(sp)
    	addi sp, sp, 4
        addi a0, zero, 0
        jalr zero , ra, 0
        
        
recursive:
    # YOUR CODE HERE
    addi sp, sp, -4
    sw ra, 0(sp)
    	
       	add t0 , zero , a0
    	addi t3, zero, 2
        div a0, a0, t3	
        rem t1, t0, t3
        bne	t1 , zero , exit       
        jal ra , recursive
       	beq a1, zero, end_of_func
    
    exit:
    	 addi t5, zero, 1
         beq t0, t5 , trueee
         jal falseee
    
    trueee:
        addi a1, zero , 0
        lw ra, 0(sp)
        addi sp, sp, 4
        addi a0, zero , 1   
        jalr zero , ra, 0
    
    falseee:
        addi a1, zero , 0
        lw ra, 0(sp)
        addi sp, sp, 4
        addi a0, zero , 0   
        jalr zero , ra, 0
    
    end_of_func:
    	lw ra, 0(sp)
        addi sp, sp, 4
        jalr zero , ra, 0
    
# Дано натуральное число n. Функция должна вернуть 1, если число n является точной степенью двойки, или 0 в противном случае.
