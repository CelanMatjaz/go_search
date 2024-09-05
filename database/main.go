package main

import (
	"database/sql"
	"log"
	"os"

	"github.com/joho/godotenv"

	"github.com/pressly/goose/v3"

	_ "github.com/lib/pq"
)

func main() {
	if len(os.Args) < 2 {
		log.Fatal("Provide a subcommand, either of 'up' or 'down'")
	}

	godotenv.Load("dev.env")
	connectionString := os.Getenv("CONNECTION_STRING")

	db, err := sql.Open("postgres", connectionString)
	if err != nil {
		log.Fatal(err)
	}

	if err := goose.SetDialect("postgres"); err != nil {
		panic(err)
	}

	switch os.Args[1] {
	case "up":
		if err := goose.Up(db, "./migrations"); err != nil {
			panic(err)
		}

	case "down":
		if err := goose.Down(db, "./migrations"); err != nil {
			panic(err)
		}

	default:
		log.Fatal("Only subcommands 'up' and 'down' supported")
	}

}
