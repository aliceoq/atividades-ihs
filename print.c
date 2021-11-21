#include <stdio.h>

// Módulo em C faz a impressão dos valores ordenados
void print(int *vetor, int tam) {
    int i = 0;
    printf("Vetor ordenado: ");

    while (i++ < tam) {
        printf("%d ", vetor[i]);
    }

    printf("\n");
}