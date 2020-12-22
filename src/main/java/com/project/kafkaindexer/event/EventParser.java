package com.project.kafkaindexer.event;

import java.util.Collections;
import java.util.Map;

@SuppressWarnings("unchecked")
public class EventParser {

    public static Event parse(Map<String, ?> message) {
        Map<String, Object> payload = (Map<String, Object>) message.get("payload");
        Event.Operation operation = parseOperation(payload);
        String indexName = (String) ((Map<String, ?>) payload.get("source")).get("table");
        Map<String, ?> data = parseFields(payload);

        System.out.println(message);
        System.out.println(payload.get("op"));

        return new Event(indexName, operation, data);
    }

    private static Event.Operation parseOperation(Map<String, ?> payload) {
        Object before = payload.get("before");
        Object after = payload.get("after");
        if (before == null) return Event.Operation.INDEX;
        else if (after == null) return Event.Operation.DELETE;
        else return Event.Operation.UPDATE;
    }

    private static Map<String, ?> parseFields(Map<String, ?> payload) {
        Object before = payload.get("before");
        Object after = payload.get("after");
        if (after != null) return (Map<String, ?>) after;
        else if (before != null) return (Map<String, ?>) before;
        else return Collections.emptyMap();
    }

}
