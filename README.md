# sam-stepfunctions-apigw

API Gateway経由でStep Functionsを起動するサンプル。

# 概要

ペイロードつけて/runを呼ぶと
Step Functionsのstart-executionが実行されて
executionArnが返ってくる。

Step Functionsはわざとlambda実行後10秒待つように書いてある。

executionArnを引数に/resultを時々呼ぶと
lambdaでdescribe-executionが実行されてて、
結果がSUCCEEDEDなら答えが得られる。

これは簡易的なもの。

1000個程度のトランザクションはStep Functionsに保持されるらしい。
それ以上残したい場合はDynamoDBに入れる(TODO)


# デプロイ

```sh
sam build
sam deploy --guided  # --guidedは最初の1回
```

`sam deploy --guided` は

```
XXXFunction may not have authorization defined, Is this okay? [y/N]: y
```

以外はデフォルトでいいです。

デプロイが終わったら
```sh
./export1.sh  # 実行にはjqとyqとaws cliが必要
```

で、APIのURLを `.export.sh` に書き出してください。


# テストの実行

```sh
./run_test.sh     # Step Functionの起動
./result_test.sh  # 起動して10秒以内に呼ぶと"RUNNING"になる
sleep 10
./result_test.sh  # Step Functionの結果の取得
```


# スタックの削除

```sh
sam delete --no-prompts
```
で消えます。
