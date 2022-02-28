Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBB215BF
	for <regressions@lists.linux.dev>; Mon, 28 Feb 2022 20:41:49 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id l9so11301153pls.6
        for <regressions@lists.linux.dev>; Mon, 28 Feb 2022 12:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wer/Oz2nOAI419q72n4sbW/GCj0W5Nx8xz2+Rlt0xdI=;
        b=EPfWBDQTZQfFwTLJ9+iWGHrZjstF+IJdDCO2XmrpedQZl8eoQHqJA+/JViu23cwxXh
         4cMj/vzH9luSjFoMSUEnTyFggS72ppUy5QkoOhB1ZLmlYGZVjojhreHYu2ecNsLh0VEG
         gCNAXqAhIEMo9kYwHuvCozq3SDVVbHt3LuY2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wer/Oz2nOAI419q72n4sbW/GCj0W5Nx8xz2+Rlt0xdI=;
        b=PTnFI2dDh336oKLZ2T/jxRIjrXeJn6tzFm+QatHt4iA6uegUc8dWxHhncWoBTz3tFy
         0V23i6m/o5cEUiNrT2bJMl2eLDcDKPW1HTd7LoCWwHaTUobnN4BpoMAxniSCTcIZg1jv
         vdC9JIyj/EUqIHrLsh673SkgTzxw2FFEVCHz+1ygIt+4OVORTFFdYm8q1rdHIcijYnAS
         JvkDle40ffh4ap9cMdxOKIiMR/3J1R8WY25RasYznkVslzYxTr/XM+eHeLWu3FNLHJ3T
         SXc4qUT6YtQ7ZQdi58LdcVZAf6K0Q7+FxANLY7T9pMj59HUj5sgcBhLV13WPKVA1yC+D
         i4RA==
X-Gm-Message-State: AOAM5302Fsj51X/i9FJ8wkEyIvVHQSExE1UaTPI4wTHZ0B34Vrx2Qf9p
	EgsXWBBYMTim1R4+/dv9oqTUtQ==
X-Google-Smtp-Source: ABdhPJy3Ync6bess6WVePu+xmx/XAAZ+UJXR4GrnPlEoCAlv3kx6LFgNA1dRDLp+plPQLZbHhc+glA==
X-Received: by 2002:a17:903:2482:b0:150:15ed:3cd3 with SMTP id p2-20020a170903248200b0015015ed3cd3mr21772341plw.147.1646080908566;
        Mon, 28 Feb 2022 12:41:48 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t38-20020a056a0013a600b004e1a0c14000sm15037898pfg.209.2022.02.28.12.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 12:41:48 -0800 (PST)
Date: Mon, 28 Feb 2022 12:41:47 -0800
From: Kees Cook <keescook@chromium.org>
To: Magnus =?iso-8859-1?Q?Gro=DF?= <magnus.gross@rwth-aachen.de>
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com,
	glaubitz@physik.fu-berlin.de, linux-fsdevel@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
	matoro_bugzilla_kernel@matoro.tk,
	matoro_mailinglist_kernel@matoro.tk, regressions@leemhuis.info,
	regressions@lists.linux.dev, viro@zeniv.linux.org.uk
Subject: Re: regression: Bug 215601 - gcc segv at startup on ia64
Message-ID: <202202281240.8BCFBB47ED@keescook>
References: <202202260344.63C15C3356@keescook>
 <Yhyn9cjDV8XfXLHm@fractal.localdomain>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yhyn9cjDV8XfXLHm@fractal.localdomain>

On Mon, Feb 28, 2022 at 11:46:13AM +0100, Magnus Groß wrote:
> > When the kernel tries to map these with a combined allocation, it asks
> > for a giant mmap of the file, but the file is, of course, not at all
> > that large, and the mapping is rejected.
> 
> > So... I'm trying to think about how best to deal with this. If I or
> > anyone else can't think of an elegant solution, I'll send a revert for
> > the offending patch next week.
> 
> Shouldn't we just be able to patch total_mapping_size() again to instead
> sum up all p_memsz fields, instead of comparing minimum and maximum
> p_vaddr?

I don't think so, and I need to have a "minimal change" to fix this so
it's more obviously correct.

And, apologies, I failed to Cc you on this patch:
https://lore.kernel.org/linux-hardening/20220228194613.1149432-1-keescook@chromium.org/

-- 
Kees Cook
