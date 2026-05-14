package com.demo.app.domain;

import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ItemRepository extends JpaRepository<Item, UUID> {}
