Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF064409
	for <regressions@lists.linux.dev>; Fri, 22 Mar 2024 06:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711089373; cv=none; b=rIRdjJSsmVblThUp8grgrBOGHAgumRvxxvvvKFhN+U+HoNpjnG8s0wSGMLA/L9+4af8/o0irn2V7Qf+xhxG8nyLbM4MAD+bIsK3ZyM8S8GGLofC2uI1ZFextSd1Mloxk4ihr9BJg2vT9brU4Ay5V8dOi61qh8J5lzNLIaQwPbY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711089373; c=relaxed/simple;
	bh=Yy2v2lCatp2/UK+Y5wd+nQJhtokBTEife0qtEPy4MZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DjEq2NE3CAlfukaZdNRjjem9nIrgAYVuJdlBBMNhoJ5pnXH2m5+Js/eK+71X2Mdc+68MqzzZIJUfchD7wSTeq2QB5XFogQgb+sqn2Nty+KEtdRJoDEbmq1ycXuNL9mRw63DUTnQkGC67WvJIjPo4tRQrV7nbD2K5hi5ynEGCQuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=0jMzHjV1; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="0jMzHjV1"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-690b8788b12so12138046d6.2
        for <regressions@lists.linux.dev>; Thu, 21 Mar 2024 23:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1711089369; x=1711694169; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NaFfoW78A9EVG57HgkhXWh91V38WD1iQCj7Aj7G25XA=;
        b=0jMzHjV19tqaAmOnFfpQLd9P1EFP5A3kntzHU7/2nsONkNszERMBzthpSmJxiPlZLd
         ZC4dw9smBb3uuuASC4yoyjd71Pa0uaYzm17WyegRJ/R0R5uZ1mbpNbRHvCeuER9Ws/Jz
         +2bNfviS2tuapOqmelLjdQd8RX/jzUaneIgStNOJC0mh9N6l9YzUp5x7W41Fv/RaMW7v
         DgLj1BJsjornAK/rYjDWFxNQLcoVZcpRAWtWnOhkQJrEWesNGjJ2hCOi4k+YFsz8PCBs
         v8j3IpBovaiWVH4S2vAVA23qCyxpaSXYlMmpt6Da3rbwGymG810tJ+q/qexA1dqmUbqm
         DQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711089369; x=1711694169;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NaFfoW78A9EVG57HgkhXWh91V38WD1iQCj7Aj7G25XA=;
        b=F3TxDYCDF/5EPwLxTYHVRnjB0VQV28MxoFemJX5SIuYm05aHA+UXkX4kaBYJf7jgTh
         FLLRsrBDC+Sp/bYvy0QmUiMuj9g/Ef7sn4H0f2gyIdfXhIa/cBW3QXBQgBnlU0i7aK7F
         kQAQzL+MCjSP7X5UqgcrVDFbYgBTSsZ+HaTSZ6qyfVAozpdgnA7RN4FsnCK3ciZFhhZ0
         e1ACurByq7ygYFeUQEW7f9lrXIUPMKV3gL9YMcYH9fwyYl9peN0dOLNFwlMChD7mjecN
         ewDYmD4jvRhSGhJVoOgb2tW9fMozgZkzu6ajmWkjzai6SS13hztsIf4qGOKtzjA8KbaH
         sNew==
X-Forwarded-Encrypted: i=1; AJvYcCUI2gclqohnNKqXxiU9sQAi9OdioIDjp42q13BBV1KHdihE/xwhop7n33C1sogIQSZfuerAkbviACAoFZOHcMbGq8WPwQUp/mMq57s=
X-Gm-Message-State: AOJu0Ywt3AFB/6eMgBKr7L16WmAUZ4xoigye3RLhcgZLtP9fKREodp08
	RmzmAB/l0Y9dRBZ4Zq/hVbcPEMff9JZmm5ZxcAlUaJCyck4yiyJLHXCv5qJ9WPg=
X-Google-Smtp-Source: AGHT+IF+JN3Bng2OpaUQIuC/DX2VCjkwGMkhxPOAM6wcBtN4i1DCa0fY96WGMslkHQ1PpW61tkGYPQ==
X-Received: by 2002:a05:6214:1bc9:b0:691:6311:eeff with SMTP id m9-20020a0562141bc900b006916311eeffmr1458488qvc.21.1711089369058;
        Thu, 21 Mar 2024 23:36:09 -0700 (PDT)
Received: from [192.168.0.51] (dhcp-24-53-241-2.cable.user.start.ca. [24.53.241.2])
        by smtp.gmail.com with ESMTPSA id gw2-20020a0562140f0200b00690cd39da04sm776784qvb.32.2024.03.21.23.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 23:36:08 -0700 (PDT)
Message-ID: <d7337014-09ac-8a35-7159-e75ecd2707b6@draconx.ca>
Date: Fri, 22 Mar 2024 02:36:07 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: PROBLEM: Sun Ultra 60 hangs on boot since Linux 6.8
Content-Language: en-US
To: Tony Lindgren <tony@atomide.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 regressions@lists.linux.dev, linux-serial@vger.kernel.org
References: <d84baa5d-a092-3647-8062-ed7081d329d4@draconx.ca>
 <20240322051531.GA5132@atomide.com>
From: Nick Bowler <nbowler@draconx.ca>
In-Reply-To: <20240322051531.GA5132@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-03-22 01:15, Tony Lindgren wrote:
> * Nick Bowler <nbowler@draconx.ca> [240322 04:29]:
>> I bisected to this commit:
>> 
>>   commit 45a3a8ef81291b63a2b50a1a145857dd9fc05e89
>>   Author: Tony Lindgren <tony@atomide.com>
>>   Date:   Mon Nov 13 10:07:53 2023 +0200
>>   
>>       serial: core: Revert checks for tx runtime PM state
>> 
>> Reverting this commit on top of Linux 6.8 is sufficient to get the
>> system booting again.
> 
> Thanks a lot for bisecting and reporting the issue.
> 
> Can you please test if the following change to add back the check for
> !pm_runtime_active() is enough to fix the issue?

I applied the below patch on top of 6.8 and unfortunately it does _not_
fix the problem (no obvious change in behaviour).

Thanks,
  Nick

> 8< -----------------------
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -156,7 +156,7 @@ static void __uart_start(struct uart_state *state)
>  	 * enabled, serial_port_runtime_resume() calls start_tx() again
>  	 * after enabling the device.
>  	 */
> -	if (pm_runtime_active(&port_dev->dev))
> +	if (!pm_runtime_enabled(&port_dev->dev) || pm_runtime_active(&port_dev->dev))
>  		port->ops->start_tx(port);
>  	pm_runtime_mark_last_busy(&port_dev->dev);
>  	pm_runtime_put_autosuspend(&port_dev->dev);
