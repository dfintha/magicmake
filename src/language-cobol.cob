       IDENTIFICATION DIVISION.
       PROGRAM-ID. cobol_hello_function.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 HELLO PIC X(17) VALUE "Hello from COBOL!".

       PROCEDURE DIVISION.
           CALL "puts" USING HELLO.
           GOBACK.

