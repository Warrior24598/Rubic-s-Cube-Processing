import peasy.*;
PeasyCam cam;

int dim = 3;
Box[][][] cube = new Box[dim][dim][dim];

int U=0, D=1, F=2, B=3, L=4, R=5;

float ang = 0;
int ri=0,rj=0,rk=0;
char axis = 'N',side = 'w';
boolean processing = false;


int[] temp = new int[dim];
int[][] sideTemp = new int[dim][dim];
int[] colors = new int[]{
  #FFFFFF,#FFFF33,#0000FF,#00FF00,#FF0000,#FF9900
};


void setup()
{
  size(600,600,P3D);
  
  cam = new PeasyCam(this,400);
  
  for(int i=0;i<dim;i++)
  {
    for(int j=0;j<dim;j++)
    {
      for(int k=0;k<dim;k++)
      {
        int len = 50;
        
        float  offset = (dim-1)*len*0.5;
        
        float x = len*i-offset;
        float y = len*j-offset;
        float z = len*k-offset;
        
        cube[i][j][k] = new Box(x,y,z,len,i,j,k);
      }
    }
  }
}

void draw()
{
 
  background(51);
  
  if(processing)
  {
    if(side=='W'||side=='y'||side=='R'||side=='G'||side=='b'||side=='o')
    {
      ang+=PI/20;
    }
    else
    {
      ang-=PI/20;
    }
    
    if(ang>=PI/2 || ang<=-PI/2)
    {
      processing = false;
      ang=0;
      axis = 'N';
      rotateSurface(side);
    }
  }
  for(int i=0;i<dim;i++)
  {
    for(int j=0;j<dim;j++)
    {
      for(int k=0;k<dim;k++)
      {
          cube[i][j][k].show();
      }
    }
  }
}

