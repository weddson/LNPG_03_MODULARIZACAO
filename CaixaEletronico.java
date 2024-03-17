package LNPG_03_MODULARIZACAO;
import java.util.Scanner;

public class CaixaEletronico {
    static double saldo = 1000.00;
    static Scanner scanner = new Scanner(System.in);

	public static void exibirMenu() {
        System.out.println("Bem-vindo ao Caixa Eletrônico");
        System.out.println("Seu saldo atual é: R$" + saldo);
        System.out.println("Escolha uma opção:");
        System.out.println("1 - Saque");
        System.out.println("2 - Depósito");
        System.out.println("3 - Consultar Saldo");
        int opcao = scanner.nextInt();
        executarOpcao(opcao);
    }

    public static void executarOpcao(int opcao) {
        switch (opcao) {
            case 1:
                realizarSaque();
                break;
            case 2:
                realizarDeposito();
                break;
            case 3:
                consultarSaldo();
                break;
            default:
                System.out.println("Opção inválida.");
        }
    }

    public static void realizarSaque() {
        System.out.println("Digite o valor do saque:");
        double valor = scanner.nextDouble();
        if (valor > saldo) {
            System.out.println("Saldo insuficiente.");
        } else {
            saldo -= valor;
            System.out.println("Saque de R$" + valor + " realizado.");
        }
    }

    public static void realizarDeposito() {
        System.out.println("Digite o valor do depósito:");
        double valor = scanner.nextDouble();
        saldo += valor;
        System.out.println("Depósito de R$" + valor + " realizado.");
    }

    public static void consultarSaldo() {
        System.out.println("Seu saldo atual é: R$" + saldo);
    }

    public static void main(String[] args) {
        exibirMenu();
        scanner.close();
    }
}
