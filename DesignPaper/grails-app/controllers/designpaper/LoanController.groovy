package designpaper

class LoanController {

    def scaffold = true
	
	def showLoanedItems ={ ->
		List<Loan> loanedItems = Loan.findAll("from Loan as l where l.user=:user",[user:session.user])
		render(view:"index",model:[loanedItems:loanedItems])
	}
}
