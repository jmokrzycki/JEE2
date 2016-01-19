package com.example.shdemo.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;

@Entity
@NamedQueries({
		@NamedQuery(name = "film.notHavingRezyser", query = "Select c from Film c where c.haveRezyser = false"),
		@NamedQuery(name = "film.byTytul", query = "Select p from Film p where p.tytul = :tytul"),
		@NamedQuery(name = "film.all", query = "Select p from Film p")
})
public class Film {

	private Long id;
	private Rezyser rezyser;
	private String tytul;
	private String gatunek;
	private Boolean haveRezyser = false;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setRezyser(Rezyser rezyser) { this.rezyser = rezyser; }

	@ManyToOne
	@JoinColumn(name = "id_rezyser", nullable = false)
	public Rezyser getRezyser() {
	return rezyser;
	}

	public String getTytul() {
		return tytul;
	}

	public void setTytul(String make) {
		this.tytul = make;
	}

	public String getGatunek() {
		return gatunek;
	}

	public void setGatunek(String model) {
		this.gatunek = model;
	}

	public Boolean getHaveRezyser() {
		return haveRezyser;
	}

	public void setHaveRezyser(Boolean haveRezyser) {
		this.haveRezyser = haveRezyser;
	}
}
