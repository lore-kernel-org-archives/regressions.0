Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E42BE61
	for <regressions@lists.linux.dev>; Sat,  1 Jul 2023 13:42:37 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1b8062c1ee1so22300215ad.3
        for <regressions@lists.linux.dev>; Sat, 01 Jul 2023 06:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688218956; x=1690810956;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NIcrTyhBVMZdXfdQxOUQpBVZ5Mv9FfDAzxWay5IM0gc=;
        b=lfAebk6qMLb2dTym07ZEc12ys4pFm0B7LNEyz+Lxi0vUeX2+aOPh5059VV42OTEr3f
         cdjkKkNsbsO8Ha4N/hHSj855KFgSac8Bf41xZ/0jS4RRBTToYznQCkHZgfCb19Uggmat
         lNtXV8GdUghW65FDCMuUUGsqjXKwtA0K4X0YnmDQjVisEdMebmxlz33uYvMBj22XCG+b
         aJkESsIBdlxrf/Oexe4AKyeHX+Wpx+hnJFXuf50kwSRWjmFIZUsKrl/hiGSpg41rIJXx
         vzKsqq5G4i9TPINce4G9Os9nj2yh3YFS02nhoK17nM86LTJSVQ7LvrXy6pCCwlUELzC6
         cAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688218956; x=1690810956;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NIcrTyhBVMZdXfdQxOUQpBVZ5Mv9FfDAzxWay5IM0gc=;
        b=VtF+tyyns1h0SdiBm5/yOtx9svXyWLCRxZCD8dISfT6l2WfUZO3sF4VcpeCW3cbT4O
         hwwqkrS0cJsM3ioKqbiKq7ZcaXvmDJqVtZtdiEQYEZLSMOq35sHDCImwLdcLMOvDERtR
         +cesErGni9lltdQlhDu94FURIj6XolmkbsjkjjM285OrjZopL3RBguIhyqi0cBJeuuFp
         OzJT9Z3TvNBgg1LEVbqdKR+6PG3AnnMO4XuLc71T+0qfpPvumDSHseZEuoB/2t0YMg4u
         M6049q1GxtzBHLrwuoePVg2g56yx/+Ng9hlVF5D8znJAkNPsEJDVOVBzXMBL5KwLVtsF
         vN/A==
X-Gm-Message-State: ABy/qLabWUZHF5spDbaPvyYCnnpqu+OVqxTw9gcXFv1DiDgN2NQfZZ/a
	+zrCZtYl8pj+uTwQSFaQTv2G0StXRY1xag==
X-Google-Smtp-Source: APBJJlEEx1xsXabB8nYZ0gjR9TuLfadUC1rA3Enfl6Gxq631rsP18fAu4/iZoH8WH+x00yLVKZHbcw==
X-Received: by 2002:a17:902:b488:b0:1b8:475d:ebf6 with SMTP id y8-20020a170902b48800b001b8475debf6mr5225629plr.0.1688218956435;
        Sat, 01 Jul 2023 06:42:36 -0700 (PDT)
Received: from [192.168.0.103] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id g12-20020a170902740c00b001b6674b6140sm12364970pll.290.2023.07.01.06.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jul 2023 06:42:35 -0700 (PDT)
Message-ID: <e65bf45f-72c5-7239-6caa-609f3c9f24d2@gmail.com>
Date: Sat, 1 Jul 2023 20:42:30 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Fwd: commit 9df9d2f0471b causes boot failure in pre-rc1 6.5
 kernel
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Borislav Petkov <bp@alien8.de>
References: <4d9fb4a9-6c48-600c-f625-8ef66208090a@gmail.com>
 <ZKAboYIj6pAd9CMO@debian.me>
 <74014a7a-7d91-0854-8002-faf32d9c65e1@leemhuis.info>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <74014a7a-7d91-0854-8002-faf32d9c65e1@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/1/23 19:43, Linux regression tracking #update (Thorsten Leemhuis) wrote:
> On 01.07.23 14:27, Bagas Sanjaya wrote:
>> On Wed, Jun 28, 2023 at 09:06:22PM +0700, Bagas Sanjaya wrote:
>>> I notice a regression report on Bugzilla [1]. Quoting from it:
>> [....]
>>> See Bugzilla for the full thread.
>>>
>>> The reporter can't provide requested dmesg due to this is early
>>> boot failure, unfortunately.
>>>
>>> Nevertheless, this regression has already been taken care of on
>>> Bugzilla, but to ensure it is tracked and doesn't get fallen through
>>> cracks unnoticed, I'm adding it to regzbot:
>>>
>>> #regzbot introduced: 9df9d2f0471b https://bugzilla.kernel.org/show_bug.cgi?id=217602
>>> #regzbot title: early arch_cpu_finalize_init() cause immediate boot failure
>>
>> #regzbot fix: 0303c9729afc40
> 
> Bagas, FWIW, there was no need for this at all. Regzbot would have
> noticed that patch automatically due to the "Link:
> https://bugzilla.kernel.org/show_bug.cgi?id=217602" in the patch
> description (thx for this, tglx) once it landed in next or mainline
> (just like it noticed
> https://lore.kernel.org/lkml/168813193932.404.2885732890333911092.tip-bot2@tip-bot2/
> earlier).
> 

OK, thanks for another tip! I was doing above because at the time
regzbot doesn't mark the regression as solved, so I had to manually
told it.

-- 
An old man doll... just what I always wanted! - Clara

