Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220FE30DD1F
	for <regressions@lists.linux.dev>; Fri,  6 Feb 2026 17:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770398365; cv=none; b=QV3+Nwh8hR6et+rGxgSHJp0/In4AfadmbobrbBwaClXADmmZiOc3ce/DJfQG4Bwhqj5vvdR2BnF+owzRbm+IfoszEhgv3MwVFYMManM9sj0nY3WF7M6WZXYqbv0Ae1gNoz3kIeSoDX5+KzEtD0nQHOOMXcpbMWXzP0fF97Oh5EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770398365; c=relaxed/simple;
	bh=j9NuMkdt8gy9/9LzNMWcyoT8dzX1lL1O0Ved08Qlucc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PdzWNvLeYsD86oq0z6y/r0W9BlV7+VrXSAg6KeAKMUoByv0SPCtjyo5Nb9kQR3SQyPD32Rp540ts5eZ6T59arMnFyQoyrIRt5eFz0rj2nvriguP4vWSt/OR35Jt5K7VGaaAr3uM4oUeZJT4ITWrFNXO+wZ7gy+2NPE1xaMvIhXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=h192P1MK; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="h192P1MK"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b87677a8abeso340617966b.1
        for <regressions@lists.linux.dev>; Fri, 06 Feb 2026 09:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1770398363; x=1771003163; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KDRVwr9oZTv0/xF6L/Df1O0KiM/OZAjWIdguXPh4mvo=;
        b=h192P1MK+lkpOycS+l4rH3QngzU0A9CUVFSZ3hjy4ag85bOSdJsYAW0sBMPenIJIzA
         lEb9I7H1LRYFWYYGoUo/Qe0SXOz1h4RS2DBf0JPmR05JE6qMqchAFPx5C36C2xXd1Fpa
         v9A9JbvD4ujD0rubflhZ/WkLT9VaFR0gKRDUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770398363; x=1771003163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDRVwr9oZTv0/xF6L/Df1O0KiM/OZAjWIdguXPh4mvo=;
        b=dAlHiiF0BPc2xOkHQ9WOuouNhLm90dk/kd/LSxDvmZCUXE/iE3652cxfedAXxYRphX
         Ly4SJmHEoa2m4YkH/Ktj32rraaXZme49eh6fTtNVRPQjAPL3tmQuV8T1V0wUyY9Gy0+X
         6qj7bxpHtTowrO0bP9T/vZfRjou3RDaco27aq3aBiZhULum/lTog7A8kOT9amtg0+Vd7
         PlH6K1Kpnag+8xRU2//BH5OS2VKM7M46zEietbmCbV+0p3jGbPYWblbunZs+ulhWlecu
         0pYkrPRZg4B6pzWcRC3wpwG/iypCnsoRM3I9jBkJYZGCa3JeGhmdmbsrzP/aIiHJYq6+
         0GuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj3/n7gx3sUS5dQm5Z07f/KkBxwtB4c/1km92W7lItsLxWw+F7PdMxqmHnZAOLmvqExuzLH1lvkKe2Cw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyV/e3PCALSwLj9rW1CjI61aRfAuhnfeCuIVT2mA4enyWG+YXsL
	msCXSttvQ4BtAxfOP6bBFxlxQ5Ejirq630t00zuc5Q3xyL5NqTBceNaeSC3XG6eTmAPIdnlTR6T
	BJZDuRMA=
X-Gm-Gg: AZuq6aKdCFSqOh6vDnZPoG91Ie9H63uHh/TrPgtXSUUraDX3q2vyupTw3U+qliO8ODO
	/57j0pp6JUgg28irs/EarKP1OUHtKkRrx9V6JAI7ritpCNkkp/bYfiVq2lRUUBUS9vTCrl1cb2D
	099n5iMEbLlTebWJ7IysRCWzsrP3JiAaBuUrp6tsPVlA5HNUJnIME5e0M0EtXiY7Pontb+EgFg8
	bxGpyGASH7sm0slinMmWvzgT6rczkuX08fMI5hptUmZvFIhUpKEnCURnc9zBlFdtSb/fGkC7w8b
	Rj+eVJTbzwQUWlDy2BYEJu89UQjVx7gojRVNfNxBrFJu4sB7MX6vaSAEFBde6KLlBl0Xn982wMW
	1U6IHA6uMJHlKMn7eO5cWZxSkmjYNatVQLMXB2iZiTjWQaSe6ZE6aWNzQRWE0AVOXUQD60uiu3Z
	e4d4I6ZgiT02+CA+mvHN/dXnyUFJJhoEP49yFXI1oS7/ZoGZ3acMI/aTcTpBwIs0T6QkIV/Jr2
X-Received: by 2002:a17:907:9344:b0:b83:95c8:15d0 with SMTP id a640c23a62f3a-b8edf3c879fmr197027566b.52.1770398363397;
        Fri, 06 Feb 2026 09:19:23 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda748254sm95638266b.5.2026.02.06.09.19.22
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 09:19:22 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b886fc047d5so411135066b.3
        for <regressions@lists.linux.dev>; Fri, 06 Feb 2026 09:19:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX4tyQcLnZGclEfi+Kf4gbGOmtKDEP9m19i6jzpH0h51AfLtA1iJMV8AdpZjs6wkDPH5i5bd/trd2njaQ==@lists.linux.dev
