package com.aurora;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
class HealthCheckTest {
    @Autowired
    private HealthService healthService;

    @Test
    void contextLoads() {}

    @Test
    void healthServiceReturnsUp() {
        assertThat(healthService.status()).isEqualTo("UP");
    }
}
