#include <stdio.h>
#include <stdlib.h>

extern void sort(int *vetor, int tam);

int main() {
    int tam, i = 0;
    int *vetor;

    // Módulo em C realiza a admissão do vetor inserido pelo usuário (até 10 valores)
    printf("Insira tamanho do vetor (<= 10): ");
    scanf("%d", &tam);

    vetor = (int *) malloc (tam * sizeof(int));

    printf("Insira os %d elementos do vetor: ", tam);
    for (i = 0 ; i < tam ; i++) {
        scanf("%d", &vetor[i]);
    }

    // Módulo em Assembly realiza a ordenação dos valores.
    // Para isso deve receber um ponteiro para o vetor e seu tamanho.
    sort(vetor, tam);

    free(vetor);
    return 0; 
}