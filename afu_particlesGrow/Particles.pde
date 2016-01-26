class Particles {
  PVector pos, vel, acc;
  PVector initPos;
  float maxSpeed = 5;
  float maxSteering = 0.1;
  color c;
  float aCol;
  float mouseVar;
  
  Particles (PVector _initPos, color _c, float _aCol){
    pos = new PVector();
    pos.set(_initPos);
    initPos = new PVector();
    initPos.set (_initPos);
    vel = new PVector (0, 0);
    acc = new PVector (0, 0);
    c = _c;  
    aCol = _aCol;
  }

  boolean mouseMove(){
    float mouseMovement;
    mouseMovement = abs(mouseX - pmouseX);
      if (mouseMovement > 0){
        return true;
        } else {
        return false;
      }
    } 
    
  void mDown(){
    acc.add (avoid(new PVector (mouseX+random(-50,50), mouseY+random(-50,50)), true));
    move();
    checkBounds();
    render();    
  }
  
  void mouseUp(){
    if (pos.x!=initPos.x && pos.y!=initPos.y)
      acc.add(steer(new PVector(initPos.x, initPos.y), true));
    move();
    checkBounds();
    render();    
  }
  
  void move(){
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0); 
  }
  
  void checkBounds(){
    if(pos.x>width)  pos.x = 0;
    if(pos.x<0)      pos.x=width;
    if(pos.y>height) pos.y = 0;
    if(pos.y<0)      pos.y =height;
  }
  
  void render(){
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(c, aCol);
    strokeWeight(5);
    point(0,0);
    popMatrix();
  }
  
  PVector steer(PVector target, boolean arrival){
    PVector steer = new PVector();
    if(!arrival){
      steer.set(PVector.sub(target, pos));
      steer.limit(maxSteering);
    } else {
      PVector targetOffset = PVector.sub(target, pos);
      float distance = targetOffset.mag();
      float rampedSpeed = maxSpeed * (distance/100);
      float clippedSpeed = min (rampedSpeed, maxSpeed);
      PVector desiredVelocity = PVector.mult(targetOffset, (clippedSpeed/distance));
      steer.set(PVector.sub(desiredVelocity,vel));
      steer.limit(maxSteering);
    } 
    return steer;
  }
  
  PVector avoid (PVector target, boolean weight){
    PVector steer = new PVector();
    steer.set(PVector.sub(pos, target));
    if (weight)
      steer.mult(10/sq(steer.mag()));
    steer.limit(maxSteering);
    return steer;  
  }
}
