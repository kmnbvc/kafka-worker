package com.project.kafkaindexer.event;

import java.util.Collections;
import java.util.Map;

public class Event {

    public enum Operation {
        INDEX,UPDATE,DELETE
    }

    private String indexName;
    private Operation operation;
    private Map<String, ?> payload = Collections.emptyMap();

    public Event(String indexName, Operation operation) {
        this.indexName = indexName;
        this.operation = operation;
    }

    public Event(String indexName, Operation operation, Map<String, ?> payload) {
        this.indexName = indexName;
        this.operation = operation;
        this.payload = payload;
    }

    public String getIndexName() {
        return indexName;
    }

    public void setIndexName(String indexName) {
        this.indexName = indexName;
    }

    public Operation getOperation() {
        return operation;
    }

    public void setOperation(Operation operation) {
        this.operation = operation;
    }

    public Map<String, ?> getPayload() {
        return payload;
    }

    public void setPayload(Map<String, ?> payload) {
        this.payload = payload;
    }
}
