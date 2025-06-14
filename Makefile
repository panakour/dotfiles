.PHONY: default
default: switch

OS := $(shell uname -s)

.PHONY: switch
switch:
ifeq ($(OS),Darwin)
	sudo darwin-rebuild switch --flake .#panamac
	# nix run nix-darwin -- switch --flake .#panamac
else
	sudo nixos-rebuild switch --flake .#pananix
endif

update:
	nix flake update
