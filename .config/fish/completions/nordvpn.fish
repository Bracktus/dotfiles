function nordvpn-countries
   nordvpn countries | tr '[:space:]' '[\n*]' | awk 'NF' | tail -n +3 
end
 
function nordvpn-cities
    # Running this is super slow
    # Like 300ms slow. so yeah idk
    set -l cities
    set -l city
    for country in (nordvpn-countries)
        set city (nordvpn cities "$country")
        set cities "$cities $city"
    end
    echo $cities | tr '[:space:]' '[\n*]' | awk 'NF' | tr '\n' ' '
end 

function nordvpn-settings
    nordvpn settings | cut -d: -f1 | sed 's/[^A-Za-z]*//g' | tr '[:upper:]' '[:lower:]'
end
        
set -l commands account cities connect countries disconnect groups login logout rate register set settings status whitelist help
set -l countries (nordvpn-countries)
# set -l cities (nordvpn-cities)
set -l settingOptions (nordvpn-settings)
set -l settingKeywords set settings

# nordvpn doesn't take in any files
complete -c nordvpn -f

complete -c nordvpn -n "not __fish_seen_subcommand_from $commands" -a account    -d 'Shows account information.'
complete -c nordvpn -n "not __fish_seen_subcommand_from $commands" -a cities     -d 'Shows a list of cities where servers are available.'
complete -c nordvpn -n "not __fish_seen_subcommand_from $commands" -a connect    -d 'Connects you to VPN.'
complete -c nordvpn -n "not __fish_seen_subcommand_from $commands" -a countries  -d 'Shows a list of countries where servers are available.'
complete -c nordvpn -n "not __fish_seen_subcommand_from $commands" -a disconnect -d 'Disconnects you from VPN.'
complete -c nordvpn -n "not __fish_seen_subcommand_from $commands" -a groups     -d 'Connects you to VPN.'
complete -c nordvpn -n "not __fish_seen_subcommand_from $commands" -a login      -d 'Logs you in.'
complete -c nordvpn -n "not __fish_seen_subcommand_from $commands" -a logout     -d 'Logs you out.'
complete -c nordvpn -n "not __fish_seen_subcommand_from $commands" -a rate       -d 'Rate your last connection quality (1-5).'
complete -c nordvpn -n "not __fish_seen_subcommand_from $commands" -a register   -d 'Registers a new user account.'
complete -c nordvpn -n "not __fish_seen_subcommand_from $commands" -a set -r     -d 'Sets a configuration option.'
complete -c nordvpn -n "not __fish_seen_subcommand_from $commands" -a status     -d 'Shows connection status.'
complete -c nordvpn -n "not __fish_seen_subcommand_from $commands" -a settings   -d 'Shows current settings.'
complete -c nordvpn -n "not __fish_seen_subcommand_from $commands" -a help       -d 'Display syntax for the given operation. If no operation was supplied, then the general synatx is shown.'

#nordvpn connect
# for city in $cities
#     complete -c nordvpn -n "__fish_seen_subcommand_from connect" -a "$city"
# end

for country in $countries
    complete -c nordvpn -n "__fish_seen_subcommand_from connect" -a "$country"
end

# nordvpn cities
for country in $countries
    complete -c nordvpn -n "__fish_seen_subcommand_from cities" -a "$country"
end

# nordvpn settings

complete -c nordvpn -n "__fish_seen_subcommand_from $settingOptions and __fish_seen_subcommand_from $settingKeywords" -a autoconnect -d "Enables or disables auto-connect. When enabled, this feature will automatically try to connect to VPN on operating system startup"
complete -c nordvpn -n "__fish_seen_subcommand_from $settingOptions and __fish_seen_subcommand_from $settingKeywords" -a cybersec   -d "Enables or disables CyberSec. When enabled, the CyberSec feature will automatically block suspicious websites so that no malware or other cyber threats can infect your device. Additionally, no flashy ads will come into your sight. More information on how it works: https://nordvpn.com/features/cybersec/."
complete -c nordvpn -n "__fish_seen_subcommand_from $settingOptions and __fish_seen_subcommand_from $settingKeywords" -a default    -d "Restores settings to their default values."
complete -c nordvpn -n "__fish_seen_subcommand_from $settingOptions and __fish_seen_subcommand_from $settingKeywords" -a dns        -d "Sets custom DNS servers."
complete -c nordvpn -n "__fish_seen_subcommand_from $settingOptions and __fish_seen_subcommand_from $settingKeywords" -a firewall   -d "Enables or disables use of the firewall"
complete -c nordvpn -n "__fish_seen_subcommand_from $settingOptions and __fish_seen_subcommand_from $settingKeywords" -a killswitch -d "Enables or disables Kill Switch. This security feature blocks your device from accessing the Internet while not connected to the VPN or in case connection with a VPN server is lost."
complete -c nordvpn -n "__fish_seen_subcommand_from $settingOptions and __fish_seen_subcommand_from $settingKeywords" -a notify     -d "Enables or disables notifications."
complete -c nordvpn -n "__fish_seen_subcommand_from $settingOptions and __fish_seen_subcommand_from $settingKeywords" -a obfuscate  -d "Enables or disables obfuscation. When enabled, this feature allows to bypass network traffic sensors which aim to detect usage of the protocol and log, throttle or block it."
complete -c nordvpn -n "__fish_seen_subcommand_from $settingOptions and __fish_seen_subcommand_from $settingKeywords" -a protocol   -d "Sets the protocol."
complete -c nordvpn -n "__fish_seen_subcommand_from $settingOptions and __fish_seen_subcommand_from $settingKeywords" -a protocol   -d "Sets the technology."

## autoconnect
##complete -c nordvpn -n "__fish_seen_subcommand_from autoconnect" ""

# making sure the functions aren't global
functions -e nordvpn-settings
functions -e nordvpn-countries
functions -e nordvpn-cities

