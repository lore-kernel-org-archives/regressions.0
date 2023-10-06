Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B97326E04
	for <regressions@lists.linux.dev>; Fri,  6 Oct 2023 18:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="rwnyv8kc"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c364fb8a4cso20772095ad.1
        for <regressions@lists.linux.dev>; Fri, 06 Oct 2023 11:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1696618279; x=1697223079; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xCV04zCvYMSRZ8PLVrYCErwlWKz0o53q1/ujh2vCW2I=;
        b=rwnyv8kcFp80ood9KueFxl6sljU/SyNRXFEv5cCSJVA4KO9hOlL1UR2F1O1HmrU2XL
         XJorBDRM3l0rCb0chPDJiDA/DWh2CoYH8GE8XoF+cEU7zz3z+jIsMSOT4CEbOnpXVulY
         A+MVMr0hH6p1JAMheTSQUE/pxntt4jMH1McexbNwHK2NljWhNtxKqhIcO9Ug+3V3rXgh
         3j/aToPXpgDWr0wtjIJJEn0FVYVOtaGWqRLi9Y2xbuhREd9SvEJNCYyoIC/P1vDWJE9t
         jQKKu6IDkbV54vAs2ZbDCEN+m/X+QLa/YiqA81Q523+apyhmjdUE6GijDRfmyOb1Rxa7
         IyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618279; x=1697223079;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCV04zCvYMSRZ8PLVrYCErwlWKz0o53q1/ujh2vCW2I=;
        b=cr+Jjr6IWA0HxQLVuW7vcFSr7vIx6BuGNfsQJwwmRtLqsFfEe2U3mg+8pFmpUIOVBG
         AOmAjPdt8SLlraxJ8g4X/T1TAMjyCsHj+zFzbbFUGBVN/TvsfN2hMSPBS8DXIEQJAAPi
         NRus2iO92lhSiFV/cKu9MjAbPs3O80T1XixDS97NVDEiSRH4a3Qs+WB32nwBuHSHNpMS
         xlLQ+Ed4kXgAsSV/P/Pg+7pi8lglXuPYyPfZH001amg+L/YorsVHj0Gz+5ZjWILu3vW1
         OV8vx+wwIgT3L97rSsP++5lS2TQrWVV1Fb46AwAzaIkP56wsdQhxO8IAf/4z7E8sChG9
         qPng==
X-Gm-Message-State: AOJu0Yx+zdxnakTfWfmUfS9mZI8qmAQbfQbUWtIP1FBdYQLowbHTbGTd
	qxDwKsU8DaXB+5bI7Cg+Tu48tw==
X-Google-Smtp-Source: AGHT+IEFrO5y5ULP5CWa6iaqkAW2+FU1lSXIQ3Vc6+v8Jz0uz9VPVoCU5MsvSwDlydQL8BKJvZTrlQ==
X-Received: by 2002:a17:902:e5c7:b0:1c5:b855:38f with SMTP id u7-20020a170902e5c700b001c5b855038fmr10107695plf.24.1696618278642;
        Fri, 06 Oct 2023 11:51:18 -0700 (PDT)
Received: from ?IPV6:2804:14d:5c5e:44fb:c07e:d4ae:2d8a:ba4? ([2804:14d:5c5e:44fb:c07e:d4ae:2d8a:ba4])
        by smtp.gmail.com with ESMTPSA id o1-20020a170902d4c100b001b9f7bc3e77sm4251840plg.189.2023.10.06.11.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 11:51:18 -0700 (PDT)
Message-ID: <c7d4fe7e-5229-71c7-b93d-f6203e163f02@mojatatu.com>
Date: Fri, 6 Oct 2023 15:51:14 -0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [REGRESSION] Userland interface breaks due to hard HFSC_FSC
 requirement
Content-Language: en-US
To: Christian Theune <ct@flyingcircus.io>, stable@vger.kernel.org,
 netdev@vger.kernel.org
Cc: regressions@lists.linux.dev, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Jamal Hadi Salim <jhs@mojatatu.com>
References: <297D84E3-736E-4AB4-B825-264279E2043C@flyingcircus.io>
From: Pedro Tammela <pctammela@mojatatu.com>
In-Reply-To: <297D84E3-736E-4AB4-B825-264279E2043C@flyingcircus.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/10/2023 05:37, Christian Theune wrote:
> Hi,
> 
> (prefix, I was not aware of the regression reporting process and incorrectly reported this informally with the developers mentioned in the change)
> 
> I upgraded from 6.1.38 to 6.1.55 this morning and it broke my traffic shaping script, leaving me with a non-functional uplink on a remote router.
> 
> The script errors out like this:
> 
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2053]: + ext=ispA
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2053]: + ext_ingress=ifb0
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2053]: + modprobe ifb
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2053]: + modprobe act_mirred
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2053]: + tc qdisc del dev ispA root
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2061]: Error: Cannot delete qdisc with handle of zero.
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2053]: + true
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2053]: + tc qdisc del dev ispA ingress
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2064]: Error: Cannot find specified qdisc on specified device.
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2053]: + true
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2053]: + tc qdisc del dev ifb0 root
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2066]: Error: Cannot delete qdisc with handle of zero.
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2053]: + true
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2053]: + tc qdisc del dev ifb0 ingress
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2067]: Error: Cannot find specified qdisc on specified device.
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2053]: + true
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2053]: + tc qdisc add dev ispA handle ffff: ingress
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2053]: + ifconfig ifb0 up
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2053]: + tc filter add dev ispA parent ffff: protocol all u32 match u32 0 0 action mirred egress redirect dev ifb0
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2053]: + tc qdisc add dev ifb0 root handle 1: hfsc default 1
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2053]: + tc class add dev ifb0 parent 1: classid 1:999 hfsc rt m2 2.5gbit
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2053]: + tc class add dev ifb0 parent 1:999 classid 1:1 hfsc sc rate 50mbit
> Oct 06 05:49:22 wendy00 isp-setup-shaping-start[2077]: Error: Invalid parent - parent class must have FSC.
> 
> The error message is also a bit weird (but that’s likely due to iproute2 being weird) as the CLI interface for `tc` and the error message do not map well. (I think I would have to choose `hfsc sc` on the parent to enable the FSC option which isn’t mentioned anywhere in the hfsc manpage).
> 
> The breaking change was introduced in 6.1.53[1] and a multitude of other currently supported kernels:
> 
> ----
> commit a1e820fc7808e42b990d224f40e9b4895503ac40
> Author: Budimir Markovic <markovicbudimir@gmail.com>
> Date: Thu Aug 24 01:49:05 2023 -0700
> 
> net/sched: sch_hfsc: Ensure inner classes have fsc curve
> 
> [ Upstream commit b3d26c5702c7d6c45456326e56d2ccf3f103e60f ]
> 
> HFSC assumes that inner classes have an fsc curve, but it is currently
> possible for classes without an fsc curve to become parents. This leads
> to bugs including a use-after-free.
> 
> Don't allow non-root classes without HFSC_FSC to become parents.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: Budimir Markovic <markovicbudimir@gmail.com>
> Signed-off-by: Budimir Markovic <markovicbudimir@gmail.com>
> Acked-by: Jamal Hadi Salim <jhs@mojatatu.com>
> Link: https://lore.kernel.org/r/20230824084905.422-1-markovicbudimir@gmail.com
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ----
> 
> Regards,
> Christian
> 
> [1] https://cdn.kernel.org/pub/linux/kernel/v6.x/ChangeLog-6.1.53
> 
> #regzbot introduced: a1e820fc7808e42b990d224f40e9b4895503ac40
> 
> 

I will take a look,
Thanks!
