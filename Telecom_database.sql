CREATE VIEW ManagementDashboard AS
SELECT
    (SELECT COUNT(*) FROM Customer WHERE CustomerStatus='Active') AS ActiveCustomers,
    (SELECT COUNT(*) FROM Subscription WHERE Status='Active') AS ActiveSubscriptions,
    (SELECT COUNT(*) FROM Complaint WHERE Status='Open') AS OpenComplaints,
    (SELECT COUNT(*) FROM Bill WHERE Status='Unpaid') AS UnpaidBills,
    (SELECT COALESCE(SUM(AmountPaid),0) FROM Payment) AS TotalRevenue;
    
    SELECT * FROM ManagementDashboard;