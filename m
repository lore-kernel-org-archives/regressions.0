Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BD92CA7
	for <regressions@lists.linux.dev>; Sat, 20 Aug 2022 15:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661009864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CSUDwEi1svTWS13A5fcvj35eehBaJVIHJlmeSdMUK/M=;
	b=cx1EAOZFIZNVYkUlcg2+QrxMupJaHKVBd/yPygNDCsxdyUQOQ8rd2xcKUTr5CUtAM0yywo
	izedAR11QX9rMSNcAtvRtfYeTWQ4m+/iXwkuRenBVTcuGHxH5rX+OC9lyBAm4aX3PABXha
	DZ+Ue0RpTWsDiR42GwihLzGsm+JewIM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-490-6bI0AuOeOzy9SkTgx8RA2w-1; Sat, 20 Aug 2022 11:37:43 -0400
X-MC-Unique: 6bI0AuOeOzy9SkTgx8RA2w-1
Received: by mail-ed1-f71.google.com with SMTP id l19-20020a056402255300b0043df64f9a0fso4415035edb.16
        for <regressions@lists.linux.dev>; Sat, 20 Aug 2022 08:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=CSUDwEi1svTWS13A5fcvj35eehBaJVIHJlmeSdMUK/M=;
        b=crnxvFCtItZA5AwJ0DP0pZ3RRm8vK7BXX56iLaeb7MnoR/zM3IMEPb2Vjn0BEQojeM
         9O5u/ehxNNmswyNH+S/OM7hugsD0+jw+q9//CgurICDnyC83scovyKebtXn7GbTRSyyB
         sKVWsNbC1EdlltKCjtWmxj8QsyLvQDjfgwU+v/NYf3WLa6J0Es6W4pn2/vjnuOFtfJRa
         IVHlPAWJogJE/Xav5chgM7zLg9f0pvXxcSYqSuK2ke/GNEV3RIXvrltSPsnA15EbPfy7
         dUEo3Jy131skXsGNX3Mz0sNLpKPZOYJPWNFnV94Oepn5e/KwcGW/ETS6sjei1+Rlxdm7
         O8rA==
X-Gm-Message-State: ACgBeo2FUJkP1h4Y1kHD8Lbg9Z+O1CJM1Fnp+/qBUb0uWYHwibNYYwzy
	0oN/5p3Hugzq4ILebzpCuHZzxyTGhEkuKdzS7HG4lwzK9vT4SVteAn0xyHwMw+t3C8Gz+iHTflN
	8krqD+4yUGj7nd1Tx50sv3zo=
X-Received: by 2002:a05:6402:3495:b0:43d:d76e:e9ff with SMTP id v21-20020a056402349500b0043dd76ee9ffmr10158401edc.227.1661009862306;
        Sat, 20 Aug 2022 08:37:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR56NKhopv/ioAeFb925MKnrc4gMGSU/vLUjnbjCFZdK2VcWWVNy8nDcXS+vYMB17jvhSSMtNQ==
X-Received: by 2002:a05:6402:3495:b0:43d:d76e:e9ff with SMTP id v21-20020a056402349500b0043dd76ee9ffmr10158391edc.227.1661009862150;
        Sat, 20 Aug 2022 08:37:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ku7-20020a170907788700b0073d15dfdc09sm2324594ejc.11.2022.08.20.08.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Aug 2022 08:37:41 -0700 (PDT)
Message-ID: <1c4ffc37-df00-0487-2e4e-79b5178d9741@redhat.com>
Date: Sat, 20 Aug 2022 17:37:40 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: 6.0-rc1 regression block (blk_mq) / RCU task stuck errors +
 block-io hang
To: Bart Van Assche <bvanassche@acm.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, rcu@vger.kernel.org
References: <dd6844e7-f338-a4e9-2dad-0960e25b2ca1@redhat.com>
 <17ccd5ae-0268-1bee-7822-1352f4c676ba@acm.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <17ccd5ae-0268-1bee-7822-1352f4c676ba@acm.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bart,

On 8/19/22 16:49, Bart Van Assche wrote:
> On 8/19/22 05:01, Hans de Goede wrote:
>> I've been dogfooding 6.0-rc1 on my main workstation and I have hit
>> this pretty serious bug, serious enough for me to go back to 5.19
>>
>> My dmesg is showing various blk_mq (RCU?) related lockdep splats
>> followed by some tasks getting stuck on disk-IO. E.g. "sync"
>> is guaranteed to hang, but other tasks too.
>>
>> This seems to be mainly the case on "sd" disks (both sata
>> and USB) where as my main nvme drive seems fine, which has
>> probably saved me from worse issues...
>>
>> Here are 4 task stuck reports from my last boot, where
>> I had to turn off the machine by keeping the power button
>> pressed for 4 seconds.
>>
>> [ ... ]
>>
>> Sorry for not being able to write a better bug-report but I don't have
>> the time to dive into this deeper. I hope this report is enough for
>> someone to have a clue what is going on.
> 
> Thank you for the detailed report. I think this report is detailed enough to root-cause this issue, something that was not possible before this report.
> 
> Please help with verifying whether this patch fixes this issue: "[PATCH] scsi: sd: Revert "Rework asynchronous resume support"" (https://lore.kernel.org/linux-scsi/20220816172638.538734-1-bvanassche@acm.org/).

Thanks that is very useful. I'm running 6.0-rc1 with this
patch added now and so far I've not seen the problem re-occur.

I was also seeing 6.0 suspend/resume issues on 2 laptops with
sata disks (rather then NVME) which I did not yet get around
to collecting logs from / reporting. I'm happy to report that
those suspend/resume issues are also fixed by this.

I'll reply to the patch with my Tested-by for this.

Regards,

Hans

