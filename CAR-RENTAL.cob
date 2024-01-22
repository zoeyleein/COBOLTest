       IDENTIFICATION DIVISION.
       PROGRAM-ID. CarRentalProgram.
       AUTHOR. JINGYI LI.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
              SELECT RENTAL-FILE ASSIGN TO "RENTAL.TXT"
              ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD RENTAL-FILE.
       01 CAR-RENTAL.
              05 REGISTRATION-NUMBER   PIC 9(8).
              05 CAR-TYPE             PIC X(10).
              05 MODEL-TYPE           PIC X(5).
              05 MODEL-YEAR           PIC 9(8).
                     88 VALID-YEAR        VALUE 0 TO 99999999.
              05 RENTER-DATA.
                     10 NAME.
                            15 FIRST-NAME      PIC X(15).
                            15 INITIAL         PIC XX.
                            15 LAST-NAME       PIC X(28).
                     10 ADDRESS.
                            15 STREET          PIC X(25).
                            15 CITY            PIC X(15).
                            15 PROVINCE        PIC X(15).
              15 POSTAL-CODE     PIC X(6).

       WORKING-STORAGE SECTION.
       01 WS-EOF                 PIC X VALUE 'N'.
       01 WS-DATE-TODAY.
              05 WS-YEAR             PIC 9(4).
              05 WS-MONTH            PIC 99.
              05 WS-DAY              PIC 99.

       PROCEDURE DIVISION.
              ACCEPT WS-DATE-TODAY FROM DATE.
              MOVE WS-YEAR TO MODEL-YEAR.

              OPEN INPUT RENTAL-FILE.

              PERFORM UNTIL WS-EOF = 'Y'
              READ RENTAL-FILE
              AT END
              MOVE 'Y' TO WS-EOF
              NOT AT END
              DISPLAY "Registration Number: " REGISTRATION-NUMBER
              DISPLAY "Car Type: " CAR-TYPE
              DISPLAY "Model Type: " MODEL-TYPE
              DISPLAY "Model Year: " MODEL-YEAR
              DISPLAY "Renter Name: " FIRST-NAME INITIAL LAST-NAME
              DISPLAY "Address: " STREET CITY PROVINCE POSTAL-CODE
              END-READ
              END-PERFORM.

       CLOSE RENTAL-FILE.

       STOP RUN.