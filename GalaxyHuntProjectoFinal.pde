import processing.sound.*;
SoundFile sonidoDisparo, sonidoAmbiente, sonidoGameOver, sonidoExplosion;
PImage img, meteorito;
PFont font;
ArrayList<Balls> balls;
Balls bola;
boolean gameover = false;
int contadorVida = 5;
int contadorPuntaje = 0;
String tittle = "GALAXY HUNT"; //declaro y defino  mis variables
int savedTime;
int totalTime = 3000;
int velocidadBolas = 1;
int passedTime;
boolean sigNivel = false;
int nivel = 1;

void setup() {
  size(720,480);
  
  sonidoDisparo = new SoundFile(this, "shot.wav");
  sonidoAmbiente = new SoundFile(this, "ambiente.mp3");
  sonidoExplosion = new SoundFile(this, "explosion.wav");
  sonidoGameOver = new SoundFile(this, "gameOver.wav");
  
  img = loadImage("space.jpg");
  meteorito = loadImage("meteoro.png");
  //meteorito = loadImage("meteo.png");
  //img = loadImage("galaxy.jpg");
  sonidoAmbiente.play();
  
  balls = new ArrayList<Balls>(); //Inicializamos el arreglo de tipo bols
 
  textSize(50);
  textAlign(CENTER, CENTER);
  
  savedTime = millis(); //inicializando el deltatime
  
}

void draw() {
  
  //Interfaz
  image(img,width/2,height/2,720,480);
  font = createFont("Yet R", 30);
  textFont(font);
  textSize(50);
  text(tittle, width/2, height/2);
  textSize(25);
  text("Vida: ", 630,50);
  text(contadorVida, 670, 50);
  text("Score: ", 60,50);
  text(contadorPuntaje, 110,50);
  text("Nivel: ", 60, 90);
  text(nivel, 110, 90);
  
  //Obtener tiempo transcurrido
  passedTime = millis() - savedTime; 
                                        // Funcion la cual permite que el titulo de play permanezca solo durante unos segundos   
  if(passedTime < 4000){
    if(passedTime > totalTime){
    tittle = "";
  }} 
  
  if(contadorPuntaje %10 == 0 && sigNivel == true){ //Realizo el aumento de velocidad con el calculo modulo que suma 1 cada 4 segundos 
    velocidadBolas +=1;  // esta operación se realiza con un metodo llamado modulo el cual nos genera el residual de la division
    nivel++;
    sigNivel = false;  
}
 
  
  if(balls.size() < 5 && gameover == false){ //Se anaden 5 bolas al arreglo
    bola = new Balls(random(width),random(-200,-100) , velocidadBolas, 50);
    balls.add(bola);
  }
  
  for (int i = 0; i < balls.size(); i++) { //llamando a las funciones fall y show y el for recorro el arreglo
    Balls temp = balls.get(i);
    temp.fall();
    temp.show();
    
    if(temp.outOfBounds() == true && contadorVida >0){ //Cuando pasa el piso la bola se borra y se crea un contadorVida hasta 5 
      balls.remove(i);
      contadorVida--;
      println("\nVida: ", contadorVida);
      sonidoExplosion.play();
      
      if(contadorVida == 0){ //contadorVida llega a 5, se eliminan las bolas y surge el texto de game over 
        gameover=true;
        tittle = "GAME OVER";
        sonidoGameOver.play();
        balls = new ArrayList<Balls>(); //Inicializo para que se borre todo
      }
      
    }
    
  }
}
  
void mousePressed(){
  
  sonidoDisparo.play();
  
  for (int i = 0; i < balls.size(); i++) { //For recorre el arreglo
    //Verificar si hemos hecho click en alguna bola del arreglo
    if(balls.get(i).hipotenusaDisparo() == true){ //si es verdadero, el mouse hizo click en una bola y se elimina.
      balls.remove(i);
      contadorPuntaje++;
      
      if(contadorPuntaje%10 == 0){
        sigNivel = true;
      }

    }
  }
}
