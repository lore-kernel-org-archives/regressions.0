Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA412C840
	for <regressions@lists.linux.dev>; Thu, 12 Oct 2023 23:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjThi49c"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-53fa455cd94so1142112a12.2
        for <regressions@lists.linux.dev>; Thu, 12 Oct 2023 16:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697155060; x=1697759860; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IMk7ef3z6b35hTlTRh2H+b/l6njrMDplSZDZc4/1mAU=;
        b=gjThi49c27pmQS6aWKrwKyrH9caT17JfBy1esLgG3+3SltSD6GBGXy2X4JhFZIDMtI
         rpMk4yxp4l0w0vbIAb8bRMritEsH0e3AqNxq1K0ECL0EGAsjxiju0ZtWAY7z8gjYlf1D
         lL4ZXubnDPO9wnMhIxJK6Fu2qGr84kgEASyecDsh2leyZRioh7qq6Ix416u5ba6ijQZL
         xMAP/L/+REFroG2K8Cipy03QjjxkfLJV4ivQynCG7w2H0g9RAGuJPIPOX7jGAsJPpdJb
         28pCr7D+sgdUqyZPY1G5fNXBSa/v40vqApw1TxN90+/z9jHfRsq9vliEKv0ctfvsijBu
         KS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697155060; x=1697759860;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IMk7ef3z6b35hTlTRh2H+b/l6njrMDplSZDZc4/1mAU=;
        b=gFKZCbsSiVnd07gia5EHyUjAW0NCpj/b7V24sYRV3sqHSkVFtXMdudt0vTze5L2tAl
         FYjlwiW4PAyLtCoINqo3zxFbyZo+UlNl8IOihLNoboPBuMRPRlXkcA4NIe8voETyRkYH
         UShTDTAZDl6cAc47bA+uuEBK1DixOb/WmujrygF38CflnvwwkUzbDJEBN+V7uraTR86r
         KIaS1GKqiB4HdDU44ee+Z72jIDaxQPxAM13g8GrFcDdsWTNTh6On7+lti6d/0ZqChErk
         tOixdhgHJYlqy07CXR5gs3KXCurBTn1PUNdVvM/1nwYoh0BLn29khQcAIlMZ44ssh5Od
         RSQQ==
X-Gm-Message-State: AOJu0Yx95NoT/8ZmJj6QixiA5kg328cGI9UK12WHWGpHb1O7PNaXS+tg
	/tFLEWAR745YHUUXdH4P0rQ=
X-Google-Smtp-Source: AGHT+IGXYpN9ClsEETOLPh4A+17Ca/iEmHa91MMqRHzbAa627nCzyd9VHmCdfnui/FFLZ8NActc9kg==
X-Received: by 2002:a05:6a21:1f16:b0:152:1ce8:ce3a with SMTP id ry22-20020a056a211f1600b001521ce8ce3amr20185803pzb.18.1697155059665;
        Thu, 12 Oct 2023 16:57:39 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id q2-20020a170902edc200b001b7f40a8959sm2553077plk.76.2023.10.12.16.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 16:57:38 -0700 (PDT)
Message-ID: <d1354343-8fe0-4338-8d71-b8a90c960017@gmail.com>
Date: Fri, 13 Oct 2023 06:57:33 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: Intel 7560 LTE Modem stops working after resuming from
 standby
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux Intel Wireless WAN <linuxwwan@intel.com>
Cc: M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Loic Poulain <loic.poulain@linaro.org>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>
References: <267abf02-4b60-4a2e-92cd-709e3da6f7d3@gmail.com>
Content-Language: en-US
In-Reply-To: <267abf02-4b60-4a2e-92cd-709e3da6f7d3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/10/2023 16:52, Bagas Sanjaya wrote:
> Hi,
> 
> I notice a regression report on Bugzilla [1]. Quoting from it:
> 
>> I noticed a few days ago, after Fedora moved to Kernel 6.5, that my Intel LTE Modem was not working anymore after resuming from standby. 
>>
>> The journal listed this error message multiple times:
>> kernel: iosm 0000:01:00.0: msg timeout
>>
>> It took me a while to determine the root cause of the problem, since the modem did not work either in the following warm reboots. 
>> Only a shutdown revived the modem.
>>
>> I did a bisection of the error and I was able to find the culprit:
>>
>> [e4f5073d53be6cec0c654fac98372047efb66947] net: wwan: iosm: enable runtime pm support for 7560
> 
> See Bugzilla for the full thread.
> 
> Anyway, I'm adding this regression to regzbot:
> 
> #regzbot introduced: e4f5073d53be6c https://bugzilla.kernel.org/show_bug.cgi?id=217996
> #regzbot title: pm support for Intel 7560 makes the modem stops working after resume
> 

FYI, the reporter had uploaded full dmesg output on Bugzilla.
Also, he noted shutdown abnormality:

> also I should mention, that if this error occurs, I am unable to shutdown my system anymore. "poweroff" does not turn the laptop off, it simply triggers a reboot, where the modem is still not functional. Only pressing the powerbutton >4 secs "resets" the device.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

