.data

solicitarnumero: .asciiz "Ingresa un numero: "
espacio: .asciiz ", "
seriefibonacci: .asciiz "la serie Fibonacci del número ingresado es: "

.text

.globl main

main:

      #solicitar al usuario que ingrese el número
      li $v0, 4
      la $a0, solicitarnumero
      syscall
      
      
      #leer el número de terminos ingresado por el usuario
      li $v0, 5
      syscall
      move $t0, $v0
      
      #Se inician los dos primeros terminos de la serie 
      li $t1, 0
      li $t2, 1
      
      #Mostrar la serie 
      li $v0, 4
      la $a0, seriefibonacci 
      syscall
      
      #Mostrar el primer termino de la serie 
      move $a0, $t1
      li $v0, 1
      syscall
      
      #Mostrar los términos restantes de la serie 
      li $t3, 2
 
 fib_loop:
 
      blt $t3, $t0, continue_fib
      
      
      li $v0, 10
      syscall
 
 continue_fib:
 
     #Calculo del siguiente termino de la serie 
     add $t3, $t3, 1
     add $t4, $t1, $t2
     move $t1, $t2
     move $t2, $t4
     
     #Muestra el termino calculado
     li $v0, 4
     la $a0, espacio
     syscall
     
     move $a0, $t4
     li $v0, 1
     syscall
     
     j fib_loop
 
      
      
      

