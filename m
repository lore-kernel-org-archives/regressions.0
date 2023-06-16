Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854ECBA23
	for <regressions@lists.linux.dev>; Fri, 16 Jun 2023 12:17:34 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-666e64e97e2so73798b3a.1
        for <regressions@lists.linux.dev>; Fri, 16 Jun 2023 05:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686917853; x=1689509853;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yi99fLv6YTyMW2x91KoXyXg12oz007UXSsco3xPyJqk=;
        b=DcIdfxzZPOT+L/X+mX1Ag6TQ4aH81opJIeSvVK0KbGWQHG8W5Akhhld1e3YmUK2/N/
         zZ0A7wpkemxlvcTP2QSZEI/Ki5ZncxH9V/jF2lJwCKYHjQ7r2lfwZOa+HY/XMs6ClM5D
         ccBVysx8qZfMCCSl/PjtAfu/8wek+WavKvpw2juh/4IXyZkYjnl16fhUOtYsYifdpRRv
         ZRF0Fdv1S1Hw6J5f69BbBHmmXkwsMRaqNYR2QMyU9/RwgFfhoDG6huk+/1LKOg6yTbup
         t9CY+WpNbn61Hye0+nXsqaN+PMAR7/yQf/0OlfZ7WKrt0SN3FEgUknzMp+rpev6Q6wLn
         p0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686917853; x=1689509853;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yi99fLv6YTyMW2x91KoXyXg12oz007UXSsco3xPyJqk=;
        b=cmQdR+nGXAS1mk57p98QaIlbVRGXjBabxA1uP15nTetxwLntCetf8/ClYskmA7ozbt
         Zqfe8zUytkDQlqFIo+JfDGoVZNrHHP891AkvZaI+yt3X/zN0PQrL34e2yY5vw1RNDHEU
         DPGOY6Etl3rZjjQIdIyHWvYRy7jaFOnQUG78kTGDTv8LUdReGkeN07GNmksm1ETdwO/2
         4xSGTYg5MSclxNKeGnopcZR1imtciGjnU1V8/08L0wDyNSL3/Oj4r+I8au49xikiBvZ8
         bxvziw18clAiOAmaj6Olu+321adBddcQB/+h8HUiwVCk1NQAOFlP77xM69Vzhn4k5FzJ
         wjrw==
X-Gm-Message-State: AC+VfDwHHBYsXfnVunylYXNEv6QUfm8Q4O/2Ea3yUt90T5QeqOLdNfcC
	gl1hn0Pv0SJByDl0A7mbyv8ph328cQ0=
X-Google-Smtp-Source: ACHHUZ4wHk1/pTm81xVV98FexsQMvN1MHJuEClbfKfoLcAp1FqqCs64b9SADoV/jkPg4TDoNOCljhA==
X-Received: by 2002:a05:6a00:13a9:b0:65c:8195:e6a2 with SMTP id t41-20020a056a0013a900b0065c8195e6a2mr2310658pfg.1.1686917853598;
        Fri, 16 Jun 2023 05:17:33 -0700 (PDT)
Received: from [192.168.0.103] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id a18-20020a62bd12000000b0064ff855751fsm13397014pff.4.2023.06.16.05.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 05:17:33 -0700 (PDT)
Message-ID: <b33d3dd1-9765-c90e-4408-941e7d8025cf@gmail.com>
Date: Fri, 16 Jun 2023 19:17:27 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [regression] STP on 80211s is broken in 6.4-rc4
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Nicolas Escande <nico.escande@gmail.com>, nbd@nbd.name,
 =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>,
 Kalle Valo <kvalo@kernel.org>, Johannes Berg <johannes.berg@intel.com>
Cc: linux-wireless@vger.kernel.org
References: <CT5GNZSK28AI.2K6M69OXM9RW5@syracuse> <ZIQbs0wqdRh7c0Kx@debian.me>
 <a9d02800-2cd6-a27b-7998-4c97cf2eb692@leemhuis.info>
 <CTDWJJDKSYYD.XBG1CAZB3A5W@syracuse>
 <50f7f64c-fe32-4362-fd4e-89ee99c4f581@leemhuis.info>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <50f7f64c-fe32-4362-fd4e-89ee99c4f581@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/23 16:25, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 16.06.23 09:45, Nicolas Escande wrote:
>> On Thu Jun 15, 2023 at 2:54 PM CEST, Linux regression tracking (Thorsten Leemhuis) wrote:
>>> On 10.06.23 08:44, Bagas Sanjaya wrote:
>>>> On Tue, Jun 06, 2023 at 12:55:57PM +0200, Nicolas Escande wrote:
> 
>>> Hmmm, Felix did not reply. But let's ignore that for now.
>> I haven't seen mails from felix on the list for a few days, I'm guessing he's
>> unavailable for now but I'll hapilly wait.
> 
> Okay.
> 
>>> Nicolas, I noticed there are a few patches in next that refer to the
>>> culprit. Might be worth giving this series a try:
>>> https://lore.kernel.org/all/20230314095956.62085-1-nbd@nbd.name/
>> Well this series already landed in 6.4 and that is the version I did my initial
>> testing with. So no luck there.
> 
> What? Ohh, sorry for the noise, I had missed that they were in mainline
> already.
> 

Hi Thorsten,

Should this be removed from tracking as inconclusive?

-- 
An old man doll... just what I always wanted! - Clara

