Arch linux has dependencies too new to build [DevilutionX](https://github.com/diasurgical/DevilutionX) so i made a docker container running debian to circumvent that.
# How to run
## 1. Clone DevilutionX source
```git clone https://github.com/diasurgical/DevilutionX DevilutionX-3ds```
## 2. Build container
```docker build -t devilutionx-3ds:1 .```
## 3. Run container (Adjust source code path accordingly)
```docker container run -d -it -v "$(pwd)"/DevilutionX-3ds:/DevilutionX-3ds:rw devilutionx-3ds:1```
