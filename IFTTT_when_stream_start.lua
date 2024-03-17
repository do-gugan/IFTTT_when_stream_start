obs = obslua
source_name = ""
prefix = ""
suffix = ""

-- Script hook for defining the script description
function script_description()
   return [[
配信開始と終了時にIFTTTのWebhooksサービスを使って通知を送信するスクリプトです。
KeyはIFTTTのWebhooksサービスを使って取得してください。
イベント名はstream_startedとstream_stoppedの2つを作成してください。
システムにcurlがインストールされている必要がありますが、最新のWindows、macOSなら入っていると思います。

by do-gugan
   ]]
end

-- 設定項目の作成
function script_properties()
    local props = obs.obs_properties_create()
    obs.obs_properties_add_text(props, "key", "Key", obs.OBS_TEXT_DEFAULT)

    return props
end

-- 起動時に実行
function script_load(settings)
    obs.obs_frontend_add_event_callback(function(event) handle_event(event,settings) end)
end

function handle_event(event,settings)
    if event == obs.OBS_FRONTEND_EVENT_STREAMING_STARTED then
       obs.script_log(obs.LOG_INFO, "配信を開始しました。")
       local event_name = "stream_started"
       send_webhook("stream_started",settings)
    elseif event == obs.OBS_FRONTEND_EVENT_STREAMING_STOPPED then
       obs.script_log(obs.LOG_INFO, "配信を終了しました。") 
       send_webhook("stream_stopped",settings)
    end
end

function send_webhook(event_name,settings)
    -- Webhookのリクエストを送信
    local url = "https://maker.ifttt.com/trigger/"..event_name.."/json/with/key/"..obs.obs_data_get_string(settings, "key")
    local command = 'curl -X POST -H "Content-Type: application/json" "' .. url .. '"'
    os.execute(command)
end
