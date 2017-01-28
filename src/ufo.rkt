;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ufo) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)
(require 2htdp/universe)

; constants 
(define WIDTH  400)
(define HEIGHT 200)
(define x-axis 200)
(define V 2)

; graphical constants
(define BACKGROUND
  (place-image (rectangle 60 10 "solid" "gray") HEIGHT HEIGHT
               (rectangle WIDTH HEIGHT "solid" "blue")))
(define MTSCN
  (place-image BACKGROUND 200 100
  (empty-scene WIDTH HEIGHT)))

(define ROCKET
  (overlay (circle 10 "solid" "green")
           (rectangle 40 4 "solid" "green")))
(define ROCKET-CENTER-TO-TOP
sub  (- HEIGHT (/ (image-height ROCKET) 2) 5))
 
; functions
(define (picture-of-rocket.v5 t)
  (cond
    [(<= (distance t) ROCKET-CENTER-TO-TOP)
     (place-image ROCKET x-axis (distance t) MTSCN)]
    [(> (distance t) ROCKET-CENTER-TO-TOP)
     (place-image ROCKET x-axis ROCKET-CENTER-TO-TOP MTSCN)]))

(define (distance t)
  (* V t))
