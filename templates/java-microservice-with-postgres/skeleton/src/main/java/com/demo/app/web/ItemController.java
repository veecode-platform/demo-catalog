package com.demo.app.web;

import com.demo.app.domain.Item;
import com.demo.app.domain.ItemRepository;
import java.time.Instant;
import java.util.List;
import java.util.UUID;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/items")
public class ItemController {

  private final ItemRepository repository;

  public ItemController(ItemRepository repository) {
    this.repository = repository;
  }

  @GetMapping
  public List<Item> list() {
    return repository.findAll();
  }

  @PostMapping
  public ResponseEntity<Item> create(@RequestBody CreateItemRequest body) {
    Item saved = repository.save(new Item(UUID.randomUUID(), body.name(), Instant.now()));
    return ResponseEntity.status(201).body(saved);
  }

  public record CreateItemRequest(String name) {}
}
