public class Car {
    
    // Attributes
    private int id;
    private String make;
    private String model;
    private int year;
    private double dailyRate;
    private boolean isAvailable;
    private String isReturned;

    // Constructor
    public Car(String make, String model, int year, double dailyRate) {
        this.make = make;
        this.model = model;
        this.year = year;
        this.dailyRate = dailyRate;
        this.isAvailable = true;      // default value
        this.isReturned = "No";       // default value
    }

    // toString Method
    @Override
    public String toString() {
        return "Car ID: " + id +
               "\nMake: " + make +
               "\nModel: " + model +
               "\nYear: " + year +
               "\nDaily Rate: " + dailyRate +
               "\nAvailable: " + isAvailable +
               "\nReturned: " + isReturned;
    }

    // Getters
    public int getID() {
        return id;
    }

    public String getMake() {
        return make;
    }

    public String getModel() {
        return model;
    }

    public int getYear() {
        return year;
    }

    public double getDailyRate() {
        return dailyRate;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public String isReturned() {
        return isReturned;
    }

    // Setters
    public void setID(int id) {
        this.id = id;
    }

    public void setMake(String make) {
        this.make = make;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public void setDailyRate(double dailyRate) {
        this.dailyRate = dailyRate;
    }

    public void setAvailable(boolean available) {
        this.isAvailable = available;
    }

    public void setReturned(String returned) {
        this.isReturned = returned;
    }
}