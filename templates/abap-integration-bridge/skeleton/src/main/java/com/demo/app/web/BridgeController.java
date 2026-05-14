package com.demo.app.web;

import com.demo.app.rfc.RFCAdapter;
import java.util.Map;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/bridge")
public class BridgeController {

  private final RFCAdapter adapter;

  public BridgeController(RFCAdapter adapter) {
    this.adapter = adapter;
  }

  @PostMapping("/{functionModule}")
  public Map<String, Object> invoke(
      @PathVariable String functionModule, @RequestBody BridgeRequest body) {
    Map<String, Object> params = body.params() == null ? Map.of() : body.params();
    return adapter.call(functionModule, params);
  }

  public record BridgeRequest(Map<String, Object> params) {}
}
