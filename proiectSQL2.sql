WITH FirstPurchase AS (
    SELECT 
        CustomerId,
        MIN(InvoiceDate) AS FirstDate
    FROM dbo.Invoice
    GROUP BY CustomerId
),
CustomerCohorts AS (
    SELECT 
        i.CustomerId,
        FORMAT(f.FirstDate, 'yyyy-MM') first_month_order,
        DATEDIFF(month, f.FirstDate, i.InvoiceDate) months_comeback
    FROM dbo.Invoice i
    JOIN FirstPurchase f ON i.CustomerId = f.CustomerId
),
CohortCounts AS (
    SELECT 
        first_month_order,
        months_comeback,
        COUNT(DISTINCT CustomerId) clients
    FROM CustomerCohorts
    GROUP BY first_month_order, months_comeback
)
SELECT 
    first_month_order fmo,
    months_comeback mcbk,
    clients cl,
    MAX(clients) OVER (PARTITION BY first_month_order) cohort_size,
    FORMAT(CAST(clients AS FLOAT) / MAX(clients) OVER (PARTITION BY first_month_order), 'P2') retention_rate
FROM CohortCounts
ORDER BY fmo, mcbk;

--Implementarea unui sistem de MysteryBox la un pret special pentru clientii care nu au plasat nicio comanda in ultimele 3 luni
--Implementarea unui program de loialitate de tip Loyalty Club cu praguri progresive de reducere (Bronze 10%, Silver 25%, Gold 50%, Premium 70%)
--Implementarea unui sistem care utilizeaza istoricul de cumparaturi pentru a afisa clientilor sugestii personalizate 