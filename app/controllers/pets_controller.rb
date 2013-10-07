class PetsController < ApplicationController

  def new  
	@pet = Pet.new  
  end
  
  def create  
	@pet = Pet.new(params[:pet])  
	if @pet.save  
		redirect_to pets_path  
	else  
		render 'new'  
	end  
  end
  
  def index  
	@pets = Pet.all  
  end

  def show 
	@pet = Pet.find(params[:id]) 
  end
  
  def edit    
	@pet = Pet.find(params[:id])  
  end
	
  def update    
	@pet = Pet.find(params[:id])    
	if @pet.update_attributes(params[:pet])      
		redirect_to pet_path(@pet.id)    
	else      
		render 'edit'    
	end  
  end
  
  def destroy    
	@pet = Pet.find(params[:id])    
	@pet.destroy    
	redirect_to pets_path  
  end
end
