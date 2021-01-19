# Ansible Trial

## リソースの説明

- config
    - ansible.cfg   ･･･ ansibleの設定
- inventory
    - hosts ･･･ 操作対象ホスト定義
    - group_vars ･･･ グループ変数（サンプル）
    - host_vars ･･･ ホスト変数（サンプル）
- roles
    - common ･･･ 共通の操作関連role（apacheのインストール）
    - app  ･･･ html操作関連role
- ssh
    - config    ･･･ SSHの設定ファイル
- wwww          ･･･ デプロイ対象資源
    - site-a
    - site-b
- site-role.yml ･･･ role実行時に使用するplaybook
- site.yml      ･･･ 通常利用のplaybook

## 事前準備

ansibleの実行環境がローカル以外のリモートマシンかローカルのDockerによって、事前準備が異なります。<br/>
リモートマシンの場合は、[Remote SSH](#Remote&nbsp;SSH)<br/>
Dockerの場合は、[Docker](#docker)<br/>
をそれぞれ参照して準備してください。

### Remote SSH

1. VSCodeの[Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)をインストール
2. Windows版[OpenSSH(Client)](https://docs.microsoft.com/ja-jp/windows-server/administration/openssh/openssh_install_firstuse)をインストール
3. SSH鍵を`c:\Users\ユーザ名\.ssh\`に配置
4. `./ssh/config`の`IdentityFile`に3で記載したファイルパスと`HostName`に接続するリモートのIPをそれぞれ記載する
5. `./ssh/config`を`c:\Users\ユーザ名\.ssh\`に配置
6. VSCodeのリモートエクスプローラーで「SSHTargets」を指定し、追加で「controllenode」、パスはssh/configまでのパスを指定する

### Docker

1. VSCodeの[Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)をインストール
2. Dockerをインストール
3. 当リポジトリのディレクトリをDockerの共有ドライブの設定に加える
4. 当リポジトリのルートを基点にVSCodeを起動する
5. 「Reopen in Container」でAnsibleコンテナを起動