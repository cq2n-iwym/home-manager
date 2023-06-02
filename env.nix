rec {
  # 自分の朝日ネットIDに書き換えてください。
  username = "cq2n-iwym";
  # 自分のメールアドレスに書き換えてください。
  email = "naoki.iwayama@asahi-net.com";

  extraConfig = { config, pkgs, self, ... }:
    {
      # [starship](https://starship.rs/) でbashの見た目をいい感じにします。
      # 自分で~/.bashrcを書きたいぜ！という人は3行ともコメントアウトしてください。
      programs.starship.enable = true;
      programs.bash.enable = true;
      programs.bash.bashrcExtra = ''[[ -e ~/.bashrc.local ]] || source ~/.bashrc.local'';

      # このブロックは書き換えないでください。
      home.username = username;
      programs.git.userName = username;
      programs.git.userEmail = email;
    };
}
