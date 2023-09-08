Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F103EA0
	for <regressions@lists.linux.dev>; Fri,  8 Sep 2023 01:38:27 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6c0b727c1caso782328a34.0
        for <regressions@lists.linux.dev>; Thu, 07 Sep 2023 18:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694137107; x=1694741907; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GoqYLLTWFIzyoZFuY1x7lHwA6k4s+5qXgOEmq2+YoYU=;
        b=ILr2CNmAVpGaruK4COUveA+zMByh5aDrttLp69QSG2LjJHrYuR7nttHoAw11RDwhw9
         /q5YBx2DuyaELvHktAo/16ZIWHS2Ve3iG7la7c++FXbOQQrPoNfI5Q9iMoqQuP6pRcVb
         3eVjndqxvT3smu9W1OeOAqPrl7WM38dS1pzQug5rOGUN/SFKphtfTkdI0kXGcK3wCm5u
         BydaagNM4i7H5sCdF/OLl6PGUv1aPrhOY/yAWwtdrLM2YawkzyPrP8a3Aq8AXEgNbYFV
         4qGPowxXBnconjOmcxw8fxhEGpV5SLP3z1UHhTY5Z98nFAXwY8yNb+u99acoI6kA45ed
         gCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694137107; x=1694741907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GoqYLLTWFIzyoZFuY1x7lHwA6k4s+5qXgOEmq2+YoYU=;
        b=fLKzFOtXTw2XQs7QdgUT6Qolk1pHzIopQf4zFA7Sk4rV+6Gjl6Va2SNl5hXvIg7qhr
         gQug0sU3SRAvnSQEVHsG1D/HLJnSbZWFItLS/bL+vFU1P6pToNHgSsVAHbDPqQ3318wm
         68t2ocJ3SNN+w3ujR5dAW5Pw0y2Yo4hK+fj4Irdaf6tv5BqzgcGMIGi16Nj3Tu9/Z60o
         0Tghduzy1V/kx7c0VcuESYNszNgBNvYaBUIGl1SeMO5+x3Mw1qR47WoN8XOSZtNduxBt
         TYgpCz2X6ITW20QhI0Lbv7SuLio5dLwAEBnl5M0LUbBSS/9raTB1C0lwoFnDIxeZKK0H
         wAVA==
X-Gm-Message-State: AOJu0YwtqbcpGOhyRpKpRM0r/FPfsRwekwavOhZeC8g8dMpcYX7iNJ3x
	OEJAXVBeKTehvmB1gRNv99A=
X-Google-Smtp-Source: AGHT+IEX3ezoCJxl3ylzzZ+PxyXa4OnAcfwLdtTuYgj04ghqbAq39XjRtCcti+FtWFJm+Zk3a/JwUA==
X-Received: by 2002:a9d:665a:0:b0:6bc:f20a:3b65 with SMTP id q26-20020a9d665a000000b006bcf20a3b65mr1067072otm.23.1694137107026;
        Thu, 07 Sep 2023 18:38:27 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id i3-20020a63b303000000b00570574feda0sm171870pgf.19.2023.09.07.18.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 18:38:26 -0700 (PDT)
Message-ID: <470bd522-3e12-0e6c-de4e-2da8164d694b@gmail.com>
Date: Fri, 8 Sep 2023 08:38:22 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: Slow boot and shutdown/reboot problems with 6.5.0+
Content-Language: en-US
To: Marcus Seyfarth <m.seyfarth@gmail.com>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Luis Chamberlain <mcgrof@kernel.org>,
 Russ Weight <russell.h.weight@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Integrity <linux-integrity@vger.kernel.org>
References: <5011708f-b0ae-2853-0f87-a3b59845a2cc@gmail.com>
 <CA+FbhJO8b5V_So2mMPu1ApKXTxk0ieWvNMa=HBTYTWDXLEA-ew@mail.gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CA+FbhJO8b5V_So2mMPu1ApKXTxk0ieWvNMa=HBTYTWDXLEA-ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/09/2023 20:56, Marcus Seyfarth wrote:
> Thanks for picking this up! Just to keep track, you can remove my earlier report (https://bugzilla.kernel.org/show_bug.cgi?id=217864 <https://bugzilla.kernel.org/show_bug.cgi?id=217864>) from regzbot. I've split out the boot/shutdown/reboot part from there into this new one as that was still reproducible on default distro Kernels.
> 
> As to bisecting: Unfortunately I cannot afford the time right now to bisect this further as the system is used in production and already did invest a lot of time without success into it. Hopefully someone else can find the root cause of the problem. My systemd version is: 254.1, and I also use dbus 1.14.10 and dbus-broker 33.r35.g2220a84 which was configured with -D linux-4-17=true.
> 

Do you have test environment with similar configurations so that
you can bisect there?

> Some other observations: It was very odd to notice that with 6.5.* local h264 video playback with mpv did not work any longer - mpv did not even open the files (it works fine with the older Kernel); the monitor refresh rate was set to 165 Hz (instead of the manually set 120 Hz) and opening of the task bar, Dolphin or attaching files to an E-mail took a lot longer to bring up the dialog than with the older Kernel. Hitting the power button still could successfully turn off the PC though, but clicking on the usual shutdown/reboot Plasma Desktop icons did not seem to work, at least not reliably in every case.
> 

In that case, can you attach mpv output?

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

