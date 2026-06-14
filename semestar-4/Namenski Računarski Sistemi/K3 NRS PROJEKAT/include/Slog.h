#ifndef SLOG_H_INCLUDED
#define SLOG_H_INCLUDED

typedef struct Slog
{
    char datum[12];  // DD.MM.YYYY.
    char vreme[9];   // HH:MM:SS
    int broj;

    Slog() : datum{"_._._."}, vreme{"/:/"}, broj(-1) {};
    Slog(string d, string v, int b) : datum{d}, vreme{v}, broj{b} {};
} Slog;

#endif // SLOG_H_INCLUDED
