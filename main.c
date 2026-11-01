// Name: Muhammed Mustafa Özbey | Student ID: 5001230020 | Task: G2
# define N 44
const int SID = 1230020;
int grades[N];
int bucket[5];
int mean;
int below_count;
int pass_count;

int mark_grade(int grade) {
    return grade | 0x100;
}

int main(void){
    unsigned int x = (unsigned int)SID;
    int i;
    int sum=0;
    int grade;
    int p = 50+(SID%10);

    for(i=0; i<N; i++) {
        x = 1664525u *x + 1013904223u;
        grades[i]= (int) ((x>>16) % 101u);
    }

    for(i=0; i < N; i++ ){
        grade = grades[i];
        sum += grade;

        if(grade < 50) {
            bucket[0]++;
        }
        else if (grade < 65) {
            bucket[1]++;
        }
        else if(grade < 75) {
            bucket[2]++;
        }
        else if(grade < 85) {
            bucket[3]++;
        }
        else{
            bucket[4]++;
        }

        if (grade >= p){
            pass_count++;
        }
    }
    mean = sum / N;
    for(i = 0; i<N; i++){
        grade = grades[i];

        if(grade<mean){
            below_count++;
            grades[i] = mark_grade(grade);
        }
    }
    return 0;
}