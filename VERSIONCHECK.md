# Version Check

To check the current version, build number, etc. of the World of Warcraft game instance, run the following command in the chat panel:

(`/run print(GetBuildInfo())`)

The resulting print-out in the chat panel should be in the following format of information:

(`[VERSION]`) (`[BUILD]`) (`[BUILD_DATE]`) (`[INTERFACE]`)

The (`[INTERFACE]`) should be exactly what's needed to replace an outdated entry for (`## Interface`) in the (`.toc`) for an addon.
