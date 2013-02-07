class PagesController < ApplicationController
	#Aqui estan las paginas estaticas de la pagina
  #y el atr title es para pasarlo a las vistas y
  #lo muestre en el titulo de la pagina

  def home
		@title = "Home"
	end
	
	def contact
		@title = "Contact"
	end
	
	def about
		@title = "About us"
	end
	
	def help
		@title = "Help"
	end
end
