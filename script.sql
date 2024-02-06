CREATE TABLE STUDENT (
    id INT PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    photo VARCHAR(255)
);

CREATE TABLE INSTRUCTOR (
    id INT PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255)
);

CREATE TABLE SESSION (
    id INT PRIMARY KEY,
    session_name VARCHAR(255),
    start_date DATE,
    end_date DATE,
    instructorId INT,
    FOREIGN KEY (instructorId) REFERENCES INSTRUCTOR(id)
);

CREATE TABLE COURSE (
    id INT PRIMARY KEY,
    course_name VARCHAR(255),
    sessionId INT,
    FOREIGN KEY (sessionId) REFERENCES SESSION(id)
);

CREATE TABLE ASSESSMENT (
    id INT PRIMARY KEY,
    type VARCHAR(255),
    grade INT,
    instructorId INT,
    FOREIGN KEY (instructorId) REFERENCES INSTRUCTOR(id)
);

CREATE TABLE CALENDAR (
    id INT PRIMARY KEY,
    date DATE,
    time TIME,
    courseId INT,
    FOREIGN KEY (courseId) REFERENCES COURSE(id)
);

CREATE TABLE STUDENT_SESSION (
    studentId INT,
    sessionId INT,
    PRIMARY KEY (studentId, sessionId),
    FOREIGN KEY (studentId) REFERENCES STUDENT(id),
    FOREIGN KEY (sessionId) REFERENCES SESSION(id)
);

CREATE TABLE STUDENT_COURSE (
    studentId INT,
    courseId INT,
    PRIMARY KEY (studentId, courseId),
    FOREIGN KEY (studentId) REFERENCES STUDENT(id),
    FOREIGN KEY (courseId) REFERENCES COURSE(id)
);

CREATE TABLE STUDENT_ASSESSMENT (
    studentId INT,
    assessmentId INT,
    PRIMARY KEY (studentId, assessmentId),
    FOREIGN KEY (studentId) REFERENCES STUDENT(id),
    FOREIGN KEY (assessmentId) REFERENCES ASSESSMENT(id)
);
