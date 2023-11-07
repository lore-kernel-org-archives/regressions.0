Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3548630647
	for <regressions@lists.linux.dev>; Tue,  7 Nov 2023 22:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="zVrU+Fvj"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6bb744262caso1640190b3a.0
        for <regressions@lists.linux.dev>; Tue, 07 Nov 2023 14:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699397098; x=1700001898; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EfYD81x3tnVSBZ+dzJdsd6K33VpK7WhVpnQah+5E/Tk=;
        b=zVrU+FvjHs9yK2/PELGtMToj3KAQZQ18/djpRCNIlV7ihJaTlEWnuFdBjmF2S2T+U0
         0oQWQY4wDQWYT/jqEeEbv0qXCUnnI/PRKI4rsAIHfDGtrsvG2b+ZBjmGEO0mbk5Z7mu6
         Y1RVnJAH8y/foPODb44BNqAKbhRn/nZXVQtqVoBtMAp4g+ezvR7nPGVGx2esb5Y8u3e3
         9FT+Xsms3rOrVmMg8jN8Qdm5buG/MW6NbyZcQn053hU6jYA4Q3MhiDcxdKKzd4XysVKC
         FobBh68cTBw3XnxNNj/b7AYMTcRHxQOvYxWWyiTv1zjiHbFZ+kkKNUqMfCjNnvareKOk
         O4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699397098; x=1700001898;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EfYD81x3tnVSBZ+dzJdsd6K33VpK7WhVpnQah+5E/Tk=;
        b=TWjrH7pA7mur7+Hi/0XRQbECdxCfXhhxcsZgsaW4yq/SCdb/usah87FMEPkeLO77aU
         QPfA6C3a5nzUIxzEl6G9cj0c+bmX7ARw6ZIVB7h7BaUxybB/eETasGYaKOEAlgci9yEo
         qc9p4Ejw3eMfTqNhUTuOOCtN7XTTm69flB+iVX20egxBRUT6nye4JB1tCu6lsUaBMoA8
         Cy+OLJwISgGD3QAzlr40q1ReNiaxr4yVRqcjfa45x62lKIiyhT/4+XnBIWgFChWyALmp
         Fnhl1Ttk9CHPJXim7ZO9Fl28PwF5M7hSh1k6txBo/CPR2Y1DSI21bgcWsa0VPp39ZLIz
         ar1A==
X-Gm-Message-State: AOJu0YycX3wcI2cedZer50YNQ++BEblvkdMrHv+Z/cbftZISKQPF57sp
	Jc7Ud87jztWjr6uQ8nFOxP4XVoYuJ4rwXa6Wmg9dIg==
X-Google-Smtp-Source: AGHT+IF09uuGD1gAAjBTot6w++wqZBDbw0IwQpTDfSqQU555NFQ+KA0Y/60I0fWJFVDKCfsb/2+gWA==
X-Received: by 2002:a05:6a20:a121:b0:181:3efd:5432 with SMTP id q33-20020a056a20a12100b001813efd5432mr349835pzk.6.1699397098410;
        Tue, 07 Nov 2023 14:44:58 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id jg22-20020a17090326d600b001c75a07f62esm333303plb.34.2023.11.07.14.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 14:44:57 -0800 (PST)
Message-ID: <727263b4-2f8c-44bf-b7b8-5a936718df76@kernel.dk>
Date: Tue, 7 Nov 2023 15:44:56 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in io_uring, leading to data corruption
Content-Language: en-US
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: regressions <regressions@lists.linux.dev>,
 Pavel Begunkov <asml.silence@gmail.com>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com>
 <92d55351-f8c2-4376-affb-d361782e20e1@kernel.dk>
 <1779502278.45625230.1699393171901.JavaMail.zimbra@raptorengineeringinc.com>
 <9529b97f-1c37-43e4-925e-5eeca47678bb@kernel.dk>
 <394590569.45631219.1699394864909.JavaMail.zimbra@raptorengineeringinc.com>
 <fbdefa85-f63b-48eb-825a-a16ae27b749b@kernel.dk>
 <23615262.45634897.1699396185842.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <23615262.45634897.1699396185842.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/7/23 3:29 PM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
>> Sent: Tuesday, November 7, 2023 4:16:51 PM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/7/23 3:07 PM, Timothy Pearson wrote:
>>> Interestingly enough that's where my current investigation is leading
>>> as well.  After instrumenting and re-instrumenting the codebase far
>>> more times than I'd like to admit, I've noticed that the workers don't
>>> time out on kernel builds that show the corruption, they are directly
>>> terminated via signal (SIGKILL).  On kernel builds with the delay, the
>>> workers time out and self-terminate.  I'm still trying to parse out
>>> what the exact difference between these two mechanisms would be and
>>> how it plays into the corruption, but at least it's a start...
>>
>> Maybe poke at how they are exiting - you say timeout, so they've been
>> idle for a while and then go away? This would then cause worker creation
>> again later on if, say, we have 1 worker left and it goes to sleep. So
>> the timeout itself may not tell you much, outside of then causing that
>> other condition to happen. You could even try and shrink the timeout to
>> HZ / 10 or something like that to make it more likely to happen.
> 
> Agreed.  As of right now I can confirm that with the delay in place
> (no corruption) the workers are exiting on their own, no signals and
> no IO_EXIT bit being set.  When I remove the delay (reintroducing the
> corruption) I see signal 9 being sent to the workers, and a mix of
> IO_EXIT being set and not being set.
> 
> Ignoring the signal 9 does not fix the corruption, which makes me
> wonder more about IO_EXIT and whether things are not fully committed /
> properly torn down when the worker thread terminates.  This also
> dovetails nicely with the fact that the observed write corruption
> always seems to be in the latter portions of the page, never at the
> beginning of the page, also indicating rapid / unclean termination of
> the writer process.
> 
> Will keep digging...

This is useful. If the workers are exiting, they will try and process
work that is still pending. And it obviously does, or the process would
hang on exit or ring exit. But it'll also cancel said work, which
obviously did not happen for the old kthread scheme, as there was no way
to do that. So you'd just wait for it. Hence maybe what's happening here
is that mtr/mysql/mariadb isn't properly waiting for pending writes to
finish? It's just assuming that previously submitted writes will finish
if the task is killed?

What page size are you using?

-- 
Jens Axboe

