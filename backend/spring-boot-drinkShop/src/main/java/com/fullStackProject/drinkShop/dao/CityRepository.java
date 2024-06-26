package com.fullStackProject.drinkShop.dao;

import com.fullStackProject.drinkShop.entity.City;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.List;

@CrossOrigin("http://localhost:4200")
@RepositoryRestResource
public interface CityRepository extends JpaRepository<City, Integer> {

    List<City> findByRegionId(@Param("id") Integer id);
    // http://localhost:8080/api/cities/search/findByRegionId?id=?
}
