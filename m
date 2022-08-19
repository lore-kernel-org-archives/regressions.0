Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D45B29A0
	for <regressions@lists.linux.dev>; Fri, 19 Aug 2022 14:49:28 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 202so3864263pgc.8
        for <regressions@lists.linux.dev>; Fri, 19 Aug 2022 07:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=AEaEgab2mhaMiSkvYoYiW7yx1z+hEFyxx9wlIiPpIa8=;
        b=cFhfYo0F0faDtaSuJuCjzNW/+R2PwsKHR3a+RBWGv8oAdyyDVGr1sO+JjINi1c98ow
         GNvFmE/R3DWc6Gq42M3DuP6EseBisWuphDcGndf9EE1NqCcTpqdx55/160IWF0g+gHZ+
         ZbjdQdS58PCINE0DCco+tAxzVTbvBUbd/HlUkr/M22tC8/ty/juBAYx5DKNhgUcdRSWH
         4iIPx7/6zZz19PaWWK0+pFdDEi/3KAJPLlmQ1FWyKL+qJDyPIeceeR3Iin+GxIDbnTpi
         CnowSb5Mj8KbfoAdwcfgFzAXsqtjOlTQ/85w1K8cHdM8B+369l/WjfqZUDQDXQ+9dpAY
         h2Jg==
X-Gm-Message-State: ACgBeo287CJLKakAvIOUOGP64g5m00oPQLg3/AUIVfMESY2s0KRcPOli
	74Y1hKqTH3F2WXy5VHzg8Qg=
X-Google-Smtp-Source: AA6agR4n7cfXryL/GLcBwpbdaZ8OS1DGI89ou5DCJZPaiWYVxSuSylH84/CiOOS86Tu5616hB6UhkA==
X-Received: by 2002:a63:1925:0:b0:429:f4f4:7d48 with SMTP id z37-20020a631925000000b00429f4f47d48mr6689792pgl.474.1660920568337;
        Fri, 19 Aug 2022 07:49:28 -0700 (PDT)
Received: from [192.168.3.217] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id e14-20020aa798ce000000b00534a1315a63sm3580495pfm.136.2022.08.19.07.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 07:49:27 -0700 (PDT)
Message-ID: <17ccd5ae-0268-1bee-7822-1352f4c676ba@acm.org>
Date: Fri, 19 Aug 2022 07:49:25 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: 6.0-rc1 regression block (blk_mq) / RCU task stuck errors +
 block-io hang
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, rcu@vger.kernel.org
References: <dd6844e7-f338-a4e9-2dad-0960e25b2ca1@redhat.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <dd6844e7-f338-a4e9-2dad-0960e25b2ca1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/22 05:01, Hans de Goede wrote:
> I've been dogfooding 6.0-rc1 on my main workstation and I have hit
> this pretty serious bug, serious enough for me to go back to 5.19
> 
> My dmesg is showing various blk_mq (RCU?) related lockdep splats
> followed by some tasks getting stuck on disk-IO. E.g. "sync"
> is guaranteed to hang, but other tasks too.
> 
> This seems to be mainly the case on "sd" disks (both sata
> and USB) where as my main nvme drive seems fine, which has
> probably saved me from worse issues...
> 
> Here are 4 task stuck reports from my last boot, where
> I had to turn off the machine by keeping the power button
> pressed for 4 seconds.
> 
> [ ... ]
 >
> Sorry for not being able to write a better bug-report but I don't have
> the time to dive into this deeper. I hope this report is enough for
> someone to have a clue what is going on.

Thank you for the detailed report. I think this report is detailed 
enough to root-cause this issue, something that was not possible before 
this report.

Please help with verifying whether this patch fixes this issue: "[PATCH] 
scsi: sd: Revert "Rework asynchronous resume support"" 
(https://lore.kernel.org/linux-scsi/20220816172638.538734-1-bvanassche@acm.org/).

Thanks,

Bart.

