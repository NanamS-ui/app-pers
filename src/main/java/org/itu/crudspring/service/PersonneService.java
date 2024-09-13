package org.itu.crudspring.service;

import org.itu.crudspring.model.Personne;
import org.itu.crudspring.repository.PersonneRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PersonneService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private PersonneRepository personneRepository;

    public List<Personne> findAll() {
        return personneRepository.findAll();
    }

    public Optional<Personne> findById(String id) {
        return personneRepository.findById(id);
    }

    public String generateIdFromDatabase() {
        return jdbcTemplate.queryForObject("SELECT generate_personne_id()", String.class);
    }

    public Personne savePersonne(Personne personne) {
        if (personne.getId() == null || personne.getId().isEmpty()) {
            personne.setId(generateIdFromDatabase());
        }
        return personneRepository.save(personne);
    }

    public void deleteById(String id) {
        personneRepository.deleteById(id);
    }
}
