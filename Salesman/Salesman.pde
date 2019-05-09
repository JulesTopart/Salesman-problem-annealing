

Travel tHandler;
Annealing an;

void setup() {
  size(1200, 1200, P3D);
  tHandler = new Travel(100);

  an = new Annealing(10, 10000, 0.9999);
}

float rot = 0;

void draw() {
  background(220);
  
  translate(width/3,height/2);
  rotateY(rot);

  rot+=0.01;
  an.run();
  tHandler.display();
  
}

class Annealing {

  Annealing(double _startingTemperature, int _numberOfIterations, double _coolingRate) {
    startingTemperature = _startingTemperature;
    numberOfIterations = _numberOfIterations;
    coolingRate = _coolingRate;
    
    System.out.println("Starting SA with temperature: " + startingTemperature + ", # of iterations: " + numberOfIterations + " and colling rate: " + coolingRate);
    t = startingTemperature;
    tHandler.generateInitialTravel();
    bestDistance = tHandler.getDistance();
    System.out.println("Initial distance of travel: " + bestDistance);
    bestSolution = tHandler;
    currentSolution = bestSolution;
    
    i = 0;
  }


  public double run() {
    if(i < numberOfIterations){

      if (t > 0.1) {

        currentSolution.swapCities();

        double currentDistance = currentSolution.getDistance();

        if (currentDistance < bestDistance) {

          bestDistance = currentDistance;
        } else if (Math.exp((bestDistance - currentDistance) / t) < Math.random()) {

          currentSolution.revertSwap();
        }

        t *= coolingRate;
      }

      if (i % 100 == 0) {
        System.out.println("Iteration #" + i + "  length :" + bestDistance);
      }
      i++;
    }
    

    return bestDistance;
  }

  int i;

  int numberOfIterations;
  double startingTemperature;
  double coolingRate;

  Travel bestSolution;

  Travel currentSolution;

  double t;

  double bestDistance;
}
