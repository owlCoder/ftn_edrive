#include "tasks.h"
#include "arduinoPlatform.h"
#include "stdio.h"
#include "windows.h"

taskHeadersType taskHeaders;
HANDLE tScheduler;
DWORD tSchedulerID;

int createTask(taskFunc task, unsigned long period, unsigned short stat, void * var){
   taskHeaders.taskH[taskHeaders.numberOfTasks].taskFunction = task;
   taskHeaders.taskH[taskHeaders.numberOfTasks].taskPeriod = period;
   taskHeaders.taskH[taskHeaders.numberOfTasks].taskStatus = stat;
   taskHeaders.taskH[taskHeaders.numberOfTasks].taskPeriodStartTime = millis();
   taskHeaders.taskH[taskHeaders.numberOfTasks].taskVar = var;
   taskHeaders.numberOfTasks++;
   return taskHeaders.numberOfTasks-1;
}

void startTasks(){
  unsigned long t = millis();
  for(int i = 0; i<taskHeaders.numberOfTasks; i++) {
     if (taskHeaders.taskH[i].taskStatus>0 && taskHeaders.taskH[i].taskStatus<=TASK_ENABLE) {
        if (t-taskHeaders.taskH[i].taskPeriodStartTime >taskHeaders.taskH[i].taskPeriod) {
           taskHeaders.taskH[i].taskFunction(i, taskHeaders.taskH[i].taskVar);
           taskHeaders.taskH[i].taskPeriodStartTime = t;
           if (taskHeaders.taskH[i].taskStatus<TASK_ENABLE)
               taskHeaders.taskH[i].taskStatus--;
        }
     }
  }
  taskHeaders.currentTime++;
};

DWORD WINAPI taskScheduler(LPVOID lpParam)
{
    while (true){
        startTasks();
        delay(1);
    }
}

void endTaskManager(){
    CloseHandle(tScheduler);
};

void startTaskManager(){
   taskHeaders.currentTime = 0;
   taskHeaders.numberOfTasks = 0;
   tScheduler = CreateThread(NULL, 0, &taskScheduler, NULL, 0, &tSchedulerID);
}

void setTaskState(int n, unsigned short state){
   if (n<taskHeaders.numberOfTasks)
       taskHeaders.taskH[n].taskStatus = state;
};

void setTaskPeriod(int n, unsigned long period){
   if (n<taskHeaders.numberOfTasks)
       taskHeaders.taskH[n].taskPeriod = period;
};

unsigned short getTaskState(int n){
   if (n<taskHeaders.numberOfTasks)
       return taskHeaders.taskH[n].taskStatus;
   else
       return NO_TASK;
};

unsigned long getTaskPeriod(int n){
   if (n<taskHeaders.numberOfTasks)
       return taskHeaders.taskH[n].taskPeriod;
   else
       return NO_TASK;

};






