echo "Load Test Starting for 5 min..."

iter=0

while [ $iter -le 30 ]; do
    curl -o /dev/null -s -w "%{http_code}\n" -d  '{"id":"510a0d7e-8e83-4193-b483-e27e09ddc34d"}' -H "Content-Type: application/json" -X POST CARTS_URL_PLACEHOLDER
    ((iter+=1))
    echo $iter
done

echo "Load Test Completed"