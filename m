Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05327F6
	for <regressions@lists.linux.dev>; Wed,  5 Jul 2023 02:09:39 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5636426c1b3so4146294eaf.1
        for <regressions@lists.linux.dev>; Tue, 04 Jul 2023 19:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688522978; x=1691114978;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSyXr8wt2ntmASjlaftTJycTyU0JD64M/HgW/H2pOqs=;
        b=eZMqo8/SCRBx5qfVtU5/iGPTggyMi+m6cvjFi6VIFC3wQbfjLBH07alAHk0k6kOL7/
         9YO44QJhs3uBCHqXAzo38gf8pQNnbckirskhI8w3Q5ZWPxI052rpYdw36oxCwY2tG6OW
         vjw1xbjF2vL+O3zwy/rbXDRgZUehItq02WQmw0dejStm8lZg9BxR7lDBo5BGRdOq3z3i
         t6z7Gzu63q1Ko3Q8GwnQ+y4DTgQXp14kSS/nccmHtKay1vHOsI/FyKcvJFPiJGd6KbAA
         ah57Rfte1+BGOOrhmzK35ecaQWdJZTzFJjV94lkVIiBX3m/RzlAQTNPPU+8nBYGJ2Ygw
         nLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688522978; x=1691114978;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RSyXr8wt2ntmASjlaftTJycTyU0JD64M/HgW/H2pOqs=;
        b=LsXOXjb//A9loFP1ttxMS2exP/G/pJ09wT5rH5397G3IjnVsUmE4DimYyr2GOugFvG
         473EgoJVpwEWCDwYSNhxxA++q9cBFeqJJTdPWDXETbrf8NBN3n8nYbFjUUDnz3xGPRCI
         pjlEEVylGB+b7UWY/ZPnRG+XaOQCIhaLDg3I1VqwB6jZXQo/yGK+yr7NVanOkVDY6nud
         PRC15itMESuaYgydvGPeEVSP2bNEd32Xqy9tlrk0yDEWVKGrKULJ51OpU7K27WFQCV4z
         zZzMoDgfAQsrkx47yH2eNhg02As/HHvPyPjNZDMerKLWrB233Ba3k0/HiG6gYM+miD7q
         AYWA==
X-Gm-Message-State: ABy/qLYsy0AGJG3JbfjbdOXrivIwZjnr8CphQPjEGfTSxlaSiw5i5ILI
	UbV9pV6a6d9ZRCQvR5yzSHM=
X-Google-Smtp-Source: APBJJlHvCc3Ope5BY4FwHT0Mr77Uxm0rAhl9Pjar4p3dMmGJVjndYQeh1/V0YNqIdcAhmb2VdTgwmw==
X-Received: by 2002:a05:6359:201:b0:134:f326:e819 with SMTP id ej1-20020a056359020100b00134f326e819mr10789439rwb.29.1688522978371;
        Tue, 04 Jul 2023 19:09:38 -0700 (PDT)
Received: from [192.168.0.103] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id 9-20020aa79109000000b0066a31111ccdsm10139786pfh.65.2023.07.04.19.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 19:09:36 -0700 (PDT)
Message-ID: <7ea9abd8-c35d-d329-f0d4-c8bd220cf691@gmail.com>
Date: Wed, 5 Jul 2023 09:09:32 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Dave Jones <davej@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Ross Maynard <bids.7405@bigpond.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux USB <linux-usb@vger.kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: 3 more broken Zaurii - SL-5600, A300, C700
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> The following patch broke support of 3 more Zaurus models: SL-5600, A300 and C700
> 
> [16adf5d07987d93675945f3cecf0e33706566005] usbnet: Remove over-broad module alias from zaurus
> 
> dmesg and lsusb output attached.

Because the description above was vague, I asked the clarification.
The reporter replied:

> The problem is that networking to SL-5600 / A300 / C700 devices does not 
> work. I cannot ping the devices.
> 
> The error is occurring in zaurus.c. dmesg is missing the following line:
> 
> zaurus 2-2:1.0 usb0: register 'zaurus' at usb-0000:00:1d.0-2, 
> pseudo-MDLM (BLAN) device, 2a:01:39:93:bc:1a
> 
> A patch was created in 2022 to fix the same problem with the SL-6000:
> 
> USB: zaurus: support another broken Zaurus - 
> [6605cc67ca18b9d583eb96e18a20f5f4e726103c]
> 
> Could you please create another patch for the 3 devices: SL-5600 / A300 
> / C700?

See Bugzilla for the full thread and attached dmesg and lsusb.

Dave: The reporter asked to write the quirk for affected devices.
Would you like to create it?

Anyway, I'm adding this to regzbot:

#regzbot introduced: 16adf5d07987d9 https://bugzilla.kernel.org/show_bug.cgi?id=217632
#regzbot title: Removing zaurus overbroad aliases breaks 3 Zaurus devices

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217632

-- 
An old man doll... just what I always wanted! - Clara
