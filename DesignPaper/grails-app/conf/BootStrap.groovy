import designpaper.Author
import designpaper.Book
import designpaper.Disk
import designpaper.Loan
import designpaper.Magazine
import designpaper.User

class BootStrap {

    def init = { servletContext ->
		
		def password = "mchancer"
		byte[] passwordHash = password.encodeAsSHA1Bytes()
		def aSampleUser = new User (login:"mchancer",password:""+passwordHash+"",firstName:"Manon",lastName:"Chancereul",role:"user")
		aSampleUser.save(flush:true)
		def password1 = "mhuger"
		byte[] passwordHash1 = password1.encodeAsSHA1Bytes()
		def aSampleUser1 = new User (login:"mhuger",password:""+passwordHash1+"",firstName:"Matthieu",lastName:"Huger",role:"deskOperator")
		aSampleUser1.save(flush:true)
		def password2 = "rsavoure"
		byte[] passwordHash2 = password2.encodeAsSHA1Bytes()
		def aSampleUser2 = new User (login:"rsavoure",password:""+passwordHash2+"",firstName:"Romain",lastName:"Savoure",role:"manager")
		aSampleUser2.save(flush:true)
		
		def aSampleAuthor = new Author(firstName:"Guillaume",lastName:"Musso")
		aSampleAuthor.save(flush:true)
		
		def aSampleBook = new Book (title:"Central Park",author:aSampleAuthor,librarySection:"A7FH38F",barcode:23982983,loanAvailable:true,type:"Book")
		aSampleBook.save(flush:true)
		def date = new GregorianCalendar(2014,12,1).getTime()
		def dueDate = new GregorianCalendar(2014,12,11).getTime()
		
		def aSampleDisk = new Disk(title:"HungerGames",publicationDate:date,librarySection:"A7FH38F",barcode:3448723,loanAvailable:true,type:"Disk")
		aSampleDisk.save(flush:true)
		
		def aSampleMagazine = new Magazine(name:"Public",publicationDate:date,librarySection:"AHG47H38F",barcode:23487284,loanAvailable:true,type:"Magazine")
		aSampleMagazine.save(flush:true)
		
		def aSampleLoan = new Loan(dueDate:dueDate,loanDate:date,user:aSampleUser,item:aSampleBook)
		aSampleLoan.save(flush:true)
		aSampleBook.loanAvailable=false
		
		def dueDate1 = new GregorianCalendar(2014,12,14).getTime()
		def aSampleLoan1 = new Loan(dueDate:dueDate1,loanDate:date,user:aSampleUser,item:aSampleDisk)
		aSampleLoan1.save(flush:true)
		aSampleDisk.loanAvailable=false
		
    }
	
	
    def destroy = {
    }
}
