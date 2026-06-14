#ifndef TASKMANAGMENT_H
#define TASKMANAGMENT_H

#define TASK_ENABLE 32000
#define TASK_DISABLE 0
#define TASK_RUN_ONCE 1
#define NO_TASK 32767

typedef void (*taskFunc) (int, void*);

typedef struct {
   taskFunc taskFunction;
   unsigned long taskPeriod;
   unsigned short taskStatus;
   int taskPeriodStartTime;
   void *taskVar;
} taskHeaderType;

typedef struct {
   int currentTime;
   int numberOfTasks;
   taskHeaderType taskH[1000];
} taskHeadersType;

int createTask(taskFunc task, unsigned long period, unsigned short stat, void * var);

void endTaskManager();

void startTaskManager();

void setTaskState(int, unsigned short);

void setTaskPeriod(int, unsigned long);

unsigned short getTaskState(int);

unsigned long getTaskPeriod(int);

#endif // TASKMANAGMENT_H
