class Box
{
  PVector pos;
  float len;
  Config config;
  int i,j,k;
  
  Box(float x, float y, float z, float len_,int i_,int j_,int k_)
  {
    pos = new PVector(x,y,z);
    len = len_;
    config = new Config();
    i=i_;
    j=j_;
    k=k_;
  }
  
  void show()
  {
    pushMatrix();
    
      switch(axis)
      {
        case 'X':
          if(ri==i)
          {
            rotateX(ang);
          }
          break;
          
        case 'Y':
          if(rj==j)
          {
            rotateY(ang);
          }
          break;
          
        case 'Z':
          if(rk==k)
          {
            rotateZ(ang);
          }
          break;
      }
    
    fill(255);
    stroke(0);
    strokeWeight(8);
    translate(pos.x,pos.y,pos.z);
    
    beginShape(QUADS);
    
    float r = len/2;
    
    //z-fixed
    
    fill(config.side[F]);
    vertex(r,r,r);
    vertex(-r,r,r);
    vertex(-r,-r,r);
    vertex(r,-r,r);
    
    fill(config.side[B]);
    vertex(r,r,-r);
    vertex(-r,r,-r);
    vertex(-r,-r,-r);
    vertex(r,-r,-r);
    
    //x-fixed
    fill(config.side[R]);
    vertex(r,r,r);
    vertex(r,-r,r);
    vertex(r,-r,-r);
    vertex(r,r,-r);
    
    
    fill(config.side[L]);
    vertex(-r,r,r);
    vertex(-r,-r,r);
    vertex(-r,-r,-r);
    vertex(-r,r,-r);
    
    
    //y-fixed
    
    fill(config.side[D]);
    vertex(r,r,r);
    vertex(-r,r,r);
    vertex(-r,r,-r);
    vertex(r,r,-r);
    
    fill(config.side[U]);
    vertex(r,-r,r);
    vertex(-r,-r,r);
    vertex(-r,-r,-r);
    vertex(r,-r,-r);
    
    endShape();
    
    popMatrix();
  }
}
