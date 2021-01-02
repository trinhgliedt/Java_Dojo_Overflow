package com.tgliedt.dojooverflow.servives;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.tgliedt.dojooverflow.models.Tag;
import com.tgliedt.dojooverflow.repositories.TagRepository;

@Service
public class TagService {

	private final TagRepository repo;
	
	public TagService(TagRepository repo) {
		this.repo = repo;
	}
	
	public List<Tag> findAll(){
		return repo.findAll();
	}
	
	public void create(Tag tag) {
		repo.save(tag);
	}
	
	public void update(Tag tag) {
		repo.save(tag);
	}
	
	public Tag findBySubject(String subject) {
		subject = subject.trim().toLowerCase();
		Optional<Tag> t = repo.findBySubject(subject);
		if(t.isPresent()) {
			System.out.println("Found: " + subject.toLowerCase());
			return t.get();
		}else {
			System.out.println("Did not find: " + subject.toLowerCase());
			return null;
		}
				
	}
}