void rotateSurface(char s)
{
  switch(s)
   {
     case 'b':
       
       for(int i=0;i<dim;i++)
       {
         temp[i] = cube[i][0][dim-1].config.side[U];
         
         cube[i][0][dim-1].config.side[U] = cube[0][dim-1-i][dim-1].config.side[L]; 
         
         cube[0][dim-1-i][dim-1].config.side[L] = cube[dim-1-i][dim-1][dim-1].config.side[D];
         
         cube[dim-1-i][dim-1][dim-1].config.side[D] = cube[dim-1][i][dim-1].config.side[R];
         
         cube[dim-1][i][dim-1].config.side[R] = temp[i];
         
       }
       
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           sideTemp[i][j]=cube[i][j][dim-1].config.side[F];
         }
       }
       
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           cube[j][i][dim-1].config.side[F] = sideTemp[i][dim-1-j];
         }
       }
       
       
       
       break;
       
     case 'B':
       for(int i=0;i<dim;i++)
       {
         temp[i] = cube[i][0][dim-1].config.side[U];
         
         cube[i][0][dim-1].config.side[U] = cube[dim-1][i][dim-1].config.side[R]; 
         
         cube[dim-1][i][dim-1].config.side[R] = cube[dim-1-i][dim-1][dim-1].config.side[D];
         
         cube[dim-1-i][dim-1][dim-1].config.side[D] = cube[0][dim-1-i][dim-1].config.side[L];
         
         cube[0][dim-1-i][dim-1].config.side[L] = temp[i];
         
       }
       
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           sideTemp[i][j]=cube[i][j][dim-1].config.side[F];
         }
       }
       
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           cube[j][i][dim-1].config.side[F] = sideTemp[dim-1-i][j];
         }
       }
       
       break;
       
       case 'r':
       
       for(int i=0;i<dim;i++)
       {
         temp[i] = cube[0][0][i].config.side[U];
         
         cube[0][0][i].config.side[U] = cube[0][dim-1-i][0].config.side[B]; 
         
         cube[0][dim-1-i][0].config.side[B] = cube[0][dim-1][dim-1-i].config.side[D];
         
         cube[0][dim-1][dim-1-i].config.side[D] = cube[0][i][dim-1].config.side[F];
         
         cube[0][i][dim-1].config.side[F] = temp[i];
         
       }
       
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           sideTemp[i][j]=cube[0][i][j].config.side[L];
         }
       }
       
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           cube[0][j][i].config.side[L] = sideTemp[dim-1-i][j];
         }
       }
       
         break;
       
       case 'R':
         for(int i=0;i<dim;i++)
         {
           temp[i] = cube[0][0][i].config.side[U];
           
           cube[0][0][i].config.side[U] = cube[0][i][dim-1].config.side[F]; 
           
           cube[0][i][dim-1].config.side[F] = cube[0][dim-1][dim-1-i].config.side[D];
           
           cube[0][dim-1][dim-1-i].config.side[D] = cube[0][dim-1-i][0].config.side[B];
           
           cube[0][dim-1-i][0].config.side[B] = temp[i];
           
         }
         for(int i=0;i<dim;i++)
         {
           for(int j=0;j<dim;j++)
           {
             sideTemp[i][j]=cube[0][i][j].config.side[L];
           }
         }
         
         for(int i=0;i<dim;i++)
         {
           for(int j=0;j<dim;j++)
           {
             cube[0][j][i].config.side[L] = sideTemp[i][dim-1-j];
           }
         }
       
      
       break;
       
       case 'o':
       
       for(int i=0;i<dim;i++)
       {
         temp[i] = cube[dim-1][0][i].config.side[U];
         
         cube[dim-1][0][i].config.side[U] = cube[dim-1][i][dim-1].config.side[F]; 
         
         cube[dim-1][i][dim-1].config.side[F] = cube[dim-1][dim-1][dim-1-i].config.side[D];
         
         cube[dim-1][dim-1][dim-1-i].config.side[D] = cube[dim-1][dim-1-i][0].config.side[B];
         
         cube[dim-1][dim-1-i][0].config.side[B] = temp[i];
         
       }
       
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           sideTemp[i][j]=cube[dim-1][i][j].config.side[R];
         }
       }
       
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           cube[dim-1][j][i].config.side[R] = sideTemp[i][dim-1-j];
         }
       }
       
       break;
       
       case 'O':
       for(int i=0;i<dim;i++)
       {
         temp[i] = cube[dim-1][0][i].config.side[U];
         
         cube[dim-1][0][i].config.side[U] = cube[dim-1][dim-1-i][0].config.side[B]; 
         
         cube[dim-1][dim-1-i][0].config.side[B] = cube[dim-1][dim-1][dim-1-i].config.side[D];
         
         cube[dim-1][dim-1][dim-1-i].config.side[D] = cube[dim-1][i][dim-1].config.side[F];
         
         cube[dim-1][i][dim-1].config.side[F] = temp[i];
         
       }
       
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           sideTemp[i][j]=cube[dim-1][i][j].config.side[R];
         }
       }
       
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           cube[dim-1][j][i].config.side[R] = sideTemp[dim-1-i][j];
         }
       }
       
       break;
       
       case 'g':
       
       for(int i=0;i<dim;i++)
       {
         temp[i] = cube[i][0][0].config.side[U];
         
         cube[i][0][0].config.side[U] = cube[dim-1][i][0].config.side[R]; 
         
         cube[dim-1][i][0].config.side[R] = cube[dim-1-i][dim-1][0].config.side[D];
         
         cube[dim-1-i][dim-1][0].config.side[D] = cube[0][dim-1-i][0].config.side[L];
         
         cube[0][dim-1-i][0].config.side[L] = temp[i];
         
       }
       
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           sideTemp[i][j]=cube[i][j][0].config.side[B];
         }
       }
       
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           cube[j][i][0].config.side[B] = sideTemp[dim-1-i][j];
         }
       }
       
       break;
       
       case 'G':
       
       for(int i=0;i<dim;i++)
       {
         temp[i] = cube[i][0][0].config.side[U];
         
         cube[i][0][0].config.side[U] = cube[0][dim-1-i][0].config.side[L]; 
         
         cube[0][dim-1-i][0].config.side[L] = cube[dim-1-i][dim-1][0].config.side[D];
         
         cube[dim-1-i][dim-1][0].config.side[D] = cube[dim-1][i][0].config.side[R];
         
         cube[dim-1][i][0].config.side[R] = temp[i];
         
       }
       
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           sideTemp[i][j]=cube[i][j][0].config.side[B];
         }
       }
       
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           cube[j][i][0].config.side[B] = sideTemp[i][dim-1-j];
         }
       }
       
       break;
       
       case 'w':
       
       for(int i=0;i<dim;i++)
       {
         temp[i] = cube[i][0][dim-1].config.side[F];
         
         cube[i][0][dim-1].config.side[F] = cube[dim-1][0][dim-1-i].config.side[R]; 
         
         cube[dim-1][0][dim-1-i].config.side[R] = cube[dim-1-i][0][0].config.side[B];
         
         cube[dim-1-i][0][0].config.side[B] = cube[0][0][i].config.side[L];
         
         cube[0][0][i].config.side[L] = temp[i];
         
       }
       
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           sideTemp[i][j]=cube[i][0][j].config.side[U];
         }
       }
       
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           cube[j][0][i].config.side[U] = sideTemp[i][dim-1-j];
         }
       }
       
       break;
       
       case 'W':
       
       for(int i=0;i<dim;i++)
       {
         temp[i] = cube[i][0][dim-1].config.side[F];
         
         cube[i][0][dim-1].config.side[F] = cube[0][0][i].config.side[L]; 
         
         cube[0][0][i].config.side[L] = cube[dim-1-i][0][0].config.side[B];
         
         cube[dim-1-i][0][0].config.side[B] = cube[dim-1][0][dim-1-i].config.side[R];
         
         cube[dim-1][0][dim-1-i].config.side[R] = temp[i];
         
       } 
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           sideTemp[i][j]=cube[i][0][j].config.side[U];
         }
       }
       
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           cube[j][0][i].config.side[U] = sideTemp[dim-1-i][j];
         }
       }
       
       break;
       
       case 'y':
       
       for(int i=0;i<dim;i++)
       {
         temp[i] = cube[i][dim-1][dim-1].config.side[F];
         
         cube[i][dim-1][dim-1].config.side[F] = cube[0][dim-1][i].config.side[L]; 
         
         cube[0][dim-1][i].config.side[L] = cube[dim-1-i][dim-1][0].config.side[B];
         
         cube[dim-1-i][dim-1][0].config.side[B] = cube[dim-1][dim-1][dim-1-i].config.side[R];
         
         cube[dim-1][dim-1][dim-1-i].config.side[R] = temp[i];
         
       }
       
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           sideTemp[i][j]=cube[i][dim-1][j].config.side[D];
         }
       }
       
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           cube[j][dim-1][i].config.side[D] = sideTemp[dim-1-i][j];
         }
       }
       
       break;
       
       case 'Y':
       
       for(int i=0;i<dim;i++)
       {
         temp[i] = cube[i][dim-1][dim-1].config.side[F];
         
         cube[i][dim-1][dim-1].config.side[F] = cube[dim-1][dim-1][dim-1-i].config.side[R]; 
         
         cube[dim-1][dim-1][dim-1-i].config.side[R] = cube[dim-1-i][dim-1][0].config.side[B];
         
         cube[dim-1-i][dim-1][0].config.side[B] = cube[0][dim-1][i].config.side[L];
         
         cube[0][dim-1][i].config.side[L] = temp[i];
         
       }
       
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           sideTemp[i][j]=cube[i][dim-1][j].config.side[D];
         }
       }
       
       for(int i=0;i<dim;i++)
       {
         for(int j=0;j<dim;j++)
         {
           cube[j][dim-1][i].config.side[D] = sideTemp[i][dim-1-j];
         }
       }
       
       break;
       
   }
}

void keyPressed()
{
  if(key=='s')
    shuf();
   else
   {
   //rotateSurface(key);
   
     if(key=='w'||key=='W')
     {
       axis = 'Y';
       rj = 0;
     }
     else if(key=='y'||key=='Y')
     {
       axis = 'Y';
       rj = dim-1;
     }
     else if(key=='o'||key=='O')
     {
       axis = 'X';
       ri = dim-1;
     }
     else if(key=='r'||key=='R')
     {
       axis = 'X';
       ri = 0;
     }
     else if(key=='b'||key=='B')
     {
       axis = 'Z';
       rk = dim-1;
     }
     else if(key=='g'||key=='G')
     {
       axis = 'Z';
       rk = 0;
     }
     else
       return;
       
     processing=true;
     side = key;

   }
}

void shuf()
{
  char[] sides = new char[]{'b','B','r','R','g','G','o','O','w','W','y','Y'};
  
  for(int i=0;i<10;i++)
  {
    rotateSurface(sides[int(random(12))]);
  }
}
