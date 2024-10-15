package model;

import java.io.Serializable;

public class User implements Serializable {
    private static final long serialVersionUID = 1L; // Recommended for Serializable classes
    private int id;
    private String username;
    private String password;
    private String email;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    @Override
    public String toString() {
        return "User [id=" + id + ", username=" + username + ", email=" + email + "]";
    }

    // Optional constructor
    public User(int id, String username, String password, String email) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
    }

    // Default constructor
    public User() {
        // Default constructor
    }
}
