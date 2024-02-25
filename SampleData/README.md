# 샘플 데이터를 작성하기 위한 함수 생성

## 랜덤 문자 생성

```sql


CREATE FUNCTION NewRandomCharacter(input_string VARCHAR(255))
RETURNS CHAR(1)
DETERMINISTIC
BEGIN

    DECLARE string_length TINYINT UNSIGNED;
    DECLARE random_index TINYINT UNSIGNED;
    DECLARE random_char CHAR(1);

    -- 입력 문자열의 길이를 구함
    SET string_length = CHAR_LENGTH(input_string);
    -- 1부터 문자열 길이까지의 랜덤한 정수를 생성
    SET random_index = FLOOR(1 + RAND() * string_length);
    -- 랜덤한 위치에 있는 글자를 선택하여 저장
    SET random_char = SUBSTRING(input_string, random_index, 1);

    -- 선택된 랜덤한 글자를 반환
    RETURN random_char;
END;


```