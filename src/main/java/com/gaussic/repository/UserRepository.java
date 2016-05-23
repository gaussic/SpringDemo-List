package com.gaussic.repository;

import com.gaussic.model.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by dzkan on 2016/5/24.
 */
public interface UserRepository extends JpaRepository<UserEntity, Integer> {

    // 由于后面要实现一个简单的查重，需要这个方法，查询指定姓和名的人的个数
    Long countByFirstNameAndLastName(String firstName, String lastName);
}
