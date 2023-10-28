package com.opencart;

import com.opencart.managers.DriverManager;
import com.opencart.managers.RandomDataManager;
import com.opencart.pageobjects.HomePage;
import com.opencart.pageobjects.RegisterPage;
import org.openqa.selenium.*;

public class TestRunnerWithPageObjects {
    public static void main(String[] args) throws InterruptedException {
        WebDriver driver = DriverManager.getInstance().getDriver();

        driver.get("https://www.andreisecuqa.host/");

        HomePage homePage = new HomePage(driver);

        homePage.navigateToRegisterPageFromHeader();

        RegisterPage registerPage = new RegisterPage(driver);


        String firstName = RandomDataManager.generateFirstName();
        System.out.println(firstName);
        String lastName = RandomDataManager.generateLastName();
        System.out.println(lastName);
        String randomEmail = RandomDataManager.generateRandomEmail();
        System.out.println(randomEmail);
        String password = RandomDataManager.generatePassword();
        System.out.println(password);

        registerPage.fillInTheRegisterForm(firstName, lastName, randomEmail, password,true);
        registerPage.clickTheContinueBtn();

        DriverManager.getInstance().tearDown();

        System.out.println("The execution is over");

    }
}