Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4E515AF6
	for <regressions@lists.linux.dev>; Wed, 20 Sep 2023 23:46:23 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-565e54cb93aso186082a12.3
        for <regressions@lists.linux.dev>; Wed, 20 Sep 2023 16:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695253583; x=1695858383; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gt6HbARnWKAOwgAzvceRCxf7hg7g6Yih13zOrAxmt4c=;
        b=Os1P7bsk2Q3/7Y16piM+3JwUoYY4MMpf8oEUMzXK43+F5x5T27u8ygJSsIAgT44wvX
         puDkgR53BRedFUqKVIQJA8GoTOEFh18xnQtilLbxxfs0ABez5zlaaKKFdl6AfRmEnKO4
         k6dFRGZKjegkcHp7vrhx6hDBDFxK2VOlxhT/feXJHSfV5XMWENQ7H6dzu1lQAOuSzzcx
         fbAfde7SPQCtBGMbgMeE9QVOz9VqS8zyDD13xjLO1kX5oQxzZKpNjumX+2v1nbgtg2nS
         6q/4Kg5qjxkskwjk09rEDbiWzoLVZCg3HMo1ilR1UfcGbQY0Ww8LVYIUf2byr3yzfCQj
         LY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695253583; x=1695858383;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gt6HbARnWKAOwgAzvceRCxf7hg7g6Yih13zOrAxmt4c=;
        b=b89eXnotuCIm0DeAabfoKmKRbcdzRxm6Wuy678VgLHYBBanYJm0Tl2B7XmTwaKWNI2
         2ry7hdox+gvTlRDebzI5F5YZCguncy9D7VhqiMhtjX26Aefj5GII7Or0AqqgbF93GBoj
         rqmpJuSSa9BwL5EVqAOr70uQ9fMvIjvPrKbDgglEgiR6WQREe243EnaMZkufk8f9YL41
         ELAnUzV64o/4LWOzUzlEi5Vlr313s4a+S4URom2hT2sbVb7+CSPKpdXeJfkJUHalfwTw
         3jrFYm6BRc7EkhXuM8J1fk2XpOYF7bPHiur1JtBNYQQCJZb9JEy/55b6NrHNoFlYBQaF
         xNMQ==
X-Gm-Message-State: AOJu0YxjN/bHLSZzKb5D12lOyVFgMSrrsDAc8UjWBH4IkrLzthny79q7
	nJmjK2S/WLcjeXULBQ21QFM=
X-Google-Smtp-Source: AGHT+IGYYfkcLaMLf9C2sRaRabd/3On4jxViG84hz4RI/C811nmL4dtFq3m1Y3YPmEZJpHZgYD3MQg==
X-Received: by 2002:a17:90b:1192:b0:259:466:940f with SMTP id gk18-20020a17090b119200b002590466940fmr3809419pjb.22.1695253583224;
        Wed, 20 Sep 2023 16:46:23 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id u4-20020a17090a518400b00268dac826d4sm162709pjh.0.2023.09.20.16.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 16:46:22 -0700 (PDT)
Message-ID: <0958f446-7637-4fbb-8c78-ad82faf93324@gmail.com>
Date: Thu, 21 Sep 2023 06:46:14 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Regression] Bug 216360 - No power to DVD drive
Content-Language: en-US
To: bruce <bhealey@live.co.uk>, Thorsten Leemhuis
 <regressions@leemhuis.info>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <d0433877-2971-b54d-fcbe-2837ae9248be@leemhuis.info>
 <ZQryrfLC6GPhSCnu@debian.me>
 <GVXP194MB17595E1811E5132B6E03BADF80F9A@GVXP194MB1759.EURP194.PROD.OUTLOOK.COM>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <GVXP194MB17595E1811E5132B6E03BADF80F9A@GVXP194MB1759.EURP194.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/09/2023 01:52, bruce wrote:
> All,
> 
> I have started work on trying to find which version of the kernel this bug first appeared. It is taking me some time to find how to do this (might be easy for you). But I have other priorities at present which mean I have not had the time to work on this. My present commitments end at the end of October and I expect to get back to this at that point.
> 
> Yes, I do care about this bug and I will get round to it but it on the equipment I have it is inconvenient, takes a long time for each build and stops me working on other things.
> 

Please don't top-post; reply inline with appropriate context instead.
This allows readers to follow and understand the conversation flow.

If you ever come into the specific culprit, let us know. In the
meantime, you can also try reproducing this regression on more
powerful device.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

