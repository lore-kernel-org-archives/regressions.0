Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E698E1B287
	for <regressions@lists.linux.dev>; Wed, 29 Nov 2023 10:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyU3Db5X"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-549070a04baso8765586a12.3
        for <regressions@lists.linux.dev>; Wed, 29 Nov 2023 02:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701253859; x=1701858659; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lAncjJSOOjZiNADXqbSSNgxD1Kx8XP10IMElfbL+LY=;
        b=WyU3Db5XUzYpGjA039h5WhGAg5WzcNrVEn2so/zheFGVDe9bs8dgbAKRONbuTE9j3T
         IzcrnpiLmBtesb3+onK8ogWpodd7LLfjJnWmyBQ3at9L8Vpo9Qq8fdNuZVROePrigGBq
         u+dOFI+QgTIPBPmR+v2wrn07fONdK8JhnUUZ4xqnphR0+g2hpvD1vyoI5nTi21p/QT+Z
         ZwkaneB3b28DO/AqsaTYv9qABjT5F7ZT6a6QCduAipa8aHFqz305xr+s6jcXztsefVLE
         wB9nLSkRE9z8ZqbkZ+gYRTA+yx8Ig2dgmr5iGIp1kGmiF7g5Nlwj3L6NJHj0zJP+YMRT
         53cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701253859; x=1701858659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lAncjJSOOjZiNADXqbSSNgxD1Kx8XP10IMElfbL+LY=;
        b=nrMzVJRa9+u7CMzN92q1MDwRhf8jGIZ3v0zhV9RM7VjQUFwL4KWxtfpJ2HZxS80KRt
         7UVgaXDzHlTkVOZ2k5OggK5lP/0cN6grG76T+YBssu53pxvKr/ECPH/I7valgBCdKOSo
         hvCR3FYeJHDx/Zl4g3ycBBGUeNJZe2KE784QNAq1X/HlURR0epi710VhC/bZdi/sQ1I2
         Ha4/4B7/HY4m4b9BfNVzEeU7JyTpy6DKDPhiixnuIP+83oNV06o3H+4j50lQJCQHYqir
         gQ3RpqkwhN8vykpLTggAZ0FtTGNXJo1mR/q89VxmxXBFRwdtqE4oT/n6UXGfVuJzWvKk
         mfBQ==
X-Gm-Message-State: AOJu0Yzl0VFdeBq8BJcfEVN6s5xvef7pKIES8q2cHPJhN4XF8JHrBPmt
	1t5Tk9Fq8ljtrCaSToIbM4U=
X-Google-Smtp-Source: AGHT+IGptUIWmZYcaDGodMJ/aJUrATc3/axoxHWWr7FC5K0fVtF61tB+rOJdv9N5WVOF8xPpsKYW6A==
X-Received: by 2002:a05:6402:220d:b0:54a:f8d9:8023 with SMTP id cq13-20020a056402220d00b0054af8d98023mr11645670edb.37.1701253859154;
        Wed, 29 Nov 2023 02:30:59 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id h14-20020aa7c94e000000b00548a57d4f7bsm7241144edt.36.2023.11.29.02.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 02:30:58 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 1BE49BE2DE0; Wed, 29 Nov 2023 11:30:58 +0100 (CET)
Date: Wed, 29 Nov 2023 11:30:58 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	regressions <regressions@lists.linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>, npiggin <npiggin@gmail.com>,
	christophe leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register save
Message-ID: <ZWcS4uBOUefxZAQY@eldamar.lan>
References: <1105090647.48374193.1700351103830.JavaMail.zimbra@raptorengineeringinc.com>
 <42b9fdd7-2939-4ffc-8e18-4996948b19f7@kernel.dk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42b9fdd7-2939-4ffc-8e18-4996948b19f7@kernel.dk>

Hi,

On Sun, Nov 19, 2023 at 06:14:50AM -0700, Jens Axboe wrote:
> On 11/18/23 4:45 PM, Timothy Pearson wrote:
> > During floating point and vector save to thread data fr0/vs0 are clobbered
> > by the FPSCR/VSCR store routine.  This leads to userspace register corruption
> > and application data corruption / crash under the following rare condition:
> > 
> >  * A userspace thread is executing with VSX/FP mode enabled
> >  * The userspace thread is making active use of fr0 and/or vs0
> >  * An IPI is taken in kernel mode, forcing the userspace thread to reschedule
> >  * The userspace thread is interrupted by the IPI before accessing data it
> >    previously stored in fr0/vs0
> >  * The thread being switched in by the IPI has a pending signal
> > 
> > If these exact criteria are met, then the following sequence happens:
> > 
> >  * The existing thread FP storage is still valid before the IPI, due to a
> >    prior call to save_fpu() or store_fp_state().  Note that the current
> >    fr0/vs0 registers have been clobbered, so the FP/VSX state in registers
> >    is now invalid pending a call to restore_fp()/restore_altivec().
> >  * IPI -- FP/VSX register state remains invalid
> >  * interrupt_exit_user_prepare_main() calls do_notify_resume(),
> >    due to the pending signal
> >  * do_notify_resume() eventually calls save_fpu() via giveup_fpu(), which
> >    merrily reads and saves the invalid FP/VSX state to thread local storage.
> >  * interrupt_exit_user_prepare_main() calls restore_math(), writing the invalid
> >    FP/VSX state back to registers.
> >  * Execution is released to userspace, and the application crashes or corrupts
> >    data.
> 
> What an epic bug hunt! Hats off to you for seeing it through and getting
> to the bottom of it. Particularly difficult as the commit that made it
> easier to trigger was in no way related to where the actual bug was.
> 
> I ran this on the vm I have access to, and it survived 2x500 iterations.
> Happy to call that good:
> 
> Tested-by: Jens Axboe <axboe@kernel.dk>

Thanks to all involved!

Is this going to land soon in mainline so it can be picked as well for
the affected stable trees?

Regards,
Salvatore
