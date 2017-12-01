package Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Source {
	@Id
	@GeneratedValue
	private int ID;
	private String Name;
	private String Url;

	public Source() {
		// TODO Auto-generated constructor stub
	}

	public Source(int iD, String name, String url) {
		super();
		ID = iD;
		Name = name;
		Url = url;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getUrl() {
		return Url;
	}

	public void setUrl(String url) {
		Url = url;
	}

}
