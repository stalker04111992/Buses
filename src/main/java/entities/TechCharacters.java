package entities;

import javax.persistence.*;
import java.util.Set;

//@Entity(name = "techCharacters")
//@Table(name = "techCharacters")
public class TechCharacters {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    //марка автобуса
    @Column(name = "mark", length = 20, nullable = false)
    private String mark;
    //модель автобуса
    @Column(name = "model", length = 30, nullable = false)
    private String model;
    //назначение автобуса
    @Column(name = "type", length = 20, nullable = false)
    private String type;
    //длина
    @Column(name = "length", nullable = false)
    private int length;
    //ширина
    @Column(name = "width", nullable = false)
    private int width;
    //высота
    @Column(name = "heigth", nullable = false)
    private int heigth;
    //масса
    @Column(name = "weight", nullable = false)
    private double weight;
    //количество посадочных мест
    @Column(name = "seating", nullable = false)
    private int seating;
    //двигатель
    @Column(name = "engine", length = 30, nullable = false)
    private String engine;
    //тип двигателя
    @Column(name = "engineType", length = 20, nullable = false)
    private String engineType;
    //объем двигателя
    @Column(name = "engineCapacity", nullable = false)
    private int engineCapacity;
    //мощность двигателя
    @Column(name = "power", nullable = false)
    private int power;
    //тип топлива
    @Column(name = "fuelType", length = 20, nullable = false)
    private String fuelType;
    //расход топлива
    @Column(name = "fuelCons", nullable = false)
    private double fuelCons;
    //экологический стандарт
    @Column(name = "ecoStandart", length = 10, nullable = false)
    private String ecoStandart;
    //категория водителя
    @Column(name = "driverCategory", length = 2, nullable = false)
    private String driverCategory;




    @OneToMany(mappedBy="techCharacters")
    private Set<Bus> buses;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getHeigth() {
        return heigth;
    }

    public void setHeigth(int heigth) {
        this.heigth = heigth;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public int getSeating() {
        return seating;
    }

    public void setSeating(int seating) {
        this.seating = seating;
    }

    public String getEngine() {
        return engine;
    }

    public void setEngine(String engine) {
        this.engine = engine;
    }

    public String getEngineType() {
        return engineType;
    }

    public void setEngineType(String engineType) {
        this.engineType = engineType;
    }

    public int getEngineCapacity() {
        return engineCapacity;
    }

    public void setEngineCapacity(int engineCapacity) {
        this.engineCapacity = engineCapacity;
    }

    public int getPower() {
        return power;
    }

    public void setPower(int power) {
        this.power = power;
    }

    public String getFuelType() {
        return fuelType;
    }

    public void setFuelType(String fuelType) {
        this.fuelType = fuelType;
    }

    public double getFuelCons() {
        return fuelCons;
    }

    public void setFuelCons(double fuelCons) {
        this.fuelCons = fuelCons;
    }

    public String getEcoStandart() {
        return ecoStandart;
    }

    public void setEcoStandart(String ecoStandart) {
        this.ecoStandart = ecoStandart;
    }

    public String getDriverCategory() {
        return driverCategory;
    }

    public void setDriverCategory(String driverCategory) {
        this.driverCategory = driverCategory;
    }
}
