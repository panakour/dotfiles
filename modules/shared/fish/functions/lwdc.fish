function lwdc
    set lwdev $HOME/lw/devsetup
    docker compose \
        -f $lwdev/docker-compose.yml \
        -f $lwdev/extra/marketplace.yml \
        -f $lwdev/extra/pubsub-emulator.yml \
        -f $lwdev/extra/cloner.yml \
        -f $lwdev/extra/account.yml \
        -f $lwdev/extra/lwdemomaker.yml \
        -f $lwdev/extra/iplocate.yml \
        -f $lwdev/extra/mailpit.yml \
        -f $lwdev/docker-compose.override.yml \
        $argv
end
