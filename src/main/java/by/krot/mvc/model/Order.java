package by.krot.mvc.model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

import static javax.persistence.GenerationType.AUTO;

@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = AUTO)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;
    @Column(name = "date", nullable = false)
    private Date date;
    @Column(name = "comment", length = 1000)
    private String comment;
    @Column(name = "address")
    private String address;
    @Column(name = "phone", length = 9)
    private int phone;
    @Column(name = "total_price", nullable = false)
    private Double totalPrice;
    @ManyToMany(cascade = {CascadeType.DETACH, CascadeType.REFRESH, CascadeType.PERSIST, CascadeType.REMOVE}, fetch = FetchType.EAGER)
    @JoinTable(name = "product_orders", joinColumns = @JoinColumn(name = "order_id"),
            inverseJoinColumns = @JoinColumn(name = "product_id"))
    private List<Product> products;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    @ManyToOne
    @JoinColumn(name = "status_id")
    private OrderStatus status;

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice() {
        totalPrice = 0.0;
        for (Product product : products) {
            totalPrice += product.getPrice();
        }

    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }


}
