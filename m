Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CADD1845
	for <regressions@lists.linux.dev>; Sat, 30 Sep 2023 12:31:41 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-692a9bc32bcso11364077b3a.2
        for <regressions@lists.linux.dev>; Sat, 30 Sep 2023 05:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696077101; x=1696681901; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0PEuv1JE1ji/lSxoZu0EKZ3PyEQs2C6XzXKupEO4HsI=;
        b=D5bgSqTUZE4bQrbAcP0pEvtIgHMR+UnWvT5iNBpUKxpfo3QPylsGtWhgaMVlMtUhgN
         zTkUJ9srblDuvZJCGTGvVhAy7K4sihOOgi/fS48Jplu5/2/Ln0kkA58KRL7rdUY5rzBN
         HSigwpVBIeUJ/csw8vloQ4kjIvTG6pe/XiBh4L8/sKq4OJ45YIyOJC0cHJz5x0a3qAr+
         BlEmvNDpFU5ii5Z6rwQG8v0t1yEfhqn/p1fjBkxpMqSWiAK4xGvtpdI0Idr6uA5bEo5u
         aFAX20lMTNSccy0bv78wV3gQWhzdZduRBavuUPsQwEXZXmFuvkryIZ2sN1CL617trAgg
         6kjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696077101; x=1696681901;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0PEuv1JE1ji/lSxoZu0EKZ3PyEQs2C6XzXKupEO4HsI=;
        b=GbNifPIiEby3HeWIFQ+1QJtLcd/lf6zrXzd/83x3GzVtCFdYO8TaKZEmGi0n2OWSg0
         HHEP12v8sLeb82YHOjLBcJzlYy0JUDq1kwmfUhJ1abjq6Pa6/r1pr5v3kwAJPYu5FsDg
         +FdoVvFK3GH9+Gha1hROpEpPaFnOcAeHlenlQcuW52hP41CvSRwDFTmeBpuX4BkLJOKW
         4bbJx8BzPzh/lXhMZS5Q3lpXzChvTxlvhgc+ELkg4Jqvj7O33OSbuJ1BXcYcTZ4o5Uqw
         pSYLNGAqVZMRIxTcqszNAhT+egsZ8ogdhTdh8YFbOM5OHO4pUiQ96zeiDYgqUvm6T/rj
         48IQ==
X-Gm-Message-State: AOJu0YzbcD6fW8+XcsTGYFKVbEvVOsHPxZJMSvkP2w5viXAn1bGY8Ain
	SrDFj+ytcgEHcAWq2uF+5e8=
X-Google-Smtp-Source: AGHT+IEhI7eA8uS9H8VpG7zI0niIhieHYI5PZG8NgJ2DvP5MEnONifsqFETJAiDku+qqJ+SYqEFV2A==
X-Received: by 2002:a05:6a00:24c6:b0:68c:2be:67bb with SMTP id d6-20020a056a0024c600b0068c02be67bbmr7158316pfv.20.1696077100602;
        Sat, 30 Sep 2023 05:31:40 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id e25-20020a62ee19000000b00690d9901ce5sm7900536pfi.102.2023.09.30.05.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Sep 2023 05:31:39 -0700 (PDT)
Message-ID: <da91c950-51c0-4c71-855e-ae11898a97f5@gmail.com>
Date: Sat, 30 Sep 2023 19:31:34 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: Performance regression: resume_console takes 100ms longer in
 S2idle/S3 resume in v6.6-rc1
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Petr Mladek
 <pmladek@suse.com>, Todd Brandt <todd.e.brandt@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Hardening <linux-hardening@vger.kernel.org>
References: <99b9d4d1-f7a9-4b6c-aebf-ef1d2ddee0d7@gmail.com>
Content-Language: en-US
In-Reply-To: <99b9d4d1-f7a9-4b6c-aebf-ef1d2ddee0d7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/09/2023 07:17, Bagas Sanjaya wrote:
> Hi,
> 
> I notice a regression report on Bugzilla [1]. Quoting from it:
> 
>> Ever since 6.6.0-rc1 we've seen S3 and S2idle resume take 100ms longer because of resume_comsole. resume_console ordinarily takes only a few milliseconds, but now it's consistently 100ms. I've bisected the issue to this commit:
>>
>> commit 9e70a5e109a4a23367810de09be826c52d27ee2f
>> Author: John Ogness <john.ogness@linutronix.de>
>> Date:   Mon Jul 17 21:52:06 2023 +0206
>>
>>     printk: Add per-console suspended state
>>     
>>     Currently the global @console_suspended is used to determine if
>>     consoles are in a suspended state. Its primary purpose is to allow
>>     usage of the console_lock when suspended without causing console
>>     printing. It is synchronized by the console_lock.
>>     
>>     Rather than relying on the console_lock to determine suspended
>>     state, make it an official per-console state that is set within
>>     console->flags. This allows the state to be queried via SRCU.
>>     
>>     Remove @console_suspended. Console printing will still be avoided
>>     when suspended because console_is_usable() returns false when
>>     the new suspended flag is set for that console.
>>
>> We are seeing this on roughly 2/3 of our machines, both on test systems and production systems.
> 
> Then,
> 
>> The effect is most pronounced in the GigaByte z170x UD5. It goes from 300ms to 400ms because of an msleep 100 in the resume_console code. This might not seem like much but it's in series with everything else so it will always be there. Our goal is to keep both suspend and resume under 1 second if at all possible, so every bit counts.
> 
> See Bugzilla for the full thread and attached sleepgraph timelines
> (in html format).
> 
> Anyway, I'm adding this regression to be tracked by regzbot:
> 
> #regzbot introduced: 9e70a5e109a4a2 https://bugzilla.kernel.org/show_bug.cgi?id=217955
> #regzbot title: resume_console performance regression due to per-console suspended state
> 

#regzbot fix: printk: flush consoles before checking progress

-- 
An old man doll... just what I always wanted! - Clara

