#include <stdio.h>

// Função que soma dois números usando assembly inline
int add(int a, int b) {
    int result;
    asm("addl %1, %0"
        : "=r" (result)    // saída: result
        : "r" (a), "0" (b) // entradas: a e b (0 significa usar o mesmo registrador da saída)
    );
    return result;
}

// Exemplo com mov direto
void exemplo_mov() {
    int result;
    asm("mov $42, %0"
        : "=r" (result)
    );
    printf("Resultado do mov: %d\n", result);
}

int main() {
    int x = 10;
    int y = 25;
    
    printf("Soma de %d + %d = %d\n", x, y, add(x, y));
    exemplo_mov();
    
    return 0;
}
