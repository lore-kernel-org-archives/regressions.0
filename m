Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CFF7B
	for <regressions@lists.linux.dev>; Fri,  2 Dec 2022 10:47:34 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id r18so4049203pgr.12
        for <regressions@lists.linux.dev>; Fri, 02 Dec 2022 02:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tgZSbXK5o+bjYMnDUxSeKCoU1ZNZ3QNjnUYkpRFNIuI=;
        b=mX1kjgJc4h7LRgfUswxA//V9WUVhM5wGeGXf0CyYSKUjR7ge2zNybUdZhpqFbewLCT
         u36cI4CItXFWnDXJxYQVy0gRi0y24BymlYVH9WYUAr0Khp9uKO56C9hEBUPau9PMQVHj
         CxOhg4jSYeSzGgZX455R59cDvxqPVOZON0SBVmsSaMzV+D6QoJi22ciGy0O2uIK1AY4F
         E3vO+C6dXnSI3a6wSnp4Z4JvvQgyyvz9PXwCHc3JkQZoigFwlWAavsQsmvGHU5RpgsNo
         5Nvdo5Qnj2jjvZjra5W3KYPx2Nf8uGmMYcL7RT5ZkzNI4t6OLS+CKE3RKH0TctxRgtih
         TEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgZSbXK5o+bjYMnDUxSeKCoU1ZNZ3QNjnUYkpRFNIuI=;
        b=CXnEkmg+1IJ7hc/coE5wtjGQdDtTiv+5+HWFvwu8s9mCVsQEzZtgjzZMBgbfJ1oGpb
         OeekgZyX47XxRKNYwfh9Bgy3iECcadV+TJ0M5OjPl/B3X4G6KOTHcLNuBnoDi9HRyBh4
         i750FWxXSkg552BzvbVW1V41ewhlXJUU5WGB8kjEfHiV3cGtAjutDD1WHPXN7wsVMET6
         MvrYLbRxXjfYD1v1NH0TJif0nTglXFowSmASfaCp9vneaaqIOpAscjaEiOvoipJUg8v0
         IIbpWe/jIUU0/OAnk6jtFFgFTrZoRJ+SRgvTI7aZuizSWxViIdHb/sabYQHuRkRwrl8J
         nuyw==
X-Gm-Message-State: ANoB5pl8WE228ifJyNsniD+c1vhhgdr0RLO0pBeas/B/aozYyUOtgzOp
	8XfWC3itTwXrPdWKR6JdQYkdpQ==
X-Google-Smtp-Source: AA0mqf6TS5g3heiZgAiv8Xg5rvRSa1KrPHqVDeAXVy5mSEkOMG6N2DK4oaYrM0TwjOP6KliKXvikkg==
X-Received: by 2002:a05:6a00:1a14:b0:557:ef5e:6db3 with SMTP id g20-20020a056a001a1400b00557ef5e6db3mr55017894pfv.13.1669978054160;
        Fri, 02 Dec 2022 02:47:34 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902784c00b001888cadf8f6sm5258938pln.49.2022.12.02.02.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 02:47:33 -0800 (PST)
Date: Fri, 2 Dec 2022 16:17:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Allen-KH Cheng =?utf-8?B?KOeoi+WGoOWLsyk=?= <Allen-KH.Cheng@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"vincent@systemli.org" <vincent@systemli.org>,
	"frank-w@public-files.de" <frank-w@public-files.de>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	Jia-wei Chang =?utf-8?B?KOW8teS9s+WBiSk=?= <Jia-wei.Chang@mediatek.com>,
	Rex-BC Chen =?utf-8?B?KOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>,
	"thomas.huehn@hs-nordhausen.de" <thomas.huehn@hs-nordhausen.de>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>
Subject: Re: Kernel Kernel bug caused by (cpufreq: mediatek: Refine
 mtk_cpufreq_voltage_tracking()) on Banana Pi R64 (MT7622)
Message-ID: <20221202104731.63mfshxwu3mqlbli@vireshk-i7>
References: <bf8d2a8f-7654-29be-1104-a842c6657b5e@systemli.org>
 <02c2c955-940b-b315-0474-85d0eddad7a3@leemhuis.info>
 <Y4jHvomTrU8guBox@makrotopia.org>
 <47a4665e-333d-a6e7-a2da-96cb06c2d87b@leemhuis.info>
 <20221202052716.uj3kzkunazmgazeq@vireshk-i7>
 <0ebef1a2-6b5a-04b9-a79b-79eb3349c32b@collabora.com>
 <c76bd301-0e8d-2d2b-0d3e-a57ece9b496f@collabora.com>
 <b1822bbc3775730c4cedf9652323c7d72e663e4b.camel@mediatek.com>
 <8be3e050-f32a-6761-8ebd-49c38dfcf9eb@collabora.com>
 <c186d104-43e0-ca10-3ce2-c2f922acd8bf@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c186d104-43e0-ca10-3ce2-c2f922acd8bf@leemhuis.info>

On 02-12-22, 11:41, Thorsten Leemhuis wrote:
> Quick question: is that relative to apply at this point of the 6.1 devel
> cycle? Or would it be better to revert the culprit (already introduced
> in 5.19) for now and reapply it together with that fix for 6.2 (and then
> backport to 6.1 stable later)?

I am not comfortable applying the revert to 6.1 kernel right now, it
is too late and the revert is big enough. Also it isn't something that
came in 6.1 cycle itself, so it isn't ideal to merge it as a fix this
late.

I would like to apply the fix, if we are able to settle on one, for
6.2 and let it get backported via stable to all the affected kernels.

-- 
viresh
