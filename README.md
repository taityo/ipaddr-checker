# ipaddr-checker
IPアドレスのValidationとGlobal/Privateの判定を行う

## Requirement
* ruby 2.6.3
* bundler

## Installation
```
$ git clone https://github.com/taityo/ipaddr-checker.git
$ cd ~/ipaddr-checker
$ bundle install
```

## Usage
### bundler
```
$ bundle exec ruby main.rb [file path]
```

### docker
```
$ docker run -v [your file path]:/ipaddr-checker/list/ipaddr taityo/ipaddr-checker
```

## Example
### bundler
```
$ bundle exec ruby main.rb list/ipaddr 
-------------------------
Input IP : 192.168.189.1
Validate : OK
Type : Local
-------------------------
Input IP : 192.168.189.2
Validate : OK
Type : Local
-------------------------
Input IP : 128.0.2.1
Validate : OK
Type : Global
-------------------------
Input IP : 512.0.4.1
Validate : Invalid IP "512.0.4.1"
Type : 
-------------------------
Input IP : 128.k.2.1
Validate : Invalid IP "128.k.2.1"
Type : 
-------------------------
Input IP : dsfdsajdsa
Validate : Unknown IP Address dsfdsajdsa
Type : 
-------------------------
```

### docker
```
$ docker run -v $(cwd)/list/ipaddr:/ipaddr-checker/list/ipaddr taityo/ipaddr-checker
...
```
