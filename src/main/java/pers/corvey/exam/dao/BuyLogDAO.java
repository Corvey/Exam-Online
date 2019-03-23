package pers.corvey.exam.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import pers.corvey.exam.entity.BuyLog;

public interface BuyLogDAO extends CrudRepository<BuyLog, Long> {

	@Query(value = "select * from buy_log where sys_user_id = ?1 and resource_id = ?2",
			nativeQuery = true)
	BuyLog findByUserIdAndResourceId(Long userId, Long resourceId);
	
}
