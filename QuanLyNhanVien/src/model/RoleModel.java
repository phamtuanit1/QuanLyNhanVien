package model;

import java.util.Date;

public class RoleModel {
    private long id;
    private String name;
    private Date createdDate;

    
    public RoleModel() {
		super();
	}
    
	public RoleModel(long id, String name, Date createdDate) {
		super();
		this.id = id;
		this.name = name;
		this.createdDate = createdDate;
	}
	public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	
    
}
