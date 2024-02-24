Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911ED44C77
	for <regressions@lists.linux.dev>; Sat, 24 Feb 2024 14:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708786657; cv=none; b=F5h5vuPHc5KS+eDCL1wXh1OaL8Ih79046bMQsGmuVj/Ifsz1XmW+Lim2JmbR/T0aWxDcmwUCm7lSn+UwSwv/4tRQBsmDrGF1qnry710eRidb/Wpzbc0jqsD0ReeY5aDDvpp+/CgMnRu5w/gUt2Ecrn8wDsRAY4fDLX/nvp4p978=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708786657; c=relaxed/simple;
	bh=ntz5o0LszKUCtCDmWmFQe0AFSUNs4yhu3EOKdO2PuRA=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=Nbj8Yfxu/YObl0JqNTsJ3upe400v8xu0QMd4kWxsrZIF7KXn1up3EbNVYzB3Q4qCRE4Hg4OsTiUCjid1Q//yLIzASB0GcV8xMd20awb3LnyuZcbZe7fKRjzHvqSOu+lOcB6DKhzVr4FZuXwUgTi54IHgqkqaFvRMwZDsL7u0FIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=telus.net; spf=pass smtp.mailfrom=telus.net; dkim=pass (2048-bit key) header.d=telus.net header.i=@telus.net header.b=T+rKV3Q0; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=telus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=telus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=telus.net header.i=@telus.net header.b="T+rKV3Q0"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5cedfc32250so1666407a12.0
        for <regressions@lists.linux.dev>; Sat, 24 Feb 2024 06:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=telus.net; s=google; t=1708786655; x=1709391455; darn=lists.linux.dev;
        h=thread-index:content-language:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ntz5o0LszKUCtCDmWmFQe0AFSUNs4yhu3EOKdO2PuRA=;
        b=T+rKV3Q09h2Ybm2N7tOKr4Tga0XpgPVX73A5QQ4G/FJHU2By3bAvBJhWb0+ZlwEieM
         Mamrb0N3/neJozVIcg5TwiqgEqceKC2ge1QKH4Bpr063Un7x37vj+0Yad8pP5pyCuCMt
         xLnQXNo3G5QYl+XtNw9gexGH9wjIN6/Xn/zyk4GJ/dLuCEh+hWmqNWGNzFWBBWoT9XFU
         PZKWt716XBazBomB+G9C8fbm2qjmK5ql4RamfGibUq/SieRaGNZmNoBkoklfn8eM46D8
         /XtCxr6t8FK8cp78sDX4QszmIDLXNQ/b2eBmz/zBpqsTMCL0Vrg4ZRWZY6gBlYZcIIBz
         5Esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708786655; x=1709391455;
        h=thread-index:content-language:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ntz5o0LszKUCtCDmWmFQe0AFSUNs4yhu3EOKdO2PuRA=;
        b=hBgb36p7mjHFWTqUIilGoxALth9eHmgSQXrDbmHtOTle/JQoCmG8wxGeucYltiwkIP
         ZP9R6Q+yIY19msLscBZRyWo7xqvbAYte89wE5ZqPDe5v+0/so23GulL704kiuIhMB1p6
         uzQQYNE7lCtABiXBJWoWvvBzYkje4jGJJSwdKtp5zSudvOwWk+wPXJyo4/HjRfnJa51e
         r/u4nsjGrffal0OeXsiUICT4+uWMHHRSU4dx3LSJd/rmS6fAaGNhLjeZC6e8KMoE57sI
         JYTLTrrr4v4kDQde3tV1+wD9Mn4s6AdWVyZBCn9M7yYfrO+dlPVmV2yx68ZqDBG8k6PB
         togQ==
X-Gm-Message-State: AOJu0Yy4RrrDai7210cXYyXzR0fR/lwp/EcSRBuD6v8zeimMGqRkdEdg
	sespLIP39NJn9QMyRLpMRTKZkNUcBrql84TIfII40cBtS4fEYMJJo6WWZVpDzW8=
X-Google-Smtp-Source: AGHT+IGwxT5TodcQX9BdTWkFfX+o3yEickfJa9v5Vw8oISLh69bG6evjEbBbh8B6dtZazqKXTSu9wg==
X-Received: by 2002:a17:903:1249:b0:1dc:51ac:88f5 with SMTP id u9-20020a170903124900b001dc51ac88f5mr3244730plh.65.1708786654970;
        Sat, 24 Feb 2024 06:57:34 -0800 (PST)
Received: from DougS18 (s66-183-142-209.bc.hsia.telus.net. [66.183.142.209])
        by smtp.gmail.com with ESMTPSA id e21-20020a170902d39500b001db37fd26bcsm1112672pld.116.2024.02.24.06.57.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 24 Feb 2024 06:57:34 -0800 (PST)
