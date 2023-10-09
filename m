Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802CAD310
	for <regressions@lists.linux.dev>; Mon,  9 Oct 2023 15:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="ycOTf7ui"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c5c91bece9so33178235ad.3
        for <regressions@lists.linux.dev>; Mon, 09 Oct 2023 08:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1696865522; x=1697470322; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zb8b93dv90D56oZ0oYIg7blNmShNpf/GwP56Ss+ZJmk=;
        b=ycOTf7uirZxPEqV6AxFIfVFZ+x4pOupQ9IJrZCeeY83vJrxiMMyV6xf+8SW3TKrlx3
         RT12uDYl4FP/Ro9pYWvO5baUOQyLhyXQQcTIDRkteKvr0x/ZZWdjACGmLUlktKwrjAh7
         pDzdxz2dwbivn54EtfHqP5bHwswEihDbnDC6bPzR5cxD50HEZCKBF5Ax5slMX7DFBXhD
         c+11EInHQWioNtwNioD7LLdhIk7r+qro3PusQL462BhPfY1SeXqPr8leNCmw2iFjEo7J
         QCOekAXjsjyr+3HpJkOFuJIoI64McSGScJByZDy77lkF063P8yeBld9KXBAVeD4m2UYX
         ervA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696865522; x=1697470322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zb8b93dv90D56oZ0oYIg7blNmShNpf/GwP56Ss+ZJmk=;
        b=iZ56qd+020TDEuQtX3bdQAla6x8Rjjxv0S04gDY3Wkw8Nk88GJfF7kkLYPAWUlDLsC
         eo7eOwao0fHfQldluXXgmHESQSadHTVdeUMadhecz+SA/h1+h3joOh3oRk5cybOevhOZ
         xFmaJKy93bYzo8yOUcD7mhbXYxG+p5wYHMV5jO1YrR6+faau5IKj1QIbrDdpa4OGuauJ
         tkXAi1cvyBozmTvQ/20JcQ2pJZBx0JZA3qz/UvtjK9r+/y4K6RsMCbH6C0yih3j/KYhV
         Tc/v5i3TVllbXxl67b3dYBH5Uijq/Yut8d8RLS1P3ai4mHhIh1TJTfqSqoQUdMbdIqu0
         2k0g==
X-Gm-Message-State: AOJu0YwcXmHhDMR9BRiFjtmrTFl6mmfLclwjycSNMygB3S+i0GC2Rf4g
	+T05BOPhis/pPBCDEGZVtPBPHA==
X-Google-Smtp-Source: AGHT+IHC377mUubwTCvPh8gkyBN84l2AmdH1Zyqa4Dk1ALNvx86TDEH09ZXiPwpLRMcyroxTcA6V4A==
X-Received: by 2002:a17:902:f690:b0:1bd:f314:7896 with SMTP id l16-20020a170902f69000b001bdf3147896mr16795613plg.25.1696865521720;
        Mon, 09 Oct 2023 08:32:01 -0700 (PDT)
Received: from ?IPV6:2804:14d:5c5e:44fb:3e90:dc7b:9e2c:258f? ([2804:14d:5c5e:44fb:3e90:dc7b:9e2c:258f])
        by smtp.gmail.com with ESMTPSA id f8-20020a170902ce8800b001c76fcccee8sm9723461plg.156.2023.10.09.08.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 08:32:01 -0700 (PDT)
Message-ID: <da08ba06-e24c-d2c3-b9a0-8415a83ae791@mojatatu.com>
Date: Mon, 9 Oct 2023 12:31:57 -0300
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
To: Jakub Kicinski <kuba@kernel.org>, markovicbudimir@gmail.com
Cc: Christian Theune <ct@flyingcircus.io>, stable@vger.kernel.org,
 netdev@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 Jamal Hadi Salim <jhs@mojatatu.com>
References: <297D84E3-736E-4AB4-B825-264279E2043C@flyingcircus.io>
 <065a0dac-499f-7375-ddb4-1800e8ef61d1@mojatatu.com>
 <0BC2C22C-F9AA-4B13-905D-FE32F41BDA8A@flyingcircus.io>
 <20231009080646.60ce9920@kernel.org>
From: Pedro Tammela <pctammela@mojatatu.com>
In-Reply-To: <20231009080646.60ce9920@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/10/2023 12:06, Jakub Kicinski wrote:
> On Sat, 7 Oct 2023 06:10:42 +0200 Christian Theune wrote:
>> The idea of not bricking your system by upgrading the Linux kernel
>> seems to apply here. IMHO the change could maybe done in a way that
>> keeps the system running but informs the user that something isn’t
>> working as intended?
> 
> Herm, how did we get this far without CCing the author of the patch.
> Adding Budimir.
> 
> Pedro, Budimir, any idea what the original bug was? There isn't much
> info in the commit message.

We had a UAF with a very straight forward way to trigger it.
Setting 'rt' as a parent is incorrect and the man page is explicit about 
it as it doesn't make sense 'qdisc wise'. Being able to set it has 
always been wrong unfortunately...
