package com.project.kafkaindexer;

import com.project.kafkaindexer.event.Event;
import org.elasticsearch.action.delete.DeleteRequest;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.update.UpdateRequest;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class MessageProcessor {

    @Autowired
    private RestHighLevelClient client;

    public void process(Event event) throws IOException {
        switch (event.getOperation()) {
            case INDEX -> index(event);
            case UPDATE -> update(event);
            case DELETE -> delete(event);
        }
    }

    private void index(Event event) throws IOException {
        String id = id(event);
        IndexRequest req = new IndexRequest(event.getIndexName()).id(id).source(event.getPayload());
        client.index(req, RequestOptions.DEFAULT);
    }

    private void update(Event event) throws IOException {
        String id = id(event);
        UpdateRequest req = new UpdateRequest(event.getIndexName(), id).upsert(event.getPayload());
        client.update(req, RequestOptions.DEFAULT);
    }

    private void delete(Event event) throws IOException {
        String id = id(event);
        DeleteRequest req = new DeleteRequest(event.getIndexName()).id(id);
        client.delete(req, RequestOptions.DEFAULT);
    }

    private String id(Event event) {
        return event.getPayload().get("id").toString();
    }

}
