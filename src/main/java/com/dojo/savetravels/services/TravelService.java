package com.dojo.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.dojo.savetravels.models.Travel;
import com.dojo.savetravels.repositories.TravelRepository;

@Service
public class TravelService {
    // adding the Travel repository as a dependency
//	this is the connection to the repository
    private final TravelRepository travelRepository;
    
    public TravelService(TravelRepository travelRepository) {
        this.travelRepository = travelRepository;
    }
    // returns all matched in repo
    public List<Travel> allTravels() {
        return travelRepository.findAll();
    }
    // ---- CREATE ONE ----
    public Travel createTravel(Travel Travel) {
        return travelRepository.save(Travel);
    }
    //  ---- FIND ONE ----
    public Travel findTravel(Long id) {
        Optional<Travel> optionalTravel = travelRepository.findById(id);
        if(optionalTravel.isPresent()) {
            return optionalTravel.get();
        } else {
            return null;
        }
    }
	// ---- EDIT ONE ----
    public Travel updateTravel(Travel Travel) {
        return travelRepository.save(Travel);
    }
    
//    ---- DELETE ONE ----
    public String deleteTravel(Long id) {
    	travelRepository.deleteById(id);
    	return id + " has been deleted.";
    }

}
