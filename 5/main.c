#include <stdio.h>
#include <locale.h>

int n;
int x = 0;

void Scan(int *a) {
    scanf("%d", &n);
    if (n > 10000 || n < 0){
        printf("Введите n в промежутке от 0 до 10000");
    }
    for (int i = 0; i < n; i++) {
        scanf("%d", &a[i]);
    }
}

void Comp(int *a, int *b) {
    int y = x;
    for (int i = n - 1; i >= 0; i--) {
        if (a[i] < 0) {
            b[x] = a[i];
            y += 1;
        }
    }
    x = y;
}

void Prin(int *b){
    printf("Получившийся массив B: ");
    for (int i = 0; i < x; i++){
        printf("%d ", b[i]);
    }
}

int main() {
    setlocale(LC_ALL, "Rus");
    int A[10000];
    int B[10000];
    printf("Введите размер массива А, затем сам массив:");
    Scan(A);
    Comp(A, B);
    Prin(B);
    return 0;
}
