# PowerShell script to update all HTML files with blue/yellow theme
$files = @(
    "asia-tour.html",
    "educational-tour.html",
    "europe-tour.html",
    "india-east.html",
    "india-north.html",
    "india-south.html",
    "india-west.html",
    "middle-east-tour.html",
    "oceania-tour.html",
    "specialty-tour.html",
    "world-tour.html"
)

$tailwindConfigOld = @"
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Outfit', 'sans-serif'],
                        serif: ['Playfair Display', 'serif'],
                    },
                    colors: {
                        primary: {
                            50: '#f0fdf4',
                            100: '#dcfce7',
                            500: '#22c55e',
                            600: '#16a34a',
                            700: '#15803d',
                            800: '#166534',
                            900: '#14532d',
                        },
                        accent: {
                            400: '#facc15',
                            500: '#eab308',
                        }
                    }
                }
            }
        }
    </script>
"@

$tailwindConfigNew = @"
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Outfit', 'sans-serif'],
                        serif: ['Playfair Display', 'serif'],
                    },
                    colors: {
                        primary: {
                            50: '#eff6ff',
                            100: '#dbeafe',
                            500: '#3b82f6',
                            600: '#2563eb',
                            700: '#1d4ed8', // Deep Blue
                            800: '#1e40af',
                            900: '#1e3a8a',
                        },
                        accent: {
                            400: '#fbbf24', // Yellow
                            500: '#f59e0b',
                        }
                    }
                }
            }
        }
    </script>
"@

$customStylesNew = @"
    <style>
        /* Custom Styles for things Tailwind doesn't cover easily */
        .glass-nav {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            transition: all 0.3s ease;
        }

        .hero-overlay {
            background: linear-gradient(to bottom, rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.1));
        }

        .dropdown-menu {
            opacity: 0;
            visibility: hidden;
            transform: translateY(10px);
            transition: all 0.3s ease;
        }

        .group:hover .dropdown-menu {
            opacity: 1;
            visibility: visible;
            transform: translateY(0);
        }

        .card-hover {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card-hover:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(37, 99, 235, 0.2), 0 10px 10px -5px rgba(37, 99, 235, 0.1);
        }

        /* New Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideInLeft {
            from {
                opacity: 0;
                transform: translateX(-30px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(30px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
        }

        @keyframes bounce {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-10px);
            }
        }

        @keyframes shimmer {
            0% {
                background-position: -1000px 0;
            }
            100% {
                background-position: 1000px 0;
            }
        }

        @keyframes rotate {
            from {
                transform: rotate(0deg);
            }
            to {
                transform: rotate(360deg);
            }
        }

        .animate-fade-in {
            animation: fadeIn 0.6s ease-out forwards;
        }

        .animate-slide-left {
            animation: slideInLeft 0.6s ease-out forwards;
        }

        .animate-slide-right {
            animation: slideInRight 0.6s ease-out forwards;
        }

        .animate-pulse-slow {
            animation: pulse 3s ease-in-out infinite;
        }

        .animate-bounce-slow {
            animation: bounce 2s ease-in-out infinite;
        }

        .bg-shimmer {
            background: linear-gradient(90deg, #3b82f6 0%, #fbbf24 50%, #3b82f6 100%);
            background-size: 1000px 100%;
            animation: shimmer 3s linear infinite;
        }

        /* Hover glow effects */
        .hover-glow-blue:hover {
            box-shadow: 0 0 20px rgba(59, 130, 246, 0.6);
            transition: box-shadow 0.3s ease;
        }

        .hover-glow-yellow:hover {
            box-shadow: 0 0 20px rgba(251, 191, 36, 0.6);
            transition: box-shadow 0.3s ease;
        }

        /* Stagger animation delays */
        .delay-100 {
            animation-delay: 0.1s;
        }

        .delay-200 {
            animation-delay: 0.2s;
        }

        .delay-300 {
            animation-delay: 0.3s;
        }

        .delay-400 {
            animation-delay: 0.4s;
        }
    </style>
"@

foreach ($file in $files) {
    $filePath = Join-Path $PSScriptRoot $file
    
    if (Test-Path $filePath) {
        Write-Host "Processing $file..." -ForegroundColor Yellow
        
        $content = Get-Content $filePath -Raw -Encoding UTF8
        
        # Replace Tailwind config
        $content = $content -replace [regex]::Escape($tailwindConfigOld), $tailwindConfigNew
        
        # Replace styles section - match any <style>...</style> block
        $content = $content -replace '(?s)<style>.*?</style>', $customStylesNew
        
        # Replace green with blue colors
        $content = $content -replace 'bg-green-50', 'bg-blue-50'
        $content = $content -replace 'text-green-', 'text-blue-'
        $content = $content -replace 'border-green-', 'border-blue-'
        $content = $content -replace 'hover:bg-green-', 'hover:bg-blue-'
        $content = $content -replace 'hover:text-green-', 'hover:text-blue-'
        $content = $content -replace 'from-green-', 'from-blue-'
        $content = $content -replace 'to-green-', 'to-blue-'
        
        # Save the file
        [System.IO.File]::WriteAllText($filePath, $content, [System.Text.Encoding]::UTF8)
        
        Write-Host "✓ Updated $file" -ForegroundColor Green
    } else {
        Write-Host "✗ File not found: $file" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "All files updated successfully!" -ForegroundColor Cyan
