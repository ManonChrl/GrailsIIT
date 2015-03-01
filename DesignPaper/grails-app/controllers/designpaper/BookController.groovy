package designpaper


class BookController {

    def scaffold = true
	
	def showBooks ={ ->
		List<Book> booksList = Book.findAll()
		render(view:"index",model:[booksList:booksList])
	}
	
	def edit ={ ->
		String message = "You want to edit the item with barcode $params.barcode"
		int barcode = Integer.parseInt(params.barcode)
		Book book = Book.findByBarcode(barcode)
		render(view:"edit",model:[message:message,book:book])
	}
	
	def doEdit ={ ->
		String librarySection = params.librarySection
		int barcode = Integer.parseInt(params.barcode)
		boolean loanAvailable
		if(params.loanAvailable=='false')
			loanAvailable = false
		else
			loanAvailable = true
			
		Book book = Book.findByBarcode(barcode)
		book.librarySection=librarySection
		book.loanAvailable=loanAvailable
		book.save(flush:true)
		
		List<Book> booksList = Book.findAll()
		render(view:"index",model:[booksList:booksList])
		
	}
	
	def add ={ ->
		render(view:"add")
	}
	
	def doAdd ={ ->
		String message = ""
		String title = params.title
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
			Author author = new Author(firstName:params.authorFirstName,lastName:params.authorLastName)
			author.save(flush:true)
			Book book = new Book (title:title,author:author,librarySection:librarySection,barcode:barcode,loanAvailable:loanAvailable,type:"Book")
			book.save(flush:true)
		}
			
		
		List<Book> booksList = Book.findAll()
		render(view:"index",model:[booksList:booksList,message:message])
		
	}
}
