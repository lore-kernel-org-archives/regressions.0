Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E595715AA
	for <regressions@lists.linux.dev>; Thu, 15 Sep 2022 02:48:20 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id s14-20020a17090a6e4e00b0020057c70943so20978274pjm.1
        for <regressions@lists.linux.dev>; Wed, 14 Sep 2022 19:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=iT4cNzTqaeWtOVogFt+yHUwJZZ1CJKXyTGfZWcy5x20=;
        b=Nf6GZ1RQgveRdjNll35QbNXYbCGlEIS+Pcqw/xePSQfl54d9zLKQc2BFi4m9YpKzWR
         mwYp/hAaZoXlDShhbSPcn3ajRjUImTSxp5g4Ly1C4l30nJlw5YnSqgIxc7vfPcPxnhHq
         4/2KzhinXD7fnpatZAYCcVCcGV7tJ5sy3j7KAidSFxZZrQzJdE2x/+BeQYlHDBFdaR2N
         nZKaVXB23qN4hiUthnusW6JXAKPQ5Xd+I9eG3Q2gk+PTy67XHH3ex6/qZTVkaQs7iqzC
         Kn2JX+jjCU9bVN1bT7KUJJGhxMfviHtEvmsaFyHTDAiy9S414L135keAbRsYA9h4xuZg
         D//Q==
X-Gm-Message-State: ACrzQf0tCeLeyxK3jWJBKVvs3eBIyA6BAZRJS1mind/DzYD3qCdtgKnV
	e2nSi2ZrEVPbvlAEfH2usPo=
X-Google-Smtp-Source: AMsMyM4gngiPyMz2ZPiGEJ3aOuJoiPcAxSmx+pJYNvBI6fIM0Ii9K8bs69+CMbcVtf278yc5nwFljQ==
X-Received: by 2002:a17:90b:4d07:b0:1ef:521c:f051 with SMTP id mw7-20020a17090b4d0700b001ef521cf051mr8210222pjb.164.1663210100258;
        Wed, 14 Sep 2022 19:48:20 -0700 (PDT)
Received: from [192.168.3.219] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id y10-20020a62640a000000b0053e6bda08e0sm10937487pfb.219.2022.09.14.19.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 19:48:19 -0700 (PDT)
Message-ID: <350ec615-ffe8-2e0e-149d-4bf45932a585@acm.org>
Date: Wed, 14 Sep 2022 19:48:17 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [REGRESSION] introduced in 5.10.140 causes drives to drop from
 LSI SAS controller (Bisected to 6d17a112e9a63ff6a5edffd1676b99e0ffbcd269)
Content-Language: en-US
To: Jason Wittlin-Cohen <jwittlincohen@gmail.com>, regressions@lists.linux.dev
Cc: stable@vger.kernel.org, linux-scsi@vger.kernel.org,
 alim.akhtar@samsung.com, Kiwoong Kim <kwmad.kim@samsung.com>
References: <CADy0EvLGJmZe-x9wzWSB6+tDKNuLHd8Km3J5MiWWYQRR2ctS3A@mail.gmail.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <CADy0EvLGJmZe-x9wzWSB6+tDKNuLHd8Km3J5MiWWYQRR2ctS3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/22 19:21, Jason Wittlin-Cohen wrote:
> 8d5c106fe216bf16080d7070c37adf56a9227e60 is the first bad commit
> commit 8d5c106fe216bf16080d7070c37adf56a9227e60
> Author: Kiwoong Kim <kwmad.kim@samsung.com <mailto:kwmad.kim@samsung.com>>
> Date: Tue Aug 2 10:42:31 2022 +0900
> 
> scsi: ufs: core: Enable link lost interrupt
> 
> commit 6d17a112e9a63ff6a5edffd1676b99e0ffbcd269 upstream.
> 
> Link lost is treated as fatal error with commit c99b9b230149 ("scsi: ufs:
> Treat link loss as fatal error"), but the event isn't registered as
> interrupt source. Enable it.

Hi Jason,

Something must have gone wrong during the bisection process. Commit
8d5c106fe216 ("scsi: ufs: core: Enable link lost interrupt") only 
affects the UFS driver and hence cannot change the behavior of a SAS 
controller. How about repeating the bisection process?

Thanks,

Bart.

