SELECT name, set_timestamp, value, origin FROM user_attributes WHERE app_id=? ORDER BY rowid LIMIT 1001
[
  None,
  False, 
  'user_attributes', 
  [
    'name', 
    'set_timestamp',
    'value',
    'origin'
  ], 
  'app_id=?', 
  [
    'com.telkom.tracencare'
  ], 
  None,
  None,
  'rowid',
  '1001', 
  None
] 

SELECT app_instance_id, gmp_app_id, resettable_device_id_hash, last_bundle_index, last_bundle_start_timestamp, last_bundle_end_timestamp, app_version, app_store, gmp_version, dev_cert_hash, measurement_enabled, day, daily_public_events_count, daily_events_count, daily_conversions_count, config_fetched_time, failed_config_fetch_time, app_version_int, firebase_instance_id, daily_error_events_count, daily_realtime_events_count, health_monitor_sample, android_id, adid_reporting_enabled, ssaid_reporting_enabled, admob_app_id, dynamite_version, safelisted_events, ga_app_id FROM apps WHERE app_id=?', 

select count(1) > 0 from raw_events where realtime = 1

'SELECT app_id, origin, name, value, active, trigger_event_name, trigger_timeout, timed_out_event, creation_timestamp, triggered_event, triggered_timestamp, time_to_live, expired_event FROM conditional_properties WHERE active=0 and app_id=? and trigger_event_name=? and abs(? - creation_timestamp) <= trigger_timeout ORDER BY rowid LIMIT 1001'