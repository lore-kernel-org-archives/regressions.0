Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66FE7B
	for <regressions@lists.linux.dev>; Fri, 21 Oct 2022 03:10:09 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id q71so1356254pgq.8
        for <regressions@lists.linux.dev>; Thu, 20 Oct 2022 20:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVDeaTKoSrOeCfd6nCXKEY/GIy0Kyct0/tmYk1UcIUw=;
        b=G7ifq2dkQ3DICOfSgmtHGTZ7dMZQvQ34Tb5+dVJfD2zOpDahc0SV/2oshuQWvCf6pt
         9deeHDnwhW7MiA3yoVmNPYOXnzV4MwmD0GpkGPthCONqn2aTzTJK6wrMlUMhkykGEFvy
         n2v9TZFznNTvYsGiPco24OZ6rOnhZmQStzhFXtETn52/E6Exb/I1FBrTGxQseO7oodpR
         CooPpXLJRSt9+tkD84l6RjAPx+MEb//8Z8BnP7EtIeFZbYXN8/fpyPjGKHIp6DJVhzpl
         e6SaUXP41JKGFksQx2qg3cU4m/93bp1oftck7u/xSdila5m8HCKaJ695CxvY0YofVh6J
         Hxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GVDeaTKoSrOeCfd6nCXKEY/GIy0Kyct0/tmYk1UcIUw=;
        b=orYyt/KSISbj0rgKkwlpL6C50aW6ojYWaK64ab2xrVRlTt9tTbat88+cQ6foe6vQYo
         rJ8s2Hcy8GkMbp3bezWo6Ssqs9NRBk9HbHIkPpygVwoGQlZEx3CffGRGagdWHIXTFXwg
         B3yijwQ/xs1X7vxfgxv3JbXMRoquZ9+2H5kpiXDR2O8EUai4rmNSSXPED6eWr5ws7MnN
         jMzAEVxivM4wp6gzCs9HfuJ+gQmtXDWmLZiBi3rDPThmfIkoChUbRhKcIy1+94Vnc46E
         BDcZnLwt6tJc9voK4YZBSOWsXrtM7cPdbYeq8I2vcGLow9orFwcmwgaiZOCzA5PtYwTK
         wQWg==
X-Gm-Message-State: ACrzQf3wPV3M3O253WqNXkPTXxoMdiEgOBJ+i3JOTzzpNQEL0B7SmRbs
	isCGDCNT8QT01CW6vbCA8lY=
X-Google-Smtp-Source: AMsMyM6nZwydnbhiGjYYOg1vjURXDJppqkZDoIFpqjmqd3F6r8dH8h2ooGiNvrvceeA+xaHFsi1eUw==
X-Received: by 2002:a63:8841:0:b0:461:24b7:a621 with SMTP id l62-20020a638841000000b0046124b7a621mr14679280pgd.277.1666321809230;
        Thu, 20 Oct 2022 20:10:09 -0700 (PDT)
Received: from localhost.localdomain ([111.203.234.211])
        by smtp.googlemail.com with ESMTPSA id f26-20020aa7969a000000b00561879b0f3asm13743395pfk.203.2022.10.20.20.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 20:10:08 -0700 (PDT)
From: Jintao Yin <nicememory@gmail.com>
To: phillip@squashfs.org.uk
Cc: bagasdotme@gmail.com,
	hsinyi@chromium.org,
	linux-kernel@vger.kernel.org,
	marcmiltenberger@gmail.com,
	mirsad.todorovac@alu.unizg.hr,
	nicememory@gmail.com,
	regressions@leemhuis.info,
	regressions@lists.linux.dev,
	srw@sladewatkins.net
Subject: Re: BISECT result: 6.0.0-RC kernels trigger Firefox snap bug with 6.0.0-rc3 through 6.0.0-rc7
Date: Fri, 21 Oct 2022 11:09:24 +0800
Message-Id: <20221021030924.687-1-nicememory@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <41ef4b22-eea8-2d67-99d8-6aaae7d25ac1@squashfs.org.uk>
References: <41ef4b22-eea8-2d67-99d8-6aaae7d25ac1@squashfs.org.uk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 20, 2022 at 04:45:53PM +0100, Phillip Lougher wrote:
> On 20/10/2022 14:55, Jintao Yin wrote:
> > Hi all,
> > 
> > After review the details of page actor, the tail bytes may be written to
> > a temp buffer instead the last used page. So before diff would wrongly
> > memzero a page which is not the tail bytes in.
> > 
> > In this diff fixes it by caculation of the real index the trailing bytes
> > in and check if the last used page matches this index. If the page is
> > the real tail bytes in, then memzero the trailing bypte of the page.
> > 
> > Please help test and any feedbacks are welcome.
> > 
> > Thanks,
> 
> This is a rediculously complex patch.  Sorry, but, absolute NACK.
> 
> Additionally, it is poor etiquette and pointless to fix an
> already fixed issue with a _more_ complex patch.
> 
> Phillip
>

Dear Phillip,

I'd like to apologize to you for my serious breakages of code of conduct. And
I had no intend to offend you. I'm new to this community and I will do my best to
follow the code of conduct and keep with good etiquettes.

Best Regards,
Jintao
