Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A95F7E
	for <regressions@lists.linux.dev>; Mon,  7 Mar 2022 16:44:46 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id t18so2816403qtw.3
        for <regressions@lists.linux.dev>; Mon, 07 Mar 2022 08:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/XL/lMkKaAjZT+R1nP8H0cffa2vVj0nan43syJIwKEM=;
        b=NGAxo4l6dVw4MjmbICDgizGHfOi4yre3b0pLfDORn6QkKhVCbfHF+rNemWGokfFRxH
         NtY+yd2RUni7Od++YThC961zb+L5Yk2ElgJ+DYjcJKhNfNR2yIQmfScjlsvMIyDNMYQe
         AXKXSlou68f/jC4mjOwJ8vmxzk+JY0I2UNLGmLBpfdJ5GRjidPgS/tcNepdp8+ee/Wmk
         nr/FiTR9dxmfDbfhxRCDvHtnaGF39JYKTcY2bfSB3ZQERE5C1i1Es81mqkd3t5U9xMkN
         VQwtkviAPHBlrajVClNPPqQ5qArz2i0+t0c+F1W37SpZXYWAeoHUyQ5m6fXR46JVYbnt
         /Z1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/XL/lMkKaAjZT+R1nP8H0cffa2vVj0nan43syJIwKEM=;
        b=T1xhAH2qQnb5wm8S/nS5E9RKa5PLvr6AwEVjELfFX7RfmPcH4q2c0PZ+wc9rviY9Vv
         tBwZn4oxM91d+j2ab1JFwJt/FNXHZVMhLnfmLBeLNpNjsB4S3/9XirftShd4/xkd8We6
         m9IwIbz7PkY4T2N0cFMvdh+U2cTWs5xxvZxm8Vs8P/aXND2kYOVDeMKABaWp97v75VF/
         nE72a4OYO5deJd660Q2uf/RoY6h3nuz19jjkmqlh0SAvw7+YqpZWnJKF9VFyRsfsS7xN
         RPfdYUncycnSy8gq9e1LmFCbKO5DEyXc8wjDFbjKxbZh789UXitxoh+9/oGI8rZuDzUU
         9atA==
X-Gm-Message-State: AOAM530CWICDaO/svs6U3GQHoD9PXZ8vVBTGcREjOWNpuwlK/F5L+hZZ
	S94T1W/GUZy8zj1qa5YW+Cn8Sg==
X-Google-Smtp-Source: ABdhPJxUlGfyQuqHLZdnpfRoANxV+0hXCfHucRHiuTC80Gc6WFLFnVnTTEp8Y7BcKFfazeg0zyoF8A==
X-Received: by 2002:ac8:5c10:0:b0:2de:2dac:1ea1 with SMTP id i16-20020ac85c10000000b002de2dac1ea1mr10272361qti.600.1646671485033;
        Mon, 07 Mar 2022 08:44:45 -0800 (PST)
Received: from localhost (cpe-98-15-154-102.hvc.res.rr.com. [98.15.154.102])
        by smtp.gmail.com with ESMTPSA id u14-20020ac858ce000000b002de89087e7dsm8747493qta.78.2022.03.07.08.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 08:44:44 -0800 (PST)
Date: Mon, 7 Mar 2022 11:44:39 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Shakeel Butt <shakeelb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>, Nadav Amit <nadav.amit@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [next] mips: madvise.c:55:7: error: 'MADV_DONTNEED_LOCKED'
 undeclared
Message-ID: <YiY2dx5F0pEbsxkU@cmpxchg.org>
References: <CA+G9fYvPdufo6c3MgPjAMBrkTqoLDO+2LN1PV3V8rTsqN5XSFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvPdufo6c3MgPjAMBrkTqoLDO+2LN1PV3V8rTsqN5XSFg@mail.gmail.com>

On Mon, Mar 07, 2022 at 09:45:38PM +0530, Naresh Kamboju wrote:
> Following build regressions errors/warnings noticed on mips architecture on
> linux next-20220307 build.
> 
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=mips
> CROSS_COMPILE=mips-linux-gnu- 'CC=sccache mips-linux-gnu-gcc'
> 'HOSTCC=sccache gcc'
> 
> mm/madvise.c: In function 'madvise_need_mmap_write':
> mm/madvise.c:55:7: error: 'MADV_DONTNEED_LOCKED' undeclared (first use
> in this function); did you mean 'MADV_DONTNEED'?
>    55 |  case MADV_DONTNEED_LOCKED:

Thanks for the report, I sent a fix in reply to Stephen:

https://lore.kernel.org/lkml/YiY2KYyjsCaANwo0@cmpxchg.org/T/#m58a9804edb680303b7351fb7cf6d9c93096ccaad
