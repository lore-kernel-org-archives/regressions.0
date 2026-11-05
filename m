Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923168;
	b=Tit4Ep1Tsg61IQzLbfU9DxZBtfB7zgPbYcpaShYWRj9tHgoHATCqeA0VB8A02JoNIA7k
	 j9NoXMBHJF55JnvAjRT/lvCmr1f1JdFwwwZbVp0SwgwrsznHFGZ/F6lu7Zkw+NSJ3MEpK
	 6kJb09OS8fImpPlcbR0PucP7Zoh9rJM6Z5D+HQq0kVBCRlbSCYiTrAro1BDI+VMmDm19b
	 FKcQiBmQWdwR7gLbK5ebjykLNjj3q0WvDGXzQuobMgp3l/M0gyjl/yQSYOTy/l7TpcbgC
	 YlVaCptWM/YOHCq3CRy0ldCa6UINQFdIwmS6IHc//LNpzB0ZzIlZJ6azs2mKXWM2yAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923168;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:X-Google-Original-From:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=b3EJWAyP/KgN/GqYocveH6uI/meUdW4z3waTDv9EBRc=;
	b=xWlO1qRhc8h7UjrFdtmcwMlLhcZ2DFkhFTyIJ7jbbcnkJaBVXFVlzEYYmkUHcIjtla3P
	 KUfveTHsx1w50VwP9rwA1mDBnFLqk2C6GUJFiItEBMtiSVoUyZxc457ndZjHy2Q8x9tHR
	 m/fK8pOvOqcemS4wJfoINJLQXXNeZMLpSMoUqJrFFGAV8XTiEfb1rxltEhEiIF24iIa8O
	 6JWbiV+XrXKDtm4D9UYX20Dv7yZTO//80zGQ4qy8jyKTdV/97WSFhiOi0V/tUCyHL7oAy
	 L/bNB/7xtJCRj+UL2ettfj00OjK1uMnoM11VHJFZuEbX7XhSero0ZPspwNKMNUjTUvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CVQP7vk7;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77719606A329
	for <regressions@lists.linux.dev>; Thu,  5 Nov 2026 23:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77719606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CVQP7vk7
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so34971a91.1
        for <regressions@lists.linux.dev>; Thu, 05 Nov 2026 15:59:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923167; x=1794527967;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:dkim-signature:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b3EJWAyP/KgN/GqYocveH6uI/meUdW4z3waTDv9EBRc=;
        b=WsaiL0jciUJCFC/O8JGz+8VbwgFyKCE1MQdtaByBMBemMCK3QlE4JT8xxxZQUarGxt
         SWLUDq7gFobL4xgDpCAPLQLFxb4HZ20ivP6J5/BBx9bMIGbKwcn7VHpbHzDSGpW1qtDN
         xeq0nClbqK+J41TFn8spXdlS80xpt8FY3vLdfBzHXB0iLnv++7J3R+7WLlNaQJw8Jbmn
         JHPHW6q3GNTIlCBg9/52mdzz2Oz5bXViKtF4DQecPKakOo4GERcVjDuc1XSUv9TGInb+
         0ekjTpI4I1MSHQeuD95+2Wro+rGjiMx32/qosfaSxwz6DZAQjUDVUrik7z8o1fA36i44
         Q84g==
X-Forwarded-Encrypted: i=1; AKwUvBx/A7lcxGIhL1HDdKwQuZoEX5icGP/iny/NXNaoliNjqBJxe8opMHU9qpK9xL5mzfnaWBmTYWgp6t3IHw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+z75w872ZBdbNStx/0jZrudiIGp0Co1AUIgaKSlW80L3FCotn+
	jx5iYafQN/TshrjXjgWJQZU3fhkyY+B890MGH61Iu4VneQBLT0Qpc/PV4cc8Wat71HPRQwsAFR/
	VP54MovvWJTuuxmQv4+yxoYdcu2OvjdNHk+I0KRThOPu/k7kwiwVyaQTGC2jSJh1LmDz7vqnpsR
	YYegM/lGmUPfOgtr+tfsMnUdKG4OiGiHYvmTzKKRAjSEtI4QuqjjUEDBL808w09RJb2aTy+Pmfu
	IyVbGvV8H2y3AR8OEJjJJk=
X-Gm-Gg: AYBFou3tVsWE0htlfxkeXMazsEtkBbEqJWuYM56KHtVWi1m+zkSy9AQLvfVWsvpjM6e
	U8ACZYTMSCYJNbaaUw/aQrye8YXTLNELElvTH6TwMjuKkm5Mp8HoBtgXTpRrO82V0h1t7/dTqE0
	a/WuGGUSXgn+t3TdH//EWaL05qDaXh+FSQdb+8JYgz+eIHtHq1OfmazAYEZDb3uTL9fncA0PP7S
	K43VIZDzHYKdzCECNg5GclVRZIboVf/19dvxpeSNUUs/Fh3RfmapydeUD+8LHlTN2sAE4K7EAxG
	KeVQPdv45FMaF+3BeCVH2YuesrohCl+pRTvtAzcFk95F371jyOWLvLVWI9bh0Gbk9KrcxhtS3cZ
	uapwsW7xfiKE5uECUf2TIqGTbPluOeTdIsld0NYlT+lp9J6YB5vDmFjPO5nslUuy2O4PJ2ydINJ
	hGUeyxLiinlyGKTuceT4qdzoGBwThGVYJdTomDAmrj
