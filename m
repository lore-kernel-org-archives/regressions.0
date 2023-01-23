Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D43D880A
	for <regressions@lists.linux.dev>; Mon, 23 Jan 2023 20:44:46 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id a1-20020a056830008100b006864df3b1f8so8061878oto.3
        for <regressions@lists.linux.dev>; Mon, 23 Jan 2023 12:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VrjOO32mNE4cQXTG/5bnvMEvE4xDptS6D0NuFaAh9As=;
        b=HbX7geOV2qLjM/wbfb+xfLGQo4tolO4JlkeMuLh/8dMK/M6VE0LZIRr0ESlFwU/y8G
         ysyLBMC0rfci65+5JvvVwnB0NWkDnX/+EIWKfMjtm2D9pPJh3I57lS1getiVFThkX/Bn
         8B/cEj7D1vHrsBZqXamdIC5E6Sk1McbSoRbHe3rajFzGQ4MHKEpccOI7MBxaBsGvqbm4
         16W6OvWg3BsLnf33pNAXA9mN/QLqSlYo7mrnY0RDdbD8/hcMs36OKxKCIIjeGNtsr6L9
         AWfCIJLZvX89PemsOM37i26aOknb7shOAKLgV2Omg6jrh/3eSBdG8kk7ImAr/i7JMvHU
         O0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VrjOO32mNE4cQXTG/5bnvMEvE4xDptS6D0NuFaAh9As=;
        b=Ajh7AcdRnSHtwOvig1uQrE7WBVEOObtRFdUFifBJpfqR3cG6UaeaAtUOddyvdEXRpq
         DFTCuMv7KMz01c49QKSljGmQ0R5gMNmHoMZbluNoaRtBFsjS8AtCatnwyVu2n0E1a7XG
         Sia8xjrZSA9fKHsVANylAzC+7mWJRMvO71vclbvq9ZJsR4A5uJwlAVJx7Zab6iTrgLF9
         jAjtrDk9v0fracUW/ixovWSLSL4DzTofq12nNSdw8aH/s1WU2V2BMumsIMuM8kcrkgTz
         xdonMoeKI2LMORhGSJGRz39uK/cSTWSnHPFYTzgb28nCE4nFyXAcRMhLXPHyVwDgW1Vu
         Eyrw==
X-Gm-Message-State: AFqh2kp5ukFsDDabbRPd/8b5lsapumlvetJfetMXD1EQUPHP9KnHVOsG
	iW0Y14dIX6F1KVyxIHBGenVSaM0alxi0smIPlvU=
X-Google-Smtp-Source: AMrXdXs3l3gUfztHj78uyC3hU4p/JrALyEzNHga+xl9JqUTRvagHylQnRrXqWn2grNZbWu234FB+zUHhAZbWnPn13fg=
X-Received: by 2002:a05:6830:26d3:b0:66e:c78e:9aca with SMTP id
 m19-20020a05683026d300b0066ec78e9acamr1344994otu.196.1674506685568; Mon, 23
 Jan 2023 12:44:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sasa Ostrouska <casaxa@gmail.com>
Date: Mon, 23 Jan 2023 21:44:34 +0100
Message-ID: <CALFERdzKUodLsm6=Ub3g2+PxpNpPtPq3bGBLbff=eZr9_S=YVA@mail.gmail.com>
Subject: Google Pixelbook EVE, no sound in kernel 6.1.x
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Lukasz Majczak <lma@semihalf.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi all, sorry if I put somebody in CC who is not the correct one. I
have a google pixelbook and using it with Fedora 37.
The last few kernels supplied by fedora 37, 6.1.6, 6.1.7 but also some
earlier have no working sound.
I see the last kernel for me with working sound is 6.0.18.
On my pixelbook this is showing in dmesg:

[    7.623064] snd_soc_skl 0000:00:1f.3: ASoC: no sink widget found
for AEC Capture
[    7.623070] snd_soc_skl 0000:00:1f.3: ASoC: Failed to add route
echo_ref_out cpr 7 -> direct -> AEC Capture
[    7.623083] kbl_r5514_5663_max kbl_r5514_5663_max: ASoC: Parent
card not yet available, widget card binding deferred
[    8.090716] NET: Registered PF_QIPCRTR protocol family
[    8.273905] rt5663 i2c-10EC5663:00: sysclk < 384 x fs, disable i2s asrc
[    8.275043] HDMI HDA Codec ehdaudio0D2: hdac_hdmi_present_sense:
disconnect for pin:port 5:0
[    8.275165] HDMI HDA Codec ehdaudio0D2: hdac_hdmi_present_sense:
disconnect for pin:port 6:0
[    8.275291] HDMI HDA Codec ehdaudio0D2: hdac_hdmi_present_sense:
disconnect for pin:port 7:0
[    8.278569] input: kbl-r5514-5663-max Headset Jack as
/devices/platform/kbl_r5514_5663_max/sound/card0/input30
[    8.278771] input: kbl-r5514-5663-max HDMI/DP,pcm=6 Jack as
/devices/platform/kbl_r5514_5663_max/sound/card0/input31
[    8.278875] input: kbl-r5514-5663-max HDMI/DP,pcm=7 Jack as
/devices/platform/kbl_r5514_5663_max/sound/card0/input32
[    8.891244] iwlwifi 0000:01:00.0: Applying debug destination EXTERNAL_DRAM
[    8.902009] r8152 2-2.1:1.0 enp0s20f0u2u1: carrier on
[    8.977070] iwlwifi 0000:01:00.0: Applying debug destination EXTERNAL_DRAM
[    8.978496] iwlwifi 0000:01:00.0: FW already configured (0) - re-configuring
[    8.991112] IPv6: ADDRCONF(NETDEV_CHANGE): enp0s20f0u2u1: link becomes ready
[    9.027053] iwlwifi 0000:01:00.0: Applying debug destination EXTERNAL_DRAM
[    9.112264] iwlwifi 0000:01:00.0: Applying debug destination EXTERNAL_DRAM
[    9.113562] iwlwifi 0000:01:00.0: FW already configured (0) - re-configuring
[   14.579846] HDMI HDA Codec ehdaudio0D2: No connections found for pin:port 5:0

Can please somebody help with this issue ?
Also in the latests kernels the shutdown stops and the machine does
not halt. It stays forever waiting for something to happen it seems.

If you need more details please dont hesitate to contact me. And
please CC me as I am not subscribed in these miling lists.

Rgds
Sasa
