Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004E68C0B
	for <regressions@lists.linux.dev>; Sun,  5 Nov 2023 13:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAesXxrA"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1cc394f4cdfso23374895ad.0
        for <regressions@lists.linux.dev>; Sun, 05 Nov 2023 05:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699191493; x=1699796293; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+e1/WOaxhHOYumCJGHxW4yo1K4Axe3NoWi7Y58Yuot4=;
        b=QAesXxrAsqzgTkArhUc4eGPmDTmg/pXqgFelGWjO6RQZkt3hVM2mp3eAaQkrPfJHpa
         PRHUPN9XQfOaXb6PXZ80eLbO23u2IZkH3W/SXwZjD+Mwa68M1HFjoBeX/+61m0K5w7FQ
         msGIa/TYTH7T6eRDZdD2EsQ1SBV3IT4d4PTTFTVuT/T8Y+JVuX6UEx6snWWWBx1m5uAO
         LFEVAUFpgn0WooAh+DxaBOWDGXxhCTkxqjS/UcyQx/J7W1wEeBOx+bMIIUnGpzj0k6Kc
         PQec7CzSpNFGjXPb+NpsiP+o+/xJhaxL+lpEdIRdehr95sVzwLzPRGs1M0MkqjnF0GHG
         ywpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699191493; x=1699796293;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+e1/WOaxhHOYumCJGHxW4yo1K4Axe3NoWi7Y58Yuot4=;
        b=gmHnEXxiOtlxQwAX0cG0nCCHccLEVafTJViuMuU1YBvRuG4qXmwJD7VON0KQrHbsKW
         JD80W47HBNnU9jbzozSt3xFUIOppkL0cUKzGO5wJhiZaX5oI5PtP8UlyyZzIRDb4sVEQ
         HtXPOSpqduQnxDNWvuNJs80w/CdRk3tSpFjfQpwIl4VUZpRREK/JquXj3NbMoRuUNYza
         khJHJr+CTjdVR5Hvfh9mMifWf9yEtgQA+Pj1UeHabL8/YoD0K8fFpdZC4UBOVRKmUYyZ
         zYo1hMSxntCgGlwsjI3r1LzKyy6jYqmNA957KKGz8gOcAOmDBK5C6Slgxt5tgBH6uwtf
         aGFg==
X-Gm-Message-State: AOJu0YwAWGpOvKtN7ejYvnp7Dp6BfpIcHqmhC81sAa/9ScBWH9GRCPk6
	TVesEUNZrHAIbwYPLS9zplc=
X-Google-Smtp-Source: AGHT+IGnOY6SoMqJljQH1E5l1ttLw6XBsY2utpcSB80AvJ/n5Hb02ZhuAlejb948Pgt1LIqsyv0Xkg==
X-Received: by 2002:a17:903:244b:b0:1cc:60ca:8f24 with SMTP id l11-20020a170903244b00b001cc60ca8f24mr19126894pls.45.1699191493169;
        Sun, 05 Nov 2023 05:38:13 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id j13-20020a170902c3cd00b001c9cc44eb60sm4216389plj.201.2023.11.05.05.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Nov 2023 05:38:12 -0800 (PST)
Message-ID: <14e3c405-5f80-4b73-b291-e84bdd6b240f@gmail.com>
Date: Sun, 5 Nov 2023 20:38:07 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Input Devices <linux-input@vger.kernel.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Jiri Kosina <jkosina@suse.cz>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Mauricio Collares <mauricio@collares.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: [amd-sfh] Interrupt disabling (b300667b) disables working HP
 ProBook x360 435 G7 accelerometer
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> I have a HP ProBook x360 435 G7 (Ryzen 4700U). On GNOME Wayland with
> the Screen Autorotate extension
> (https://extensions.gnome.org/extension/4191/screen-autorotate/), I
> confirmed by bisection that b300667b33b2b5a2c8e5f8f22826befb3d7f4f2b
> caused autorotation to stop working.
> 
> More specifically, before this commit (on aa0b724a2bf041036e56cbb3b4b3afde7c5e7c9e):
> 
> * `sudo iio-sensor-proxy -v -r` stays running (doesn't exit immediately) and prints nothing
> * `monitor-sensor` starts up by saying "=== Has accelerometer (orientation: normal)" and prints "    Accelerometer orientation changed: bottom-up" when I physically rotate the screen.
> * `udevadm info --export-db` contains the accelerometer/gyroscope sensor info I've pasted in the attachment.
> 
> After b300667b33b2b5a2c8e5f8f22826befb3d7f4f2b:
> 
> * `sudo iio-sensor-proxy -v -r` exits immediately.
> * `monitor-sensor` prints "    Waiting for iio-sensor-proxy to appear" on startup and does nothing when I rotate the screen.
> * The sensors in the attachment are no longer listed in `udevadm info --export-db`.
> * The `hid_sensor_gyro_3d` and `hid_sensor_accel_3d` kernel modules are no longer loaded automatically, and loading them does nothing.
> 
> Reverting b300667b33b2b5a2c8e5f8f22826befb3d7f4f2b on top of 6.6 also makes screen autorotation work again. Whenever screen autorotation works, `iio_generic_buffer --device-num 2 -A -c 100` reports good accelerometer values.
> 
> (The following is essentially the contents of bug #212625 comment #46)
> 
>> If you revert that commit on top of 6.6 does it start working?  Also; can
>> you still get into the deepest s2idle sleep state in 6.6 with it reverted? 
>> You can check with /sys/power/suspend_stats/last_hw_sleep.
> 
> I don't have a /sys/power/suspend_stats/last_hw_sleep file (tested on stock 6.6, as well as on 6.6 + revert of b300667b33b2b5a2c8e5f8f22826befb3d7f4f2b), but if I leave my computer idle for a while it enters standby and I see
> 
> Nov 03 08:47:29 hp kernel: PM: suspend entry (deep)
> 
> in journalctl, and the computer enters deep sleep (need to press power button to wake it up). Also, the content of /sys/power/mem_sleep is "s2idle [deep]". In bug ug #212615 I also attached the report produced by amd_s2idle.py run on stock 6.6 in case it is relevant (I can also attach it for 6.6 + revert if desired).
> 

See Bugzilla for the full thread and attached udevadm output.

Anyway, I'm adding this regression to regzbot:

#regzbot introduced: b300667b33b2b5 https://bugzilla.kernel.org/show_bug.cgi?id=218104

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218104

-- 
An old man doll... just what I always wanted! - Clara
