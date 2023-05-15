Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408B6C2D6
	for <regressions@lists.linux.dev>; Mon, 15 May 2023 13:10:01 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ab0c697c2bso117611785ad.1
        for <regressions@lists.linux.dev>; Mon, 15 May 2023 06:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684156201; x=1686748201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/pd7IH8iQ4KOAD+IGRJ2kpU4wAM/iguRWIx6a9cMo2M=;
        b=G4iss71zL/pAgQitGB/tMRoEosPEK6miLaIAsf+UOJ6GJwmgzEft4m29hABqk+l8nb
         F0V9nt4vcBsaCor6syjSCxACXETUI54Gx4QF5Au3YbYNbI9JcxejZEaFYYLpGkLVajIT
         Yq95TK1jpDTkoSp0xtSBIsHS4orOrXPKMfOsaSQNEYRoOqkjBmLuwwbOPPGM6S144M8I
         PqqTnHX6MAH7SKOS+JWuVZh30B7tBQutM/SSCblobe1HMnhLiQRXWbfI8N80RwfD15Ua
         U3k+05Xza9Dp3M+hlyyFsXF7pln+SC+Qr7Pizzd/EhUl285lvsKilqeWZwnMsndW0M6f
         Y8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684156201; x=1686748201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/pd7IH8iQ4KOAD+IGRJ2kpU4wAM/iguRWIx6a9cMo2M=;
        b=fb0dcZ7y8GC53TLIgIf7iHM8zWrSL19wW5njV8w1wjf5hdputJO/GJgL4ocDn3/wis
         eYayC95B4LNbB3AlBv8lXaAJxftA4fPEbNmNhpizn4aNmlVVStpOiQHsBtjLbO4suK2H
         MjmT6D3wAMKtLboJCG+TMFf/vHNgX+BhuEkBTry6lIgGxTq2URJ8n/LvYEQG4XzirsFw
         Z3wiYD022+EHwekv75Ugf714EldoGA3usER6exzX2MoQh6jMTcTGqHGviDCSlCdjrr6B
         Ahfwk202s6k8vJGB6gw715RU05+jR5A4BmvMx06EPGlPdzRx6Ez0rlnep7P1tXuGqDMJ
         cWcQ==
X-Gm-Message-State: AC+VfDxRX4oBhElNmF1fNuvPtS+X5sLK0rnzkhlkFRgMwKFzfgTXKQgx
	erHsEoq0YTJwKRy0n8sUntw=
X-Google-Smtp-Source: ACHHUZ6tAg9ha1mMvaWILouNIGS4l8+m+gtn+R6sNaWAfRPEal9tyuaSig5YDstqPJlQfVeWhCPh7A==
X-Received: by 2002:a17:902:d2c2:b0:1ac:5dfa:3545 with SMTP id n2-20020a170902d2c200b001ac5dfa3545mr36716635plc.68.1684156200448;
        Mon, 15 May 2023 06:10:00 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-3.three.co.id. [180.214.233.3])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902db0900b001a6a53c3b04sm13519333plx.306.2023.05.15.06.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 06:09:59 -0700 (PDT)
Message-ID: <b3bb9fc7-c7ec-ad32-5d6f-e6ba55e2dd7d@gmail.com>
Date: Mon, 15 May 2023 20:09:49 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Fwd: Freeze after resuming from hibernation (culprit is brcmfmac
 change?)
To: Hans de Goede <hdegoede@redhat.com>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Wireless <linux-wireless@vger.kernel.org>,
 Broadcom 80211 Devices <brcm80211-dev-list.pdl@broadcom.com>,
 SHA cyfmac Subsystem <SHA-cyfmac-dev-list@infineon.com>,
 Linux Kernel Network Developers <netdev@vger.kernel.org>
Cc: Hante Meuleman <hante.meuleman@broadcom.com>,
 Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>,
 Franky Lin <franky.lin@broadcom.com>,
 Arend van Spriel <arend.vanspriel@broadcom.com>,
 Kalle Valo <kvalo@kernel.org>, julien.falque@gmail.com
References: <018f62d0-ee1d-9198-9c38-e45b10921e2e@gmail.com>
 <f629341e-5920-8061-6120-cb954d22ffe9@redhat.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <f629341e-5920-8061-6120-cb954d22ffe9@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/15/23 15:56, Hans de Goede wrote:
> Hi,
> 
> On 5/15/23 04:21, Bagas Sanjaya wrote:
>> Hi,
>>
>> I notice a regression report on bugzilla [1]. Quoting from it:
>>
>>>  julien.falque@gmail.com 2023-05-14 09:55:38 UTC
>>>
>>> Since a Kernel update a few weeks ago, my laptop freezes when resuming from hibernation. It seems to handle the resume process normally but at the moment I should see Gnome login screen, I either get a black screen with just a white underscore instead, or nothing displayed at all (no backlight). I can't do anything at that point and I have to hard reboot.
>>>
>>> Steps to reproduce:
>>> - hibernate
>>> - resume
>>> - wait until the resuming process should finish: black screen instead of e.g. Gnome's login screen
>>>
>>> journalctl gives nothing between the beginning of the resume and the crash, as if it never happened.
>>>
>>> I have a Dell XPS 15 (9550) with Arch Linux. The issue happens on linux (since v6.2.0 I think) but linux-lts (currently v6.1.28) is fine.
>>>
>>> A bisect on linux-git gave commit da6d9c8ecd00 as the cause of the problem.
>>
>> See bugzilla for the full thread.
>>
>> Julien: I asked you to also provide dmesg log as I don't know
>> what exactly happened, but you mentioned the culprit was
>> da6d9c8ecd00e2 ("wifi: brcmfmac: add firmware vendor info in driver info"),
>> which implies that the crash involves your wifi device. From my experience
>> though, GDM crashes are usually caused by xwayland.
>>
>> Anyway, I'm adding this to regzbot:
>>
>> #regzbot introduced: da6d9c8ecd00e2 https://bugzilla.kernel.org/show_bug.cgi?id=217442
>> #regzbot title: brcmfmac firmware vendor info addition triggers GDM crash on resuming from hibernation
> 
> da6d9c8ecd00e2 is known to cause a NULL pointer deref on resume,
> which is likely what is happening here. This is fixed by:
> 
> https://lore.kernel.org/regressions/20230510141856.46532-1-hdegoede@redhat.com/
> 
> This patch is ready for merging and is waiting for the wireless-maintainer
> to merge it and send it to Linus.
> 

OK, thanks for the fixup!

#regzbot fix: wifi: brcmfmac: Check for probe() id argument being NULL

-- 
An old man doll... just what I always wanted! - Clara

