public aspect Log{
		File file = new File("log.txt");
	    Calendar cal = Calendar.getInstance();
        pointcut transaction():execution(void Bank.make*(..));
            pointcut money():execution(void Bank.my*(..));
            pointcut user():execution(void Bank.create*(..));
            after() : transaction(){
                writeFile("Transaccion realisada "+cal.getTime());
            }
            after() : money(){
                writeFile("Dinero retirado "+cal.getTime());
                }
            after() : user(){
                writeFile("Usuario creado "+cal.getTime());
            }

            public void writeFile(String mensaje){
                try {

                    String content = mensaje;



                    if (!file.exists()) {
                        file.createNewFile();
                    }

                    FileWriter fw = new FileWriter(file.getAbsoluteFile());
                    BufferedWriter bw = new BufferedWriter(fw);
                    bw.write(content);
                    bw.close();

                    System.out.println("Done");

                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
}
