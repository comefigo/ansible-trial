# Ansible Trial

## リソースの説明

- config
    - ansible.cfg   ･･･ ansibleの設定
- inventory
    - hosts ･･･ 操作対象ホスト定義
- roles
    - nginx ･･･ nginxの操作関連role
    - html  ･･･ html操作関連role
- ssh
    - xxxxx.pem ･･･ 操作対象ホストのssh鍵
- site-role.yml ･･･ role実行時に使用するplaybook
- site.yml      ･･･ 通常利用のplaybook
