package main

import (
	"fmt"
	"log"
	"os"
	"os/exec"
)

func main() {
	cmd := exec.Command("./kafka-mesos.sh",
		"scheduler",
		"--master", os.Getenv("MASTER"),
		"--zk", os.Getenv("ZK"),
		"--api",
		fmt.Sprintf("http://%s:%s", os.Getenv("HOST"), os.Getenv("PORT0")),
		"--storage",
		"zk:/kafka-mesos",
		"--user",
		"root")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	if err := cmd.Run(); err != nil {
		log.Fatal(err)
	}
}
