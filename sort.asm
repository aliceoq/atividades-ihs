section .text
extern print
global sort

sort:
    enter 0, 0
    mov edx, [ebp + 8]      ; edx = ponteiro para o vetor
    mov ecx, [ebp + 12]     ; ecx = tamanho do vetor

    push ebx    ; preservar ebx

    cmp ecx, 2  ; se o vetor tiver tamanho = 0 ou 1, nao tem o que ser ordenado e pode terminar
    jl end 

    mov ebx, 0  ; zerar registradores que vão ser usados de contadores
    mov eax, 0
    dec ecx     ; ecx = tamanho - 1

for1:                               ; equivale a for (int i = 0 ; i < n - 1 ; i++)
    mov ebx, 0  
    .for2:                          ; equivale a for (int j = 0 ; j < n - 1 ; j++)
        push ecx                    ; salva o tamanho e o contador do loop externo
        push eax
        mov ecx, [edx+ebx*4]        ; equivale a ecx = vetor[j]
        mov eax, [edx+ebx*4 + 4]    ; equivale a eax = vetor[j + 1]
        cmp ecx, eax
        jle .next                   ; if (vetor[j] <= vetor[j+1]) vai pra proxima iteração

        mov [edx+ebx*4], eax        ; caso contrário, faz o swap
        mov [edx+ebx*4+4], ecx

        .next:
            pop eax                 ; recupera o tamanho e o contador do loop externo
            pop ecx
            inc ebx                 ; j++
            cmp ebx, ecx            ; j < n - 1
            jne .for2
    
    inc eax         ; i++
    cmp eax, ecx    ; i < n - 1
    jne for1

end:
    inc ecx         ; restaurar o tamanho do vetor
    pop ebx         ; recupera ebx

    push ecx        ; passando parametros para a funcao em C que vai printar
    push edx
    call print      ; chamando funcao que vai printar
    
    leave
    ret
