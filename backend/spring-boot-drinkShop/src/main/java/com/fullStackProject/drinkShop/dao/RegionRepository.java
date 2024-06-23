package com.fullStackProject.drinkShop.dao;

import com.fullStackProject.drinkShop.entity.Region;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin("http://localhost:4200")
@RepositoryRestResource(collectionResourceRel = "regions", path = "regions")
public interface RegionRepository extends JpaRepository<Region, Integer> {
}
