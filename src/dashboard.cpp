#include "dashboard.h"

Dashboard::Dashboard(QObject *parent)
    : QObject{parent}
{}

bool Dashboard::isX86_64(void)
{
#ifdef __x86_64__
        return 1;
#else
        return 0;
#endif
}
