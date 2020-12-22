package com.project.kafkaindexer;

import com.project.kafkaindexer.es.ElasticSearchConfig;
import com.project.kafkaindexer.kafka.KafkaConsumerConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;

@SpringBootApplication
@Import({KafkaConsumerConfig.class, ElasticSearchConfig.class})
public class KafkaIndexerApplication {

    public static void main(String[] args) {
        SpringApplication.run(KafkaIndexerApplication.class, args);
    }

}
