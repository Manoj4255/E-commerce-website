package model;

public class Order {
    private int id;
    private int userId;
    private double total;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }
}