X-Received: by 2002:a17:907:3c93:b0:b87:20eb:a66d with SMTP id
 a640c23a62f3a-b8edf461c8cmr189507366b.65.1770398362011; Fri, 06 Feb 2026
 09:19:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <bed73c01aba29fe651c9e23a9820a21e88ad13e7.1769048488.git.jpoimboe@kernel.org>
 <99a9c69a-fc1a-43b7-8d1e-c42d6493b41f@broadcom.com> <73641ce4-9387-48c6-8904-74997f9bb7ac@leemhuis.info>
 <cjacqm5kz67e3nrjfxhpe4lepr27cnbmykdixknta4r2wh7ugq@3wne235ikkb7>
 <eef847de-7ef5-4491-91f2-7437dcb573cb@leemhuis.info> <kv4bv3jng2iap3qwvk36pciggiho4yhavnfvsisri67jkdt6kr@szokbl6qdibl>
 <87jywq18yt.ffs@tglx> <uc62gsttzmh5o35uh7viy326bqwpq5gxmcxqqyqb4zp4blp7tg@v3kfsotqtaay>
In-Reply-To: <uc62gsttzmh5o35uh7viy326bqwpq5gxmcxqqyqb4zp4blp7tg@v3kfsotqtaay>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Feb 2026 09:19:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=wivx7pi+h+hGmvNFAJm6StQLiQ-b8DdsE5J=LMOWae8Ng@mail.gmail.com>
X-Gm-Features: AZwV_Qj9cQatAAyE2XFiiPzjfJLIEiKV9l4zIWWMqdqLaWjQMd0eFXFZ0Z1x3G0
Message-ID: <CAHk-=wivx7pi+h+hGmvNFAJm6StQLiQ-b8DdsE5J=LMOWae8Ng@mail.gmail.com>
Subject: Re: [PATCH] x86/vmware: Fix hypercall clobbers
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Thomas Gleixner <tglx@glx-um.de>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Ajay Kaher <ajay.kaher@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Peter Zijlstra <peterz@infradead.org>, Justin Forbes <jforbes@fedoraproject.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

,

On Fri, 6 Feb 2026 at 08:32, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> So a spot fix would need to be something like so:

So from what I can tell, this was never a kernel bug to begin with,
and the actual bug is in QEMU. And the kernel change that exposes this
is old, and apparently the main issue is that it also then depends on
bad luck with a compiler that generates particular code that then
shows the QEMU bug.

So what I'd suggest we do is to do the *minimal* workaround for the
specific case of the broken QEMU mouse emulation, and not make the
already ugly vmware code even worse like your patch.

And the minimal workaround is apparently just the
vmmouse_report_events() oneliner that Alexey Makhalov suggested.

Longer term, we should probably clean this garbage up. The whole "use
inline functions with inline asm" for the vmware case makes zero sense
to begin with. Absolutely nobody cares. This is not
performance-critical code. We should get rid of those inlines in
<asm/vmware.h> *entirely*, and just make vmware_hypercall_slow() be
less of a shit-show.

Make that stupid switch statement in vmware_hypercall_slow() use a
static call, and get rid of the idiotic calling conventions that pass
in ten arguments, of which five are pointers that can be NULL. So
*OF*COURSE* the end result is a steaming pile of sh*t because the
calling convention is just a pile of dung that cannot be dealt with
well.

So make it do something like this instead:

        // Called 'in1,3-5' traditionally for bad reasons.
        // 'in2' was presumably apparently 'cmd' in cx
        // and ax is VMWARE_HYPERVISOR_MAGIC
        struct vmware_hypercall_args {
                unsigned long bx, dx, si, di;
        };

        // Called 'out1-5' traditionally for bad reasons.
        // 'in0' is returned in ax.
        struct vmware_hypercall_results {
                unsigned long bx, cx, dx, si, di;
        };

        unsigned long vmware_hypercall(unsigned long cmd,
                const struct vmware_hypercall_args *in,
                struct vmware_hypercall_results *out)
        {
                ... do sane code here ...

and I can almost guarantee it's going to be as fast or faster than the
existing crazy inline asm, because it won't have any stupid bad
calling conventions.

Then you can have trivial wrapper functions like

        static inline unsigned long vmware_hypercall1(unsigned long
cmd, unsigned long arg)
        {
                const struct vmware_hypercall_args in = { .bx = arg };
                struct vmware_hypercall_results out;
                return vmware_hypercall(cmd, &in, &out);
        }

and you're damn well done. Wouldn't that be a hell of a lot nicer -
and avoid the existing bug just by virtue of not having that stupid
and pointless "optimziation" where it thinks that si/di might be
useful around the vmware call.

The existing vmware code is just disgusting. Don't try to "fix it up"
for a bug that isn't even in the kernel.

Please.

                 Linus
