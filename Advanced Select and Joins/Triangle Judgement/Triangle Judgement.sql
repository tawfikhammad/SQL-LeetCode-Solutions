select x,y,z, (if(x+y>z and x+z>y and z+y>x, 'Yes', 'No')) triangle 
from Triangle 
