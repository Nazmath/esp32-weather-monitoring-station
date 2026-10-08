% ESP32 Weather Monitoring Station
% Send an email when temperature is above 35 C.

channelID = 3520109;

% ThingSpeak Alerts API Key
% Do not upload your real key to GitHub.
alertApiKey = 'YOUR_THINGSPEAK_ALERTS_API_KEY';

alertUrl = "https://api.thingspeak.com/alerts/send";

options = weboptions("HeaderFields", ...
    ["ThingSpeak-Alerts-API-Key", alertApiKey]);

alertSubject = "ESP32 Weather Station - Extreme Temperature Alert";

% Read latest temperature from Field 1
temperatureData = thingSpeakRead(channelID, ...
    'Fields', 1, ...
    'NumPoints', 1);

if isempty(temperatureData)

    fprintf("No temperature data received.\n");

else

    temperature = temperatureData(end);

    fprintf("Latest temperature: %.1f C\n", temperature);

    if temperature > 35

        alertBody = sprintf( ...
            "WARNING! Extreme temperature detected. Temperature: %.1f C. Threshold: 35 C.", ...
            temperature);

        try

            webwrite(alertUrl, ...
                "body", alertBody, ...
                "subject", alertSubject, ...
                options);

            fprintf("Temperature alert email sent.\n");

        catch exception

            fprintf("Failed to send email: %s\n", ...
                exception.message);

        end

    else

        fprintf("Temperature is normal.\n");

    end

end
