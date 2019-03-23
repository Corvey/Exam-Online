package pers.corvey.exam.entity.sys;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.security.core.GrantedAuthority;

import pers.corvey.exam.entity.common.IdEntity;

@Entity
public class SysAuthority implements GrantedAuthority, IdEntity<Byte> {
	
	private static final long serialVersionUID = -59397517996869520L;
	
	private Byte id;
	private String authority;
	
	public SysAuthority() {}
	
	@Override
	public String toString() {
		return String.format("SysAuthority[id=%d, authority=%s]", id, authority);
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Override
	public Byte getId() {
		return id;
	}

	@Override
	public void setId(Byte id) {
		this.id = id;
	}
	
	@Override
	@Column(length = 20, unique = true)
	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}
}
