package com.nagarro.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nagarro.model.Book;
import com.nagarro.services.*;

@Controller
public class BookController {
	
	@RequestMapping("/")
	public String login() {
		return "login";
	}
	

	@RequestMapping("/validate")
	public String validate(@RequestParam("email") String email,@RequestParam("password") String pass,HttpSession session) {
		session.setAttribute("user", email);
		session.setAttribute("password", pass);
		UserService auth = new UserService();
		if(auth.authenticate(email,pass)) {
			return "forward:/afterlogin";
		}
		
		return "redirect:/";  
		
		
		
	}
	
	@RequestMapping("/addBookPage")
	public String addBookPage() {
		return "add-book";
	}
	
	@RequestMapping("/editBookPage/{id}")
	public String editBookPage(@PathVariable int id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("code", id);
		return "add-book";
	}

	@RequestMapping("/afterlogin")
	public String allEmp(Model model, HttpSession session,@RequestParam("email") String username,HttpServletRequest req) {
		
		session = req.getSession();
		session.setAttribute("user", username);
		
		List<Book> list = BookService.getAllBooks();
		model.addAttribute("bookList", list);
		model.addAttribute("user", username);
		return "bookdetails";
		}
	
	@RequestMapping("/backToWelcome")
	public String backToWelcome() {
		return "bookdetails";
	}

	@RequestMapping(path = "/addbook", method = RequestMethod.POST)
	public String handleForm(@RequestParam("bookCode") int id, @RequestParam("bookName") String bookName,@RequestParam("bookAuthor") String bookAuthor, HttpSession session,Model model) {
		
		Book existingBook = null;
		existingBook = BookService.getBook(id);
		if(existingBook!=null) {
			model.addAttribute("bookCodeError", "Book already exist with this bookCode");
			return "add-book";
		}
		
		
		Book book  = new Book();
		book.setBookAuthor(bookAuthor);
		book.setBookName(bookName);
		book.setId(id);
		
		BookService.addBook(book);
		
		List<Book> list = BookService.getAllBooks();
		model.addAttribute("bookList", list);
		return "bookdetails";
		
		
	}

	@RequestMapping("/editBook/{id}")
	public ModelAndView editBook(@PathVariable int id, Book booklist,Model model, HttpSession session) {
		
		Book book = BookService.getBook(id);
		System.out.println("line 60");
		ModelAndView mv = new ModelAndView();
		mv.addObject("book", book);
		mv.setViewName("bookedit");
		
		return mv;
		
		
	}

	@RequestMapping(path = "/afteredit", method = RequestMethod.POST)
	public String editHandleForm(@RequestParam("bookCode") int id, @RequestParam("bookName") String bookName,@RequestParam("bookAuthor") String bookAuthor,Model model, HttpSession session) {
		Book book  = new Book();
		book.setBookAuthor(bookAuthor);
		book.setBookName(bookName);
		book.setId(id);
		
		BookService.updateBook(book);
		
		List<Book> list = BookService.getAllBooks();
		model.addAttribute("bookList", list);
		return "bookdetails";
		
	}
	
	@RequestMapping(path = "/delete/{id}", method=RequestMethod.POST)
	public String delete(@PathVariable int id,Model model) {
		System.out.println("coming here....");
		ModelAndView mv = new ModelAndView();
		BookService.deleteBook(id);
		List<Book> list = BookService.getAllBooks();
		model.addAttribute("bookList", list);
		mv.setViewName("bookdetails");
		
		model.addAttribute("email", "user");
		
		return "redirect:/afterlogin";
		

	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest Request,HttpServletRequest Response) {
		HttpSession session = Request.getSession();
		session.removeAttribute("user");
		session.invalidate();
		return "login";
	}
	
}
