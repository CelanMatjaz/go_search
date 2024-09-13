package main

import (
	"log"
	"os"
	"os/exec"

	"github.com/joho/godotenv"

	_ "github.com/lib/pq"
)

func main() {
	if len(os.Args) < 2 {
		log.Fatal("Provide a migration name")
	}

	godotenv.Load("dev.env")
	connectionString := os.Getenv("POSTGRES_URL")

	cmd := exec.Command("goose", "-dir", "migrations", "postgres", connectionString, "create", os.Args[1], "sql")
	output, err := cmd.CombinedOutput()
	if err != nil {
		log.Fatal(err.Error())
	}
	print(string(output))
}
