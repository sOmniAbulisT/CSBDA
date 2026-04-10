# Module 4: Database 

This module documents the core concepts of databases, comparing flat files, relational databases (SQL), and non-relational databases (NoSQL).

## 1. What is a Database?

[cite_start]A database is an organized collection of data that can create, update, retrieve, and manage information[cite: 2463]. [cite_start]It allows for the efficient use of speed and storage[cite: 2464].

[cite_start]Modern databases also have several additional requirements[cite: 2466]:
* [cite_start]**Security** [cite: 2467]
* [cite_start]**Redundancy reduction** (minimizing duplicate data) [cite: 2468]
* [cite_start]**Integrity/Consistency** [cite: 2469]
* [cite_start]**Synchronization** [cite: 2470]
* [cite_start]**Management** [cite: 2471]

## 2. Flat Files vs. Relational Databases

### Flat Files
[cite_start]Data is stored in one single (big) file, such as an Excel spreadsheet or a text file where records are in lines[cite: 2476].
* [cite_start]**Advantages**: Simple and easy to understand [cite: 2478][cite_start]; very common; no constraints or restrictions[cite: 2479].
* [cite_start]**Disadvantages**: Hard to understand the relationship between data [cite: 2481, 2482][cite_start]; hard to update and retrieve [cite: 2483][cite_start]; prone to inconsistency and redundancy[cite: 2484, 2485].

### Relational Databases
[cite_start]Relational databases define sets of "relations" between data[cite: 2635].
* [cite_start]**Table**: A collection of records where each table holds closely related information[cite: 2636, 2647].
* [cite_start]**Column (Attribute/Field)**: Stores the same type of data (e.g., String, DATETIME, INT)[cite: 2637, 2661].
* [cite_start]**Row (Record)**: An individual entry[cite: 2638].
* [cite_start]**Primary Key (PK)**: Required for each table[cite: 2648]. [cite_start]It must be unique and cannot be NULL[cite: 2649, 2650]. [cite_start]It is frequently set to AUTO_INCREMENT[cite: 2651].
* [cite_start]**Foreign Key (FK)**: A connection between tables and records[cite: 2688, 2689]. [cite_start]It must connect to a valid primary key[cite: 2690].

## 3. Cardinality (Types of Relationships)

[cite_start]Cardinality defines the type of relationship between tables[cite: 2715]:
* [cite_start]**One-to-One (1-1)**: e.g., Student ID to Student's name[cite: 2717, 2720, 2721].
* [cite_start]**One-to-Many (1-M)**: e.g., Room to multiple courses[cite: 2723, 2725].
* [cite_start]**Many-to-Many (N-M)**: e.g., Students to Projects[cite: 2732, 2735].

## 4. ACID Properties

[cite_start]ACID properties provide reliability guarantees for each transaction (a group of database operations treated as one unit)[cite: 2931, 2932]:
* [cite_start]**Atomicity**: All operations succeed, or none are applied[cite: 2933].
* [cite_start]**Consistency**: All transactions keep the database in a valid state[cite: 2934].
* [cite_start]**Isolation**: Concurrent transactions do not interfere with each other[cite: 2935, 2936].
* [cite_start]**Durability**: Once committed, a transaction is permanently saved[cite: 2937].

## 5. NoSQL (Not Only SQL)

[cite_start]NoSQL refers to non-relational or partially relational databases that became popular post-2000s[cite: 2958, 2959].

**Pros & Cons:**
* [cite_start]**Advantages**: Performance (cost for storage goes down) [cite: 2962][cite_start], availability and concurrency [cite: 2963][cite_start], flexibility [cite: 2964][cite_start], and scalability for big data[cite: 2965].
* [cite_start]**Disadvantages**: Compatibility issues [cite: 2967][cite_start], lack of standardization [cite: 2968][cite_start], consistency challenges [cite: 2969][cite_start], and a large variety of systems to choose from[cite: 2970, 2971].

[cite_start]**Types of NoSQL Stores[cite: 2975]:**
* [cite_start]**Document-oriented**: Each key is associated with a "document" containing complex or nested structures (e.g., MongoDB)[cite: 2976, 2978].
* [cite_start]**Key-Value**: Every record has a key-value pair (e.g., DynamoDB, Redis)[cite: 2979, 2980].
* [cite_start]**Wide-Column**: Data is stored in rows and super columns containing lots of information (e.g., Cassandra, HBase)[cite: 3000, 3001].
* [cite_start]**Graph stores**: Store information in a network-like format (e.g., Neo4j)[cite: 3002].

### SQL vs. NoSQL Comparison

| Feature | Relational (SQL) | Non-relational (NoSQL) |
| :--- | :--- | :--- |
| **Data** | [cite_start]Structured tables [cite: 3024] | [cite_start]Semi-structured [cite: 3024] |
| **Flexibility** | [cite_start]Strict schema [cite: 3024] | [cite_start]Dynamic schema [cite: 3024] |
| **Transactions** | [cite_start]ACID [cite: 3024] | [cite_start]Mostly BASE, few ACID [cite: 3024] |
| **Consistency** | [cite_start]Strong [cite: 3024] | [cite_start]Eventual to Strong [cite: 3024] |
| **Availability**| [cite_start]Consistency prioritized [cite: 3024] | [cite_start]Basic Availability [cite: 3024] |
| **Scale** | [cite_start]Vertically by upgrading hardware [cite: 3024] | [cite_start]Horizontally by data partitioning [cite: 3024] |
