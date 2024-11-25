
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

public class TxtDateFormatter {

    public static void main(String[] args) {
        String inputTxt = "C:path_to_file";  // Replace with your input file path
        String outputTxt = "C:path_to_file"; // Replace with your output file path

        // Define date formatters for input and output
        DateTimeFormatter formatterDash = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        DateTimeFormatter formatterBackspace = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        DateTimeFormatter formatterMonthName = DateTimeFormatter.ofPattern("MMMM dd, yyyy");
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");

        try (
                BufferedReader reader = Files.newBufferedReader(Paths.get(inputTxt)); BufferedWriter writer = Files.newBufferedWriter(Paths.get(outputTxt))) {

            String line;

            // Process each line
            while ((line = reader.readLine()) != null) {
                String[] columns = line.split("\\s+"); // Split by whitespace
                if (columns.length > 1) { // Ensure there are at least two columns
                    String originalDate = columns[1].trim(); // Assuming the date is in the second column
                    String normalizedDate = null;

                    try {
                        // Try parsing as dd-MM-yyyy
                        LocalDate date = LocalDate.parse(originalDate, formatterDash);
                        normalizedDate = date.format(outputFormatter);
                    } catch (DateTimeParseException e1) {
                        try {
                            // Try parsing as "MMMM dd, yyyy"
                            LocalDate date = LocalDate.parse(originalDate, formatterMonthName);
                            normalizedDate = date.format(outputFormatter);
                        } catch (DateTimeParseException e2) {
                            try {
                                // Try parsing as dd/MM/yyyy
                                LocalDate date = LocalDate.parse(originalDate, formatterBackspace);
                                normalizedDate = date.format(outputFormatter);
                            } catch (DateTimeParseException e3) {
                                // Handle invalid date format
                                System.err.println("Invalid date format: " + originalDate);
                                normalizedDate = originalDate; // Retain the original for debugging
                            }
                        }
                    }

                    // Debugging: Print the parsed and normalized date for each row
                    System.out.println("Original: " + originalDate + " -> Normalized: " + normalizedDate);

                    // Replace the date column with the normalized date
                    columns[1] = normalizedDate;
                }

                // Write the updated line to the output file
                writer.write(String.join(" ", columns) + "\n");
            }

            System.out.println("Date formatting completed. Cleaned file saved to: " + outputTxt);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
