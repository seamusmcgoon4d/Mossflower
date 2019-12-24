#include "Mossflower.hpp"

namespace mf
{
Mossflower::Mossflower(uint32_t status) { _status = status; }

uint32_t Mossflower::status() const { return _status; }
}  // namespace mf