Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2526F154B0
	for <regressions@lists.linux.dev>; Tue, 30 May 2023 12:50:47 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b01d912a76so25905425ad.2
        for <regressions@lists.linux.dev>; Tue, 30 May 2023 05:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685451046; x=1688043046;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42TjERYpl34ezVm6gTZ6MgxR9jYfte5EhPsCPBAMTK8=;
        b=OdjPG1DSwHjTLkO4frX1ZQ9iHRRuMfJuphaUqBbNt/DbI1cEa2eOe3sXkQpEg3Lqfa
         xT3KMZQHiL4WbaJHNUMnwJOVvbANilzfSAWdJfvegrzvElBB89TRQd/Ny42kxH7lwRvW
         7XcJdBvsHZyXU80G7WTcS+HBEYsox3v68rE7/CF7YFG5SURtH4XhHC8fZLyGN1Qg1885
         AKB/Fse2eNWjS+I1vDsDjoc9B9S4+pdNjUqEp8f1AVKGZwuRrovA9PZsVHewsKJ3jGj/
         HJI9/4CTmKwVtCHxy1/NqgCWslJDcrjBZAO5zPIy6ZfdxeTlNuV90wGCyd6CMWAhVk+R
         7rAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685451046; x=1688043046;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=42TjERYpl34ezVm6gTZ6MgxR9jYfte5EhPsCPBAMTK8=;
        b=iKPmaY9h4waByECnLCmeGp/So9fl3fUMvOli6H+/b10dQPSmszHlPh+zPB3d/mg8HX
         kYp9M96UeVuMfhZMo3zfEbX6wu5LVFwd2795d6ouLG1iwSNKcv6a2O6Lz0/vyKF9BXIR
         b6iVV0P2vPGt5oW7LjtKLR0YmzYTO2ZvzeiOOBv/y7R1A2lsTSoVYUKC88XhpvO9KgiD
         D5Z+tRbZmhXhwBkCUVyR6ajYZdgGENnl4A3Lgjn127aZuOoc7cwdGMd4kj5Tlh800c/9
         qBsXDGwrUed+DCEiY+W1nvlo1kvI1uVEORFoBJy8+FbzD9Ze3aMNXmYEMgdEpx7S2mMf
         ZRow==
X-Gm-Message-State: AC+VfDwY0hkqyQQuGfr137fapWf1HLrM9qzLq3p5xTYkZ3LRfv82CV3n
	h3j8k1bOJktyBwtK/3tZes8=
X-Google-Smtp-Source: ACHHUZ48xTw2/AxpJYUFWYho6qBeQsi813yiiCGQz8Au8VSU5pflTs59kBiSuqjTi50nCTVoXF4NZw==
X-Received: by 2002:a17:902:8504:b0:1a5:dfd:d167 with SMTP id bj4-20020a170902850400b001a50dfdd167mr2056892plb.8.1685451046491;
        Tue, 30 May 2023 05:50:46 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-12.three.co.id. [180.214.232.12])
        by smtp.gmail.com with ESMTPSA id ik29-20020a170902ab1d00b001b0218651a6sm7093717plb.178.2023.05.30.05.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 05:50:45 -0700 (PDT)
Message-ID: <dbb825e9-f92b-6c17-c1d7-b7e6cfb9b474@gmail.com>
Date: Tue, 30 May 2023 19:50:41 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux ALSA Subsystem Development <alsa-devel@alsa-project.org>,
 Linux USB <linux-usb@vger.kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Apple USB-C 3.5mm dongle cannot output 41000hz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Overview:
> With an A2049 Apple USB-C to 3.5mm DAC dongle, I have the same issue as outlined in this link: ALSA won't detect 44100Hz as an available sample rate:
> https://github.com/mikebrady/shairport-sync/issues/1504
> 
> 
> Steps to Reproduce:
> Play a 44.1Khz audio file.
> 
> 
> Actual Results:
> Pipewire reports that the output is locked to 48000hz, and ALSA reports that this is the only detected supported rate:
> 
> $ cat /proc/asound/card0/stream0
> Playback:
>   Status: Running
>     Interface = 1
>     Altset = 1
>     Packet Size = 288
>     Momentary freq = 48000 Hz (0x30.0000)
>   Interface 1
>     Altset 1
>     Format: S24_3LE
>     Channels: 2
>     Endpoint: 0x02 (2 OUT) (SYNC)
>     Rates: 48000 - 48000 (continuous)
>     Bits: 0
>     Channel map: FL FR
>   Interface 1
>     Altset 2
>     Format: S16_LE
>     Channels: 2
>     Endpoint: 0x02 (2 OUT) (SYNC)
>     Rates: 48000 - 48000 (continuous)
>     Bits: 0
>     Channel map: FL FR
> 
> 
> Expected Result:
> It should be switching between 44100-48000hz, the only two rates it supports.
> 
> 
> Build Date and Hardware:
> Running Arch Linux with kernel 6.3.4-arch1-1, alsa-lib 1.2.9-1.
> AMD Ryzen 3600 on a MSI B450M Mortar Max motherboard
> 
> 
> Additional Information:
> It seems like a regression between Linux 4.x and 5.x, and halfway through the above thread the user "quantonian" added the device to the ALSA quirks table and has posted a patch:
> 
> https://github.com/mikebrady/shairport-sync/issues/1504#issuecomment-1193355701
> 
> Thanks if this can be fixed in the kernel. The dongle in question is US $9:
> https://www.apple.com/shop/product/MU7E2AM/A/usb-c-to-35-mm-headphone-jack-adapter

See bugzilla for the full thread.

Unfortunately, the reporter said that he can only run kernel as
old as 5.6, as older than that, he experiences unrelated GPU crashes,
so he can't bisect this regression.

Anyway, I'm adding it to regzbot:

#regzbot introduced: v4.19..v5.10 https://bugzilla.kernel.org/show_bug.cgi?id=217501
#regzbot title: 44100hz is mistaken as 48000hz on Apple Headphone Jack Adapter
#regzbot link: https://github.com/mikebrady/shairport-sync/issues/1504
#regzbot link: https://www.audiosciencereview.com/forum/index.php?threads/review-apple-vs-google-usb-c-headphone-adapters.5541/page-32

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217501

-- 
An old man doll... just what I always wanted! - Clara
