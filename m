Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D958408C7
	for <regressions@lists.linux.dev>; Sat, 10 Jun 2023 06:38:54 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-256932cea7aso1039970a91.3
        for <regressions@lists.linux.dev>; Fri, 09 Jun 2023 23:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686379134; x=1688971134;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yGVhz1sAD6q2mvEjxF0pg4PBT4Cx0EoYk9cX0ojzw7k=;
        b=rHJzw9HMsYn6a13iz3WbD0crMFkPlXc0e8Yb3nBTH/Ssm1T5sus7EQNukL9JfVVGS4
         NhFFKST/ybZ2ELB4j6sU9HWzeGhDnkWYc6bApg66RF/nJ7p81ynn0Xj09jqfa2134tU0
         /4Ljln+XrOsfWgJ1KF8UuRv49o+em+kJMeogJjkB1rfs4jiShcJAhSumot7jlyjxC7SG
         yI6No0XFpSdVPrNoMNNjrWNtTw1qkJxxQ+wbecsZjI21H2np7W4N8Sv5fkRoirIqtvNN
         M3nYQExXPHipcWnwKCRlLTPLQwZB3Idn1BV7NmThpnCNR6AsWJS6+aI790ro7O/iAVyC
         1FZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686379134; x=1688971134;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yGVhz1sAD6q2mvEjxF0pg4PBT4Cx0EoYk9cX0ojzw7k=;
        b=F2WYvNq9r0lNIEgM4/BHPEkalP06QrE99dgvRGzo41X5fEdhsKtSXUsdL06y2eqgOw
         iYeRVVbR/1VF8TQpLvbGff9Gh1aQnQGkLu+tHnXSzlZDzqBxh31kAgxhW8StNqB502fw
         5nNkAvyXW6sCOLSQpnTePGmggX1ADGtjZIygSu6GW/YZGlqHh+GWEwCyMxEi8Y/XwJFK
         8sXzyT3h3wNrpRLELpugQA57QufNubnWtNBsJig28dhQ275FZ+ErmGHrhy7LtDqOTIlh
         OWIPMx8txP7He0dxEFefa+7kyrZzjSHEAu4hRGTDDBZ4Geiera0TpUlqbmSzi6daf/0s
         BPMg==
X-Gm-Message-State: AC+VfDy9y2V+q/TT1r2b/HKm6BK2NVHUVSHTFj8CXsh9ozIcbGC5fst3
	8oUT5e9c3pbfM8NNkzTqK24=
X-Google-Smtp-Source: ACHHUZ6U8LuPYo6qTIzC6FmLnF/Ulx2KVvuwaayPVlE29Z3/R06/68EjE8sPxR6bbsBIv8SJ3NMpvA==
X-Received: by 2002:a17:90a:9746:b0:255:b1d3:5220 with SMTP id i6-20020a17090a974600b00255b1d35220mr2753407pjw.20.1686379134369;
        Fri, 09 Jun 2023 23:38:54 -0700 (PDT)
Received: from [192.168.43.80] (subs28-116-206-12-58.three.co.id. [116.206.12.58])
        by smtp.gmail.com with ESMTPSA id j24-20020a17090a589800b0023b3d80c76csm3841294pji.4.2023.06.09.23.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 23:38:53 -0700 (PDT)
Message-ID: <5513e29d-955a-f795-21d6-ec02a2e2e128@gmail.com>
Date: Sat, 10 Jun 2023 13:38:48 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: Fwd: Waking up from resume locks up on sr device
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Thorsten Leemhuis <linux@leemhuis.info>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Phillip Potter <phil@philpotter.co.uk>,
 Joe Breuer <linux-kernel@jmbreuer.net>
Cc: Linux Power Management <linux-pm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Hardening <linux-hardening@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux SCSI <linux-scsi@vger.kernel.org>
References: <2d1fdf6d-682c-a18d-2260-5c5ee7097f7d@gmail.com>
In-Reply-To: <2d1fdf6d-682c-a18d-2260-5c5ee7097f7d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/9/23 18:04, Bagas Sanjaya wrote:
> Hi,
> 
> I notice a regression report on Bugzilla [1]. Quoting from it:
> 
>> I'm running LibreELEC.tv on an x86_64 machine that, following a (kernel) update, now locks up hard while trying to device_resume() => device_lock() on sr 2:0:0:0 (the only sr device in the system).
>>
>> Through some digging of my own, I can pretty much isolate the fault in this device_lock() call:
>> https://elixir.bootlin.com/linux/v6.3.4/source/drivers/base/power/main.c#L919
>>
>> I put an additional debug line exactly before the device_lock(dev) call, like this:
>> dev_info(dev, "device_lock() in device_resume()");
>>
>> This is the last diagnostic I see, that device_lock() call never returns, ie line 920 in main.c is never reached (confirmed via TRACE_RESUME).
>> The device, in my case, is printed as sr 2:0:0:0.
>>
>> Knowing this, as a workaround, booting with libata.force=3:disable (libata port 3 corresponds to the SATA channel that sr 2:0:0:0 is attached to) allows suspend/resume to work correctly (but the optical drive is not accessible, obviously).
>>
>> When resume hangs, the kernel is not _completely_ locked, interestingly the machine responds to pings and I see the e1000e 'link up' message a couple seconds after the hanging sr2 device_lock().
>> Magic SysRq, however, does NOT work in that state; possibly because not enough of USB is resumed yet. Resuming devices seems to broadly follow a kind of breadth-first order; I see USB ports getting resumed closely before the lockup, but no USB (target) devices.
>>
>> This is a regression, earlier kernels would work correctly on the exact same hardware. Since it's an 'embedded' type (LibreELEC.tv) install that overwrites its system parts completely on each update, I don't have a clear historical record of kernel versions. From the timeline and my memory, moving from 5.x to 6.x would make sense. Due to the nature of the system, it's somewhat inconvenient for me to try numerous kernel versions blindly for a bisection; I will try to test against some current 5.x soon, however.
>>
>> I do have the hope that this information already might give someone with more background a strong idea about the issue.
>>
>> Next, I will try to put debug_show_all_locks() before device_lock(), since I can't Alt+SysRq+d.
> 
> See Bugzilla for the full thread.
> 
> Anyway, I'm adding it to regzbot (with rough version range since the reporter
> only knows major kernel version numbers):
> 
> #regzbot introduced: v5.0..v6.4-rc5 https://bugzilla.kernel.org/show_bug.cgi?id=217530
> #regzbot title: Waking up from resume locks up on SCSI CD/DVD drive
> 

The reporter had found the culprit (via bisection), so:

#regzbot introduced: a19a93e4c6a98c

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

