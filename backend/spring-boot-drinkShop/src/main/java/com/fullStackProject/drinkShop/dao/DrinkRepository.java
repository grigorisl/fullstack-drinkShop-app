package com.fullStackProject.drinkShop.dao;

import com.fullStackProject.drinkShop.entity.Drink;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin("http://localhost:4200")
@RepositoryRestResource
public interface DrinkRepository extends JpaRepository<Drink, Long> {

    Page<Drink> findByCategoryId(@Param("id") Long id, Pageable pageable);
    // SELECT * FROM Drink where category_id = ?

    Page<Drink> findByNameContaining(@Param("name") String name, Pageable pageable);
    // SELECT * FROM Drink d WHERE d.name LIKE CONCAT('%', :name, '%')
}
