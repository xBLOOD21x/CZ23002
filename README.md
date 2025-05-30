

### Ejercicio 1: Resta de Tres Enteros (16 bits)
**Archivo:** `ejercicio1/operacion_resta.asm`  
**Descripción:**  
- Realiza la resta de tres números enteros (30 - 10 - 5) usando registros de 16 bits
- Muestra el resultado en pantalla con un mensaje descriptivo
- Técnicas utilizadas:
  - Operaciones con registros AX, BX
  - Conversión de números a ASCII
  - Llamadas al sistema para impresión

**Compilación y ejecución:**
```bash
nasm -f elf32 ejercicio1/operacion_resta.asm -o ejercicio1/resta.o
ld -m elf_i386 ejercicio1/resta.o -o ejercicio1/ejecutableResta
./ejercicio1/ejecutableResta
```

### Ejercicio 2: Multiplicación (8 bits)
**Archivo:** `ejercicio2/operacion_multiplicacion.asm`  
**Descripción:**  
- Multiplica dos números de 8 bits (6 * 4) usando registros AL y BL
- Implementa conversión a ASCII para mostrar el resultado
- Características:
  - Uso de la instrucción MUL para 8 bits
  - Manejo de buffers para conversión numérica
  - Optimización para números pequeños

**Compilación y ejecución:**
```bash
nasm -f elf32 ejercicio2/operacion_multiplicacion.asm -o ejercicio2/multiplicacion.o
ld -m elf_i386 ejercicio2/multiplicacion.o -o ejercicio2/ejecutableMultiplicacion
./ejercicio2/ejecutableMultiplicacion
```

### Ejercicio 3: División (32 bits)
**Archivo:** `ejercicio3/operacion_division.asm`  
**Descripción:**  
- Divide dos números de 32 bits (50 / 10)
- Versión simplificada que muestra solo el cociente
- Aspectos destacables:
  - Uso de registros EAX, EDX
  - Instrucción DIV para 32 bits
  - Manejo de casos especiales (división por cero no incluida)

**Compilación y ejecución:**
```bash
nasm -f elf32 ejercicio3/operacion_division.asm -o ejercicio3/division.o
ld -m elf_i386 ejercicio3/division.o -o ejercicio3/ejecutableDivision
./ejercicio3/ejecutableDivision
```

## Requisitos del Sistema
- Sistema operativo Linux (probado en Kali Linux)
- NASM (Netwide Assembler) instalado
- Enlazador ld
- Arquitectura x86 (32 bits)

## Estructura de Directorios
```
./
├── ejercicio1/
│   ├── operacion_resta.asm
│   ├── resta.o
│   └── ejecutableResta
├── ejercicio2/
│   ├── operacion_multiplicacion.asm
│   ├── multiplicacion.o
│   └── ejecutableMultiplicacion
└── ejercicio3/
    ├── operacion_division.asm
    ├── division.o
    └── ejecutableDivision





