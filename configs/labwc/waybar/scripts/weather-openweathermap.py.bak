#!/usr/bin/env python3
import json
import requests
import os
import sys

# ===== CONFIGURATION =====
API_KEY = "4bc7314973dc3e4ddf3bc80bad6fecd3"  # ← Put your spare key here
LAT = "-27.7333"       
LON = "27.0667"        
UNITS = "metric"       
LANG = "en"         
# =========================

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
CACHE_FILE = os.path.join(SCRIPT_DIR, "weather-cache.json")
CACHE_DURATION = 300  # Cache duration in seconds (5 min)

def get_cached_data():
    """Load cached weather if still valid."""
    try:
        if os.path.exists(CACHE_FILE):
            with open(CACHE_FILE, 'r') as f:
                cache = json.load(f)
            import time
            if time.time() - cache.get('timestamp', 0) < CACHE_DURATION:
                return cache.get('data')
    except:
        pass
    return None

def save_cache(data):
    """Save weather data to cache."""
    try:
        import time
        with open(CACHE_FILE, 'w') as f:
            json.dump({'timestamp': time.time(), 'data': data}, f)
    except:
        pass

def wind_direction(deg):
    """Convert degrees to cardinal direction."""
    dirs = ["N","NNE","NE","ENE","E","ESE","SE","SSE","S","SSW","SW","WSW","W","WNW","NW","NNW"]
    try:
        return dirs[int((float(deg) + 11.25) / 22.5) % 16]
    except:
        return "?"

def weather_icon(code):
    """Map OpenWeatherMap icon codes to emojis."""
    icons = {
        200: "⛈️", 201: "⛈️", 202: "⛈️",  # Thunderstorm
        300: "🌦️", 301: "🌦️", 302: "🌧️",  # Drizzle
        500: "🌦️", 501: "🌧️", 502: "🌧️", 503: "🌧️", 504: "🌧️",  # Rain
        511: "🌨️",  # Snow
        600: "🌨️", 601: "🌨️", 602: "❄️",  # Snow
        701: "🌫️", 711: "🌫️", 721: "🌫️", 731: "🌫️", 741: "🌫️",  # Fog/Mist
        800: "☀️",   # Clear
        801: "🌤️", 802: "⛅", 803: "☁️", 804: "☁️",  # Clouds
    }
    return icons.get(code, "🌡️")

def main():
    # Try cache first
    data = get_cached_data()
    
    # If no valid cache, fetch from API
    if not data:
        try:
            url = f"https://api.openweathermap.org/data/2.5/weather?lat={LAT}&lon={LON}&appid={API_KEY}&units={UNITS}&lang={LANG}"
            resp = requests.get(url, timeout=10)
            resp.raise_for_status()
            data = resp.json()
            save_cache(data)
        except Exception as e:
            print(json.dumps({"text":"⚠️ Err","tooltip":f"API Error: {str(e)[:50]}"}))
            sys.exit(0)
    
    # Extract data safely
    try:
        w = data.get('weather', [{}])[0]
        m = data.get('main', {})
        wd = data.get('wind', {})
        loc = data.get('name', 'Unknown')
        country = data.get('sys', {}).get('country', '')
        
        temp = m.get('temp', 0)
        feels = m.get('feels_like', 0)
        humidity = m.get('humidity', 0)
        pressure = m.get('pressure', 0)
        
        wind_speed = wd.get('speed', 0)
        wind_deg = wd.get('deg', 0)
        wind_dir = wind_direction(wind_deg)
        
        icon = weather_icon(w.get('id', 800))
        desc = w.get('description', 'Unknown').title()
        
        # Build output
        output = {}
        output['text'] = f"{icon} {temp:.0f}°"
        
        tooltip = f"📍 {loc} {country}\n"
        tooltip += f"🌤️ {desc}\n"
        tooltip += f"\n🌡️ Temperature\n"
        tooltip += f"   Current: {temp:.1f}°{'C' if UNITS=='metric' else 'F'}\n"
        tooltip += f"   Feels Like: {feels:.1f}°{'C' if UNITS=='metric' else 'F'}\n"
        tooltip += f"   Humidity: {humidity}%\n"
        tooltip += f"   Pressure: {pressure} hPa\n"
        tooltip += f"\n💨 Wind\n"
        tooltip += f"   {wind_dir} ({wind_deg}°) {wind_speed:.1f} {'km/h' if UNITS=='metric' else 'mph'}\n"
        
        output['tooltip'] = tooltip
        
        print(json.dumps(output))
        
    except Exception as e:
        print(json.dumps({"text":"⚠️ Err","tooltip":f"Parse Error: {str(e)[:50]}"}))

if __name__ == "__main__":
    main()
