package by.krot.mvc.model;


import javax.persistence.*;

import java.util.Arrays;
import java.util.Objects;
import java.util.Set;

import static javax.persistence.GenerationType.AUTO;

@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = AUTO)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;
    @Lob
    @Column(name = "picture")
    @Basic(fetch = FetchType.LAZY)
    private byte[] picture;
    @Column(name = "model", unique = true, nullable = false)
    private String model;
    @Column(name = "price", nullable = false)
    private Double price;
    @Column(name = "description", nullable = false)
    private String description;
    @ManyToOne
    @JoinColumn(name = "category_id", nullable = false)
    private Category category;
    @ManyToOne
    @JoinColumn(name = "status_id")
    private ProductStatus status;
    @ManyToOne
    @JoinColumn(name = "producer_id", nullable = false)
    private Producer producer;
    @ManyToMany(mappedBy = "products")
    private Set<Order> orders;

    public ProductStatus getStatus() {
        return status;
    }

    public void setStatus(ProductStatus status) {
        this.status = status;
    }

    public Set<Order> getOrders() {
        return orders;
    }

    public byte[] getPicture() {
        return picture;
    }

    public void setPicture(byte[] picture) {
        this.picture = picture;
    }

    public void setOrders(Set<Order> orders) {
        this.orders = orders;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Producer getProducer() {
        return producer;
    }

    public void setProducer(Producer producer) {
        this.producer = producer;
    }


    @Override
    public String toString() {
        return "Product{" +
                ", picture=" + Arrays.toString(picture) +
                ", model='" + model + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                '}';
    }
}
