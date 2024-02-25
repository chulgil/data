# 샘플 데이터를 작성하기 위한 함수 생성

## 랜덤 문자 생성

```sql


DELIMITER $$

CREATE FUNCTION RandomCharacter(input_string VARCHAR(255))
RETURNS CHAR(1)
BEGIN
    DECLARE string_length INT;
    DECLARE random_index INT;
    DECLARE random_char CHAR(1);

    SET string_length = CHAR_LENGTH(input_string);
    SET random_index = FLOOR(1 + RAND() * string_length);

    SET random_char = SUBSTRING(input_string, random_index, 1);

    RETURN random_char;
END$$

DELIMITER ;


```