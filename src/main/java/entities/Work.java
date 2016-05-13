package entities;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;

@Entity(name = "work")
@Table(name = "work")
public class Work {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "busId", nullable = false)
    private int busId;
    @Column(name = "graphId", nullable = false, unique = true)
    private int graphId;

    public Work(){}

    @JsonIgnore
    @OneToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="graphId", unique = true, insertable = false, updatable = false)
    public Graph graph;

    @OnDelete(action = OnDeleteAction.CASCADE)
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="busId", insertable = false, updatable = false)
    private Bus bus;

    public Work(int busId, int graphId){
        this.setBusId(busId);
        this.setGraphId(graphId);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBusId() {
        return busId;
    }

    public void setBusId(int busId) {
        this.busId = busId;
    }

    public int getGraphId() {
        return graphId;
    }

    public void setGraphId(int graphId) {
        this.graphId = graphId;
    }

    public Bus getBus() {
        return bus;
    }

    public void setBus(Bus bus) {
        this.bus = bus;
    }
}
