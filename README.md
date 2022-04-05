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





[Step Functions ステートを作成マシンLambda の使用 - AWS Step Functions](https://docs.aws.amazon.com/ja_jp/step-functions/latest/dg/tutorial-creating-lambda-state-machine.html)
に出てくるリソースをSAMで作成するサンプル。

CFnの AWS::StepFunctions::StateMachine ではなく
SAMの AWS::Serverless::StateMachine を使っている。

それですっきり短くなったか、というとそうでもない感じ。
(ポリシーをインラインにしたので、見た目4つ分減っている)

実際には使用していないS3が1個ある。

デプロイ後のテストの方法は
上記URLを参照。
