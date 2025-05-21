<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<!-- Chart.js Library -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        background-color: #f4f4f4;
        font-family: Arial, sans-serif;
    }

    .wrap {
        display: flex;
        min-height: 100vh;
    }

    .side {
        width: 240px;
        background: #151934;
        color: white;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        padding: 30px 20px;
    }

    .logo {
        font-size: 22px;
        font-weight: bold;
        color: #ae00ff;
        margin-bottom: 40px;
        text-align: center;
    }

    .nav {
        display: flex;
        flex-direction: column;
    }

    .nav a {
        color: white;
        text-decoration: none;
        padding: 12px 15px;
        border-radius: 8px;
        margin-bottom: 12px;
        transition: background 0.3s;
        font-size: 15px;
    }

    .nav a:hover,
    .nav a.active {
        background: #ae00ff;
        font-weight: bold;
    }

    .logout {
        background: #ae00ff;
        border: none;
        color: white;
        padding: 12px;
        width: 100%;
        border-radius: 8px;
        cursor: pointer;
        font-weight: bold;
        font-size: 15px;
        margin-top: 20px;
    }

    .main {
        flex: 1;
        padding: 40px 50px;
        background: #f4f4f4;
        width: 100%;
    }

    .main h2 {
        font-size: 26px;
        color: #333;
        margin-bottom: 30px;
    }

    .cards {
        display: flex;
        flex-wrap: wrap;
        gap: 30px;
        margin-bottom: 30px;
        justify-content: space-between;
    }

    .card {
        background: white;
        border-radius: 15px;
        padding: 25px;
        flex: 1 1 220px;
        min-width: 220px;
        box-shadow: 0 0 12px rgba(0, 0, 0, 0.05);
        text-align: center;
        transition: transform 0.2s ease;
    }

    .card:hover {
        transform: translateY(-5px);
    }

    .card-title {
        font-size: 16px;
        font-weight: 600;
        margin-bottom: 12px;
        color: #444;
    }

    .card-val {
        font-size: 28px;
        color: #6a0dad;
        font-weight: bold;
    }

    .chart-container {
        background: white;
        padding: 20px;
        border-radius: 15px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.08);
        width: 100%;
        margin-top: 30px;
    }

    .chart-title {
        margin-bottom: 15px;
        font-size: 20px;
        color: #6a0dad;
        text-align: center;
        font-weight: bold;
    }

    canvas#adminBarChart {
        width: 100% !important;
        height: auto !important;
    }

    @media (max-width: 768px) {
        .wrap {
            flex-direction: column;
        }

        .side {
            width: 100%;
            flex-direction: row;
            justify-content: space-around;
            padding: 20px;
        }

        .main {
            padding: 20px;
        }

        .cards {
            justify-content: center;
        }

        .card {
            width: 100%;
            max-width: 300px;
        }
    }
</style>
</head>
<body>

<div class="wrap">
    <!-- Sidebar -->
    <div class="side">
        <div>
            <div class="logo">Let's Connect</div>
            <div class="nav">
                <a class="active" href="${pageContext.request.contextPath}/admin">Dashboard</a>
                <a href="${pageContext.request.contextPath}/UpdateProduct">Product</a>
                <a href="${pageContext.request.contextPath}/Orders">Orders</a>
                <a href="${pageContext.request.contextPath}/ManageUser">Manage User</a>
            </div>
        </div>
        <form action="${pageContext.request.contextPath}/logout" method="post">
            <button class="logout">Log out</button>
        </form>
    </div>

    <!-- Main Content -->
    <div class="main">
        <h2>Dashboard</h2>

        <div class="cards">
            <div class="card">
                <div class="card-title">Total Product</div>
                <div class="card-val">${totalProducts}</div>
            </div>
            <div class="card">
                <div class="card-title">Total Customer</div>
                <div class="card-val">${totalUsers}</div>
            </div>
            <div class="card">
                <div class="card-title">Total Orders</div>
                <div class="card-val">${totalOrders}</div>
            </div>
        </div>

        <!-- Bar Chart Section -->
        <div class="chart-container">
            <div class="chart-title">Overview Bar Chart</div>
            <canvas id="adminBarChart"></canvas>
        </div>
    </div>
</div>

<script>
    const ctx = document.getElementById('adminBarChart').getContext('2d');

    const totalProducts = parseInt('${totalProducts}');
    const totalUsers = parseInt('${totalUsers}');
    const totalOrders = parseInt('${totalOrders}');

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Products', 'Customers', 'Orders'],
            datasets: [{
                label: 'Total Count',
                data: [totalProducts, totalUsers, totalOrders],
                backgroundColor: [
                    '#4e79a7',
                    '#4b1c76',
                    '#e15759'
                ],
                borderRadius: 6,
                borderSkipped: false
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        stepSize: 1,
                        color: '#333',
                        font: {
                            size: 13
                        }
                    }
                },
                x: {
                    ticks: {
                        color: '#333',
                        font: {
                            size: 13
                        }
                    }
                }
            },
            plugins: {
                legend: {
                    display: false
                }
            }
        }
    });
</script>

</body>
</html>
