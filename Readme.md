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

## 事前準備

### ansibleの導入

1. pythonのインストール

```
> yum install python
```

2. ansibleのインストール

```
> pip install ansible
```

### ansible設定ファイルの配置

```
> cp config/ansible.cfg ~/.ansible.cfg
```

### 操作対象ホストのipをhostsに追加

```
app1 ansible_host=<ip>
```

### 操作対象ホストのssh鍵をhostsに追加

```
ansible_ssh_private_key_file=../ssh/<hogehoge.pem>
```

### ssh鍵の権限設定

```
> chmod 700 ./ssh
> chmod 600 ./ssh/<hogehoeg.pem>
```

## 疎通確認

```
> ansible all -i inventory/hosts -m ping 
```

