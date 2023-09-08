Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143024C93
	for <regressions@lists.linux.dev>; Fri,  8 Sep 2023 15:58:44 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-68cbbff84f6so2396320b3a.1
        for <regressions@lists.linux.dev>; Fri, 08 Sep 2023 08:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694188724; x=1694793524; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sVWvu8RoKeTjqF5A2JKxf1ztiSq4CSZLNWsOZzIBv6o=;
        b=QZderH1KLBWPCuwF+ZZfHneOg9rQ0Rpu1WFrlWacLzDzIWP4mx3jP+PLglxNKwRfHQ
         wsKKiQXBFpoErWP2x2ivMk/oR8zGpj6y5lywxLrjxUqFOZpjZkoojK0rP8xu0INfycv4
         ZXYDhKeerQghgCR+l66H7Y2v5DsxxgxC62f18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694188724; x=1694793524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVWvu8RoKeTjqF5A2JKxf1ztiSq4CSZLNWsOZzIBv6o=;
        b=iry7MnTau5E+u0evAFQyONcC8Q/rJRFe0bVGVa2AVq+G987MtPbDjs9oOlm2Kv/MAq
         IqkNefEXghzAsy37Vfsy/Pm4ivduP3LL1TaMbtwRprPqIH6SbXw/Q+0YVq4XMyBaladF
         WwoMRCnPOpNQHHC0KLFZvoD29om5dObcjDmkCU7DGQxQmsYRTdxuWGpmVwfUZ66QJEwM
         BHC0CtjwIF2W4GQnl+kWpZ3XuB49cid9OVrEEsPAMZPibpY7ckCQOw89qygNPWWLVY0X
         Cprn8RWhKSBYNLN1yMUT1Z44SxxEPwY6lyWbJqIx9OQym/UzWhuQIgJzJpyCYcB7uetg
         2ghQ==
X-Gm-Message-State: AOJu0YyaSsQSfLY8ZIX0aDmGykoKFMSH5fMd19NnFt0yhrhFbh8ojYbG
	slx6c8z5vYMELgXWpZHOl3f9Mg==
X-Google-Smtp-Source: AGHT+IEeBILJPe405y2GBTm/QUKPyzLs1vv58mCNYqEGLGb92qtZCnyLwgrOcMTUwsOfQMQAElfm4g==
X-Received: by 2002:a05:6a20:e111:b0:149:602e:9239 with SMTP id kr17-20020a056a20e11100b00149602e9239mr4069491pzb.21.1694188724224;
        Fri, 08 Sep 2023 08:58:44 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id h4-20020aa786c4000000b0068bbd43a6e2sm1542461pfo.10.2023.09.08.08.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 08:58:43 -0700 (PDT)
Date: Fri, 8 Sep 2023 08:58:42 -0700
From: Kees Cook <keescook@chromium.org>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Aaron Lu <aaron.lu@intel.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>, ardb@google.com
Subject: Re: kexec reboot failed due to commit 75d090fd167ac
Message-ID: <202309080856.F066F92C98@keescook>
References: <20230829114816.GA508985@ziqianlu-dell>
 <ZO3hQ0rbr8QuUjVI@debian.me>
 <20230829125134.GA509331@ziqianlu-dell>
 <20230829125939.bcg2r6hwqf45npko@box.shutemov.name>
 <20230829140451.GA509854@ziqianlu-dell>
 <20230907131409.masxz42ik6u456qp@box.shutemov.name>
 <20230908060230.GA283801@ziqianlu-dell>
 <20230908123233.dpbpohgrbyyxekzk@box.shutemov.name>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230908123233.dpbpohgrbyyxekzk@box.shutemov.name>

On Fri, Sep 08, 2023 at 03:32:33PM +0300, Kirill A. Shutemov wrote:
> On Fri, Sep 08, 2023 at 02:02:30PM +0800, Aaron Lu wrote:
> > On Thu, Sep 07, 2023 at 04:14:09PM +0300, Kirill A. Shutemov wrote:
> > > On Tue, Aug 29, 2023 at 10:04:51PM +0800, Aaron Lu wrote:
> > > > > Could you show dmesg of the first kernel before kexec?
> > > > 
> > > > Attached.
> > > > 
> > > > BTW, kexec is invoked like this:
> > > > kver=6.4.0-rc5-00009-g75d090fd167a
> > > > kdir=$HOME/kernels/$kver
> > > > sudo kexec -l $kdir/vmlinuz-$kver --initrd=$kdir/initramfs-$kver.img --append="root=UUID=4381321e-e01e-455a-9d46-5e8c4c5b2d02 ro net.ifnames=0 acpi_rsdp=0x728e8014 no_hash_pointers sched_verbose selinux=0"
> > > 
> > > I don't understand why it happens.
> > > 
> > > Could you check if this patch changes anything:
> > > 
> > > diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/misc.c
> > > index 94b7abcf624b..172c476ff6f3 100644
> > > --- a/arch/x86/boot/compressed/misc.c
> > > +++ b/arch/x86/boot/compressed/misc.c
> > > @@ -456,10 +456,12 @@ asmlinkage __visible void *extract_kernel(void *rmode, memptr heap,
> > >  
> > >  	debug_putstr("\nDecompressing Linux... ");
> > >  
> > > +#if 0
> > >  	if (init_unaccepted_memory()) {
> > >  		debug_putstr("Accepting memory... ");
> > >  		accept_memory(__pa(output), __pa(output) + needed_size);
> > >  	}
> > > +#endif
> > >  
> > >  	__decompress(input_data, input_len, NULL, NULL, output, output_len,
> > >  			NULL, error);
> > > -- 
> > 
> > It solved the problem.
> 
> Looks like increasing BOOT_INIT_PGT_SIZE fixes the issue. I don't yet
> understand why and how unaccepted memory is involved. I will look more
> into it.
> 
> Enabling CONFIG_RANDOMIZE_BASE also makes the issue go away.

Is this perhaps just luck? I.e. does is break ever on, say, 1000 boot
attempts? (i.e. maybe some position is bad and KASLR happens to usually
avoid it?)

> Kees, maybe you have a clue?

The only thing I can think of is that something isn't being counted
correctly due to the size of code, and it just happens that this commit
makes the code large enough to exceed some set of mappings?

> 
> diff --git a/arch/x86/include/asm/boot.h b/arch/x86/include/asm/boot.h
> index 9191280d9ea3..26ccce41d781 100644
> --- a/arch/x86/include/asm/boot.h
> +++ b/arch/x86/include/asm/boot.h
> @@ -40,7 +40,7 @@
>  #ifdef CONFIG_X86_64
>  # define BOOT_STACK_SIZE	0x4000
>  
> -# define BOOT_INIT_PGT_SIZE	(6*4096)
> +# define BOOT_INIT_PGT_SIZE	(7*4096)

That's why this might be working, for example? How large is the boot
image before/after the commit, etc?

>  # ifdef CONFIG_RANDOMIZE_BASE
>  /*
>   * Assuming all cross the 512GB boundary:
> -- 
>   Kiryl Shutsemau / Kirill A. Shutemov

-Kees

-- 
Kees Cook
