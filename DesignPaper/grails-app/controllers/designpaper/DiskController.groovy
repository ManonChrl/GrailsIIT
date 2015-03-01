package designpaper

import java.text.SimpleDateFormat


class DiskController {

    def scaffold = true
	
	def showDisks ={ ->
		List<Disk> disksList = Disk.findAll()
		render(view:"index",model:[disksList:disksList])
	}
	
	def edit ={ ->
		String message = "You want to edit the item with barcode $params.barcode"
		int barcode = Integer.parseInt(params.barcode)
		Disk disk = Disk.findByBarcode(barcode)
		render(view:"edit",model:[message:message,disk:disk])
	}
	
	def doEdit ={ ->
		String librarySection = params.librarySection
		int barcode = Integer.parseInt(params.barcode)
		boolean loanAvailable
		if(params.loanAvailable=='false')
			loanAvailable = false
		else
			loanAvailable = true
			
		Disk disk = Disk.findByBarcode(barcode)
		disk.librarySection=librarySection
		disk.loanAvailable=loanAvailable
		disk.save(flush:true)
		
		List<Disk> disksList = Disk.findAll()
		render(view:"index",model:[disksList:disksList])
		
	}
	
	def add ={ ->
		render(view:"add")
	}
	
	def doAdd ={ ->
		String message = ""
		String title = params.title
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
			Disk disk = new Disk (title:title,publicationDate:publicationDate,librarySection:librarySection,barcode:barcode,loanAvailable:loanAvailable,type:"Disk")
			disk.save(flush:true)
		}
			
		
		List<Disk> disksList = Disk.findAll()
		render(view:"index",model:[disksList:disksList,message:message])
		
	}
}
