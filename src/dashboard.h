#ifndef DASHBOARD_H
#define DASHBOARD_H

#include <QObject>

class Dashboard : public QObject
{
    Q_OBJECT
public:
    explicit Dashboard(QObject *parent = nullptr);

signals:

public slots:
    bool isX86_64(void);

};

#endif // DASHBOARD_H
