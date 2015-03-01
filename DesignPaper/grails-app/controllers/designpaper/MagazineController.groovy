package designpaper

import java.text.SimpleDateFormat



class MagazineController {

    def scaffold = true
	
	def showMagazines ={ ->
		List<Magazine> magazinesList = Magazine.findAll()
		render(view:"index",model:[magazinesList:magazinesList])
	}
	
	def edit ={ ->
		String message = "You want to edit the item with barcode $params.barcode"
		int barcode = Integer.parseInt(params.barcode)
		Magazine mag = Magazine.findByBarcode(barcode)
		render(view:"edit",model:[message:message,mag:mag])
	}
	
	def doEdit ={ ->
		String librarySection = params.librarySection
		int barcode = Integer.parseInt(params.barcode)
		boolean loanAvailable
		if(params.loanAvailable=='false')
			loanAvailable = false
		else
			loanAvailable = true
		
		Magazine mag = Magazine.findByBarcode(barcode)
		mag.librarySection=librarySection
		mag.loanAvailable=loanAvailable
		mag.save(flush:true)
		
		List<Magazine> magazinesList = Magazine.findAll()
		render(view:"index",model:[magazinesList:magazinesList])
		
	}
	
	def add ={ ->
		render(view:"add")
	}
	
	def doAdd ={ ->
		String message = ""
		String name = params.name
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date publicationDate = sdf.parse(params.publicationDate);
		String librarySection = params.librarySection
		int barcode = Integer.parseInt(params.barcode)
		boolean loanAvailable
		
		if(params.loanAvailable=='false')
			loanAvailable = false
		else
			loanAvailable = true

		if(Item.findByBarcode(barcode)){
			message = "barcode already existed"
		}else{
			Magazine mag = new Magazine (name:name,publicationDate:publicationDate,librarySection:librarySection,barcode:barcode,loanAvailable:loanAvailable,type:"Magazine")
			mag.save(flush:true)
		}
			
		
		List<Magazine> magazinesList = Magazine.findAll()
		render(view:"index",model:[magazinesList:magazinesList,message:message])
		
	}
}
