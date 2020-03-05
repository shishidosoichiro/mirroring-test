# Github - Gitlab 間の双方向ミラーリングを手作りで。

Gitlab CE では 2020/03/05 現在双方向ミラーリングを行うことができません(Gitlab EE の Starter 以上のライセンスでは可能な模様)。
Github への push ミラーリングは可能ですが、
Github からの pull ミラーリングができません。

## 解決方法

Gitlab CI で自力で push/pull する。

### Github への接続に Personal Access Token を使う

Github 側でトークン(repo権限付与)を発行しておくことで、
`https://${USERNAME}:${TOKEN}@github.com/${ACCOUNT}/${REPO}.git`

という形でアクセスして push/pull が可能。


参考: [https+アクセストークンを使ってGitHubのアカウントを使い分ける](https://qiita.com/tq_jappy/items/6e2f81f372e4abaa5139)

### Pull は通常のジョブでは実行しないようにする

pull ジョブ時の話です。
このサンプルでは `MANUAL` 変数に値が設定されている場合のみ pull ジョブが実行されます。
逆に `MANUAL` 変数設定時は push ジョブは実行しないように設定してあります。

### Gitlab リポジトリへは SSH 接続を行う。

これも pull ジョブ時の話なのですが、
ジョブ内にデフォルトで設定されている origin リポジトリへのプッシュできません。
SSH の鍵ペアをそれぞれGitlabプロジェクト上に設定することで、プッシュできるようになります。

参考: [GitLab CI/CDパイプラインからGitLabにコミット(Push)し直す方法](https://qiita.com/ynott/items/8cb3b3995cb41ca78437)
