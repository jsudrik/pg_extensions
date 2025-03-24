-- factorial--1.0.sql

-- Create a new schema for the extension
CREATE SCHEMA factorial;

-- Create the factorial function
CREATE OR REPLACE FUNCTION factorial.factorial(n INTEGER)
RETURNS BIGINT AS $$
DECLARE
    result BIGINT := 1;
BEGIN
    IF n < 0 THEN
        RAISE EXCEPTION 'Factorial is not defined for negative numbers';
    ELSIF n > 1 THEN
        FOR i IN 2..n LOOP
            result := result * i;
        END LOOP;
    END IF;
    RETURN result;
END;
$$ LANGUAGE plpgsql;

-- Grant execute permission to public (change to appropriate roles if needed)
GRANT EXECUTE ON FUNCTION factorial.factorial(INTEGER) TO PUBLIC;

