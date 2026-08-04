Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F26F46EC66
	for <regressions@lists.linux.dev>; Tue,  4 Aug 2026 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785855501; cv=pass; b=nbjK+QqTU3XOeUDH2U4K1AwWdyqsbozTLC27iTYIj0yGM2tyT7SZw8Z7nwVsJUIROHSYiqRadX91IQqwxkwKj+KEt5BZEdXg3k1OA7hcfm22Hg0kyysvX+4TxdxmfBeoQdDYYSPE5Goe4mJ9shh0y/fpWPdVEPHL00XaOQMj85k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785855501; c=relaxed/simple;
	bh=sqpxW+936twxLe3WmzLdq8tvXCx4QLWmRhhPEOQUQvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ttfgi9cdjlrBZ5ADUqC+ALSKsEw2BOTfPzTkUPDmP7TOjWgrGAsFb5Pgz0vt5+/m4suZxPkNmZe97+5YnTRJ3BXkli7J5P1ZYEZu9JW/1fcYKtsSfywPwiTNRdzqNMOldXEMwRJGIcU+CUww9p1OlPelE3oPpisXEIaOYaSsKcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGXT1DbI; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGXT1DbI"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso5722247a91.2
        for <regressions@lists.linux.dev>; Tue, 04 Aug 2026 07:58:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785855485; cv=none;
        d=google.com; s=arc-20260327;
        b=dAuZUDvkgLEkaLim4IdsioHiK8dbLx8yEclCwpqxQbAGOofEZ1NkLksIiKzxSUcpN6
         tr7xZe0FYAuBMdF3j5BPhy/hiaZX6pNzgtjaPYS3GPBhTA0yDpC0J0VdMwNa62eFHBmw
         1gBTNnjp4VzA+AQEXx/GGJLOZYxtUhUvGmT6gJfhMyvwlhEVvbRcttw2He2qt5JkCWuf
         s1poEhVURdkGROdVoEyUFbIiWt4Zi3p2iUBsZbOQouaTGsFAAjy/xOEkkNpwA6q+fn7y
         Jg8i0Kc2MEfUxwYm0uyn8kHRdzPQjEMLFw8Bg7Lim6CuvTC7eLKqJTErssmzml3NihIe
         ft1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZXmm83TGVs8V0++ogZvMrKHltLz+j+PoXOcZxjRNY7o=;
        fh=klqQKFK91K6jHJ29VadGmembNkwoDCWcRBD0Nzapcak=;
        b=iBQWdcZIZrDJlz67jxpcFVpBhfpGAGP83UD92gZoJr5EANwYAy5RxvTWJWDicdrP4D
         mmK+D2nD0+AtUr+kGQRnqnUYLRsF+A5r4BmaS6Pac/E24nT6cY4GJn+gf9YkWE8uwZGi
         FxokMn0qyx0ftqGQnFhP9w9t1gVAN+WwPPJX5/xyWR71M1t+OBKVqI7Nnoq8ulmIK2uB
         7TCYM/Yk4HjMto1ZmXPElQztHo6E4BsE5kb9sK+m/IFjaLKx6V0I9bQmPopcd5d1H9uI
         UGW18axxrHpEM72jTjjRnKbJ4lqcmNyLBEB6rxYADjYDWSwMgudjdUO9jUGL76ck10JE
         2XFg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785855485; x=1786460285; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXmm83TGVs8V0++ogZvMrKHltLz+j+PoXOcZxjRNY7o=;
        b=VGXT1DbIhe5NytBAg/0Z4Z6d+1zkAuQl0REmL0kDnesAQ9Gtt0eLI/oIJFxPykFyR5
         LVmFvEg6llogs3/Vs8Sj7GHGmyuSc3kVZu/8o4HkIuleB7bJsvFwImYjOJHULbNLIRX3
         aXMZRxIXCZuBL59r0300PCPT/jdX9Qi6wszJ+Gum5qkipQDr5ooRBgjZgctYu+5Yruuc
         HstOIKP2/MQkCXttt3cUoYGnp6l6zj5KGx+ASSFsoCYs2EfSzOLvMS8FQsfvohYheZDd
         Xq7Z/Q8f/PkYdQ0cSwRt6Q7NiRZYpjlCGqdrhFr0nYBBhWHdG5NHAwZowWkZH6ZKzsA2
         fV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785855485; x=1786460285;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXmm83TGVs8V0++ogZvMrKHltLz+j+PoXOcZxjRNY7o=;
        b=l5EJHi0/x0KTgToeaU69YWxtxleO851SXK87nDd5gyxUBra7ZxPBp6ts/r8ZpYkFpw
         2iLW10T9CjyN58OptDK9KtQwRX5w9KE6Zk2nj+c70xKnuqO+n3v4QngAy9ajV6Dc7Tu8
         v+GqBCfgmzMC6bvmwQFagua1k0NoQUOvc9jwrKyBfyNbzwC1AMEgfxbtUHe8a9jX8jrE
         y/awSP7WrLIeXWUDi/iaoE5RBlDz+lEys+1voXPtOH5npn2V5BoT4kNO9558RzouRNXt
         k65xE2bqWg+meL6kkfvBE3Y9TnV+8B/LHcDJl2kQVcjSyFfkXSjSPEDG2I04CXKPL1If
         QHJg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7n0oZ+DzZdeL6m0bh6Xgl7Eij+hYRE/ifPyQIa3Cmgo9j+dHU26MmyEF3/hLCr8FxP1fixxUdBQ4F1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyT7xIppGM94ZZYi/5dIVH9sFE73eKk1o7tuSegu4YcoZbtmA0D
	eQj344oeGZxwj/DYCeHYZ+0IHYikDK2MfDIUgFq1RWDuMg+/Hr5nhnB5aHTsh412k0BJ/I/iYuQ
	3WfmeUCxcHARVk1SE5/Y6DczjeRy+O68=
