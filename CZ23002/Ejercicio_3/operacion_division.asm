; =============================================
; Programa: División en Ensamblador
; Versión: 2.0
; Descripción: Realiza la operación 50 / 10
; =============================================

; Sección de datos inicializados
section .data
    ; Valores para la división
    dividendo    dd 50    ; Número a dividir
    divisor      dd 10    ; Número por el que se divide
    cociente     dd 0     ; Variable para el resultado

    ; Strings y caracteres
    mensaje      db "Al dividir 50 / 10 el resultado es: ", 0
    msg_len      equ $ - mensaje
    salto_linea  db 10    ; Caracter de nueva línea

; Sección de datos no inicializados
section .bss
    resultado_ascii resb 12   ; Buffer para el resultado en ASCII

; Sección de código
section .text
    global _start

_start:
    ; ===== Realización de la división =====
    mov eax, [dividendo]      ; Cargar dividendo
    xor edx, edx              ; Limpiar registro para residuo
    div dword [divisor]       ; Realizar división
    mov [cociente], eax       ; Guardar cociente

    ; ===== Preparación para conversión =====
    mov edi, resultado_ascii + 10  ; Posicionar al final del buffer
    mov byte [edi], 0              ; Agregar terminador nulo
    dec edi
    mov byte [edi], 10             ; Agregar salto de línea

    ; ===== Conversión a ASCII =====
    test eax, eax                  ; Verificar si resultado es cero
    jz .resultado_cero

    mov ecx, 10                    ; Base decimal
.convertir:
    dec edi
    xor edx, edx                   ; Limpiar para división
    div ecx                        ; Dividir por 10
    add dl, '0'                    ; Convertir a ASCII
    mov [edi], dl                  ; Guardar dígito
    test eax, eax                  ; Verificar si hay más dígitos
    jnz .convertir                 ; Continuar si hay más
    jmp .mostrar_resultado

.resultado_cero:
    dec edi
    mov byte [edi], '0'            ; Si es cero, solo mostrar '0'

.mostrar_resultado:
    ; ===== Mostrar resultados =====
    ; Imprimir mensaje
    mov eax, 4                     ; syscall write
    mov ebx, 1                     ; stdout
    mov ecx, mensaje               ; mensaje
    mov edx, msg_len               ; longitud
    int 0x80

    ; Imprimir número
    mov eax, 4
    mov ebx, 1
    lea ecx, [edi]                 ; Inicio del número
    mov edx, resultado_ascii + 11
    sub edx, ecx                   ; Calcular longitud
    int 0x80

    ; Imprimir salto de línea
    mov eax, 4
    mov ebx, 1
    mov ecx, salto_linea
    mov edx, 1
    int 0x80

    ; ===== Finalizar programa =====
    mov eax, 1                     ; syscall exit
    xor ebx, ebx                   ; código de salida 0
    int 0x80
