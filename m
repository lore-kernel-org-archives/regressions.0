Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BEA2C9C
	for <regressions@lists.linux.dev>; Fri,  7 Jan 2022 16:30:11 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id u8so7747557iol.5
        for <regressions@lists.linux.dev>; Fri, 07 Jan 2022 08:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=azdtjei8H3F887uLBWbFbfAT3uLSkbk5K45L3Vv9UNo=;
        b=oar8YcEKO/COWlgFuXb3nooULxnsMpGkYuMr34pFSHEtrUZsQekiucGTIVGP4RS8ko
         +aoGTNOUTSLTD5wdEjge7hBYwQDOweusgoNZZ5V0A+yhArWPRfdQtBkO+0WIg5fDIh+C
         8/W/8GLHxLA87SCCW8gWC5CE6wBwafjIsEQZKNDQxKJMih1uyGS4B1YTgGYajboLH/Qv
         k5GFGEepJhg6p5A7XIgsXt0qyAtXfM6FYFgd0lBLNd2plTZrYLDBiU2geokWSskj2LGW
         CvUfmE0r9bbJ162GbUAylxCP33LlaPioBYvKwWmbBc9+lxiUkbh0hhnIrc5RiOf/SSVk
         lY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=azdtjei8H3F887uLBWbFbfAT3uLSkbk5K45L3Vv9UNo=;
        b=1IowINvFEYNlHvxagg5dpqLhIyopjucoE2fU1lCVktB9zFOPO4gJNSlpWRha4oH7m9
         DOcNOZAPkSyBEnD4lPGVbWzs1mBqj+XGoODhfsLYXOXuDw3kaBKzz4KN0yXva+/9OqoI
         vp27/TbI8L7nP6bO++tY6vwxzvdDMweKfTTf1Ojsz+BNgrdNscjisB9dO0rzSZr/TUxp
         aTFgr32oTMLBsNFEvdBu5AbAWTBjoIA5RO++03zRYEnK8tbSHAXdNAhJANTDmOaRvANO
         c5lDBDff6MqGzdFLRW1YvdqP35ts7cZChzBW9wyQT/e2Jk28kwWgFc+z2GpiTgTPjWJF
         +Qyg==
X-Gm-Message-State: AOAM532AJXW+aX1Mud7UyEVO5clUOWb+RSjA+U0Lt76if7/CpTgB6NN9
	duzrG7jyCglpO6raY/DsXc2cZg==
X-Google-Smtp-Source: ABdhPJxbza27yeTR8GJEgOpvPtoqzcXCBD4fj/B7QHvAlTTKfaGtPL6pEK0zjtljPEq9RF6WNxHFXQ==
X-Received: by 2002:a05:6638:3449:: with SMTP id q9mr29247379jav.218.1641573010200;
        Fri, 07 Jan 2022 08:30:10 -0800 (PST)
Received: from [192.168.1.30] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id e16sm3079421iom.51.2022.01.07.08.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jan 2022 08:30:09 -0800 (PST)
Subject: Re: Special regressions report for the pending 5.16 release
To: Thorsten Leemhuis <linux@leemhuis.info>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: Song Liu <songliubraving@fb.com>, wsa@kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <7cd73147-2170-a0cd-c64e-ded4bef645b0@leemhuis.info>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <b0a6a5fa-3a4e-2269-4f43-aee8e81b6641@kernel.dk>
Date: Fri, 7 Jan 2022 09:30:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <7cd73147-2170-a0cd-c64e-ded4bef645b0@leemhuis.info>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/7/22 3:59 AM, Thorsten Leemhuis wrote:
> * This fix afaics is not yet mainlined:
> 
> [PATCH] md/raid1: fix missing bitmap update w/o WriteMostly devices
> 
> https://lore.kernel.org/all/20220103230401.180704-1-song@kernel.org/
> 
> 
> 
> But I'm pretty sure Jens (CCed) will send it onwards soon:
> 
> https://lore.kernel.org/all/499b185d-ff9a-934e-7768-ec796244fa1a@kernel.dk/

Going upstream today.

-- 
Jens Axboe

