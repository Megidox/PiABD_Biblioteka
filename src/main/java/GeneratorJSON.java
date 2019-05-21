import com.github.javafaker.Faker;
import org.json.JSONArray;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class GeneratorJSON {

    private static final Faker FAKER = new Faker(new Locale("pl"));
    private static final java.text.SimpleDateFormat SIMPLE_DATE_FORMAT = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public static void main(String[] args) throws IOException {
        createCategories();
        createPublishers();
        createPersons();
        createAddresses();
        createAuthors();
        createBooks();
        createOpinions();
        createEmployees();
        createBorrows();
        createBookAuthorRelation();
        createBookCategoryRelation();
    }

    private static void createBookCategoryRelation() throws IOException {
        JSONArray array = new JSONArray();
        int i = 0;
        while (i < 2000) {
            Map<String, String> publisherMap = new HashMap<String, String>();
            publisherMap.put("BOOK_ID", String.valueOf(FAKER.number().numberBetween(0, 1000)));
            publisherMap.put("CATEGORY_ID", String.valueOf(FAKER.number().numberBetween(0, 25)));

            array.put(publisherMap);
            i++;
        }
        writeContentToJsonFile("BookCategoryRelation", array.toString());
    }

    private static void createBookAuthorRelation() throws IOException {
        JSONArray array = new JSONArray();
        int i = 0;
        while (i < 2000) {
            Map<String, String> publisherMap = new HashMap<String, String>();
            publisherMap.put("BOOK_ID", String.valueOf(FAKER.number().numberBetween(0, 1000)));
            publisherMap.put("AUTHOR_ID", String.valueOf(FAKER.number().numberBetween(0, 100)));

            array.put(publisherMap);
            i++;
        }
        writeContentToJsonFile("BookAuthorRelation", array.toString());
    }

    private static void createBorrows() throws IOException {
        JSONArray array = new JSONArray();
        int i = 0;
        while (i < 2000) {
            Map<String, String> publisherMap = new HashMap<String, String>();
            Date dateOfBorrow = FAKER.date().birthday();
//            publisherMap.put("BORROW_ID", String.valueOf(i));
            publisherMap.put("DATE_OF_BORROW", SIMPLE_DATE_FORMAT.format(dateOfBorrow));
            if (FAKER.random().nextDouble() > 0.5) {
                Date dateOfReturn = FAKER.date().between(dateOfBorrow, new Date());
                publisherMap.put("DATE_OF_RETURN", SIMPLE_DATE_FORMAT.format(dateOfReturn));
            } else {
                publisherMap.put("DATE_OF_RETURN", "");
            }
            publisherMap.put("PERSON_ID", FAKER.random().nextInt(0, 100).toString());
            publisherMap.put("BOOK_ID", String.valueOf(FAKER.number().numberBetween(0, 1000)));
            publisherMap.put("EMPLOYEE_ID", String.valueOf(FAKER.number().numberBetween(0, 10)));

            array.put(publisherMap);
            i++;
        }
        writeContentToJsonFile("Borrow", array.toString());
    }

    private static void createEmployees() throws IOException {
        JSONArray array = new JSONArray();
        int i = 0;
        while (i < 10) {
            Map<String, String> publisherMap = new HashMap<String, String>();
//            publisherMap.put("ID", String.valueOf(i));
            publisherMap.put("ACTIVE", FAKER.random().nextBoolean() ? "1" : "0");
            publisherMap.put("PERSON_ID", FAKER.random().nextInt(0, 100).toString());
            //publisherMap.put("ADDRESS_ID", String.valueOf(FAKER.number().numberBetween(0, 100)));

            array.put(publisherMap);
            i++;
        }
        writeContentToJsonFile("employees", array.toString());
    }

    private static void createOpinions() throws IOException {
        JSONArray array = new JSONArray();
        int i = 0;
        while (i < 10000) {
            Map<String, String> publisherMap = new HashMap<String, String>();
//            publisherMap.put("ID", String.valueOf(i));
            publisherMap.put("DESCRIPTION", FAKER.dragonBall().character());
            publisherMap.put("RATE", FAKER.random().nextInt(1, 10).toString());
            publisherMap.put("PERSON_ID", FAKER.random().nextInt(0, 100).toString());
            publisherMap.put("BOOK_ID", String.valueOf(FAKER.number().numberBetween(0, 1000)));

            array.put(publisherMap);
            i++;
        }
        writeContentToJsonFile("Opinion", array.toString());
    }

    private static void createBooks() throws IOException {
        JSONArray array = new JSONArray();
        int i = 0;
        while (i < 1000) {
            Map<String, String> publisherMap = new HashMap<String, String>();
//            publisherMap.put("BOOK_ID", String.valueOf(i));
            publisherMap.put("TITLE", FAKER.book().title());
            publisherMap.put("DESCRIPTION", FAKER.gameOfThrones().quote());
            publisherMap.put("QUANTITY", FAKER.random().nextInt(0, 1000).toString());
            publisherMap.put("PUBLISHMENT_DATE", SIMPLE_DATE_FORMAT.format(FAKER.date().birthday()));
            publisherMap.put("ISBN", FAKER.random().nextInt(100000000, 999999999).toString());
            publisherMap.put("PUBLISHER_ID", FAKER.random().nextInt(1, 20).toString());
            publisherMap.put("EDITION", FAKER.number().digits(1));

            array.put(publisherMap);
            i++;
        }
        writeContentToJsonFile("Book", array.toString());
    }

    private static void createCategories() throws IOException {
        JSONArray array = new JSONArray();
        int i = 0;
        while (i < 25) {
            Map<String, String> categoryMap = new HashMap<String, String>();
//            categoryMap.put("CATEGORY_ID", String.valueOf(i));
            categoryMap.put("NAME", FAKER.book().genre());

            array.put(categoryMap);
            i++;
        }
        writeContentToJsonFile("Category", array.toString());
    }

    private static void createPublishers() throws IOException {
        JSONArray array = new JSONArray();
        int i = 0;
        while (i < 20) {
            Map<String, String> publisherMap = new HashMap<String, String>();
//            publisherMap.put("PUBLISHER_ID", String.valueOf(i));
            publisherMap.put("NAME", FAKER.book().publisher());

            array.put(publisherMap);
            i++;
        }
        writeContentToJsonFile("Publisher", array.toString());
    }

    private static void createPersons() throws IOException {
        JSONArray array = new JSONArray();
        int i = 0;
        while (i < 100) {
            Map<String, String> personMap = new HashMap<String, String>();
//            personMap.put("PERSON_ID", String.valueOf(i));
            personMap.put("EMAIL", FAKER.internet().emailAddress());
            personMap.put("LOGIN", FAKER.funnyName().name());
            personMap.put("PASSWORD", FAKER.internet().password(8, 32, true, true));

            array.put(personMap);
            i++;
        }
        writeContentToJsonFile("Person", array.toString());
    }

    private static void createAuthors() throws IOException {
        JSONArray array = new JSONArray();
        int i = 0;
        while (i < 100) {
            Map<String, String> authorMap = new HashMap<String, String>();
//            authorMap.put("AUTHOR_ID", String.valueOf(i));
            authorMap.put("FIRST_NAME", FAKER.address().firstName());
            authorMap.put("LAST_NAME", FAKER.address().lastName());
            authorMap.put("DATE_OF_BIRTH", SIMPLE_DATE_FORMAT.format(FAKER.date().birthday()));
            authorMap.put("DESCRIPTION", FAKER.rickAndMorty().quote());

            array.put(authorMap);
            i++;
        }
        writeContentToJsonFile("Author", array.toString());
    }

    private static void createAddresses() throws IOException {
        JSONArray array = new JSONArray();
        int i = 0;
        while (i < 100) {
            Map<String, String> addressMap = new HashMap<String, String>();
            //addressMap.put("ADDRESS_ID", String.valueOf(i));
            addressMap.put("FIRST_NAME", FAKER.address().firstName());
            addressMap.put("LAST_NAME", FAKER.address().lastName());
            addressMap.put("STREET", FAKER.address().streetAddress());
            addressMap.put("CITY", FAKER.address().city());
            addressMap.put("ZIP_CODE", FAKER.address().zipCode());
            addressMap.put("COUNTRY", FAKER.address().country());
            addressMap.put("TEL_NUMBER", String.valueOf(FAKER.random().nextInt(1000000, 9999999)));
            addressMap.put("PERSON_ID", String.valueOf(i));

            array.put(addressMap);
            i++;
        }
        writeContentToJsonFile("Address", array.toString());
    }

    private static void writeContentToJsonFile(String titleOfFile, String content) throws IOException {
        BufferedWriter writer = new BufferedWriter(new FileWriter("src\\main\\resources\\" + titleOfFile + ".json"));
        writer.write(content);
        writer.close();
    }

}
