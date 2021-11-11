Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C3E68
	for <regressions@lists.linux.dev>; Thu, 11 Nov 2021 10:52:36 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id t11so11103599ljh.6
        for <regressions@lists.linux.dev>; Thu, 11 Nov 2021 02:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iEKA4VskprioZ3wq/U9m+wCXLZ4G97pCcQBnvlOh4Uo=;
        b=btLkorl9c8K853xVrxR1ADIOhdX23K66lM173VTISdcLAui9Uwt/y1wOtf64uYH2kZ
         Dfqh0Mnz01q/fHVPSAumedyawbY8zGsiN/ohklkbofF6iyOEsGIEtbyeA5Gwq8kyPC7K
         3Ie4wEUiPPjhiE+nr7bjZnLKswnBoKEO1ecaoOyktehx1CpwAgxDIP5AuT0iu0FoAmCw
         0BnmH6TUueo4T4bI2DbIHmxBLl0f/0vwYnYNvzJWPCF0LoxzJkAGFcnpBi5OQ/WDEBtA
         jbKlgVKxeFZlbzmDYcKMQsrlZ+pnWXSFveJITJ2PsdwpND/o6akXMvq+h+syJTulliUn
         B5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iEKA4VskprioZ3wq/U9m+wCXLZ4G97pCcQBnvlOh4Uo=;
        b=nSDu5MdFi17Z3au5svopqKk0Ph2MzesX6/nEPgRq1Hn7nZC32b2Qr211xiZoU2MycF
         GO/ZcCuVVo+niG2YEjp5OOaE9FGDlEP887FW6hmxRFyrpoqOz6dYjcoI3Wx+Qp5DoQ4n
         xtLelpQ9TBn2y0UG52P08QxnjgPYgenSMZQccrpcBOo7/GyJH/YOy015Om7+MRIdZMHA
         iCk/b0f/iVOSOP8jJ7EqcBJMsjgp9Uzvpu35IVYU7X8BJyA9MJl52edYXmBtjRXlJAUa
         71jup4LlcSkz0q52rQX68JOpoLGt72K3x+ZpsKaKtbNnm479oeAbkNKlACiX+IFekew0
         jEIA==
X-Gm-Message-State: AOAM5338PMUS1qj5m9KkmRKEcXIBCOGPCj2KWxCoTV3SeCIjLDnwltf3
	lcqEEt/O0wi3sA9NTLYe2GQ=
X-Google-Smtp-Source: ABdhPJz1IYsvS04cZQ+CvSu8XzvmkMKAcCwl/+9b0JTk3164neupuBhveziHtfju1ysnhZD2DcJ+Dw==
X-Received: by 2002:a2e:83c6:: with SMTP id s6mr6345880ljh.477.1636627954556;
        Thu, 11 Nov 2021 02:52:34 -0800 (PST)
Received: from lahvuun (93-76-191-141.kha.volia.net. [93.76.191.141])
        by smtp.gmail.com with ESMTPSA id l11sm255066lfg.79.2021.11.11.02.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 02:52:34 -0800 (PST)
Date: Thu, 11 Nov 2021 12:52:32 +0200
From: Ilya Trukhanov <lahvuun@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-pm@vger.kernel.org,
	tzimmermann@suse.de, ardb@kernel.org, rafael@kernel.org,
	len.brown@intel.com, pavel@ucw.cz,
	dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [REGRESSION]: drivers/firmware: move x86 Generic System
 Framebuffers support
Message-ID: <20211111105232.apk2msip4ng7hgsw@lahvuun>
References: <20211110200253.rfudkt3edbd3nsyj@lahvuun>
 <627b6cd1-3446-5e55-ea38-5283a186af39@redhat.com>
 <20211111004539.vd7nl3duciq72hkf@lahvuun>
 <af0552fb-5fb5-acae-2813-86c32e008e58@redhat.com>
 <1ddb9e88-1ef8-9888-113b-fd2a2759f019@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ddb9e88-1ef8-9888-113b-fd2a2759f019@redhat.com>

On Thu, Nov 11, 2021 at 10:24:56AM +0100, Javier Martinez Canillas wrote:
> On 11/11/21 08:31, Javier Martinez Canillas wrote:
> 
> [snip]
> 
> >>> And for each check /proc/fb, the kernel boot log, and if Suspend-to-RAM works.
> >>>
> >>> If the explanation above is correct, then I would expect (1) and (2) to work and
> >>> (3) to also fail.
> >>>
> > 
> > Your testing confirms my assumptions. I'll check how this could be solved to
> > prevent the efifb driver to be probed if there's already a framebuffer device.
> > 
> 
> I've posted [0] which does this and also for the simplefb driver.
> 
> [0]: https://lore.kernel.org/dri-devel/20211111092053.1328304-1-javierm@redhat.com/T/#u

I applied the patch and it fixes the issue for me.
Thank you!

> 
> Best regards,
> -- 
> Javier Martinez Canillas
> Linux Engineering
> Red Hat
> 
