Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5624011197
	for <regressions@lists.linux.dev>; Mon,  3 Jul 2023 19:03:25 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-666e64e97e2so2491054b3a.1
        for <regressions@lists.linux.dev>; Mon, 03 Jul 2023 12:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688411004; x=1691003004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e2RYZRLdkNoiixgGGXsCAsn40wE9t2aXAfVNzXokwOc=;
        b=YRPxXzGc4UuYzbUAXbPHrASt5qkMMnE+qv577e9xoiY0qIQ7l7/oStaFPnopW0oxCG
         AiMz0AKa25o4ThiYM9wkdLrVxFOwAPhvifaGRw8kbuk8uVl7dBiKjQXarb5rYmbfnA5T
         IQdEBHnH5pwK+Uopjec2Mgd0ZJHfOnt6eNkLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688411004; x=1691003004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2RYZRLdkNoiixgGGXsCAsn40wE9t2aXAfVNzXokwOc=;
        b=Ssk4QBPcRskC8T8nOuZ5AMCeDlGHdhkV9sqYUxTn1vsi0dE25YQxgpO0aRsjD3cOwq
         FKiwRp2+7EP/pdAIL41MwPK0tWY2Y3yIcAgQ+oi8aYG22MjQm0Isj3D9XezMHuoYfk35
         9McOBiTFX09Tbf19et59eVgcqZ+Y9CyHhnPnIGi7fkG0wUqLaSKzNRas8Bj5R7WegZOG
         J2fEp9Plr6cjCOpjVWvLuBwmm0GKdfOCrBBepiSLOiITh7Ipzoul4LweMsq73ALsi/R8
         /yMD2rvJfaDmf7OFdJq0UpOAoeYTsci+dXW17zy9XNnl6ro6eEvHTUW2vImYcX7O8ckt
         0uiQ==
X-Gm-Message-State: AC+VfDygQzQwLPT5ihTB6N9JHgoZ96b3p0QmzKw3Ab+mCwBv8j+6OkDq
	wWpBTzLkqxfD1yoSM38qGGGVlA==
X-Google-Smtp-Source: ACHHUZ6IXmGjtNBPTn5F9tKfIIbMruqpzIVIdDTQJTrxxqTXR2sQw4qGgV7Jdg1/hPAZMZHNu2YuRg==
X-Received: by 2002:a05:6a20:1013:b0:128:ffb7:dcff with SMTP id gs19-20020a056a20101300b00128ffb7dcffmr10025060pzc.11.1688411004501;
        Mon, 03 Jul 2023 12:03:24 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x16-20020a056a00271000b0067459e92801sm12973915pfv.64.2023.07.03.12.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 12:03:23 -0700 (PDT)
Date: Mon, 3 Jul 2023 12:03:23 -0700
From: Kees Cook <keescook@chromium.org>
To: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux LLVM <llvm@lists.linux.dev>, linux-kbuild@vger.kernel.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-hardening@vger.kernel.org
Subject: Re: [CRASH][BISECTED] 6.4.1 crash in boot
Message-ID: <202307031149.823F9A3@keescook>
References: <9a8e34ad-8a8b-3830-4878-3c2c82e69dd9@alu.unizg.hr>
 <ZKIoBVzrjZ+Ybxy9@debian.me>
 <202307022018.B26F5795@keescook>
 <625e951e-9922-d15d-5520-e8cd5eba1995@roeck-us.net>
 <4fa56264-f188-46f9-cc77-117b469b3328@roeck-us.net>
 <2b1a4f49-ba18-0246-af09-4e4133814411@alu.unizg.hr>
 <202307022230.6121D6896@keescook>
 <ed3e4315-b149-2f9e-70d4-45d7f83b9922@alu.unizg.hr>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed3e4315-b149-2f9e-70d4-45d7f83b9922@alu.unizg.hr>

On Mon, Jul 03, 2023 at 09:03:38AM +0200, Mirsad Goran Todorovac wrote:
> On 3.7.2023. 7:41, Kees Cook wrote:
> > On Mon, Jul 03, 2023 at 07:18:57AM +0200, Mirsad Goran Todorovac wrote:
> > > I apologise for confusion. In fact, I have cloned the Torvalds tree after
> > > 6.4.1 was released, but I actually cloned the Torvalds tree, not the 6.4.1
> > > from the stable branch as the Subject line might have misled.
> > 
> > Thanks, no worries! I got myself confused too. :)
> > 
> > The config you sent looks like I'd expect now too. Questions for you, if
> > you have time to diagnose further:
> > 
> > - Are you able to catch the very beginning of the crash, where the Oops
> >    starts?
> 
> It scrolls up very quickly. Couldn't catch that with the camera.
> 
> > - Does pstore work for you to catch the crash?
> 
> Haven't tried that yet. I will have to do some homework.

Try adding this to the .config:

# Enable PSTORE support
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS=y
# Enable UEFI pstore backend
CONFIG_EFI_VARS_PSTORE=y
# CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE is not set
# Enable ACPI ERST pstore backend
CONFIG_ACPI=y
CONFIG_ACPI_APEI=y

A go write-up about using it is here:
https://blogs.oracle.com/linux/post/pstore-linux-kernel-persistent-storage-file-system
and covers the systemd-pstore details too. Note that in the config I
suggested, I've enabled the efi backend by default.

> > - Can you try booting with this patch applied?
> >    https://lore.kernel.org/lkml/20230629190900.never.787-kees@kernel.org/
> 
> Sure, but after 4 PM UTC+02 I suppose.

Cool. xhci-hub is in your backtrace, and the above patch was made for
something very similar (though, again, I don't see why you're getting a
_crash_, it should _warn_ and continue normally). And, actually, also
include this patch:
https://lore.kernel.org/lkml/20230614181307.gonna.256-kees@kernel.org/

> > I'll try to see if I can figure out anything more from the images you
> > posted.

Yeah, the xhci-hub bit is the only clue I can see here. It's also in the
IRQ handler, which reminds me of this bug that we still don't have a
root-cause for the _crash_ during the warning here:
https://lore.kernel.org/oe-lkp/202306131354.A499DE60@keescook/
but I the new patch I linked to above fixes the source of the warning.

> I really couldn't figure out myself what went wrong with this one?

Having the crash scroll off the page is pretty frustrating. I wonder if
the kernel crash handler could changed to repeat the RIP at the end of
the crash...

-Kees

-- 
Kees Cook
