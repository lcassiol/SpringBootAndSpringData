package com.springboot.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.dao.MovieDAO;
import com.springboot.model.Movie;


@Service
@Transactional
public class MovieDAOService
{
	private final MovieDAO movieDAO;

	public MovieDAOService(MovieDAO movieDAO) {
		this.movieDAO = movieDAO;
	}
	
	public List<Movie> findAll(){
		List<Movie> movies = new ArrayList<>();
		for(Movie movie : movieDAO.findAll()){
			movies.add(movie);
		}
		return movies;
	}
	
	public Movie findMovie(Long id){
		return movieDAO.findOne(id);
	}
	
	public void save(Movie movie){
		movieDAO.save(movie);
	}
	
	public void delete(Long id){
		movieDAO.delete(id);
	}
}
