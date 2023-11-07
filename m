Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36312A1C1
	for <regressions@lists.linux.dev>; Tue,  7 Nov 2023 21:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Wf2Duiek"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-51f64817809so632312a12.1
        for <regressions@lists.linux.dev>; Tue, 07 Nov 2023 13:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699392138; x=1699996938; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EpkVFpqDCnjSzXw6/ZCYHgQzkC1D1tBwOiO2h4L+mcA=;
        b=Wf2Duiek1s0+fKTtjZnvAQL0U7RHS9mgbJgzD4mcVJ8Exds6Ok0I+K0oVrZxnDWbka
         1JObiaqxvtR5lhyi6QDkKGdNRrnaabUv2eXGPLEh/rZrR0DWQRO0H1WEbjnk9+Fnbi83
         vH2wOn3lb4vDLvMvBbFpaZfpFL4CD8XjpuDUvG31fV3uNaqBtdoLcbImxG7eV7Pp4Xtz
         Ty7i3JtD0VjktIK/UyzYzFN2HglYTvDYjj9K9DMQSc2dZX8Xby/AnPBxGqWzu3vuZvYZ
         298//dNRXJWqJQ4tMXvUjKVRjESBj8hW55D5TrczUgryCpiN2uzCNvLyUsmaLquARLUd
         dqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699392138; x=1699996938;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EpkVFpqDCnjSzXw6/ZCYHgQzkC1D1tBwOiO2h4L+mcA=;
        b=vyYvQMLdMvukorNih9JSsmC6nkoakXnFz+a7rjXagyGWMu4EwMc1dJxNinN7mxlINF
         nO0qPXC8BVegYLlz7Aov8GPARdMMru+UPEkWsLq9z2FFXGGbd1SaGNcXYo2YyTe1Dzhk
         MnZyJ1oRVc0l4OCs7gA8rFuc5kW/iuCB131dXiZEej3/L0PhAjgpN7WjU86QoDVqYxAa
         lTxMyVUGkfPJt+kwopRx/UzuAMs7MEAQYYYo7nKWhpu22hdxvrt3p3IlAknYsPd2rsnQ
         v3MykdSgjc8JQjOMc2qtoSk9vwaGar4sre8ks6sMjr6aRL76OeUrDsbW1W2cFF8nGngj
         4Jzw==
X-Gm-Message-State: AOJu0Yz5fogsiSYnxlat/hTJ5hbxXp7LJ80kgLWwPcCPAa6VMnydcE4q
	wktLejwG68OTMYsRN0Ep+s/iDQ==
X-Google-Smtp-Source: AGHT+IEuVgXYX4h1ctTsuEoxpiKqYKwil9Tm6rjj/ZUfyajm38hzpXYgJc8macA3cTGCOPxLcKsNAA==
X-Received: by 2002:a05:6a20:7d9b:b0:183:e7bb:591b with SMTP id v27-20020a056a207d9b00b00183e7bb591bmr163587pzj.3.1699392138126;
        Tue, 07 Nov 2023 13:22:18 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id s12-20020aa7828c000000b006bd9422b279sm7594592pfm.54.2023.11.07.13.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 13:22:17 -0800 (PST)
Message-ID: <92d55351-f8c2-4376-affb-d361782e20e1@kernel.dk>
Date: Tue, 7 Nov 2023 14:22:16 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in io_uring, leading to data corruption
Content-Language: en-US
To: Timothy Pearson <tpearson@raptorengineering.com>,
 regressions@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/7/23 9:34 AM, Timothy Pearson wrote:
> I can make the corruption disappear by adding a 1ms busy wait delay
> into io_wqe_dec_running().  This appears to alter the timing of
> something in the io_uring system just enough to make the (presumed)
> data race disappear.  KASAN and KCSAN do not show any issues, nor does
> the lock debugger, yet a corruption problem that disappears with a
> delay is indicative of a race somewhere.  The delay primary impacts
> how long the IRQ lock is held, if the delay is moved outside of the
> IRQ locked section the corruption returns.

This is interesting... This forces the current task to schedule out
first, rather than potentially create a new worker.

If you put that 1 ms sleep at the top of io_wq_worker(), before the
loop, does it fix it as well? With the previous one removed, of course.

Does it do anything if you just put isync() in there instead of the
sleep in io_wqe_dec_running()?

-- 
Jens Axboe

