# Lab 1

## 1. Створити змінні базових (atomic) типів. Базові типи: character, numeric, integer, complex, logical.

+ character
```R
ch <- 'a'
print(class(ch))
```
```R
[1] "character"
```

+ numeric
```R
n <- 0.9
print(class(n))
```
```R
[1] "numeric"
```

+ integer
```R
i <- 1L
print(class(i))
```
```R
[1] "integer"
```

+ complex
```R
c <- 1+5i
print(class(c))
```
```R
[1] "complex"
```

+ logical
```R
l <- TRUE
print(class(l))
```
```R
[1] "logical"
```

## 2. Створити вектори, які: містить послідовність з 5 до 75; містить числа 3.14, 2.71, 0, 13; 100 значень TRUE.

+ містить послідовність з 5 до 75
```R
v1 <- c(5:75)
print(class(v1))
print(v1)
```
```R
[1] "integer"
 [1]  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36
[33] 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68
[65] 69 70 71 72 73 74 75
```

+ містить числа 3.14, 2.71, 0, 13
```R
v2 <- c(3.14, 2.71, 0, 13)
print(class(v2))
print(v2)
```
```R
[1] "numeric"
[1]  3.14  2.71  0.00 13.00
```

+ 100 значень TRUE
```R
v3 <- c(rep(TRUE, 100))
print(class(v3))
print(v3)
```
```R
[1] "logical"
  [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [20] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [39] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [58] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [77] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [96] TRUE TRUE TRUE TRUE TRUE
```

## 3. Створити наступну матрицю за допомогою matrix, та за допомогою cbind або rbind

| | | |
|-|-|-|
0.5 | 1.3 | 3.5
3.9 | 131 | 2.8
0 | 2.2 | 4.6
2 | 7 | 5.1

+ matrix
```R
m1 <- matrix(c(0.5, 1.3, 3.5, 3.9, 131, 2.8, 0, 2.2, 4.6, 2, 7, 5.1), nrow=4, byrow = TRUE)
print(class(m1))
print(m1)
```
```R
[1] "matrix"
     [,1]  [,2] [,3]
[1,]  0.5   1.3  3.5
[2,]  3.9 131.0  2.8
[3,]  0.0   2.2  4.6
[4,]  2.0   7.0  5.1
```

+ cbind
```R
m2 <- cbind(c(0.5, 3.9, 0, 2), c(1.3, 131, 2.2, 7), c(3.5, 2.8, 4.6, 5.1))
print(class(m2))
print(m2)
```
```R
[1] "matrix"
     [,1]  [,2] [,3]
[1,]  0.5   1.3  3.5
[2,]  3.9 131.0  2.8
[3,]  0.0   2.2  4.6
[4,]  2.0   7.0  5.1
```

+ rbind
```R
m3 <- rbind(c(0.5,1.3, 3.5), c(3.9, 131, 2.8), c(0, 2.2, 4.6), c(2, 7, 5.1))
print(class(m3))
print(m3)
```
```R
[1] "matrix"
     [,1]  [,2] [,3]
[1,]  0.5   1.3  3.5
[2,]  3.9 131.0  2.8
[3,]  0.0   2.2  4.6
[4,]  2.0   7.0  5.1
```

## 4. Створити довільний список (list), в який включити всі базові типи.

```R
my_list <- list('y', 0.3, 1L, 8+9i, TRUE)
print(class(my_list))
print(my_list)
```
```R
[1] "list"
[[1]]
[1] "y"

[[2]]
[1] 0.3

[[3]]
[1] 1

[[4]]
[1] 8+9i

[[5]]
[1] TRUE
```

## 5. Створити фактор з трьома рівнями «baby», «child», «adult».

```R
my_factor <- factor(c('baby', 'child', 'baby', 'baby', 'adult', 'child', 'child', 'adult'))
print(class(my_factor))
print(my_factor)
```
```R
[1] "factor"
[1] baby  child baby  baby  adult child child adult
Levels: adult baby child
```

## 6. Знайти індекс першого значення NA в векторі 1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 11. Знайти кількість значень NA.

+ індекс першого значення NA
```R
my_vector <- c(1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 11)
match(NA, my_vector)
```
```R
[1] 5
```

+ кількість значень NA
```R
print(length(which(is.na(my_vector))))
```
```R
[1] 3
```

## 7. Створити довільний data frame та вивести в консоль.

```R
my_dataframe <- data.frame(x1 = c(5:8), x2 = c('yellow','red', 'rose', 'green'), x3 = c(TRUE, FALSE, TRUE, TRUE))
print(my_dataframe)
```
```R
  x1     x2    x3
1  5 yellow  TRUE
2  6    red FALSE
3  7   rose  TRUE
4  8  green  TRUE
```

## 8. Змінити імена стовпців цього data frame.

```R
names(my_dataframe) <- c('numbers', 'charaters', 'logicals')
print(my_dataframe)
```

```R
   numbers charaters logicals
1       5    yellow     TRUE
2       6       red    FALSE
3       7      rose     TRUE
4       8     green     TRUE
```