From: "Doug Smythies" <dsmythies@telus.net>
To: "'Linux regressions mailing list'" <regressions@lists.linux.dev>,
	"'Rafael J. Wysocki'" <rafael@kernel.org>
Cc: "'Vincent Guittot'" <vincent.guittot@linaro.org>,
	"'Srinivas Pandruvada'" <srinivas.pandruvada@linux.intel.com>,
	"'Ingo Molnar'" <mingo@kernel.org>,
	<linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	"Doug Smythies" <dsmythies@telus.net>
References: <002f01da5ba0$49cbf810$dd63e830$@telus.net> <CAKfTPtA-jizig0sh_shmkAMudAxDPYHP0SdanZe=Gc57jVKouQ@mail.gmail.com> <003801da5bae$02d6f550$0884dff0$@telus.net> <CAKfTPtC7pOtb-srrgQLFbTueLLDqHay+GQBm9=sNsnZDg_UYSQ@mail.gmail.com> <000b01da5d09$8219f900$864deb00$@telus.net> <CAKfTPtB8v30LzL3EufRqbfcCceS2nQ_2G8ZHuoD5N1_y-pvFbg@mail.gmail.com> <001b01da5ea7$86c7a070$9456e150$@telus.net> <CAKfTPtD4Un-A2FcdsvKnNZskG=xH0wrsT3xzaWDs--mQjgZ3rg@mail.gmail.com> <003001da6061$bbad1e30$33075a90$@telus.net> <CAKfTPtC82YXOw5yYPNkHHyF+DYSG+Ts9OjnwsVjbd_HcUsZQMg@mail.gmail.com> <c03533dc-73fc-4d97-8248-0affbddbed32@leemhuis.info> <CAJZ5v0hfMuiZCFU6e9TZ7yZV1qER2ymOM7d=AAf5beyMOyHg+g@mail.gmail.com> <a831a69f-fa75-4ae2-b7d5-a2bbfd6bd9dd@leemhuis.info>
In-Reply-To: <a831a69f-fa75-4ae2-b7d5-a2bbfd6bd9dd@leemhuis.info>
Subject: RE: sched/cpufreq: Rework schedutil governor performance estimation - Regression bisected
Date: Sat, 24 Feb 2024 06:57:35 -0800
Message-ID: <000b01da6731$cdaa7610$68ff6230$@telus.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-ca
Thread-Index: AQHymzO4ho/iLx8gQfQ33x85MlP38AE230H5ATs9P70BGBlhKwIBEbUgAWfpSqoB1OxCigJA5W0AAaqAerYCnLdoYQL2zC8KAiN+cn4BxRsBOLA3rPVg

On 2024.02.24 06:31 Thorsten wrote:
> On 24.02.24 15:11, Rafael J. Wysocki wrote:
>> On Sat, Feb 24, 2024 at 2:44=E2=80=AFPM Linux regression tracking =
(Thorsten
>>> Leemhuis) <regressions@leemhuis.info> wrote:
>>> On 16.02.24 14:17, Vincent Guittot wrote:
>>>> On Thu, 15 Feb 2024 at 23:53, Doug Smythies <dsmythies@telus.net> =
wrote:
>>>>>
>>>>> This email thread appears as if it might be moving away from a =
regression
>>>>> caused by your commit towards a conclusion that your commit =
exposed
>>>>> a pre-existing bug in the intel_psate.c code.
>>>> Ok
>>>
>>> Well, even in that case it's a regression that must be fixed -- =
ideally
>>> before 6.8. Did anything happen towards that?
>>>
>>> I noticed that Doug send the fix "cpufreq: intel_pstate: fix pstate
>>> limits enforcement for adjust_perf call back":
>>> =
https://lore.kernel.org/all/20240217213010.2466-1-dsmythies@telus.net/
>>>
>>> Is that supposed to fix the problem?=20

Yes it fixes the preexisting issue exposed by 9c0b4bb7f630.

>>>Looks a bit like it, but I'm not
>>> totally sure. In that case I'd say it likely should be applied to =
6.8,
>>> but Rafael apparently applied it to 6.9.
>>=20
>> This hasn't reached linux-next yet, so I rebased it on top of -rc5 in
>> order to push it as a 6.8 fix.
>
> Ahh, great, many thx!

Yes, thanks.

>>> I'd also say that a Fixes: would be good as well (to ensure that fix =
is
>>> also backported in case anyone backports 9c0b4bb7f630), but I know =
that
>>> subsystems handle this differently.

I left the fixes tag off on purpose, because there was never anything =
wrong
with 9c0b4bb7f630. Apologies to Vincent for wasting his time, but thanks
for the help finding the actual issue.
=20
>> So I added a Fixes: tag to it, but it points to the original change
>> that missed the check.
> Yeah, that totally works for me as well. Again: many thx!

Yes, thanks. A fix tag pointing to the original commit makes sense.

... Doug


