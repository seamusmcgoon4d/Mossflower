#include <iostream>

namespace mf
{
class Mossflower
{
    Mossflower(uint32_t status);

    uint32_t status() const;

private:
    uint32_t _status = 0;
};
}  // namespace mf
