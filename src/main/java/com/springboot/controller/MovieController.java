package com.springboot.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.model.Movie;
import com.springboot.service.MovieDAOService;


@Controller
public class MovieController
{

	@Autowired
	private MovieDAOService movieDAOService;
	
	@GetMapping("/")
	public String home(HttpServletRequest request){
		request.setAttribute("mode", "MODE_HOME");
		return "index";
	}
	
	@GetMapping("/all-movies")
	public String allMovies(HttpServletRequest request){
		request.setAttribute("movies", movieDAOService.findAll());
		request.setAttribute("mode", "MODE_MOVIES");
		return "index";
	}
	
	@GetMapping("/new-movie")
	public String newMovie(HttpServletRequest request){
		request.setAttribute("mode", "MODE_NEW");
		return "index";
	}
	
	@PostMapping("/save-movie")
	public String saveMovie(@ModelAttribute Movie movie, BindingResult bindingResult, HttpServletRequest request){
		movieDAOService.save(movie);
		request.setAttribute("movies", movieDAOService.findAll());
		request.setAttribute("mode", "MODE_MOVIES");
		return "index";
	}
	
	@GetMapping("/update-movie")
	public String updateMovie(@RequestParam Long id, HttpServletRequest request){
		request.setAttribute("movie", movieDAOService.findMovie(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "index";
	}
	
	@GetMapping("/delete-movie")
	public String deleteMovie(@RequestParam Long id, HttpServletRequest request){
		movieDAOService.delete(id);
		request.setAttribute("movies", movieDAOService.findAll());
		request.setAttribute("mode", "MODE_MOVIES");
		return "index";
	}
}
