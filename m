Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78852163
	for <regressions@lists.linux.dev>; Thu, 28 Sep 2023 00:17:37 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c5bbb205e3so111175855ad.0
        for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 17:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695860257; x=1696465057; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvZYJDFjw6AtaYjYTuzTNmQLcMXi0xxUU7gqtmd/9gc=;
        b=cNo6QaAq78hG3rM0aios5S4HNJ3BxSYUwPOziKFJEKx4mfkjMghri1ZOuTVSTzsb/I
         xweUPBCJ3owYWFnHX4lbzmWt/4QfbOUmAqFn1Mk9Sos9jH2tsfldx6jLr/1SfYEUKJaJ
         Njb4j53nVRf9hS25UkpR3KZ6Ixmxx+lp/hh2rlDB57F2pZ/mfy10MqCYkaSEf/FGa6BI
         c3lPAVnpNV9CmwMOZSbAyh23hMGkbIQwllOq2/VVOcguX4BAggKPNajeobjDLf+29c2u
         AxtCJQ/8jpS6biR3hfcwxAVtwFu9UI5EDg/28sTUZlnoJw8tRr8RRchTcswpT/VUMu4l
         gtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695860257; x=1696465057;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qvZYJDFjw6AtaYjYTuzTNmQLcMXi0xxUU7gqtmd/9gc=;
        b=uTB2e0XOesMdGkINdEXNzyE4uExsJ2wrXllSrCs+4J9xxKpA4wMSnp9vRAD0hJUrpl
         qtkzanDwNGDrO163Qy+tE7HvwSe6iEFsBPFcAkWQqBWT//Y+51jzu2ydDwcqDRflHgFt
         FaD1us+k0m46j6HT9vMvk4C7AIIgftE4lDrLiv1yHBKWiZZsKnQJ57Sbjcb7T2EIcwHu
         0MT6pXTJ6nZ1Cz+fvylaazkUDuRMAyqgsQtdExBycgAeyVkaG2xY+IOyiL7RHaSikSWv
         P/Q0e0ajyZHcqp61mWimHbmh/T0VTlM9VjSGBQiD0BlQ4bordaQU/n8N7oNK/xzY4tjd
         cIDg==
X-Gm-Message-State: AOJu0Yy9ZykDIvXDehQFku6uRXgWXPGOoLUM5Z9nznwyYhIgZMKWy+gF
	fOfFndU2YQjh/sMsrnf4qj6cO77LyhwEnw==
X-Google-Smtp-Source: AGHT+IHlbfoihbCEKofpMw/0JZU0HYH2cWhIJn6F5hSC1Meu2QrWUcExGMHVTjyVpnTlXGel2ufM8w==
X-Received: by 2002:a17:902:da84:b0:1c6:183a:f4ec with SMTP id j4-20020a170902da8400b001c6183af4ecmr3632437plx.17.1695860256324;
        Wed, 27 Sep 2023 17:17:36 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id p11-20020a170902eacb00b001c625d6ffccsm5887624pld.129.2023.09.27.17.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 17:17:35 -0700 (PDT)
Message-ID: <99b9d4d1-f7a9-4b6c-aebf-ef1d2ddee0d7@gmail.com>
Date: Thu, 28 Sep 2023 07:17:27 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Petr Mladek
 <pmladek@suse.com>, Todd Brandt <todd.e.brandt@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Hardening <linux-hardening@vger.kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Performance regression: resume_console takes 100ms longer in
 S2idle/S3 resume in v6.6-rc1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Ever since 6.6.0-rc1 we've seen S3 and S2idle resume take 100ms longer because of resume_comsole. resume_console ordinarily takes only a few milliseconds, but now it's consistently 100ms. I've bisected the issue to this commit:
> 
> commit 9e70a5e109a4a23367810de09be826c52d27ee2f
> Author: John Ogness <john.ogness@linutronix.de>
> Date:   Mon Jul 17 21:52:06 2023 +0206
> 
>     printk: Add per-console suspended state
>     
>     Currently the global @console_suspended is used to determine if
>     consoles are in a suspended state. Its primary purpose is to allow
>     usage of the console_lock when suspended without causing console
>     printing. It is synchronized by the console_lock.
>     
>     Rather than relying on the console_lock to determine suspended
>     state, make it an official per-console state that is set within
>     console->flags. This allows the state to be queried via SRCU.
>     
>     Remove @console_suspended. Console printing will still be avoided
>     when suspended because console_is_usable() returns false when
>     the new suspended flag is set for that console.
> 
> We are seeing this on roughly 2/3 of our machines, both on test systems and production systems.

Then,

> The effect is most pronounced in the GigaByte z170x UD5. It goes from 300ms to 400ms because of an msleep 100 in the resume_console code. This might not seem like much but it's in series with everything else so it will always be there. Our goal is to keep both suspend and resume under 1 second if at all possible, so every bit counts.

See Bugzilla for the full thread and attached sleepgraph timelines
(in html format).

Anyway, I'm adding this regression to be tracked by regzbot:

#regzbot introduced: 9e70a5e109a4a2 https://bugzilla.kernel.org/show_bug.cgi?id=217955
#regzbot title: resume_console performance regression due to per-console suspended state

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217955

-- 
An old man doll... just what I always wanted! - Clara
