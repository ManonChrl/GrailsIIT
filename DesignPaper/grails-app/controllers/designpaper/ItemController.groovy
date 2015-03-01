package designpaper

class ItemController {

    def scaffold = true
	
	def index ={ ->
		render(view:"scanBarcodes")
	}
	
	def librarySections ={ ->
		render(view:"librarySections")
	}
	
	def itemLoaned ={ ->
		
		String login = params.login
		int barcode;
		String message =""
		Date date = new Date()
		
		if(params.barcode)
			barcode = Integer.parseInt(params.barcode)
		
		Item itemToLoan = Item.findByBarcode(barcode)
		User user = User.findByLogin(login)
		
		if(itemToLoan){
			if(user?.role=='user'){
				if(itemToLoan.loanAvailable){
					Loan loan = new Loan(dueDate:date+10,loanDate:date,user:user,item:itemToLoan)
					loan.save(flush:true)
					itemToLoan.loanAvailable=false
					itemToLoan.save(flush:true)
					message = "User $user has loaned the item : $itemToLoan"
				}else{
					message = "Item $itemToLoan not available to loan"
				}
			}else{
				message = "Unknown user login"
			}
		}else{
			if(user){
				message = "Unknown barcode"
			}else{
				message = "Unknown barcode and user login"
			}
		}
		render(view:"scanBarcodes",model:[message:message])
	}
	
	def search ={ ->
		List<Item> itemList = new ArrayList()
		if(Item.findAll("from Item as i where i.librarySection=:librarySection",[librarySection:params.query])){
			itemList =Item.findAll("from Item as i where i.librarySection=:librarySection",[librarySection:params.query])
			render(view:"librarySections",model:[itemList:itemList])
		}else{
		String message = "No library sections found"
		render(view:"librarySections",model:[itemList:itemList,message:message])
		}
	}
}
