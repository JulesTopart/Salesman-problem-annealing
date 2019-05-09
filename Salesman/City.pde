class City {
 
    private int x;
    private int y;
    private int z;
 
    public City() {
        this.x = (int) (Math.random() * 500);
        this.y = (int) (Math.random() * 500);
        this.z = (int) (Math.random() * 500);
    }
 
     
    public int getX(){
      return x;
    }
    
    public int getY(){
      return y;
    }
    
    public int getZ(){
      return z;
    }
    
    public double distanceToCity(City city) {
        int x = Math.abs(getX() - city.getX());
        int y = Math.abs(getY() - city.getY());
        int z = Math.abs(getZ() - city.getZ());
        return Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2) + Math.pow(z, 2));
    }
 
 
   public void display(){
    stroke(0);
    strokeWeight(4);
    fill(0);
    point(x,y,z);
   }
}
