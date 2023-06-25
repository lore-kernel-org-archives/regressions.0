Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9587487
	for <regressions@lists.linux.dev>; Sun, 25 Jun 2023 18:17:26 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-39ecf031271so2250025b6e.1
        for <regressions@lists.linux.dev>; Sun, 25 Jun 2023 11:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687717045; x=1690309045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAA+VrbO9krgfzrzDGzCg+M3T3IjPa2ks+yrz5EWc4o=;
        b=jDPKWbld2lNsNaTcg4vgnyBxkoEwQs8+Osrvz7LiEQsvL2fEjMXk7L0nL9S3AWZRzm
         iq07s4nJv+KzxSeuGy9Csco1w8GqHv02h9VIC5zikekCrnI7K8dx6gmLthIYk8fNF666
         MkkzYsbedQzt2u6y84BAdETMidChRNtxpXImfXO1UsunzeGM752eB3BV5FUGO5YSSexZ
         bCkAf3n03b6yj7TNesbLhAx5iq1FvoQHujaBdW61Sv0rApLHtia9JDRMvS7ZLLTn8Brx
         4BODOfI6WlV9AdUguunYz55357/+0tBWrM4a35mrOZVGq9dlL99PXlsp9K5CuXqUwPT5
         Zthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687717045; x=1690309045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZAA+VrbO9krgfzrzDGzCg+M3T3IjPa2ks+yrz5EWc4o=;
        b=bWa11jWqFaP1xCr3m4tq/FtsVRhmUEVU4VVcI3c0pKYfDf1DBOPy0Vfz7UVDuYUI5l
         tWTfkS/ZsIzMns3/HH9ZWoGAJ8QImnDWsgpWBuEmQqifC+kniWE0L6zxtkuBat805NKa
         ezoVmlIBoHiJJMYRHMByzMP8ikRnMYfycz9iukAOituVW28CH7m9ChikvLjxZa39lvJI
         v4BBZCaD/BhM3osaxgC0WWTD+Du+vUP9rgqJXfddHdExzgf9JDFIY17xUlgmx60K+9Hs
         PASd8WiOg2LOalMsugxUrzenw9ujXMWJrSeToyOtJbx3fURzjdd7Xvw+dsLSpd1O6rZk
         rQDg==
X-Gm-Message-State: AC+VfDxlBG/Od8m5faqNCrOf/I/TsYW19z5ENufOMvDJbKwD/4bVdkgr
	ogs6I0+eRfofMSRenvqR2wQ=
X-Google-Smtp-Source: ACHHUZ5H32ckcsK1zBfyNZceMELsMtOPJ905PuQ8Afi9/aItnS8mT3KegO0GWvzYKc6z2xmQQkC4EQ==
X-Received: by 2002:a05:6808:2810:b0:398:4761:20d with SMTP id et16-20020a056808281000b003984761020dmr27571840oib.19.1687717045532;
        Sun, 25 Jun 2023 11:17:25 -0700 (PDT)
Received: from [192.168.1.119] ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id u3-20020a056808000300b0039cc917d0b9sm1697342oic.16.2023.06.25.11.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 11:17:25 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <da80b806-de3f-c7ea-0352-cd23e0f6dd65@lwfinger.net>
Date: Sun, 25 Jun 2023 13:17:23 -0500
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Fwd: After kernel 6.3.7 or 6.3.8 b43 driver fails
To: Arnd Bergmann <arnd@arndb.de>, "Sardonimous ." <sardonimous@hotmail.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Wireless <linux-wireless@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>
Cc: =?UTF-8?Q?Michael_B=c3=bcsch?= <m@bues.ch>,
 kernel test robot <lkp@intel.com>, Simon Horman <simon.horman@corigine.com>,
 Kalle Valo <kvalo@kernel.org>
References: <27829c69-515c-36a6-4beb-3210225f8936@gmail.com>
 <b9428e48-f0f9-46f6-892c-4c8834c930c4@app.fastmail.com>
 <RO2P215MB193850DDADD38492BEC8CC2FA720A@RO2P215MB1938.LAMP215.PROD.OUTLOOK.COM>
 <a3bc5eb5-9639-8016-36ab-105abc8c0ca3@gmail.com>
 <69b98eb4-2c4e-fe75-90b4-4b08505a595a@lwfinger.net>
 <RO2P215MB193879B2D99DD0BAF59EFA92A721A@RO2P215MB1938.LAMP215.PROD.OUTLOOK.COM>
 <e0a08449-554a-4a28-ac50-7051866eb95e@app.fastmail.com>
Content-Language: en-US
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <e0a08449-554a-4a28-ac50-7051866eb95e@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/25/23 13:12, Arnd Bergmann wrote:
> On Sun, Jun 25, 2023, at 18:58, Sardonimous wrote:
>> I have been unable to get DMA to work in the past.  So I have been
>> configuring it with PIO=1 (/etc/modprobe,d/b43.conf):
>>
>>       options b43 pio=1 qos=0
>>
> 
> I think the qos=0 parameter is what causes the WARN_ON(), as that
> causes the use of only one queue, while the warning happens when
> tx function iterates over all the queues and warns that they don't
> exist.

I agree and suggest running with no options. If we need debug, we can turn it on 
later.

Larry


