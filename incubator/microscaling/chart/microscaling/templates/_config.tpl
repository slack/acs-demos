{{- define "microscaling-env" -}}
- name: AZURE_STORAGE_ACCOUNT_NAME
  valueFrom:
    configMapKeyRef:
      name: microscaling-config
      key: AZURE_STORAGE_ACCOUNT_NAME
- name: AZURE_STORAGE_ACCOUNT_KEY
  valueFrom:
    configMapKeyRef:
      name: microscaling-config
      key: AZURE_STORAGE_ACCOUNT_KEY
- name: AZURE_STORAGE_QUEUE_NAME
  valueFrom:
    configMapKeyRef:
      name: microscaling-config
      key: AZURE_STORAGE_QUEUE_NAME
- name: AZURE_STORAGE_SUMMARY_TABLE_NAME
  valueFrom:
    configMapKeyRef:
      name: microscaling-config
      key: AZURE_STORAGE_SUMMARY_TABLE_NAME
- name: ANALYZER_SLEEP_TIME
  valueFrom:
    configMapKeyRef:
      name: microscaling-config
      key: ANALYZER_SLEEP_TIME
- name: SLACK_INFO_CHANNEL
  valueFrom:
    configMapKeyRef:
      name: microscaling-config
      key: SLACK_INFO_CHANNEL
- name: SLACK_WEBHOOK
  valueFrom:
    configMapKeyRef:
      name: microscaling-config
      key: SLACK_WEBHOOK
{{- end -}}