package pers.corvey.exam.entity.common;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public interface IdEntity<ID extends Serializable> extends Serializable {
	
	ID getId();
	void setId(ID id);
	
	static <T extends Serializable> List<T> getCollectionIds(Iterable<? extends IdEntity<T>> entities) {
		List<T> ids = new ArrayList<>();
		if (entities != null) {
			entities.forEach(e -> ids.add(e.getId()));
		}
		return ids;
	}
}
