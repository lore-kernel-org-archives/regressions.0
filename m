Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCF32562
	for <regressions@lists.linux.dev>; Tue, 20 Sep 2022 14:14:34 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id p3so2312886iof.13
        for <regressions@lists.linux.dev>; Tue, 20 Sep 2022 07:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=/yot0ov3usmKB3Zy+wkJUKPk22BQTuylnVUMZmxsCR4=;
        b=lIXZTwlaHIbQQ9hNPvRV7HuGvm5RDJYX8qcUeX22OX83N0tkw9Xt13KdlC/anWINwm
         GSdQCjuqFlnjXmK6d3quFgRZ7vkpgfhPiFdng2KG0u9ylgvfBvqMepItjYQ2ivjERQGp
         8lbIhTvYiKoy9hpyPK3TjnPUEnO2JyjF2hhVOdKkuSRa0+4ZtVIZ0cplD7cmpKuDl69T
         uqT78PPAKOllkkBpBIUzKAmALjQnSnksHUYVyAn5ydOljMtwsZEGwWrugEhmfOR/ZRxs
         gaLDLph39qi7lQQj9HHR0xjlCHEUwJZ+rHe2pgOisLfuPgHb7r7OhEJ2DUDpVDTh2sgy
         kqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/yot0ov3usmKB3Zy+wkJUKPk22BQTuylnVUMZmxsCR4=;
        b=QrPTIShvXGF8hyzxKprjKF2bRKy8l6/uQVlGMRe7nmpheGJn8GRhcWVGLlC034iUED
         L/YTY5+VZ7w/pUBn8/nv/LH9WnNvHu/ORV06sf5WM/cNTyK9I8yQ3IwEvrdUtamPYmjz
         DNPHVq+g6zEhARsa3xnzmJo/1QItMwmsn/jHpgmKy43SNblYk0ZTAIYPFKG90JF0M2vm
         N1k0gbAFXelj9FuauwyKao4uYj5QgtPiatc30JVS1lIpB26B2TFD1ETsEwPvkS/x/B7I
         qmZL7uCiXwAIt7bHWlVztkWA5mRJHTBwKByPq97BfnBWV+u8QV+Yo5ZUoa14JKACycFw
         P7RQ==
X-Gm-Message-State: ACrzQf16HfoysCc/q2iA3fz6fLrbWBVnnlJpoBig7undVggSnZigLmUm
	r0CRT06TVVsm/tUKYjtNwL/V+A==
X-Google-Smtp-Source: AMsMyM4Fm0kTiShfxuAAb97HY9gCdOOBLEjpM6ZrfDeefAteWrULruA4zXYQ/fIChp4JLiLJB3BlqQ==
X-Received: by 2002:a5d:9902:0:b0:6a2:f72d:4b21 with SMTP id x2-20020a5d9902000000b006a2f72d4b21mr5956574iol.113.1663683273188;
        Tue, 20 Sep 2022 07:14:33 -0700 (PDT)
Received: from [192.168.1.94] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id w16-20020a056e0213f000b002f5cd533b31sm125125ilj.0.2022.09.20.07.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 07:14:32 -0700 (PDT)
Message-ID: <9594af4b-eb16-0a51-9a4a-e21bbce3317d@kernel.dk>
Date: Tue, 20 Sep 2022 08:14:30 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: regression caused by block: freeze the queue earlier in
 del_gendisk
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
 Dusty Mabe <dusty@dustymabe.com>, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <017845ae-fbae-70f6-5f9e-29aff2742b8c@dustymabe.com>
 <YxBZ4BBjxvAkvI2A@T590> <20220907073324.GB23826@lst.de>
 <Yxr4SD4d0rZ9TZik@T590> <20220912071618.GA4971@lst.de>
 <Yx/jLTknQm9VeHi4@T590> <95cbd47d-46ed-850e-7d4f-851b35d03069@dustymabe.com>
 <f2c28043-59e6-0aee-b8bf-df38525ee899@leemhuis.info>
 <d39e9149-fcb6-1f7c-4c19-234e74f286f8@kernel.dk>
 <20220920141217.GA12560@lst.de>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20220920141217.GA12560@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/20/22 8:12 AM, Christoph Hellwig wrote:
> On Tue, Sep 20, 2022 at 08:05:06AM -0600, Jens Axboe wrote:
>> Christoph and I discussed this one last week, and he has a plan to try
>> a flag approach. Christoph, did you get a chance to bang that out? Would
>> be nice to get this one wrapped up.
> 
> I gave up on that as it will be far too much change so late in
> the cycle and sent you the revert yesterday.

Gotcha, haven't made it all the way through the emails of the morning yet.
I'll queue it up.

-- 
Jens Axboe


