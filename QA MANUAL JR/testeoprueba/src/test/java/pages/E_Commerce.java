package pages;

import static org.junit.Assert.assertTrue;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import util.Page_Base;

public class E_Commerce extends Page_Base {

	public void givenUnFormularioEnLaInterfazDeLogin() {
		System.setProperty("webdriver.chrome.driver",
				"C:\\Users\\falco\\eclipse-workspace\\testeoprueba\\src\\test\\resources\\browser\\chromedriver.exe");
		driver = new ChromeDriver();
		driver.get("https://www.saucedemo.com/");
	}

	public void whenElUsuarioDiligenciaElFormulario(String username, String password) {
		WebElement usernameInput = driver.findElement(By.id("username"));
		WebElement passwordInput = driver.findElement(By.id("password"));

		// Ingresa los datos en el formulario
		usernameInput.sendKeys(username);
		passwordInput.sendKeys(password);
	}

	public void whenHaceClicEnElBoton(String buttonName) {
		WebElement loginButton = driver.findElement(By.id("Login"));
		loginButton.click();
	}

	public void thenElUsuarioSeHaLogueado() {
		// Agrega aserciones para verificar que el usuario se ha logueado correctamente
		WebElement loggedInMessage = driver.findElement(By.id("loggedInMessage"));
		assertTrue(loggedInMessage.isDisplayed());

	}
}
