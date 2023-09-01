Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044DB881F
	for <regressions@lists.linux.dev>; Fri,  1 Sep 2023 09:42:30 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-26fb8225268so1226322a91.1
        for <regressions@lists.linux.dev>; Fri, 01 Sep 2023 02:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693561350; x=1694166150; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxbsY73eqE9chY2EX3xsnlO4/jof06x9cIh9+N32rEY=;
        b=V+iq+R2VYDejLa28dRUbjtO2heFz/xA8BsMWCF2ukkFcuQkBYBunwdM0yyksohdRiR
         rMtNWjY3cth26z/Y0wSw2KdxpgwGVc8DRaU7DLS1b42VVDfBlHf6ouGEZWJCy3QGlPkc
         dNQv7O3D1pZWy3jkQKuViEuK2BH6L7AXCbloSOTYQLv99NhGwkNAfi64vX/9M16KaUOb
         YAbF+Lrr+f1QdVGFqEsOCHT/3QCrax8PtkRklgaLLQq2PpPnxw+kkxNZEM8BTJgFUAjt
         TWoFsFYiSGO3Ei8KKm+wDUaPYASAdB6EqsiSuJTX8RF3HXW8EsrsyiRFDrbL5P+XuNQX
         k9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693561350; x=1694166150;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SxbsY73eqE9chY2EX3xsnlO4/jof06x9cIh9+N32rEY=;
        b=BASPMv2+bVvrrKjBa+eAKpyq275JbmShZWKHQgbD2R8+IxhgAsrHYnslAAi8iyNQLu
         Auyp6BGWP3q6TUxKb2frDPqInRBPcVQIikyFwNKsQo4dMJy724lpMx6/XgaHsduJMlew
         hRGeatKODNqzF3hxKz3ZOkLSFnDaLVHwxC8+FV3Wgi8F1hCGQ8e6GInvVWmpxrLeL6QR
         hgd28XHO0pth7lQKFoOmP/5CFHDLnx02dx8JWokXxonB/sptBp7y+mJs6MLC2DGIsl0T
         vAw0V3PTk+Fljh1fIocTsbTFuBg0wyGr/fwjJ3iLeiPnLJNyr21yQ+4wiWBwcObSjRKt
         HTqw==
X-Gm-Message-State: AOJu0Yyhd00lMNLOz846lEu4RlVJso4nSrU+WhrTmdJh5Z9HDp6xD7bB
	zLYOS7GAm2d+CDagswOS0lI=
X-Google-Smtp-Source: AGHT+IEZzAhARyVFBvaiXDdpznBROrWDzsHD5p0QeHfBpniT6ccOViVKaS0K8DiuKFWyEJKOr2ZJpw==
X-Received: by 2002:a17:90a:bf8a:b0:268:b682:23da with SMTP id d10-20020a17090abf8a00b00268b68223damr1677995pjs.34.1693561350349;
        Fri, 01 Sep 2023 02:42:30 -0700 (PDT)
Received: from [192.168.0.105] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id 30-20020a17090a199e00b0026b4decfe59sm2856220pji.31.2023.09.01.02.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 02:42:30 -0700 (PDT)
Message-ID: <bede02c1-ef90-8e30-aa8b-e6fae49a8ccf@gmail.com>
Date: Fri, 1 Sep 2023 16:42:22 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Michele Della Guardia <micheledellaguardia@yahoo.it>
Cc: Linux Power Management <linux-pm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Abnormal battery drain with kernel 6.5 (Ryzen 5500u)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1] that have been already handled
there. Quoting from it:

> After switching from 6.4.x kernel to 6.5 I experienced an abnormal battery drain since my laptop is actually never idle.
> I accepted default CPUfreq to schedutil and AMD Processor P-State mode is 3 (active). 
> 
> I expected a different behaviour, but am I missing something?
> In my boot configuration I had "amd_pstate.shared_mem=1" and tried to remove this switch, but did not affect my power consuption.
> 
> Is there something changed from 6.4.x to 6.5 that requires a different configuration to get an optimal power consumption?
> 
> Thanks a lot for your attention

See Bugzilla for the full thread.

Anyway, I'm adding it to regzbot:

#regzbot introduced: v6.4..v6.5 https://bugzilla.kernel.org/show_bug.cgi?id=217853

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
