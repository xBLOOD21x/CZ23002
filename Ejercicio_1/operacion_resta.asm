; =============================================
; Programa: Operación de Resta en Ensamblador
; Versión: 2.0
; =============================================

; Sección de datos inicializados
section .data
    ; Constantes numéricas
    valor1    dw 30    ; Primer valor
    valor2    dw 10    ; Segundo valor
    valor3    dw 5     ; Tercer valor
    total     dw 0     ; Variable para el resultado

    ; Strings y caracteres
    texto     db "El resultado de restar 30 - 10 - 5 es: ", 0
    texto_len equ $ - texto
    nl        db 10    ; Caracter de nueva línea

; Sección de datos no inicializados
section .bss
    num_ascii resb 4   ; Buffer para el número en ASCII

; Sección de código
section .text
    global _start

_start:
    ; ===== Cálculo de la resta =====
    mov ax, [valor1]        ; Cargar primer valor
    sub ax, [valor2]        ; Restar segundo valor
    sub ax, [valor3]        ; Restar tercer valor
    mov [total], ax         ; Guardar resultado

    ; ===== Preparación para conversión =====
    mov ax, [total]         ; Cargar resultado
    mov edi, num_ascii + 3  ; Posicionar puntero
    mov byte [edi], 10      ; Agregar salto de línea
    dec edi                 ; Ajustar puntero

    ; ===== Conversión a ASCII =====
    mov cx, 10              ; Base 10
convertir:
    xor dx, dx              ; Limpiar para división
    div cx                  ; Dividir por 10
    add dl, '0'             ; Convertir a ASCII
    mov [edi], dl          ; Guardar dígito
    dec edi                 ; Mover puntero
    test ax, ax             ; Verificar si hay más dígitos
    jnz convertir           ; Continuar si hay más

    ; ===== Mostrar resultados =====
    ; Imprimir texto
    mov eax, 4              ; syscall write
    mov ebx, 1              ; stdout
    mov ecx, texto          ; mensaje
    mov edx, texto_len      ; longitud
    int 0x80

    ; Imprimir número
    mov eax, 4
    mov ebx, 1
    lea ecx, [edi + 1]      ; Inicio del número
    mov edx, 2              ; Longitud del número
    int 0x80

    ; Imprimir salto de línea
    mov eax, 4
    mov ebx, 1
    mov ecx, nl
    mov edx, 1
    int 0x80

    ; ===== Finalizar programa =====
    mov eax, 1              ; syscall exit
    mov ebx, 0              ; código de salida
    int 0x80
