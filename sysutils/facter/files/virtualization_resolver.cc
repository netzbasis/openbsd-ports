#include <internal/facts/openbsd/virtualization_resolver.hpp>
#include <facter/facts/scalar_value.hpp>
#include <facter/facts/collection.hpp>
#include <facter/facts/fact.hpp>
#include <facter/facts/vm.hpp>
#include <facter/execution/execution.hpp>
#include <boost/algorithm/string.hpp>

using namespace std;
using namespace facter::facts;
using namespace facter::execution;

namespace facter { namespace facts { namespace openbsd {

    string virtualization_resolver::get_hypervisor(collection& facts)
    {
        string value = get_product_name_vm(facts);

        return value;
    }

} } }  // namespace facter::facts::openbsd
