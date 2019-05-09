

import java.util.ArrayList;
import java.util.Collections;


class Travel {



    private ArrayList<City> travel = new ArrayList<City>();

    private ArrayList<City> previousTravel = new ArrayList<City>();



    public Travel(int numberOfCities) {

        for (int i = 0; i < numberOfCities; i++) {

            travel.add(new City());

        }

    }



    public void generateInitialTravel() {

        if (travel.isEmpty())

            new Travel(10);

        Collections.shuffle(travel);

    }



    public void swapCities() {

        int a = generateRandomIndex();

        int b = generateRandomIndex();

        previousTravel = travel;

        City x = travel.get(a);

        City y = travel.get(b);

        travel.set(a, y);

        travel.set(b, x);

    }



    public void revertSwap() {

        travel = previousTravel;

    }



    private int generateRandomIndex() {

        return (int) (Math.random() * travel.size());

    }



    public City getCity(int index) {

        return travel.get(index);

    }



    public int getDistance() {

        int distance = 0;

        for (int index = 0; index < travel.size(); index++) {

            City starting = getCity(index);

            City destination;

            if (index + 1 < travel.size()) {

                destination = getCity(index + 1);

            } else {

                destination = getCity(0);

            }

            distance += starting.distanceToCity(destination);

        }

        return distance;

    }
    
    
    void display(){
      for(int i = 0; i < travel.size(); i+=2){
        getCity(i).display();
        strokeWeight(1);
        line(getCity(i).getX(), getCity(i).getY(), getCity(i).getZ(), getCity(i+1).getX(), getCity(i+1).getY(), getCity(i+1).getZ());
        getCity(i+1).display();
        strokeWeight(1);
        if(i < travel.size() - 2) line(getCity(i+1).getX(), getCity(i+1).getY(), getCity(i+1).getZ(), getCity(i+2).getX(), getCity(i+2).getY(), getCity(i+2).getZ());
      }
    }



}
