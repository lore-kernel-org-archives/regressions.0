Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13A018621
	for <regressions@lists.linux.dev>; Fri,  3 Nov 2023 13:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKCdePRt"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6bd32d1a040so2250937b3a.3
        for <regressions@lists.linux.dev>; Fri, 03 Nov 2023 06:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699019049; x=1699623849; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cAwnuNWOqdk8r7RMLFguMdGxoKK8GFPpsUqe+jMzKdA=;
        b=IKCdePRt6RPFElyCjgydI36Vi272ZeAsski+lGmQMTEVlqBJdCq8AW//LCP5xuXs3q
         db8O29mkjue7tsEo0KKrcgZmdUi/duz7ZDITQEG2nyYqMSIIbunoqLu6EUNzfl+cIITB
         tQ8R/9zsEvvbHAVAE3JW8Dfei1JdjUWUEN6hAjfCIIXrWzfA8mLRaR/eNX+p52+U6LiX
         NaPRKlokFRDqiXtTWBsziflHX2CSHFAmM9cOf6Z9k1Xo9T0llWESu28hOn5dou4wfysQ
         qLj7Iu+NlWFg7zhAZQhKeTSp8VCvKQS3WoqCidHtsSxGmm/iRVUOhxwUI/NcqBaQ7DBb
         yZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699019049; x=1699623849;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cAwnuNWOqdk8r7RMLFguMdGxoKK8GFPpsUqe+jMzKdA=;
        b=i7iJTSZiLB/mVCTzlQnrZCIbKYXWcejJS9PGKHYFLcU69fdiouceB2XvZlvKlmCzoM
         O8kZOLwhAZp/U6U+qRmVhJnQDLenOcVkWvAHhhirxDM8UFmuG8voWdoMxDboKh3vfj90
         1bW27DEk+iJ2lilINXbM08Zh/CfqTOblngqK1nTi9k1NqkKTf1HGlqEMh86x7Hfucsu3
         fNGmBelnsQ1IWCplHAsRpkjd0Z65YGswm0K5O/JAQaer0j3Da/vbA8pnt1vOxwvEl48L
         m8aTcGpObIaCVVz+WmBdgaoHsCF5K8/mZhJN3zGaZWzEKiEbA2CzDoY1pFzA9l5FVAPc
         gLmQ==
X-Gm-Message-State: AOJu0YyJdMj/AXvO/RI3M6fwskCmcH9oCNLw5HWB0bIBtBQ+ZgElvP+D
	/28DoGyqkEca845I2xqpWoU=
X-Google-Smtp-Source: AGHT+IGt8gFlTfzrJIRGBAC72qQjPlYWGPSABBzTLE9SMs00eMp4wOMMiOVSjuxBEX+fQWfTPHQfvw==
X-Received: by 2002:a05:6a21:7881:b0:17e:2afd:407f with SMTP id bf1-20020a056a21788100b0017e2afd407fmr28675924pzc.9.1699019049094;
        Fri, 03 Nov 2023 06:44:09 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id s1-20020aa78281000000b006b4a5569694sm1462691pfm.83.2023.11.03.06.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 06:44:08 -0700 (PDT)
Message-ID: <1578a6d3-e2f0-443e-85d1-55c639aa1910@gmail.com>
Date: Fri, 3 Nov 2023 20:43:58 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression apparently caused by commit
 088a40980efbc2c449b72f0f2c7ebd82f71d08e2 "ASoC: amd: acp: add pm ops support
 for acp pci driver"
Content-Language: en-US
To: syed saba kareem <ssabakar@amd.com>, Marian Postevca
 <posteuca@mutex.one>, Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
 Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
References: <87a5v8szhc.fsf@mutex.one> <ZUQssoD2rUHSYQ2v@debian.me>
 <610d562f-0bbc-485c-ad63-9534fa4ba937@amd.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <610d562f-0bbc-485c-ad63-9534fa4ba937@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/11/2023 20:30, syed saba kareem wrote:
> 
> On 11/3/23 04:41, Bagas Sanjaya wrote:
>> On Thu, Aug 03, 2023 at 10:22:07PM +0300, Marian Postevca wrote:
>>> I'm trying to develop a sound machine driver based on the acp legacy driver.
>>> The first version of the driver was sent for review on the alsa mailing list this
>>> spring: https://lore.kernel.org/all/20230320203519.20137-1-posteuca@mutex.one
>>>
>>> I'm trying to fix some of the issues that were brought up during the review back then,
>>> but when I ported the patches to the latest commit on the for-next
>>> branch, I noticed a regression where I couldn't hear any sound at all.
>>>
>>> So I started a bisect session and found that the first bad commit is:
>>> ASoC: amd: acp: add pm ops support for acp pci driver
>>> commit 088a40980efbc2c449b72f0f2c7ebd82f71d08e2
>>> https://lore.kernel.org/lkml/20230622152406.3709231-11-Syed.SabaKareem@amd.com
>>>
>>> If I revert this commit sound works as expected. So I started tinkering a little bit
>>> with it and I believe that what happens is that the acp pci driver
>>> enters the autosuspend state and never leaves this state at all.
>>> I noticed this because if I increase the autosuspend delay to a much
>>> larger value, then the sound works until that delay passes.
>>> I added traces and I can see that when the delay expires the suspend callback snd_acp_suspend()
>>> gets called, but the resume callback snd_acp_resume() never gets called.
>>>
>>> I'm no expert in runtime power management (though I did read a bit on it), so I don't understand
>>> all the things that happen underneath, but one thing that is not clear to me is who's supposed
>>> to mark activity on this device and keep it from entering autosuspend if the user wants to play
>>> some sound? Shouldn't there be some counterpart that calls pm_runtime_mark_last_busy() ?
>>> I looked through the code and can't find who's calling pm_runtime_mark_last_busy().
>>>
>>> Some help here would be welcome. Is there something missing in my machine driver code, or
>>> is the runtime pm handling in acp pci driver wrong?
>> Thanks for the regression report. I'm adding it to regzbot:
>>
>> #regzbot ^introduced: 088a40980efbc2
>>
> We were working on some other priority tasks, will upstream the changes
> 
> by next week.
> 

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara

