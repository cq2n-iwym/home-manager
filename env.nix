rec {
  # 自分の朝日ネットIDに書き換えてください。
  username = "cq2n-iwym";
  extraConfig = { config, pkgs, self, ... }:
    {
      # [starship](https://starship.rs/) でbashの見た目をいい感じにします。
      # 自分で~/.bashrcを書きたいぜ！という人は3行ともコメントアウトしてください。
      programs.starship.enable = true;
      programs.bash.enable = true;
      programs.bash.bashrcExtra = ''[[ -e ~/.bashrc.local ]] || source ~/.bashrc.local'';

      # この行は書き換えないでください。
      home.username = username;
    };
}
