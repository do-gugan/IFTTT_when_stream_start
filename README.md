# IFTTT_when_stream_start
LUA script for OBS Studio. it hit the webhook of IFTTT, when stream start/end.

OBS Studio向けのLUAスクリプトです。配信開始／終了時にIFTTTのWebHookを叩き、家電のコントロールや通知、メール送信など様々な操作を行うためのものです。
SwitchBot経由でライトをオン／オフするために作りました。

IFTTTでWebHookサービスを設定し、Keyを取得してスクリプトの設定画面に保存してください。
開始と終了それぞれにアプレットを作成し、WebHookイベント名はそれぞれ「stream_started」と「stream_stopped」とします。
（2024年3月現在、IFTTTは無料プランでも2つのアプレットが使えます。）
