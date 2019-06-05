package com.bank;
public aspect Login{
	private static Scanner entrada = new Scanner(System.in);
    pointcut needLogin() :execution(void Bank.make*(..))||execution(void Bank.my*(..));

    before():needLogin(){
        System.out.println("Es necesario logiarce");
        readConsole("Nombre: ");
        readConsole("Id: ");
    }

    public static  String readConsole(String mensaje){
        System.out.println(mensaje);  
        String inputText;
        inputText = entrada.nextLine();           
        return inputText;
    }
}
