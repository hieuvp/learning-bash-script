#!/usr/bin/env bash

# Other systems than Linux and Mac OS
# May have bash in a different location
# This will find bash on the user's PATH

# Downside (Drawback)
# Cannot give options
# Result depends on the user's configuration

echo "Version: $BASH_VERSION"

#!/usr/bin/env searches PATH for bash,
# and bash is not always in /bin, particularly on non-Linux systems.
# For example, on my OpenBSD system, it's in /usr/local/bin,
# since it was installed as an optional package.

# If you are absolutely sure bash is in /bin and will always be,
# there's no harm in putting it directly in your shebang
# but I'd recommend against it because scripts
# and programs all have lives beyond what we initially believe they will have.
