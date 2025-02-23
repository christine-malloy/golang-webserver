# Golang Programming Language Tutorial

## Introduction
Go (or Golang) is an open-source programming language developed by Google. It is designed for simplicity, efficiency, and scalability. This guide provides an introduction to Go, covering its syntax, features, and best practices.

## Prerequisites
Before starting, ensure you have the following:
- Basic knowledge of programming concepts
- Go installed on your system ([Download Go](https://golang.org/dl/))
- A text editor or an IDE (e.g., VS Code, GoLand)

## Installation
1. Download and install Go from the official website.
2. Verify the installation:
   ```sh
   go version
   ```
3. Set up your Go workspace:
   ```sh
   mkdir -p $HOME/go/{bin,src,pkg}
   ```
4. Add Go to your system PATH (if not set automatically):
   ```sh
   export GOPATH=$HOME/go
   export PATH=$PATH:$GOPATH/bin
   ```

## Writing Your First Go Program
Create a file named `main.go` and add the following code:

```go
package main

import "fmt"

func main() {
    fmt.Println("Hello, World!")
}
```

Run the program:
```sh
go run main.go
```

## Setting Up a New Golang Project

### Step 1: Initialize the Project
1. Open a terminal and create a new directory for your project:
   ```sh
   mkdir my-go-project
   cd my-go-project
   ```

2. Initialize a new Go module:
   ```sh
   go mod init github.com/yourusername/my-go-project
   ```

### Step 2: Create the Main Package
1. Create a `main.go` file:
   ```sh
   touch main.go
   ```

2. Open `main.go` and add the following code:
   ```go
   package main

   import "fmt"

   func main() {
       fmt.Println("Hello, World!")
   }
   ```

### Step 3: Run the Application
Execute the program with:
```sh
go run main.go
```

### Step 4: Add Dependencies
To add external dependencies, use:
```sh
go get github.com/some/package
```

### Step 5: Build the Application
To compile the program into an executable:
```sh
go build -o myapp
```

Run the compiled binary:
```sh
./myapp  # On Linux/macOS
myapp.exe  # On Windows
```

### Step 6: Writing Tests
1. Create a `main_test.go` file:
   ```sh
   touch main_test.go
   ```

2. Add a simple test case:
   ```go
   package main

   import "testing"

   func TestExample(t *testing.T) {
       expected := "Hello, World!"
       if expected != "Hello, World!" {
           t.Errorf("Expected %s but got something else", expected)
       }
   }
   ```

3. Run the tests:
   ```sh
   go test
   ```

### Step 7: Version Control with Git
Initialize a Git repository:
```sh
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/yourusername/my-go-project.git
git push -u origin main
```

### Step 8: Using Environment Variables
To manage environment variables, create a `.env` file and load it using a package like `github.com/joho/godotenv`:

1. Install the package:
   ```sh
   go get github.com/joho/godotenv
   ```
2. Load the `.env` file in `main.go`:
   ```go
   import (
       "fmt"
       "os"
       "github.com/joho/godotenv"
   )

   func main() {
       godotenv.Load()
       apiKey := os.Getenv("API_KEY")
       fmt.Println("API Key:", apiKey)
   }
   ```

### Step 9: Formatting and Linting
Format code using:
```sh
go fmt ./...
```

Run a linter (install `golangci-lint` first):
```sh
golangci-lint run
```

### Step 10: Package and Distribute
To create a binary for different platforms:
```sh
GOOS=linux GOARCH=amd64 go build -o myapp-linux
GOOS=windows GOARCH=amd64 go build -o myapp.exe
```

For reference, refer to [hello-world](./hello-world/) app 

## Go Basics
### Variables and Constants
```go
var name string = "Gopher"
age := 10  // Short-hand declaration
const PI = 3.14
```

### Data Types
Go has basic data types such as:
- `int`, `float64`, `string`, `bool`
- Arrays and slices: `[]int{1,2,3}`
- Maps: `map[string]int{"a": 1, "b": 2}`

### Functions
```go
func add(a int, b int) int {
    return a + b
}
```

### Control Structures
```go
if age > 18 {
    fmt.Println("Adult")
} else {
    fmt.Println("Minor")
}
```

```go
for i := 0; i < 5; i++ {
    fmt.Println(i)
}
```
## Structs and Interfaces
```go
type Person struct {
    Name string
    Age  int
}

func (p Person) Greet() {
    fmt.Println("Hello, my name is", p.Name)
}
```

## Concurrency with Goroutines
```go
func hello() {
    fmt.Println("Hello from Goroutine!")
}

go hello() // Run concurrently
```

## Modules and Packages
1. Initialize a new module:
   ```sh
   go mod init mymodule
   ```
2. Create and import packages:
   ```go
   package mypackage
   func SayHello() { fmt.Println("Hello!") }
   ```

## Testing in Go
```go
import "testing"

func TestAdd(t *testing.T) {
    result := add(2, 3)
    if result != 5 {
        t.Errorf("Expected 5, got %d", result)
    }
}
```

## Conclusion
Go is a powerful language for building tools for a wide range of use cases. Explore more at [golang.org](https://golang.org/).