X-Gm-Gg: AR+sD11s52MUW0pP1kDLS0KwkUfWDoFRANn+8S9cAuy5E0RXqlEEoynWpzMOD4NFgpA
	6+6OlVPnXnLpe6O4ZPmglrCMdTSzkW52fpAk1quMxA5QyVDN8s5GEpK6dnhiddmmtF33BQPBkMo
	pt6FT/fQPT1MssdFYY9L8WbVW6KZ9K8WVy/n+Db5ZvJ3w1qfAaWepSB9uoADK/rs0C+ni9Pbv3r
	N4R+xZSp1ufjPWgY5BcD+GH3gvVAF9RTwXQ1SIS6Ttk0Pq8EOvSlDPit5Mm5c0WlSfG9QfANkuh
	S1UVcy7I90xlhU8xAYcpIkJpdK5+4cx5SpdUEAtzGKieako+xyyeLNvNkYsQZpSHTghPpur+Xwm
	q4CR9aBLIs2u0LtT4muK1Kcs=
X-Received: by 2002:a17:90b:1c86:b0:38d:ef48:b04 with SMTP id
 98e67ed59e1d1-38fbc4249efmr13503882a91.10.1785855484729; Tue, 04 Aug 2026
 07:58:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804140403.16337-1-kfastov@gmail.com> <20260804162924.0268f80a@fedora-21.home>
In-Reply-To: <20260804162924.0268f80a@fedora-21.home>
From: Konstantin Fastov <kfastov@gmail.com>
Date: Tue, 4 Aug 2026 17:57:52 +0300
X-Gm-Features: AUfX_mxmYF7mTsV_kCbKDVkg1SSi2DOX7EMuysDet_SV7d52zqlljQHcxRDaOHk
Message-ID: <CABWhNekebS6dt=Ft+74iG4YpCq-5ZcV1EvvERNxT612VUOC9Ww@mail.gmail.com>
Subject: Re: [PATCH] drm/gem-shmem: Install writable PTEs for write faults
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Boris,

=D0=B2=D1=82, 4 =D0=B0=D0=B2=D0=B3. 2026=E2=80=AF=D0=B3. =D0=B2 17:29, Bori=
s Brezillon <boris.brezillon@collabora.com>:
>
> Hello Konstantin,
>
> On Tue,  4 Aug 2026 17:04:03 +0300
> Konstantin Fastov <kfastov@gmail.com> wrote:
>
> > Since the introduction of dirty tracking, drm_gem_shmem_vm_ops has a
> > .pfn_mkwrite handler.  Its presence makes vma_wants_writenotify() true,
> > so vma_set_page_prot() removes the write bit from vm_page_prot of
> > shared mappings, and the vmf_insert_pfn() call in the fault handler now
> > installs read-only PTEs even when serving a write fault.
> >
> > For regular CPU accesses this is transparent: the retried access faults
> > again on the present read-only PTE, goes through wp_pfn_shared() into
> > .pfn_mkwrite() and the PTE is upgraded to writable.  But consumers that
> > resolve faults through fixup_user_fault() + follow_pfnmap_start()
> > perform no such retry.  In particular KVM's hva_to_pfn_remapped(),
> > after "successfully" handling a write fault, finds a present read-only
> > PTE, treats it as KVM_PFN_ERR_RO_FAULT and fails the vcpu run with
> > EFAULT.  Observed as AsahiLinux/linux#560: muvm/libkrun microVMs
> > mapping virtio-gpu blob resources die with EFAULT on first GPU access.
> > The traced failing sequence:
> >
> >   follow_pfnmap_start()        -> -EINVAL   (no PTE yet)
> >   fixup_user_fault(WRITE)
> >     drm_gem_shmem_fault()
> >       vmf_insert_pfn()         -> NOPAGE    (read-only PTE installed)
> >   fixup_user_fault()           -> 0         (fault "handled")
> >   follow_pfnmap_start()        -> 0, !writable
> >   hva_to_pfn()                 -> KVM_PFN_ERR_RO_FAULT
> >
> > Fix it the same way commit cb2a2a5b37ad ("drm/shmem_helper: Make sure
> > PMD entries get the writeable upgrade") did for the PMD path: when the
> > fault is a write fault, install a writable entry directly and record
> > the write for dirty tracking, instead of relying on a refault that not
> > every fault-resolution path performs.
> >
> > To do that at PTE level, add vmf_insert_pfn_mkwrite(), the VM_PFNMAP
> > counterpart of vmf_insert_mixed_mkwrite(): insert_pfn() already
> > implements the mkwrite semantics, there was just no wrapper exposing it
> > for pfn inserts with the default pgprot.
>
> The same issue is being discussed here [1].
>
> Regards,
>
> Boris
>
> [1]https://lore.kernel.org/dri-devel/20260804120529.1730187-1-pbonzini@re=
dhat.com/

Thanks, I missed that series, I searched dri-devel but not the kvm list.
Paolo's patches 1-2 are indeed the same fix (down to the same function
name), so please consider my patch superseded by his series.

I have a fast reproducer on Apple Silicon (Asahi, muvm microVM, dies in
under a second on stock 7.1.5) and an automated test rig, so I'll run
Paolo's full series on that hardware and follow up with Tested-by in his
thread.

Thanks,
Konstantin
