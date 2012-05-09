db = sqlite3_connect(':memory');

sqlite3_query(db, 'DROP TABLE IF EXISTS people');
sqlite3_query(db, 'CREATE TABLE people (name TEXT, age INTEGER)');

people = {
    'Harry' 20;
    'Bob' 23;
};

for ii = 1:size(people, 1)
    sqlite3_query(db, 'INSERT INTO people (name, age) VALUES ("{name}", "{age}")', ...
                  'name', people{ii, 1}, ...
                  'age', people{ii, 2});
end

sqlite3_query(db, 'SELECT * FROM people')
sqlite3_query(db, 'SELECT name FROM people WHERE age <= 20')
sqlite3_query(db, 'SELECT AVG(age) FROM people')
