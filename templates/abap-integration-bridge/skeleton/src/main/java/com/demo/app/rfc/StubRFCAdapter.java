package com.demo.app.rfc;

import java.time.Instant;
import java.util.Map;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Bean;

/**
 * Stub adapter active when no real RFC implementation bean is registered.
 * Echoes back the call so the bridge boots and can serve traffic in development
 * environments without an actual SAP system reachable.
 *
 * Replace by registering a JCoRFCAdapter (or HTTP-backed alternative) in your
 * application context — Spring will pick the real bean and skip this one.
 */
@Configuration
public class StubRFCAdapter {

  @Bean
  @ConditionalOnMissingBean(RFCAdapter.class)
  public RFCAdapter stubRfcAdapter() {
    return (functionModule, params) ->
        Map.of(
            "functionModule", functionModule,
            "echo", params,
            "stub", true,
            "calledAt", Instant.now().toString());
  }
}
