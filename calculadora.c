#include <stdio.h>

float soma(float num1, float num2) {
    return num1 + num2;
}

float subtracao(float num1, float num2) {
    return num1 - num2;
}

float multiplicacao(float num1, float num2) {
    return num1 * num2;
}

float divisao(float num1, float num2) {
    if (num2 != 0) {
        return num1 / num2;
    } else {
        return -1;
    }
}

int solicitaOperacao() {
    char operador;
    printf("Digite a operação (+, -, *, /): ");
    scanf("%c", &operador);
    return operador;
}

float solicitaNumero1() {
    float num1;
    printf("Digite o primeiro número: ");
    scanf("%f", &num1);
    return num1;
}

float solicitaNumero2() {
    float num2;
    printf("Digite o segundo número: ");
    scanf("%f", &num2);
    return num2;
}


float resultadoOperacao(char operador, float num1, float num2) {
    float resultado;
    switch (operador) {
        case '+':
            resultado = soma(num1, num2);
            break;
        case '-':
            resultado = subtracao(num1, num2);
            break;
        case '*':
            resultado = multiplicacao(num1, num2);
            break;
        case '/':
            resultado = divisao(num1, num2);
            break;
        default:
            resultado = -1;
    }
    return resultado;
}

int main() {
    char operador;
    float num1, num2, resultado;
    solicitaOperacao();
    solicitaNumero1();
    solicitaNumero2();

    resultadoOperacao(operador, num1, num2);

    return 0;
}