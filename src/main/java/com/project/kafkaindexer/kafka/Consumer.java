package com.project.kafkaindexer.kafka;

import com.project.kafkaindexer.MessageProcessor;
import com.project.kafkaindexer.event.Event;
import com.project.kafkaindexer.event.EventParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Map;

@Service
public class Consumer {

    @Autowired
    private MessageProcessor processor;

    @KafkaListener(topics = {"dbserver1.public.accounts", "dbserver1.public.clients", "dbserver1.public.transactions"})
    public void consume(@Payload(required = false) Map<String, ?> message) throws IOException {
        if (message == null) {
            System.out.println("message is null");
            return;
        }
        Event event = EventParser.parse(message);
        processor.process(event);
    }
}