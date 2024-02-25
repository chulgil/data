# 샘플 데이터를 작성하기 위한 함수 생성

## 랜덤 문자 생성

```sql


CREATE FUNCTION f_rand_char(input_string VARCHAR(255))
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
END


```

## 랜덤 이름 생성

```sql

CREATE FUNCTION f_rand_name_kr() RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE last_names VARCHAR(255) DEFAULT '김이박최정강조윤장임한오서신권황안송전홍류고문손양배조백허남심노정하';
    DECLARE first_names VARCHAR(255) DEFAULT '순신세종성호지가은호윤국철길달봉혜림송숙희상인영민수시가나다자';
    DECLARE full_names VARCHAR(255);
    DECLARE random_last_name CHAR(1) CHARACTER SET utf8mb4;
    DECLARE random_first_name1 CHAR(1) CHARACTER SET utf8mb4;
    DECLARE random_first_name2 CHAR(1) CHARACTER SET utf8mb4;

    -- 성 생성
    SET random_last_name = f_rand_char(last_names);

    REPEAT
        -- 이름 생성
        SET random_first_name1 = f_rand_char(first_names);
        SET random_first_name2 = f_rand_char(first_names);
    UNTIL random_first_name1 != random_first_name2 END REPEAT;

    SET full_names = CONCAT(random_last_name, random_first_name1, random_first_name2);

    RETURN full_names;
END;


```