# Module 4: Database Introduction

This module documents the core concepts of databases, comparing flat files, relational databases (SQL), and non-relational databases (NoSQL).

## 1. What is a Database?

A database is an organized collection of data that can create, update, retrieve, and manage information. It allows for the efficient use of speed and storage.

Modern databases also have several additional requirements:
* **Security**
* **Redundancy reduction** (minimizing duplicate data)
* **Integrity/Consistency**
* **Synchronization**
* **Management**

## 2. Flat Files vs. Relational Databases

### Flat Files
Data is stored in one single (big) file, such as an Excel spreadsheet or a text file where records are in lines.
* **Advantages**: Simple and easy to understand; very common; no constraints or restrictions.
* **Disadvantages**: Hard to understand the relationship between data; hard to update and retrieve; prone to inconsistency and redundancy.

### Relational Databases
Relational databases define sets of "relations" between data.
* **Table**: A collection of records where each table holds closely related information.
* **Column (Attribute/Field)**: Stores the same type of data (e.g., String, DATETIME, INT).
* **Row (Record)**: An individual entry.
* **Primary Key (PK)**: Required for each table. It must be unique and cannot be NULL. It is frequently set to AUTO_INCREMENT.
* **Foreign Key (FK)**: A connection between tables and records. It must connect to a valid primary key.

## 3. Cardinality (Types of Relationships)

Cardinality defines the type of relationship between tables:
* **One-to-One (1-1)**: e.g., Student ID to Student's name.
* **One-to-Many (1-M)**: e.g., Room to multiple courses.
* **Many-to-Many (N-M)**: e.g., Students to Projects.

## 4. ACID Properties

ACID properties provide reliability guarantees for each transaction (a group of database operations treated as one unit):
* **Atomicity**: All operations succeed, or none are applied.
* **Consistency**: All transactions keep the database in a valid state.
* **Isolation**: Concurrent transactions do not interfere with each other.
* **Durability**: Once committed, a transaction is permanently saved.

## 5. NoSQL (Not Only SQL)

NoSQL refers to non-relational or partially relational databases that became popular post-2000s.

**Pros & Cons:**
* **Advantages**: Performance (cost for storage goes down), availability and concurrency, flexibility, and scalability for big data.
* **Disadvantages**: Compatibility issues, lack of standardization, consistency challenges, and a large variety of systems to choose from.

**Types of NoSQL Stores:**
* **Document-oriented**: Each key is associated with a "document" containing complex or nested structures (e.g., MongoDB).
* **Key-Value**: Every record has a key-value pair (e.g., DynamoDB, Redis).
* **Wide-Column**: Data is stored in rows and super columns containing lots of information (e.g., Cassandra, HBase).
* **Graph stores**: Store information in a network-like format (e.g., Neo4j).

### SQL vs. NoSQL Comparison

| Feature | Relational (SQL) | Non-relational (NoSQL) |
| :--- | :--- | :--- |
| **Data** | Structured tables | Semi-structured |
| **Flexibility** | Strict schema | Dynamic schema |
| **Transactions** | ACID | Mostly BASE, few ACID |
| **Consistency** | Strong | Eventual to Strong |
| **Availability**| Consistency prioritized | Basic Availability |
| **Scale** | Vertically by upgrading hardware | Horizontally by data partitioning |
