{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs: with inputs; {
      homeConfigurations."ubuntu" =
        let
          system = "x86_64-linux";
          specialArgs.userArgs = rec {
            username = "lok";
            homeDirectory = "/home/${username}";
            projectRoot = "${homeDirectory}/.config/home-manager";
            git = {
              userName = "Marco Lam";
              userEmail = "lokflam@gmail.com";
            };
          };
        in
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          extraSpecialArgs = specialArgs;
          modules = [ ./home.nix ];
        };
    };
}
