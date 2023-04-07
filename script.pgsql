CREATE TYPE sex AS ENUM ('М', 'Ж');

CREATE TABLE person (
    id serial PRIMARY KEY,
    sex sex,
    full_name varchar NOT NULL 
);

CREATE TABLE parent (
    person_id int REFERENCES person (id),
    child_id int REFERENCES person (id),
    parent_type varchar,
    CONSTRAINT parent_id PRIMARY KEY (person_id, child_id)
);

CREATE TABLE action (
    id serial PRIMARY KEY,
    person_id int REFERENCES person (id),
    action_type varchar,
    reaction varchar,
    context varchar
);

CREATE TABLE scheduled_action (
    id serial PRIMARY KEY,
    action_id int REFERENCES action (id),
    delay varchar
);

CREATE TABLE memory (
    id serial PRIMARY KEY,
    action_id int REFERENCES action (id),
    age varchar
);

INSERT INTO person
VALUES (1, 'М', 'Олвин');

INSERT INTO person
VALUES (2, 'М', 'Эристон');

INSERT INTO person
VALUES (3, 'Ж', 'Итания');

INSERT INTO parent
VALUES (2, 1, 'названный отец');

INSERT INTO parent
VALUES (3, 1, 'мать');

INSERT INTO action
VALUES (
    1,
    1,
    'услышал слова: "Добро пожаловать Олвин. Я -- Эристон, твой названый отец. А это -- Итания -- твоя мать"', 
    'тогда эти слова не значили ничего', 
    'память запечатлела момент с безупречной точностью'
);

INSERT INTO action
VALUES (
    2,
    1,
    'оглядел себя', 
    'теперь он уже подрос на пару дюймов', 
    'в сущности, тело его едва ли изменилось с момента рождения'
);

INSERT INTO action
VALUES (
    3,
    1,
    'пришёл в этот мир', 
    NULL, 
    'пришёл в этот мир уже взрослым'
);

INSERT INTO action
VALUES (
    4,
    1,
    'пришло время умирать', 
    NULL, 
    'он будет все таким же, разве только чуточку выше ростом'
);

INSERT INTO memory VALUES (1, 1, 20);
INSERT INTO memory VALUES (2, 2, 20);
INSERT INTO scheduled_action VALUES (1, 4, '1000 лет');
