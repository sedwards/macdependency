#ifndef MACHODEMANGLEEXCEPTION_H
#define MACHODEMANGLEEXCEPTION_H

#include "macho_global.h"
#include "machoexception.h"


class EXPORT MachODemangleException : public MachOException
{

public:
  MachODemangleException(const std::string&);
};

#endif // MACHODEMANGLEEXCEPTION_H