X-Received: by 2002:a17:90b:5410:b0:3b0:d365:f8ed with SMTP id 98e67ed59e1d1-3b0db6c9cb3mr685583a91.21.1793923166770;
        Thu, 05 Nov 2026 15:59:26 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b0d7c9e095sm671262a91.2.2026.11.05.15.59.26
        for <regressions@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Nov 2026 15:59:26 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c817b56adso1450926d6.1
        for <regressions@lists.linux.dev>; Thu, 05 Nov 2026 15:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793923166; x=1794527966; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3EJWAyP/KgN/GqYocveH6uI/meUdW4z3waTDv9EBRc=;
        b=CVQP7vk786Ui4gGdl+KK91HyHUJEywlYabOd4BWDNokrlWLXEuxzBjvWqYfwpZIXWC
         gOd0eqzGd13m9u5ZdOc/BgMt3I9CyoAuN08TbOP4fkqWFWeTviot1pNwtlXVkISo3oBJ
         QdAz5GIPHu3pZvvFlmQQnjE1L0LCz7PsAtKlw=
X-Forwarded-Encrypted: i=1; AKwUvBzqcQe/pLAERV03RG4elXZLetY6JNBbPXjIbeWiPJ/VwUJ4gJL7KXGMi86NjwcIuON8r8PZjvSJ22M1gQ==@lists.linux.dev
X-Received: by 2002:ad4:5e87:0:b0:91e:8d68:564b with SMTP id 6a1803df08f44-91ea961d91emr9255346d6.16.1793923165531;
        Thu, 05 Nov 2026 15:59:25 -0800 (PST)
X-Received: by 2002:ad4:5e87:0:b0:91e:8d68:564b with SMTP id 6a1803df08f44-91ea961d91emr9255166d6.16.1793923165088;
        Thu, 05 Nov 2026 15:59:25 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a4f9bdsm7260506d6.16.2026.11.05.15.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 15:59:24 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
X-Google-Original-From: Florian Fainelli <fainelli@broadcom.com>
Message-ID: <097f4855-eca1-414a-932c-107d9eee5088@broadcom.com>
Date: Thu, 5 Nov 2026 15:59:21 -0800
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/idle: Stop the tick when no cpuidle driver is
 available
To: Christian Loehle <christian.loehle@arm.com>,
 Joseph Salisbury <joseph.salisbury@oracle.com>,
 "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: rafael.j.wysocki@intel.com, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, frederic@kernel.org,
 linux-pm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev
References: <096b42fa-107f-450d-b3b1-03bcad3f1e04@oracle.com>
 <CAJZ5v0g+SkTxuP5fqUMisQAh19v-JzpmRZHiKtYzJH1sVt656g@mail.gmail.com>
 <5f5cb821-92ae-4539-ae81-a43e33a7ded5@arm.com>
 <f5946a8a-43be-49d4-a827-25149112b21f@oracle.com>
 <774c3a68-6a6b-4e2e-a347-03e36953b750@arm.com>
 <0b9b9c3d-8ba0-4329-9504-b9d33c627649@arm.com>
Content-Language: en-US, fr-FR
Autocrypt: addr=fainelli@broadcom.com; keydata=
 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
In-Reply-To: <0b9b9c3d-8ba0-4329-9504-b9d33c627649@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 7/28/26 09:37, Christian Loehle wrote:
> Commit f4c31b07b136 ("sched: idle: Consolidate the handling of two
> special cases") changed the no-cpuidle-driver path to use the previous
> tick wakeup heuristic.
> 
> Oracle reported a substantial sysbench regression on small OCI VM shapes
> with no cpuidle driver available. Reverting the commit recovered the lost
> performance.
> 
> Restore the previous tick handling for the no-driver case while retaining
> the heuristic for the single-state cpuidle case.
> 
> Fixes: f4c31b07b136 ("sched: idle: Consolidate the handling of two special cases")
> Reported-by: Joseph Salisbury <joseph.salisbury@oracle.com>
> Closes: https://lore.kernel.org/all/096b42fa-107f-450d-b3b1-03bcad3f1e04@oracle.com/
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>

FWIW:

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>

We also hit this issue after it got back ported into stable trees (5.15, 
6.1, etc.) and this is seen during a network throughput test. This is on 
an ARM 32-bit platform with:

# CONFIG_ARM_CPUIDLE is not set
# CONFIG_ARM_PSCI_CPUIDLE is not set

Not that we could not fix that, but this platform really only has WFI 
has the idle state and it looks like other people are impacted anyway.
-- 
Florian
