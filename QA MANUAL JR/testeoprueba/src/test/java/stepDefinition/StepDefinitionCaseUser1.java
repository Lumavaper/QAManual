package stepDefinition;

import org.openqa.selenium.WebDriver;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;



public class StepDefinitionCaseUser1 {
	
	private WebDriver drivers;

	@Given("^un formulario en la interfaz de login$")
	public void un_formulario_en_la_interfaz_de_login() throws Throwable {

	}

	@When("^el usuario diligencia el formulario: Usuario \"([^\"]*)\" Contraseña \"([^\"]*)\"$")
	public void el_usuario_diligencia_el_formulario_Usuario_Contraseña(String arg1, String arg2) throws Throwable {

	}

	@When("^hace clic en el boton \"([^\"]*)\"$")
	public void hace_clic_en_el_boton(String arg1) throws Throwable {

	}

	@Then("^el usuario se ha logueado$")
	public void el_usuario_se_ha_logueado() throws Throwable {
	}
}