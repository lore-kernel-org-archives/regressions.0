Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF7C18050
	for <regressions@lists.linux.dev>; Tue, 17 Oct 2023 07:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXMptymF"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1ca816f868fso11212615ad.1
        for <regressions@lists.linux.dev>; Tue, 17 Oct 2023 00:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697526537; x=1698131337; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jzW3ddlIc/g6qI+zVds2r3DLCiTHQ00BzaCVpAuMb6I=;
        b=HXMptymFqQhtZvoHT6iwQol7Twg1dCPW20Vkh/ZKK42zCAuKjx3gvsSbLwiehHlJWp
         ggMipgdGUr+gEyLpd6kwyQHU7lKxMKbz/YiYPv+JXdm2d5Tp+Yuk9G59IOrNPIluC98i
         Eb6lpcz+ZJd99YzT0ieyRWzKLQLDricyR/U0oLNFTG5oSu8h5dw/j39lT9zcU2Lgw0fL
         Gh24LDdQIPZsLda0H7bmPkDjJNfDmxnS2nQbCET8i4thbIW+OlMmp0ysQ1PwWwBAZXZE
         QI0wSb0ykpn9au+a+QbAzADIGBrn0fLYHyxJv8kRdxjxAOvVlRGN8q+2y3pgo9MWj2c7
         Ojeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697526537; x=1698131337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jzW3ddlIc/g6qI+zVds2r3DLCiTHQ00BzaCVpAuMb6I=;
        b=gi4Tq1/WK+YGWRWsjUeS/CGT/Q5+G4dc5Mt9X8QJIADLdeko5arz8y7c5UX4lVa/OM
         vY29PpLQqw+mUpYlGY9fsIahg34ZyXDojM3XIEFMM0Lj5cI40Z711t63fqSGTb7CEyLF
         0K5MnZZXXBO0NvL6Xx3k0mo9Gb4tSUe1TU4KrPNnfiumZoQA2AT3BDh1HzGn5pnG0dh7
         vYaWOeQB6+mxlpVoij1tOMWKQDqVedXYRKN6TUK3nM3tXlWj1olz934t5ToclEmhug3a
         2qiIrej/SF7VulFsmBm0Q3Ub6CEN78ePHwv/xmfc2Q9ckZtWq19hkNeUbNGE8gXxfnvE
         YjmA==
X-Gm-Message-State: AOJu0YyO6Ej0Bdrrfgune/cIgIRR6QgtTrq81tIEh/xiBxdGWaUYYUH9
	9oCfnXfGYeO6QeTaAnDfeqWnhP55tkw=
X-Google-Smtp-Source: AGHT+IFcZm2I+/ze3s7LVVDqOJSLHWpKutKCrCcG53oJu5+j2C1Yli/FVpo7Mkc/J58Z4ZLrjwq0PA==
X-Received: by 2002:a17:903:228e:b0:1ca:86a9:cace with SMTP id b14-20020a170903228e00b001ca86a9cacemr1578654plh.2.1697526536615;
        Tue, 17 Oct 2023 00:08:56 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902bd0c00b001b850c9d7b3sm738472pls.249.2023.10.17.00.08.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 00:08:56 -0700 (PDT)
Message-ID: <f8387cd2-032e-4231-9769-a8229b573614@gmail.com>
Date: Tue, 17 Oct 2023 14:08:51 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Intel 7560 LTE Modem stops working after resuming from standby
To: Loic Poulain <loic.poulain@linaro.org>
Cc: M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux Intel Wireless WAN <linuxwwan@intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>
References: <267abf02-4b60-4a2e-92cd-709e3da6f7d3@gmail.com>
 <CAMZdPi9RDSAsA8bCwN1f-4v3Ahqh8+eFLTArdyE5qZeocAMhtQ@mail.gmail.com>
 <ZSiJdxjokD0P9wRc@debian.me>
 <CAMZdPi8qmc4aKPsm3J60Fb+wa0ixVCV+KK11TDsvqFJk81Gfrw@mail.gmail.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CAMZdPi8qmc4aKPsm3J60Fb+wa0ixVCV+KK11TDsvqFJk81Gfrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/10/2023 20:18, Loic Poulain wrote:
> Hi Bagas,
> 
> On Fri, 13 Oct 2023 at 02:04, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>>
>> On Thu, Oct 12, 2023 at 06:54:11PM +0200, Loic Poulain wrote:
>>> Hi Chetan,
>>>
>>> On Thu, 12 Oct 2023 at 11:52, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>>>> I notice a regression report on Bugzilla [1]. Quoting from it:
>>>>
>>>>> I noticed a few days ago, after Fedora moved to Kernel 6.5, that my Intel LTE Modem was not working anymore after resuming from standby.
>>>>>
>>>>> The journal listed this error message multiple times:
>>>>> kernel: iosm 0000:01:00.0: msg timeout
>>>>>
>>>>> It took me a while to determine the root cause of the problem, since the modem did not work either in the following warm reboots.
>>>>> Only a shutdown revived the modem.
>>>>>
>>>>> I did a bisection of the error and I was able to find the culprit:
>>>>>
>>>>> [e4f5073d53be6cec0c654fac98372047efb66947] net: wwan: iosm: enable runtime pm support for 7560
>>>
>>> Any quick fix for this issue? alternatively we will probably revert e4f5073d53.
>>
>> Chetan can't be contacted as sending to his address bounces (error 550)
>> (had he left Intel?). Last message on LKML is this culprit patch [1].
>> Hence, revert for now.
> 
> Could you please submit the revert fix?
> 

OK, will do.

-- 
An old man doll... just what I always wanted! - Clara

