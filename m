Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A48C6135
	for <regressions@lists.linux.dev>; Thu, 14 Sep 2023 07:03:10 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso4502055ad.1
        for <regressions@lists.linux.dev>; Thu, 14 Sep 2023 00:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694674989; x=1695279789; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e25qQ9p0C2P5SWU0KD60Ifyzn1bMFGxGkmDRK1NWFGg=;
        b=jQU7sDttZLo71ODZa02sY+HDbXpbnL5RD6yRFmeEKGriX1603AAjyyK7yGYWl4/XrX
         jXqxz+e5Grqg5CLi4balGrBH6qxv++p6rdMVJpAS5cwQbxeVkexm7vslqRf0xcog3XXj
         wX4MDs9h4dJoAH82X4XrPM39M/u+E1cT7l05/2kN6tlL7YFOLlkQV2K6KtwAUEnkL2gz
         lncefnPfxDS6SU78olr9QhOzF2mJV4HaMZ47Xm4CArn9Kp/EZm2iBulkFlDHXh8hjvzS
         GY24eqVL73HPEPSQBuipf6CO5G0x6vMA98vKoWc6dwAwQTNEWc+dx/Jdsewu2H0nQlhe
         nfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694674989; x=1695279789;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e25qQ9p0C2P5SWU0KD60Ifyzn1bMFGxGkmDRK1NWFGg=;
        b=UtX3JzH/U1WeH4nscSIdk6YrRThkYYqQr1MpEyDMf0bzoaGxbQISzr9GgXKD+cw/Bo
         pcNzW1v8F16ufJ08dwZ4Pt6CGxZNHSAN9T7QOhe5VGuCgh/NNZgG99ggEj5T6kiAYjXf
         bZnBI1pUZe8j9XoHQRzWhkDwd4/vnn2OQlWczV/gsTMdNspsfuiDkFWGnBJGT2YlEhqO
         740RGOt+XiS2qAzFmfUp0VKabgiQ2wQm85F9FWixJ7WlOmtWZYvO5kNZ/onvdzTTwk7j
         RBITVSxeH2RZ/qIpLICwVPAkC7v2bFR4vTUC6z93Z4wh/dVZ/YsCxe04pmJzMpyeiU5S
         PY7A==
X-Gm-Message-State: AOJu0Yy33CUYe6rNQ2079KUcxPJxo9J1VhEJVacKQkRT5CFq1X4IAmxp
	I2MvlACatawfaF5aeHhmJ+g=
X-Google-Smtp-Source: AGHT+IE0akRhGk0UGa1FvuBd3BoNxwOFbDloyRSrs4PXKBf116lOnoKRNJaEkHoGyQTfVQgFFg8VSw==
X-Received: by 2002:a17:903:11c4:b0:1c0:b17a:754f with SMTP id q4-20020a17090311c400b001c0b17a754fmr4779020plh.63.1694674989443;
        Thu, 14 Sep 2023 00:03:09 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id a11-20020a170903100b00b001bdc664ecd3sm780083plb.307.2023.09.14.00.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 00:03:08 -0700 (PDT)
Message-ID: <2bc62c07-2195-e378-c057-f28e8d4a6034@gmail.com>
Date: Thu, 14 Sep 2023 14:03:00 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Tester47 <e598@gmx.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux TTY & Serial <linux-serial@vger.kernel.org>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Kernel 6.6-rc1 fails to reboot or shutdown Ryzen 5825U
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> The Kernel stalls at boot very long with a drm-amdgpu message, but fails to restart or shutdown with secure boot enabled or not. Magic key works to exit. Nothing wrong in the Kernel 6.5 cycle.

Later, the reporter (Cc'ed) described the regression:

> Let me be clearer, it does not shutdown at all: magic key for shut down has no effect (o or b). The keyboard is dead. Plus, $ shutdown -r now hangs too. Restart works when using Alt+PrtSc+b. Same when booting stalls for long.
> 
> We started bisecting with 20230903 daily kernel, the bug was there. 6.6-rc1 has been removed. Take good note that next boot log after shutdown may or may not be the same log. Plus, booting requires now and then magic key to restart, because the Kernel hangs.  In this case, we must click enter twice + Esc to boot in desktop. 
> 
> It booted ok after a cold shutdown with enter twice and ESC ounce + backspace. 
> ...
> In all cases, tpm and secure boot are enabled. If secure boot is disabled, when we shut down, magic key works to restart.

He then pasted journalctl excerpt at the point where the hang occured:

> This where it stalls for restart. Shut down hangs at the Lenovo image:
> 
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: SE 1, SH per SE 1, CU per SH 8, active_cu_number 8
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring gfx uses VM inv eng 0 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring gfx_low uses VM inv eng 1 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring gfx_high uses VM inv eng 4 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 5 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 6 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 7 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 8 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 9 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 10 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 11 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 12 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring kiq_0.2.1.0 uses VM inv eng 13 on hub 0
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring sdma0 uses VM inv eng 0 on hub 8
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring vcn_dec uses VM inv eng 1 on hub 8
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring vcn_enc0 uses VM inv eng 4 on hub 8
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring vcn_enc1 uses VM inv eng 5 on hub 8
> Sep 13 21:43:08 mm kernel: amdgpu 0000:04:00.0: amdgpu: ring jpeg_dec uses VM inv eng 6 on hub 8
> Sep 13 21:43:08 mm kernel: [drm] Initialized amdgpu 3.54.0 20150101 for 0000:04:00.0 on minor 0
> Sep 13 21:43:08 mm kernel: fbcon: amdgpudrmfb (fb0) is primary device
> Sep 13 21:43:08 mm kernel: [drm] DSC precompute is not needed.

See Bugzilla for the full thread and links to complete journalctl log.

Anyway, I'm adding this regression to regzbot:

#regzbot introduced: v6.5..v6.6 https://bugzilla.kernel.org/show_bug.cgi?id=217905
#regzbot title: shutdown/reboot hang on Ryzen 5825U (stuck on amdgpu initialization)

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217905

-- 
An old man doll... just what I always wanted! - Clara
