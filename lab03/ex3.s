.globl main

.data
source:
    .word   3
    .word   1
    .word   4
    .word   1
    .word   5
    .word   9
    .word   0
dest:
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0

.text

fun:
    addi t0, a0, 1
    sub t1, x0, a0
    mul a0, t0, t1
    jr ra

main:
    
    # BEGIN PROLOGUE
    addi sp, sp, -20
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw s3, 12(sp)
    sw ra, 16(sp)
    
    # END PROLOGUE
    addi t0, x0, 0
    addi s0, x0, 0
    la s1, source
    la s2, dest
loop:
    slli s3, t0, 2		# будем постоянно умножать на 4, дабы итерироваться по массиву, где каждый элемент имеет размер 4
    add t1, s1, s3		# получение ссылки на элемент масссива  source[k] ? т.е. *source[k]
    lw t2, 0(t1)		# получение самого значения source[k].  t2 = source[k]
    beq t2, x0, exit	# сравнение элемента с нулём по условию цикла
    add a0, x0, t2		# передаём в аргумент функции элемент source[k]
    addi sp, sp, -8		# резервируем на стеке место ещё под две переменные
    sw t0, 0(sp)		# сохраняем две переменные на стек .   Хороший вопрос. Когда мы их сохранили в память, перед использованием в функции, мы должны их заксорить?
    sw t2, 4(sp)
    jal fun				# прыгаем на функции, притом параметр функции в регистре a0
    lw t0, 0(sp)		# возвращаем наши старые переменные
    lw t2, 4(sp)
    addi sp, sp, 8		# освобождаем стекфреймы
    add t2, x0, a0		# ??????????? Что лежит в a0? fun()??? dest[k] = fun(source[k]);
    add t3, s2, s3      # делаем *dest[k]
    sw t2, 0(t3)		# t2 = dest[k]
    add s0, s0, t2		# sum += dest[k]
    addi t0, t0, 1		# k+=
	jal x0, loop		# идём на новую итерацию цикла.
exit:
    add a0, x0, s0		
    
    # BEGIN EPILOGUE
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    lw s3, 12(sp)
    lw ra, 16(sp)
    addi sp, sp, 20
   
   # END EPILOGUE

