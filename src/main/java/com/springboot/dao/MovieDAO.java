package com.springboot.dao;

import java.io.Serializable;

import org.springframework.data.repository.CrudRepository;

import com.springboot.model.Movie;

public interface MovieDAO extends CrudRepository<Movie, Long>
{

}
