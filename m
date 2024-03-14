Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4046CDD5
	for <regressions@lists.linux.dev>; Thu, 14 Mar 2024 09:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710408347; cv=none; b=pnVW/Bl+9wjTF/JO0CrC0O2HZLSkdEYQdUF1Rf2/VKT77ZtJWqkc2r69IGNea3/8RUQvNeAO6979oGfJrk5SbFXs+baBxkrYZP8ukGObC+nrSURIbyzS8Eyc3d5zhyD/jQ6qvpYYizwidkJyRP+lck3ph64jwsO5ldQ8Zq/pxHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710408347; c=relaxed/simple;
	bh=zAq7B127SJlJg80NOehyDIikyu1/dR36D90cGWogZtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FL8XT+0NOdfalzVb2XH0BJtvoroFViqUdtMkyUi7ge3iqRd74+2Dh0zCcK/s1/Jm5kS3xvm8HOTW7MSlSRQZ9Kt5AP+mBBUgjiH7EDNi1fEL5hnFls3qcgNTabSg3ZRY5qBTEXb1hEH8begf3tO/uq/ggv/JfSbalkapzQ+rcyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d8Ddl84k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d8Ddl84k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710408344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rl/H4MWGLgmEqfgbk+kWHokXGlfem4Ht/IF+GTQnQp4=;
	b=d8Ddl84k5J1BmnlY2kK1d+OX4izryqGA8auStABY7L50u9XL2kVbhiumAmuUGnwsxN17Up
	h7N2ecnkj1B50G6iPamC1ZeP03wKgWcv0TXVNnaiddO2Dd0KTztqV0j+0h8oxQOdV1Rse6
	gPnv0wmtS4TN3JpiQpdNv+2ISjDEFkc=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-kqDi_MPrP-C6lyTXSYunvA-1; Thu, 14 Mar 2024 05:25:42 -0400
X-MC-Unique: kqDi_MPrP-C6lyTXSYunvA-1
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3665480799bso2507905ab.0
        for <regressions@lists.linux.dev>; Thu, 14 Mar 2024 02:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710408342; x=1711013142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rl/H4MWGLgmEqfgbk+kWHokXGlfem4Ht/IF+GTQnQp4=;
        b=uA1la/HfQcEXn21PxCm68A+Ut0ibCwb44O2+of+iKYmos23MOMBQAha7/tfx3JBm/4
         78igQXj/rONI3x911S9O44ZV2kSBavC9cMRAvAvt13SAh/EyX46ZIsADnhn7W2aQxB61
         8V0fnfw3SmkEqJn2ISMqYYawr7WZR/eGFlb8r8H48mGxE1nMywi/Uf3TlkyMHHm/jBa6
         L0RBwM8f91hwELMS4z0/JM4xBVXaeemUu0X/F87c1WNsUTVEcMS7cw8pjPtWttPMglET
         3oFFgL7byUcJhVdxGV9KjkFQMexgmrd87YFwgbLZGO7m0l04pDYmQlZHXPeO95LlfljM
         erRA==
X-Forwarded-Encrypted: i=1; AJvYcCW5nPCLF9HDUrfqDi3bLSY+L0DyTD4y84WkuBJbQpH99DvvmfHNHgShriSFh7i0xPw76fVd0WKMeLjr+fN8BS8GduOSWNOTeCST0qg=
X-Gm-Message-State: AOJu0Yw1wTCmW1edWgCwPiJryDfrbHoWW29sAL6mQ7BB7KhQrZ3l4OZ5
	EUBrUxM3zVMXnrpxuqt4AqUIcjCK6YR7O+BG5y7FEomW1g36LyQPzGJThhynUU/papGAmwD5XOo
	Qw7Myi6MeA2Oj8sdNvcYHSC11DgdJMG6S6iPNxMzbDhhFw/zPw0nH8msQ82ET4zz4wuuJW1oink
	2Gm4Rx9qisHPtT9ZECQS3tiWGheIpVgWCTn3I=
X-Received: by 2002:a92:de44:0:b0:365:4e45:33ad with SMTP id e4-20020a92de44000000b003654e4533admr935899ilr.1.1710408342161;
        Thu, 14 Mar 2024 02:25:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW8ilRYhJOkTU999SkD7mYGv+S2pTq79uG4Gtss8uUESu2wfnl2F8tti+O0WDSOfuRxxW4k70RHgq5g5PMV/g=
