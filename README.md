# IFTTT_when_stream_start
LUA script for OBS Studio. it hit the webhook of IFTTT, when stream start/end.

OBS Studio向けのLUAスクリプトです。配信開始／終了時にIFTTTのWebHookを叩き、家電のコントロールや通知、メール送信など様々な操作を行うためのものです。
SwitchBot経由でライトをオン／オフするために作りました。

## 必要なもの
- IFTTTアカウント（無料プランでも2つのアプレットが作れるので、今回の用だけなら無料でも足ります）
- IFTTTから制御できるもの（SwitchBotやNature Remoなどスマート家電コントローラーなど。通知やメールを送るだけなら不要）
- IFTTTのWebHooksサービスの固有Key（URLの最後の文字列）

## 手順概要
IFTTTでWebHookサービスを設定し、Keyを取得してスクリプトの設定画面に保存してください。
開始と終了それぞれにアプレットを作成し、WebHookイベント名はそれぞれ「stream_started」と「stream_stopped」とします。
（2024年3月現在、IFTTTは無料プランでも2つのアプレットが使えます。）

Luaのhttp用ライブラリをインストールする手間をなくすため、最近のOSにプレインストールされているcurlを使っています。Linuxは当然として、Windowsなら10以降、macOSでも最近のバージョンなら入っていると思います。環境によってはパスを指定する必要があるかも知れません。Windows 11ではなにもしなくても使えました。

詳しい解説はブログをご覧ください。

https://do-gugan.com/~furuta/archives/2024/03/obs-studio_ifttt.html
