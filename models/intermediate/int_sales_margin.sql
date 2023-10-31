SELECT 
    products_id, 
    date_date, 
    orders_id,
    revenue, 
    quantity, 
    purchase_price, 
    ROUND(CAST(s.quantity as float64)*CAST(p.purchase_price as float64),2) AS purchase_cost,
    CAST(s.revenue as float64) - ROUND(CAST(s.quantity as float64)*CAST(p.purchase_price as float64),2) AS margin,
    {{ margin_percent('s.revenue', 's.quantity*CAST(p.purchase_price AS FLOAT64)') }} as margin_percent 
FROM {{ref("stg_raw__sales")}} s
LEFT JOIN {{ref("stg_raw__product")}} p 
	USING (products_id)





      