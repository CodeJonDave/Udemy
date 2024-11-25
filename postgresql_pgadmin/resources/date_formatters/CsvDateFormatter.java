
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

public class CsvDateFormatter {

    public static void main(String[] args) {
        String inputCsv = "C:path_to_file";
        String outputCsv = "C:path_to_file.csv";

        // Define date formatters for input and output
        DateTimeFormatter formatterDash = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        DateTimeFormatter formatterBackspace = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        DateTimeFormatter formatterMonthName = DateTimeFormatter.ofPattern("MMMM dd, yyyy");
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");

        try (
                BufferedReader reader = Files.newBufferedReader(Paths.get(inputCsv)); BufferedWriter writer = Files.newBufferedWriter(Paths.get(outputCsv))) {

            String line = reader.readLine(); // Read the header
            writer.write(line + "\n"); // Write the header to the output file

            // Process each line
            while ((line = reader.readLine()) != null) {
                String[] columns = line.split(",");

                // Assuming the date is in the second column (index 1)
                String originalDate = columns[1].trim();
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
                writer.write(String.join(",", columns) + "\n");
            }

            System.out.println("Date formatting completed. Cleaned file saved to: " + outputCsv);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
