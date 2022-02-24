Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3C91360
	for <regressions@lists.linux.dev>; Thu, 24 Feb 2022 03:59:00 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id m11so623302pls.5
        for <regressions@lists.linux.dev>; Wed, 23 Feb 2022 19:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ipcMbOhFS/2FiJEFtsW19b67QSx/DKh4wGATjCAKrkY=;
        b=ZnawhkpDqU+rZlOg1P0cBGB0T65BAaTadLRW1leM/SrFFGbp0E9ZJ3/bJH3dhqPAcm
         pQpEqo/A7vpTuh9ApxtdE0+Q4YuYDWgqFar+s/Iao8+jjt3Uuz5ySEP3Sv8h8VmG/zcc
         1ARH9+FZTnmavgiFljrm2KxQ8Wy3OsIlx+FLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ipcMbOhFS/2FiJEFtsW19b67QSx/DKh4wGATjCAKrkY=;
        b=zhAPp11ou9CgIjEWKtPoef/EHtLMwX8YvOg+GV7vhhGakDvJQwRu8l1KjgAMGLr2Ef
         d35YvihwD0IwLwB7F/ga21l5QGI2oWrJrpstYhsMDSfEoS+TNix+ZvLlnJMCsJ8EPjW1
         lkqW7hxrsVdtS4WBZlVwnMnj/Xn7A4YcfP1zUEoy3Li/9Xa1yQoKlV8hQtC+x53axO2d
         XhC0GJR95GTX1Jm++z4HtyQnauUdlXXPdxwpaG0IHGU55WmTRB6uVK8mCfpjH4GmiwgO
         YoH1jyIQkqxxtMG2rSDuStg/sGyGgx/tblU3+BzQ4jcs403xQgY3lemhEtSOjQPhN+eo
         jwGw==
X-Gm-Message-State: AOAM531RKcvOp3/Nqrz4hDWItbV7Dk1wugiJqxzrviX0NcHJ6+adO2er
	i6EIOJD7UHvVvByexzvN7DsLUdBwsof08Q==
X-Google-Smtp-Source: ABdhPJzn1uMQcYSD5vqES/uqQG8fcX1txbzlrszEOeO34PcIjg+0QC/31asHtN0y0pT/5plGU0HyDA==
X-Received: by 2002:a17:902:f606:b0:14b:4c2d:e1fa with SMTP id n6-20020a170902f60600b0014b4c2de1famr889815plg.24.1645675139788;
        Wed, 23 Feb 2022 19:58:59 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z13sm1146016pfe.20.2022.02.23.19.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 19:58:59 -0800 (PST)
Date: Wed, 23 Feb 2022 19:58:58 -0800
From: Kees Cook <keescook@chromium.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	matoro_bugzilla_kernel@matoro.tk,
	Andrew Morton <akpm@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	linux-ia64@vger.kernel.org,
	Linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: regression: Bug 215601 - gcc segv at startup on ia64
Message-ID: <202202231957.801F1780@keescook>
References: <a3edd529-c42d-3b09-135c-7e98a15b150f@leemhuis.info>
 <823f70be-7661-0195-7c97-65673dc7c12a@leemhuis.info>
 <03497313-A472-4152-BD28-41C35E4E824E@chromium.org>
 <94c3be49-0262-c613-e5f5-49b536985dde@physik.fu-berlin.de>
 <9A1F30F8-3DE2-4075-B103-81D891773246@chromium.org>
 <4e42e754-d87e-5f6b-90db-39b4700ee0f1@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e42e754-d87e-5f6b-90db-39b4700ee0f1@physik.fu-berlin.de>

On Mon, Feb 21, 2022 at 10:57:01PM +0100, John Paul Adrian Glaubitz wrote:
> Hi Kees!
> 
> On 2/21/22 21:58, Kees Cook wrote:
> >> I have applied this patch on top of 038101e6b2cd5c55f888f85db42ea2ad3aecb4b6 and it doesn't
> >> fix the problem for me. Reverting 5f501d555653f8968011a1e65ebb121c8b43c144, however, fixes
> >> the problem.
> >>
> >> FWIW, this problem doesn't just affect GCC but systemd keeps segfaulting with this change as well.
> > 
> > Very weird! Can you attached either of those binaries to bugzilla (or a URL I can fetch it from)? I can try to figure out where it is going weird...
> 
> Here's the initrd of that particular machine:
> 
> > https://people.debian.org/~glaubitz/initrd.img-5.17.0-rc5+
> 
> You should be able to extract the binaries from this initrd image and the "mount" command,
> for example, should be one of the affected binaries.

I don't see anything immediately obvious here, but I'll keep looking. Is
there any way to emulate ia64? I don't see anything that'll work under
QEMU...

-- 
Kees Cook
