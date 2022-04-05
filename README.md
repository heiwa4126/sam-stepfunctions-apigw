# sam-stepfunctions-apigw

API Gateway経由でStep Functionsを起動するサンプル。

# 概要

ペイロードつけて/runを呼ぶと
Step Functionsのstart-executionが実行されて
executionArnが返ってくる。

executionArnを引数に/resultを時々呼ぶと
lambdaでdescribe-executionが実行されてて、
(とりあえず最初はAPIの出力をそのまま帰す)
結果がSUCCESSなら答えが得られる。
結果がFAILEDのときもありうる。

これは簡易的なもの。

1000個程度のトランザクションはStep Functionsに保持されるらしい。
それ以上残したい場合はdynamoDBに入れる(TODO)

# デプロイ

```sh
sam build
sam deploy --guided  # --guidedは最初の1回
```

`sam deploy --guided` は

```
HelloWorldFunction may not have authorization defined, Is this okay? [y/N]: y
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
./result_test.sh  # Step Functionの結果の取得
```


# スタックの削除

```sh
sam delete --no-prompts
```
で消えます。
