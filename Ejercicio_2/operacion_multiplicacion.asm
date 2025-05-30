; =============================================
; Programa: Multiplicación en Ensamblador
; Versión: 2.0
; Descripción: Realiza la operación 6 * 4
; =============================================

; Sección de datos inicializados
section .data
    ; Valores para la multiplicación
    factor1    db 6     ; Primer factor
    factor2    db 4     ; Segundo factor
    producto   db 0     ; Variable para el resultado

    ; Strings y caracteres
    mensaje    db "El producto de multiplicar 6 * 4 es: ", 0
    msg_len    equ $ - mensaje
    salto_linea db 10   ; Caracter de nueva línea

; Sección de datos no inicializados
section .bss
    resultado_ascii resb 4   ; Buffer para el resultado en ASCII

; Sección de código
section .text
    global _start

_start:
    ; ===== Realización de la multiplicación =====
    mov al, [factor1]        ; Cargar primer factor
    mul byte [factor2]       ; Multiplicar por segundo factor
    mov [producto], al       ; Guardar resultado

    ; ===== Preparación para conversión =====
    movzx eax, byte [producto]  ; Extender resultado a 16 bits
    mov edi, resultado_ascii + 3 ; Posicionar puntero
    mov byte [edi], 10          ; Agregar salto de línea
    dec edi                     ; Ajustar puntero

    ; ===== Conversión a ASCII =====
    mov ecx, 10                 ; Base decimal
convertir:
    xor edx, edx                ; Limpiar para división
    div ecx                     ; Dividir por 10
    add dl, '0'                 ; Convertir a ASCII
    mov [edi], dl              ; Guardar dígito
    dec edi                     ; Mover puntero
    test eax, eax               ; Verificar si hay más dígitos
    jnz convertir               ; Continuar si hay más

    ; ===== Mostrar resultados =====
    ; Imprimir mensaje
    mov eax, 4                  ; syscall write
    mov ebx, 1                  ; stdout
    mov ecx, mensaje            ; mensaje
    mov edx, msg_len            ; longitud
    int 0x80

    ; Imprimir número
    mov eax, 4
    mov ebx, 1
    lea ecx, [edi + 1]          ; Inicio del número
    mov edx, 2                  ; Longitud del número
    int 0x80

    ; Imprimir salto de línea
    mov eax, 4
    mov ebx, 1
    mov ecx, salto_linea
    mov edx, 1
    int 0x80

    ; ===== Finalizar programa =====
    mov eax, 1                  ; syscall exit
    mov ebx, 0                  ; código de salida
    int 0x80
