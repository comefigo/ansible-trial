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
    - xxxxx.pem ･･･ 操作対象ホストのssh鍵
- wwww          ･･･ デプロイ対象資源
    - site-a
    - site-b
- site-role.yml ･･･ role実行時に使用するplaybook
- site.yml      ･･･ 通常利用のplaybook

## 事前準備

### Remote SSH

1. VSCodeの[Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)をインストール
2. Windows版[OpenSSH(Client)](https://docs.microsoft.com/ja-jp/windows-server/administration/openssh/openssh_install_firstuse)をインストール
3. SSH鍵を`c:\Users\ユーザ名\.ssh\`に配置
4. `./ssh/config`の`IdentityFile`に3で記載したファイルパスと`HostName`に接続するリモートのIPをそれぞれ記載する


### ansibleの導入

1. pythonのインストール(管理者権限)
2. ansibleのインストール(管理者権限)

```
> pip install ansible
```

### ansible設定ファイルの配置

```
> cp config/ansible.cfg ~/.ansible.cfg
```

### inventory/hostsを編集

#### 操作対象ホストの<ip>をIPまたはホスト名を変更

```
app1 ansible_host=<ip>
```

#### 操作対象ホストの<hogehoge.pem>を変更

```
ansible_ssh_private_key_file=./ssh/<hogehoge.pem>
```

## 疎通確認

当フォルダで以下のコマンドを実行

```
> ansible -i inventory/hosts aws -m ping
```

