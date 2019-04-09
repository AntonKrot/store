package by.krot.mvc.service;

import by.krot.mvc.model.Status;

import java.util.List;

public interface StatusService {
    List<Status> findAllStatus();

    Status findStatusById(Long id);
}
