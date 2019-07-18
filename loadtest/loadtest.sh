echo "Load Test Starting for 5 min..."

i=0

while [ $i -le 25 ]
do
    curl -o /dev/null -s -w "%{http_code}\n" -d  '{"id":"510a0d7e-8e83-4193-b483-e27e09ddc34d"}' -H "Content-Type: application/json" -X POST CARTS_URL_PLACEHOLDER
    curl -o /dev/null -s -w "%{http_code}\n" -d  '{"id":"510a0d7e-8e83-4193-b483-e27e09ddc34d"}' -H "Content-Type: application/json" -X POST CARTS_URL_PLACEHOLDER
    curl -o /dev/null -s -w "%{http_code}\n" -d  '{"id":"510a0d7e-8e83-4193-b483-e27e09ddc34d"}' -H "Content-Type: application/json" -X POST CARTS_URL_PLACEHOLDER
    curl -o /dev/null -s -w "%{http_code}\n" -d  '{"id":"510a0d7e-8e83-4193-b483-e27e09ddc34d"}' -H "Content-Type: application/json" -X POST CARTS_URL_PLACEHOLDER
    curl -o /dev/null -s -w "%{http_code}\n" -d  '{"id":"510a0d7e-8e83-4193-b483-e27e09ddc34d"}' -H "Content-Type: application/json" -X POST CARTS_URL_PLACEHOLDER

    sleep 2

    i=$(($i + 1))
done

echo "Load Test Completed"