Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF5515482
	for <regressions@lists.linux.dev>; Thu, 11 Jan 2024 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SirfIEJb"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3368abe1093so4138918f8f.2
        for <regressions@lists.linux.dev>; Thu, 11 Jan 2024 03:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704971795; x=1705576595; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lMrj071u8QxSrpPG+XgJOGjzHRcUM7yJCNZgbHu8j4E=;
        b=SirfIEJbnmj7KfWKB9dwcWzjaMkGihywvvtUTL3DEI6smlJE7vmzmWssppkKRnbvtg
         gc0JVyUjlffRa6Zqz4twsWm75KkF03wN6b9uepPsHX/D7QgA+bs7BINcfCOLYZQ5Xaip
         ZtC6KV+TFeuPpRoHOLP+MRk55kRoddxvCdIveb+Bi+lgmPopW75gFL3XitGMY3WfbiFg
         5pPDBQa+UgKCPMXV9bzqa0tukvHaXUV5jqHunGmK0gwLZwsxb/zbXrvDudozqh73CEGj
         ZOGwqNBwB+4qOW2bpem/clTiMi0s7hrF4Ivhj36aL1gN7NXU0Gz6VoU3jib4NG//wcuF
         HPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704971795; x=1705576595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMrj071u8QxSrpPG+XgJOGjzHRcUM7yJCNZgbHu8j4E=;
        b=Fo+iBDVV2bzfH3i0S4FaFO9Z3zV7hGdISpE08LY4DoOGcrafPjXtXYStAWvEjmQb9P
         LHmXanDM/RdT1OrdjRmtFu94BF4LDmrGg3+6iUZOB9d2lyzWsEtVfjZ+O0wFQGKtJSOd
         HYaN+YUTdlNiyaPs+iipIP2Sk7Amlc0tVh7tMan04ezENrY2v0YaluGCYscG8WVmIC5F
         EKdQoM1jRCtFTBY4DfsmE/zF/WiILo7Ugk7REx2eFnjvRfer07wJDzJ13CgknOT0qZQv
         XZzWVKugGyYzE+/Cddw/8CdEBU3FBwezVPz504T24hv/XXMb3ejbk1BFR1FPdmkyUQEp
         gTxQ==
X-Gm-Message-State: AOJu0YxT+3CC5WvcQBSjd3TBqwoR5yUxNkIWtaacaCiQYEogGqWoNoLO
	4esfOn8X/8vK+2y1OCA7eFiOwqpO3KInTLnAKcbNJQEUhv0=
X-Google-Smtp-Source: AGHT+IEPPNVvbO5ZAGHaJIqpc3i4tc1NLOXiXRpJBAk/R+nqSaMM7qnZtN104k+NMK5aCMx5D6B0oA==
X-Received: by 2002:a05:6000:11c9:b0:336:76dc:9b48 with SMTP id i9-20020a05600011c900b0033676dc9b48mr488079wrx.91.1704971794944;
        Thu, 11 Jan 2024 03:16:34 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id p19-20020adf9d93000000b003378ea9a7desm157130wre.33.2024.01.11.03.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 03:16:34 -0800 (PST)
Date: Thu, 11 Jan 2024 14:16:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Uladzislau Rezki <urezki@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	clang-built-linux <llvm@lists.linux.dev>,
	lkft-triage@lists.linaro.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: mm/vmalloc.c:4691:25: error: variable 'addr' is uninitialized
 when used here [-Werror,-Wuninitialized]
Message-ID: <628bf675-77fc-4ccc-be2f-9c3ec8a7b0b8@moroto.mountain>
References: <CA+G9fYvDNksfKNvtfERaBa9t2MJNucfD_s3LgKGw_z2otW+nyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvDNksfKNvtfERaBa9t2MJNucfD_s3LgKGw_z2otW+nyw@mail.gmail.com>

On Thu, Jan 11, 2024 at 04:23:09PM +0530, Naresh Kamboju wrote:
> Following build failures noticed on i386 and x86 with clang builds on the
> Linux next-20240111 tag.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Build error:
> ----------
> mm/vmalloc.c:4691:25: error: variable 'addr' is uninitialized when
> used here [-Werror,-Wuninitialized]
>  4691 |                 va = __find_vmap_area(addr, &vn->busy.root);
>       |                                       ^~~~
> mm/vmalloc.c:4684:20: note: initialize the variable 'addr' to silence
> this warning
>  4684 |         unsigned long addr;
>       |                           ^
>       |                            = 0
> 1 error generated.

We turned off uninitialized variable warnings for GCC a long time ago...
:/ I don't know if we'll be able to re-enable it in a -Werror world
although Clang seems to be managing alright so perhaps there is hope.

regards,
dan carpenter

