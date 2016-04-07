package entities;

import javax.persistence.*;
import java.util.Set;

@Entity(name="users")
@Table(name="users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;
    @Column(name = "username", length = 50, nullable = false)
    private String username;
    @Column(name = "password", length = 40, nullable = false)
    private String password;
    @Column(name = "email", length = 50, nullable = false)
    private String email;
    @Column(name = "enabled", nullable = false)
    private boolean enabled;
    @Column(name = "tabNumber", nullable = true)
    private int tabNumber;

    @OneToMany(mappedBy="user", fetch = FetchType.LAZY, cascade = {CascadeType.ALL}, orphanRemoval = true)
    private Set<Role> roles;

    public User(){}

    public User(String username, String password, String email, boolean enabled, int tabNumber){
        setUsername(username);
        setPassword(password);
        setEmail(email);
        setEnabled(enabled);
        setTabNumber(tabNumber);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public int getTabNumber() {
        return tabNumber;
    }

    public void setTabNumber(int tabNumber) {
        this.tabNumber = tabNumber;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}
