package br.com.casadocodigo.loja.controllers;

import javax.persistence.NoResultException;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionHandlerController {

	@ExceptionHandler(NoResultException.class)
	public ModelAndView trataDetalhaNaoEncontrado(Exception exception) {
		ModelAndView modelAndView = new ModelAndView("error");
		modelAndView.addObject("exception", exception);

		return modelAndView;
	}
}
