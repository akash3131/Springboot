package com.nagarro.services;

import java.util.List;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.nagarro.model.Book;

public class BookService {

	private final static String BOOK = "/books";
	private final static String BOOK_AND_ID = "/books/{id}";
	private final static String SERVER_URI = "http://localhost:8080";
	private final static RestTemplate restTemplate = new RestTemplate();

	// Method to get all the employees
	public static List<Book> getAllBooks() {
		ResponseEntity<List<Book>> bookResponse = restTemplate.exchange(SERVER_URI + BOOK, HttpMethod.GET, null,
				new ParameterizedTypeReference<List<Book>>() {
				});
		List<Book> books =	bookResponse.getBody();
		return books;
	}

	public static Book getBook(int book_code) {
		Book emp = restTemplate.getForObject(SERVER_URI + "/bookById/{id}", Book.class, book_code);
		return emp;
	}

	public static void addBook(Book book) {
		restTemplate.postForObject(SERVER_URI + "addBook", book, Book.class);
	}

	public static void updateBook(Book book) {
		String Url = SERVER_URI +"/"+ "updateBook";
		HttpHeaders headers = new HttpHeaders();
		headers.set("X-COM-PERSIST", "true");
		HttpEntity<Book> requestUpdate = new HttpEntity<Book>(book, headers);
		restTemplate.exchange(Url, HttpMethod.PUT, requestUpdate, Void.class);
	}

	public static void deleteBook(int bookCode) {
		restTemplate.delete(SERVER_URI +"/delete/{id}", bookCode);
	}
}
