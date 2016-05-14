#lang racket

; Упражнение 1.37.
; а. Бесконечнаяцепная дробь (continued fraction) есть выражение вида

; f =     N1
;     --------
;     D1 + N2
;         ---------
;          D2 + N3
;              -----------
;               D3 + . . .

; В качестве примера можно показать, что расширение бесконечной цепной дроби при всех Ni и
; Di, равных 1, дает 1/, где  — золотое сечение (описанное в разделе 1.2.2). Один из способов
; вычислить цепную дробь состоит в том, чтобы после заданного количества термов оборвать вы-
; числение. Такой обрыв — так называемая конечная цепная дробь (finite continued fraction) из k
; элементов, — имеет вид

; f =    N1
;     -------
;     D1 + N2
;         ---------------
;          D2 + . . . Nk
;                    ----
;                     Dk

; Предположим, что n и d — процедуры одного аргумента (номера элемента i), возвращающие Ni и
; Di элементов цепной дроби. Определите процедуру cont-frac так, чтобы вычисление (cont-
; frac n d k) давало значение k-элементной конечной цепной дроби. Проверьте свою процедуру,
; вычисляя приближения к 1/ с помощью

; (cont-frac (lambda (i) 1.0)
;            (lambda (i) 1.0)
;            k)
;------------------------------------------------------------------
(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i)
                    (iter (+ i 1))))))
  (iter 0))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           1000)
;==================================================================