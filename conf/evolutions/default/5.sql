# --- !Ups

CREATE TABLE "EXERCISE_ENTRIES_2021" (
    id SERIAL NOT NULL PRIMARY KEY,
    exerciseType varchar(64) NOT NULL,
    reps DECIMAL,
    dateDone DATE NOT NULL,
    userId INTEGER NOT NULL,
    comment TEXT,
    FOREIGN KEY (userId) REFERENCES "USERS" (id)
);

# --- !Downs

DROP TABLE "EXERCISE_ENTRIES_2021" CASCADE;