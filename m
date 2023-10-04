Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8CB13FE3
	for <regressions@lists.linux.dev>; Wed,  4 Oct 2023 12:50:36 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c87e55a6baso1303495ad.3
        for <regressions@lists.linux.dev>; Wed, 04 Oct 2023 05:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696423836; x=1697028636; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BhOZL0I3FBTOfyJ3ennuGJmU/lunAyqILUznWBH305w=;
        b=ZxPp55LKTk16UrIXgo8RBv0cuoA7NfaFbHu0i62tc8lkzcyMcUZVuiUd1VVh1qX1wy
         yP+WiLQVivHe1YdkuJ6ZTiTUbAMPdmf+OERaNpJkVt7akkSGlaQvKlO0qOJnuCgPx4oz
         RISCLDqw2RncLnOwsiuHutmbHnk3F0cS1RF60/0v0VZgIX/aJmjGqmSBR8Eot9x6n76r
         ZKzCyAWJP58PSdqQgJF7LRLmjwrtPVsWqyNMgwrJ/u8v0CRjVWhddqftuonW9LiVL2AV
         FeSfpM40APMQ4InJXyoayqiQQiiZ9B2Mnl0lQ/u52ClGR5Mplmjgw7M15SZv6oA8B82Q
         os7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696423836; x=1697028636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BhOZL0I3FBTOfyJ3ennuGJmU/lunAyqILUznWBH305w=;
        b=nFVFO1rN2M2UGNpT4G5BOve1jtvyH41l95ecc/0CEOKBr8LW8i/XCUImix+n2DM7+h
         u4f/QvSIQFunYm8QQXp/n2mjAwV1yDCBaFhGrsq4tmfgDePcCreZK2Bk0v2V+GfYi+pF
         Z7EzKZ1nyGhJOb5X+0Kpaea/cK8LagAXTFECauuCK6Dm/n4n//uG3kxik17TRRVLjBux
         D66E+sIZ9RcU67pq4zV6xHHSX0honWc2Acl/foFKo2rXZKq6wv86EaoJ+vFbEPetswof
         KFR8YtP88/GVCU+EvZ47KVtl/MM9wJd1VYVrusAdzYvFyX8DEYqOmfeX5DADpJfo+kY8
         fizw==
X-Gm-Message-State: AOJu0Yz9LPber/jM20BEzqW+tynuhHFiENUnGmGNKVnxQlBAhQfAo/lR
	TeGJrwg9fCRfP9+sFKRKSyY=
X-Google-Smtp-Source: AGHT+IFcjMsOQQhmGdfIuMvLf8hz8TNgdUnzohKk0xxDDt4+Vc0L1eBz/HGGC0IQWyDiJNN4xSJjKg==
X-Received: by 2002:a17:902:e810:b0:1c5:59ea:84de with SMTP id u16-20020a170902e81000b001c559ea84demr2643108plg.29.1696423835809;
        Wed, 04 Oct 2023 05:50:35 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id p18-20020a170902e75200b001c61073b079sm3612247plf.71.2023.10.04.05.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 05:50:35 -0700 (PDT)
Message-ID: <bcf1998e-5efa-4505-a8d2-3381c16de885@gmail.com>
Date: Wed, 4 Oct 2023 19:50:29 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: what to do on no reproducer case? (was Re: Fwd: Uhhuh. NMI
 received for unknown reason 3d/2d/ on CPU xx)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
References: <0e6de51b-da1d-43f0-ffae-fb521febbe07@gmail.com>
 <ZQo8hzP-eRjXvtXf@debian.me>
 <2a298145-b6ec-4b4e-bd45-0cddf62b6052@leemhuis.info>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <2a298145-b6ec-4b4e-bd45-0cddf62b6052@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/09/2023 15:10, Thorsten Leemhuis wrote:
> On 20.09.23 02:27, Bagas Sanjaya wrote:
>> This regression looks stalled: on Bugzilla, the reporter keeps asking to me,
>> for which I'm not the expert of involved subsystem. And apparently, he still
>> had not any reproducer yet (is it triggered by random chance?). Should I
>> mark this as inconclusive?
> 
> Yes, without a reliable bisection result there sometimes is not much we
> can do -- apart from prodding various developers directly and asking for
> help or an idea. But in this case that's not worth it afaics, as
> messages like
> https://lore.kernel.org/all/e08e33d5-4f6d-91aa-f335-9404d16a983c@amd.com/
> indicate that it might be a hardware problem and not really a
> regression. Hence:
> 
> #regzbot resolve: inconclusive: not bisected and might be a hardware
> problem after all
> 

Thanks for the tip! Now to fix up:

#regzbot inconclusive: regression not bisected - possibly hardware issue

-- 
An old man doll... just what I always wanted! - Clara

