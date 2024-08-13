class Balls {
    float x; // definimos x 
    float y; //definimos y
    float speed; //
    int size;
    
  Balls(float x_, float y_, float speed_, int size_){ // Constructor inicializando las variables
    x = x_;
    y = y_;
    speed = speed_;
    size = size_;
  }
  
  void fall(){ // creo una variable para la caida
    y += speed; // y mas velocidad (efecto caida)
  }
  
  void show() { //funcion para mostrar los circulos
    //fill(138,43,226);
    //stroke(138,43,226);
    //ellipse(x,y,size,size);
    imageMode(CENTER);
    image(meteorito,x,y,size,size);
  }
  
  boolean outOfBounds(){ //Función para retirar las bolas cada vez que sobre pasen el piso
    if(y > height){
      return true;
    }else{
      return false;
    }
  }
  
  float getX(){ //obtener coordenada x
    return x;
  }
  
  float getY(){  //obtener coordenada y
    return y;
  }
  //Funcion que me dice si el mouse esta dentro del area del circulo para ver si hice click en el. con formula de hipotenusa
  boolean hipotenusaDisparo(){
    float hipotenusa_Mouse = sqrt((mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y)); // formula hipotenusa para ver la distancia del mouse hasta el centro de la bola
    if(hipotenusa_Mouse <= size){ //si la distancia es -= al radio se encuentra dentro del area del circulo 
      return true;
    }else // caso contrario no se encuentra dentro del area del circulo 
    return false;
  }
  
}
