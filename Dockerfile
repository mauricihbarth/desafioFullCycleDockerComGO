# syntax=docker/dockerfile:1
FROM golang:1.21 as build
WORKDIR /src
COPY <<EOF /src/main.go
package main

import "fmt"

func main() {
  fmt.Println("Full Cycle Rocks!!")
}
EOF
RUN go build -o /bin/hello ./main.go
FROM scratch
COPY --from=build /bin/hello /bin/hello
EXPOSE 8080
CMD ["/bin/hello"]