# --- !Ups
ALTER TABLE "EXERCISE_ENTRIES" RENAME TO "EXERCISE_ENTRIES_2015";

CREATE TABLE "EXERCISE_ENTRIES_2016" (
    id SERIAL NOT NULL PRIMARY KEY,
    exerciseType varchar(64) NOT NULL,
    reps DECIMAL,
    dateDone DATE NOT NULL,
    userId INTEGER NOT NULL,
    comment TEXT,
    FOREIGN KEY (userId) REFERENCES "USERS" (id)
);

# --- !Downs
ALTER TABLE "EXERCISE_ENTRIES_2015" RENAME TO "EXERCISE_ENTRIES";
DROP TABLE "EXERCISE_ENTRIES_2016" CASCADE;