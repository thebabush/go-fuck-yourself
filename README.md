# gfy

`gfy` is a version of golang that tries not to get in your way when you are
trying to do complex stuff and don't really want to deal with that nice little
`-Werror` which is sprinkled all over the compiler.

Because, let me tell you people, when you are trying to implement a forkserver
in Go and you end up reading the syscall helpers, which are written in x86\_64
assembly btw, the last thing you want to see is `declared and not used`.

## Usage

```
$ go run test.go
# command-line-arguments
./test.go:7:8: imported and not used: "os"

$ alias gfy="GO_FUCK_YOURSELF=1 go"
$ gfy run test.go
Hello World, GFY!
```

## Install

Figuring out how to properly automate everything.
For now, I'm using docker as a makefile:

```sh
docker build -t gfy .
docker run -v $PWD:/work -t gfy cp /out/gfy.tar.gz /work/
```

You can now enjoy you local `gfy.tar.gz`
