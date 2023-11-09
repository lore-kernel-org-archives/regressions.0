Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679A423769
	for <regressions@lists.linux.dev>; Thu,  9 Nov 2023 17:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="JRkdnjwI"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7aff68e5caeso7262939f.1
        for <regressions@lists.linux.dev>; Thu, 09 Nov 2023 09:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1699551934; x=1700156734; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WjqusW12qX+EnDQrRy1uBT8LWkbkkUBK635BX5MegMY=;
        b=JRkdnjwIPWs++bwp36dCoRBqpZfuhpMVakRTq1fZHfd9uzACqcy96i5iOLQP12McEO
         y+SlzVrmjbTjnE7k1yRof9h95WmouRTDpFp+vi0ZV2nJiL02/J6boMO4MpN/tYmhCjcg
         iEtlmFddE/9VEXxgERMyKkDqUOyG4hvGrAHLvxn69Oprc7fAYWMPzR7RWyC/HOp4fQWe
         Z6+wAxlmKDKrKYDbw+ru1uj2/qYOaoubMCqRNb7bkDNWhZq/aASO2eCYmkrGtdJwl0Fz
         Wg4smXHn/RuL/VqiJaI9ZKAzKvPpQUOhq/KU4Ly3pejgFojZqj+8aGBzgCpjnNVA/ian
         H1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699551934; x=1700156734;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WjqusW12qX+EnDQrRy1uBT8LWkbkkUBK635BX5MegMY=;
        b=KPNo72BiBxrI6U77XAdS8BLGEhQHvTWn0hPt9CSDFQhZLwb6ZgP44CtjHlh5pxN2OR
         HcX8i8qZoQp0FBVhM97ouIl5DM0Q+Z+HCSJ6+t6eCmyLD1zsVo48ODUcWnUDvoG0NpOM
         xgfrfhXIG5E1NpF0Hz6FWEgObVSiwYLJdxu6ooUWZLROMhpuawtY2dOF6WLAwTbJhD1H
         I3nckAetM2XYyXiJ5hSt5VPRmcdeSbPToqUdPQ6tyHgTGKHtq4RIY2EaJAJutTwktwLS
         ilf0feHQYVEKAH/4QuZ/+AgE6udmmDy29VcYUk8asKftCvOunAPFKFgy8xjiwV9mjJJm
         VRAg==
X-Gm-Message-State: AOJu0YyY/hiHoVp2dhSyonuxbYZVbUfYURq8aDKcgi0C2O0UGeXT4sG4
	9ejK+V3m/y6ej/k7c/b0C2QLdS+SQg75mBRr5/wMmQ==
X-Google-Smtp-Source: AGHT+IFpSVvENWWqOvPrjtaEadkC0K0hbpt/oZ0b++mR9ajIbqwCHGGccv66+LfhOIW9wi7rlIIw6w==
X-Received: by 2002:a92:870f:0:b0:359:6a3f:6aa4 with SMTP id m15-20020a92870f000000b003596a3f6aa4mr5545128ild.0.1699551934424;
        Thu, 09 Nov 2023 09:45:34 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id y6-20020a056e02118600b003574cad1598sm738905ili.33.2023.11.09.09.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 09:45:33 -0800 (PST)
Message-ID: <99f43fc0-a500-41b5-9575-33a57d0795de@kernel.dk>
Date: Thu, 9 Nov 2023 10:45:33 -0700
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
 <9860f9b2-1d98-497c-9480-56852fda781b@kernel.dk>
 <1557819821.46044536.1699549241816.JavaMail.zimbra@raptorengineeringinc.com>
 <f4fffe29-7c95-4d22-918b-f2835fb76366@kernel.dk>
 <597693097.46047776.1699550641104.JavaMail.zimbra@raptorengineeringinc.com>
 <e3e1b31f-a9a0-4387-982e-aba6d9763c6b@kernel.dk>
 <1926532589.46050149.1699551411577.JavaMail.zimbra@raptorengineeringinc.com>
 <a262a91e-f2ec-402f-ba40-adacb76c72b9@kernel.dk>
 <871420600.46050861.1699551732591.JavaMail.zimbra@raptorengineeringinc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <871420600.46050861.1699551732591.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/9/23 10:42 AM, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Jens Axboe" <axboe@kernel.dk>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
>> Sent: Thursday, November 9, 2023 11:38:10 AM
>> Subject: Re: Regression in io_uring, leading to data corruption
> 
>> On 11/9/23 10:36 AM, Timothy Pearson wrote:
>>>> Hmm ok, that is odd. How quickly does it trigger for you?
>>>
>>> Almost immediately.  Third pass in this case, which is pretty typical
>>> -- without any delays etc. it will normally fail in under 10
>>> iterations.  When I add other delays in e.g. the worker thread it
>>> becomes less likely to fail, but still fails.   Only adding the udelay
>>> in the one specific (IRQ locked) location allows it to pass all 200
>>> iterations.
>>
>> What specific IRQ locked location? Hard to know where you are adding
>> these things without seeing the patches.
>>
>> --
>> Jens Axboe
> 
> Sorry about that.  Here's the patch that automagically makes things
> work (bear in mind line numbers etc. are munged since I have a bunch
> of other debug stuff in here at this point):
> 
>  static void io_wqe_dec_running(struct io_worker *worker)
> @@ -312,19 +326,39 @@ static void io_wqe_dec_running(struct io_worker *worker)
>         if (!(worker->flags & IO_WORKER_F_UP))
>                 return;
> 
> +       udelay(1000);
>         if (atomic_dec_and_test(&acct->nr_running) && io_wqe_run_queue(wqe)) {
>                 atomic_inc(&acct->nr_running);
>                 atomic_inc(&wqe->wq->worker_refs);

Ah I see, you're on older stable? What specifically?

-- 
Jens Axboe

