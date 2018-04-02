package cn.ltuz.bean;

public class User {
    private Integer id;

    private String loginName;

    private String password;

    private String phone;

    
    
    public User() {
		super();
		// TODO Auto-generated constructor stub
	}

    
	public User(Integer id, String loginName, String password, String phone) {
		super();
		this.id = id;
		this.loginName = loginName;
		this.password = password;
		this.phone = phone;
	}


	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName == null ? null : loginName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }
}