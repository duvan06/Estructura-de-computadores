.data

ingresarnumero1: .asciiz "Ingrese el primer número: "
ingresarnumero2: .asciiz "Ingrese el segundo número: "
ingresarnumero3: .asciiz "Ingrese el tercer número: "
resultado: .asciiz "El número mayor es: "

.text
.globl main

main:
      
    # Pedir al usuario que ingrese los tres números
    la $a0, ingresarnumero1 #aquí se carga en $a0 el mensaje contenido en la "variable" ingresarnumero1"
    jal prompt_input #aquí a través de la estructura_definida al final, se llama el mensaje contenido en "ingresanumero1" y se muestra al usuario
    li $v0, 5 
    syscall
    move $t0, $v0  #aqui se almacena el número ingresado por el usuario en $t0
    
    la $a0, ingresarnumero2 #aquí se carga en $a0 el mensaje contenido en la "variable" ingresarnumero2"
    jal prompt_input #aquí a través de la estructura_definida al final, se llama el mensaje contenido en "ingresanumero2" y se muestra al usuario
    li $v0, 5
    syscall
    move $t1, $v0 #aqui se almacena el número ingresado por el usuario en $t1
    
    la $a0, ingresarnumero3 #aquí se carga en $a0 el mensaje contenido en la "variable" ingresarnumero3"
    jal prompt_input #aquí a través de la estructura_definida al final, se llama el mensaje contenido en "ingresanumero1" y se muestra al usuario
    li $v0, 5
    syscall
    move $t2, $v0 #aqui se almacena el número ingresado por el usuario en $t2
    
    #Realizar comparación de los tres números para saber cual es el menor
    move $t3, $t0 #Aquí inicializzmos la posición $t3 y movemos el primero número ingresado por el usuario, que está almacenado en $t0
    
    bgt $t1, $t3, check_second #Aquí comparamos el segundo numero ingresado que está almacenado en $t1 con el primero que está almacenado en $t3
    move $t3, $t1 # si el segundo número es menor, lo almacenamos en $t3
    
    bgt $t2, $t3, find_max  #aquí comparamos el tercer número ingresado almacenado con el que está almacenado en $t3 y si $t2 es mayor, lo almacenamos en $t3
    j print_result
    

# en éste bloque compararmos entre si los numeros indicados por el usuario y el mayor de todos, lo almacenamos en $t3 

check_second:
    move $t3, $t1
    bgt $t2, $t1, find_max
    j print_result
    
find_max:
    move $t3, $t2
    
# Mostrar la respuesta al usuario
print_result:
    li $v0, 4 
    la $a0, resultado # almacenamos el mensaje  contenido en "resultado" en $a0 
    syscall
    
    
    li $v0, 1
    move $a0, $t3 #mostramos el mensaje contenido en "resultado" incluyendo el número mayor almacenado en $t3
    syscall
    
    
    li $v0, 10
    syscall
 
 #está función nos muestra el mensaje contenido en $a0 y posteriormente espera hasta el usuario ingrese el número      
prompt_input:
    li $v0, 4
    syscall 
    jr $ra