X-Received: by 2002:a92:de44:0:b0:365:4e45:33ad with SMTP id
 e4-20020a92de44000000b003654e4533admr935892ilr.1.1710408341845; Thu, 14 Mar
 2024 02:25:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJbxNHe3EJ88ABB1aZ8bYZq=a36F0TFST1Fqu4fkugvyU_fjhw@mail.gmail.com>
 <ZensTNC72DJeaYMo@swahl-home.5wahls.com> <CAJbxNHfPHpbzRwfuFw6j7SxR1OsgBH2VJFPnchBHTtRueJna4A@mail.gmail.com>
 <ZfBxIykq3LwPq34M@swahl-home.5wahls.com> <42e3e931-2883-4faf-8a15-2d7660120381@pavinjoseph.com>
 <ZfDQ3j6lOf9xgC04@swahl-home.5wahls.com> <87cyryxr6w.fsf@email.froward.int.ebiederm.org>
 <ZfHRsL4XYrBQctdu@swahl-home.5wahls.com>
In-Reply-To: <ZfHRsL4XYrBQctdu@swahl-home.5wahls.com>
From: Dave Young <dyoung@redhat.com>
Date: Thu, 14 Mar 2024 17:25:52 +0800
Message-ID: <CALu+AoSZhUm_JuHf-KuhoQp-S31XFE=GfKUe6jR8MuPy4oQiFw@mail.gmail.com>
Subject: Re: [REGRESSION] kexec does firmware reboot in kernel v6.7.6
To: Steve Wahl <steve.wahl@hpe.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Pavin Joseph <me@pavinjoseph.com>, 
	Simon Horman <horms@verge.net.au>, kexec@lists.infradead.org, 
	Eric Hagberg <ehagberg@gmail.com>, dave.hansen@linux.intel.com, 
	regressions@lists.linux.dev, stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Mar 2024 at 00:18, Steve Wahl <steve.wahl@hpe.com> wrote:
>
> On Wed, Mar 13, 2024 at 07:16:23AM -0500, Eric W. Biederman wrote:
> >
> > Kexec happens on identity mapped page tables.
> >
> > The files of interest are machine_kexec_64.c and relocate_kernel_64.S
> >
> > I suspect either the building of the identity mappged page table in
> > machine_kexec_prepare, or the switching to the page table in
> > identity_mapped in relocate_kernel_64.S is where something goes wrong.
> >
> > Probably in kernel_ident_mapping_init as that code is directly used
> > to build the identity mapped page tables.
> >
> > Hmm.
> >
> > Your change is commit d794734c9bbf ("x86/mm/ident_map: Use gbpages only
> > where full GB page should be mapped.")
>
> Yeah, sorry, I accidentally used the stable cherry-pick commit id that
> Pavin Joseph found with his bisect results.
>
> > Given the simplicity of that change itself my guess is that somewhere in
> > the first 1Gb there are pages that needed to be mapped like the idt at 0
> > that are not getting mapped.
>
> ...
>
> > It might be worth setting up early printk on some of these systems
> > and seeing if the failure is in early boot up of the new kernel (that is
> > using kexec supplied identity mapped pages) rather than in kexec per-se.
> >
> > But that is just my guess at the moment.
>
> Thanks for the input.  I was thinking in terms of running out of
> memory somewhere because we're using more page table entries than we
> used to.  But you've got me thinking that maybe some necessary region
> is not explicitly requested to be placed in the identity map, but is
> by luck included in the rounding errors when we use gbpages.

Yes, it is possible. Here is an example case:
http://lists.infradead.org/pipermail/kexec/2023-June/027301.html
Final change was to avoid doing AMD things on Intel platform, but the
mapping code is still not fixed in a good way.

>
> At any rate, since I am still unable to reproduce this for myself, I
> am going to contact Pavin Joseph off-list and see if he's willing to
> do a few debugging kernel steps for me and send me the results, to see
> if I can get this figured out.  (I believe trimming the CC list and/or
> going private is usually frowned upon for the LKML, but I think this
> is appropriate as it only adds noise for the rest.  Let me know if I'm
> wrong.)
>
> Thank you.
>
> --> Steve Wahl
>
> --
> Steve Wahl, Hewlett Packard Enterprise
>
> _______________________________________________
> kexec mailing list
> kexec@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kexec
>

