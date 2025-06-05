FROM fluent/fluentd:v1.16-1

USER root

# 필요한 플러그인 설치(순서대로로)
# 로그의 태그를 조건에 따라 재작성할 수 있게 해주는 플러그인
# 로그를 Amazon S3에 저장할 수 있게 해주는 출력 플러그인
# 다른 Fluentd 또는 Fluent Bit로부터 로그를 수신하는 입력 플러그인
RUN gem install fluent-plugin-rewrite-tag-filter --no-document && \ 
    gem install fluent-plugin-s3 --no-document && \
    gem install fluent-plugin-forward --no-document

USER fluent