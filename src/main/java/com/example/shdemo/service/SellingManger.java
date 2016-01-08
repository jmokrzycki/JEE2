package com.example.shdemo.service;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.example.shdemo.domain.Film;
import com.example.shdemo.domain.Rezyser;

@Stateless
public class SellingManger {

	@PersistenceContext
	EntityManager em;

	
	public void addRezyser(Rezyser rezyser) {
		rezyser.setId(null);
		em.persist(rezyser);
	}
	
	public void deleteRezyser(Rezyser rezyser) {
		rezyser = (Rezyser) em.find(Rezyser.class,
				rezyser.getId());
		
		for (Film film : rezyser.getFilms()) {
			film.setHaveRezyser(false);
			em.merge(film);
		}
		em.remove(rezyser);
	}

	public List<Film> getOwnedFilms(Rezyser rezyser) {
		rezyser = (Rezyser) em.find(Rezyser.class,
				rezyser.getId());
		List<Film> films = new ArrayList<Film>(rezyser.getFilms());
		return films;
	}

	@SuppressWarnings("unchecked")
	public List<Rezyser> getAllRezyzser() {
		return em.createNamedQuery("person.all")
				.getResultList();
	}

	public void addFilm(Film film) {
		film.setId(null);
		em.persist(film);
	}

	public void assignRezyserToFilm(Long rezyserId, Long filmId) {
		Rezyser rezyser = (Rezyser) em.find(
				Rezyser.class, rezyserId);
		Film film = (Film) em.find(Film.class, filmId);
		film.setHaveRezyser(true);
		rezyser.getFilms().add(film);
	}

	public List<Film> getAvailableFilm() {
		return em.createNamedQuery("film.notHavingRezyser").getResultList();
	}

	public void disposeFilm(Rezyser rezyser, Film film) {

		rezyser = (Rezyser) em.find(Rezyser.class,
				rezyser.getId());
		film = (Film) em.find(Film.class,
				film.getId());

		Film toRemove = null;
		// lazy loading here (rezyser.getCars)
		for (Film aFilm : rezyser.getFilms())
			if (aFilm.getId().compareTo(film.getId()) == 0) {
				toRemove = aFilm;
				break;
			}

		if (toRemove != null)
			rezyser.getFilms().remove(toRemove);

		film.setHaveRezyser(false);
	}

	public Rezyser findRezyserById(Long id) {
		return (Rezyser) em.find(Rezyser.class, id);
	}

	public List<Film> getAllFilm(){
		return em.createNamedQuery("film.all").getResultList();
	}

	public Film findFilmById(Long id){
		return (Film) em.find(Film.class, id);
	}

	public void updateFilm(Film film){
		em.merge(film);
	}

	public void updateRezyser(Rezyser rezyser){
		em.merge(rezyser);
	}

	public void deleteFilm(Film film) {
		em.remove(film);
	}

	public List<Rezyser> searchTwoElementName()	{
		List<Rezyser> rezyserzy = getAllRezyzser();
		String pattern1 = "\\w+-\\w+";
		Pattern r = Pattern.compile(pattern1);

		List<Rezyser> rezyserzyWynik = new ArrayList<Rezyser>();

		for(Rezyser rezyser : rezyserzy){
			Matcher m = r.matcher(rezyser.getPin());
			if (m.find( )) {
				rezyserzyWynik.add(rezyser);
			}
		}


		return rezyserzyWynik;
	}

	public void deleteAllFilm(){
		List<Film> filmy = getAllFilm();
		for (Film f : filmy){
			deleteFilm(f);
		}
	}

	public void deleteAllRezyser(){
		List<Rezyser> rezyserzy = getAllRezyzser();
		for (Rezyser r : rezyserzy){
			deleteRezyser(r);
		}
	}
}
