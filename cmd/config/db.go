package config

import (
	"database/sql"
	"fmt"
	"log"
	"os"

	_ "github.com/lib/pq"
)

var DB *sql.DB

func ConnectDB() {
	// Connect ------------------------------------------------------------------------------------
	// create connection string
	// Get infor connection from .env to avoid sensitive case
	dbHost := os.Getenv("DB_HOST")
	dbName := os.Getenv("DB_NAME")
	dbPort := os.Getenv("DB_PORT")
	dbUsername := os.Getenv("DB_USERNAME")
	dbPassword := os.Getenv("DB_PASSWORD")
	connStr := fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=%s sslmode=disable", dbHost, dbPort, dbUsername, dbPassword, dbName)
	db, err := sql.Open("postgres", connStr)
	if err != nil {
		log.Fatalf("Error: %s", err)
	}

	err = db.Ping()
	if err != nil {
		log.Fatalf("Error: %s", err)
	} else {
		fmt.Printf("\nSuccessfully connected to database!\n")
	}
	DB = db
}
