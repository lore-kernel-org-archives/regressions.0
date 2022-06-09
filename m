Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B683C7A
	for <regressions@lists.linux.dev>; Thu,  9 Jun 2022 11:02:47 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id c14so21478178pgu.13
        for <regressions@lists.linux.dev>; Thu, 09 Jun 2022 04:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eA2rSMTUFSewTOnPsmOrnE6HCmgRpXaUuyafBR4ipFo=;
        b=PhF2l/vtHVZjCKAqz4OpktNX8yi0juQT7/9mlOjaRI+WJ/8mFLlvmrChupswhPlMoa
         bc7vMTDPOhZSuBdmsu8Ao+uRlmChD/jUJbcP2miIjzmjYzQ9L3TWeewo4w8AdkVg1o6p
         4Y0jslyAC5Xw0nkFpxZEl70DVxJkswiTrwXxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eA2rSMTUFSewTOnPsmOrnE6HCmgRpXaUuyafBR4ipFo=;
        b=rIpLMMXE9R4vBun2YR6/1pJOIGXWaMZCmePDI8eFIV2M4dhFgx7S4fkaQ8Agsx8r3j
         V4E+41hs1P5LjxWH5ez4KggP/usGMem4f5ZGYI2StQDqcGsQSemQHNSUR5mXw8J+jg7k
         EZcncg4f1eygMbh9JKExRKt4g+7EQQkbPfS7E/acZE+3Q0U7OvYbL1907OOH0PTE2I23
         PTQJkiQBsCa3Emss0T+0uT7ZEju8Qv/n8TxQyCbHbDX1mMYoU+vDdFtH0dgN4Y8f4mul
         vykI8GmwNdA6NfLz7s29kZx4Xll3EjStIOMbYkLpiRCswE4SagWKzr7U6BCYVxplSHhi
         s2Vg==
X-Gm-Message-State: AOAM532nFvhFTlMh0QO9YO3hVPNZIklOg5XggQKzTIvfdJTOFt45jxir
	kfsvEewnD1TlwMbyPKwGPTuynA==
X-Google-Smtp-Source: ABdhPJyRD8M4C4AIWlnMkoCdrxA428zPc/65lMrKv7boT8iwH7ATo4M+sNcCYcjeZm4RCxc0iZEi5Q==
X-Received: by 2002:a63:8242:0:b0:3fe:3601:747f with SMTP id w63-20020a638242000000b003fe3601747fmr6713986pgd.314.1654772567192;
        Thu, 09 Jun 2022 04:02:47 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:1572:8d44:6d26:109d])
        by smtp.gmail.com with ESMTPSA id t1-20020a1709027fc100b00163f2f9f07csm194145plb.48.2022.06.09.04.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:02:46 -0700 (PDT)
Date: Thu, 9 Jun 2022 20:02:41 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Minchan Kim <minchan@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	open list <linux-kernel@vger.kernel.org>,
	linux-fsdevel@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>,
	regressions@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Nitin Gupta <ngupta@vflare.org>
Subject: Re: qemu-arm: zram: mkfs.ext4 : Unable to handle kernel NULL pointer
 dereference at virtual address 00000140
Message-ID: <YqHTUdeZ8H0Lnf8E@google.com>
References: <CA+G9fYtVOfWWpx96fa3zzKzBPKiNu1w3FOD4j++G8MOG3Vs0EA@mail.gmail.com>
 <Yp47DODPCz0kNgE8@google.com>
 <CA+G9fYsjn0zySHU4YYNJWAgkABuJuKtHty7ELHmN-+30VYgCDA@mail.gmail.com>
 <Yp/kpPA7GdbArXDo@google.com>
 <YqAL+HeZDk5Wug28@google.com>
 <YqAMmTiwcyS3Ttla@google.com>
 <YqEKapKLBgKEXGBg@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqEKapKLBgKEXGBg@google.com>

On (22/06/08 13:45), Minchan Kim wrote:
> 
> I am trying to understand the problem. AFAIK, the mapping_area was
> static allocation per cpu so in zs_cpu_down, we never free the
> mapping_area itself. Then, why do we need to reinitialize the local
> lock again?

Well... Something zero-s out that memory. NULL deref in strcmp() in
lockdep points at NULL ->name. So I'm merely testing my theories here.
If it's not area lock then it's pool->migrate_lock?
