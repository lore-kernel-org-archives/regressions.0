Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DF4186294
	for <regressions@lists.linux.dev>; Tue, 21 Jan 2025 05:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737436825; cv=none; b=o8K+xNdoLzoSNcsjNRAvWbRqqcAUb1TTE459Az4YWOR5hHDg2nH9JxXrvXZE1ggFkRDeK+95m2cMOBci8cZU3DmOgsVKt73TkHGiuZnIKOdnNJUAmrLDCkXLOcbGdzszbsuQqjIPW8Ue+l+oULSBwhFnWjbKfNTPYjxXn+mRrto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737436825; c=relaxed/simple;
	bh=eKOK2EO91ur0UC7MMxZ4derhiPJDvIpQSa4AutwErLQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cKYAvlFqaFDoR1gOCCqdlhG5OFgCLHYnsK/aLAVrSYCL3ueD+OfHXi5Nq5rCHeQmeuw5++gtzyni/FecY3vE03Wg8oxerA4rX93fKJZe+Z9V5k4rx3ifXk/Kq4fPz+H7PBO3xhZbJMPZHo00ZtwT7BaZYEup2CKdiEurvOfdPu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kx1iq2KC; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kx1iq2KC"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ee46851b5eso6973770a91.1
        for <regressions@lists.linux.dev>; Mon, 20 Jan 2025 21:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737436824; x=1738041624; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IECYlM40D+zruDOMOUzD+1MoRjtsBCDwEaB3RwH3myQ=;
        b=kx1iq2KCtazc520XroqFuJbMB8un4s7WtRh+2u2fNOx6d1oJBTYKDynrzE87sC2NwM
         m4MzZxfwxMbalH3A4x0GXxH2uRLeFsxpNRfunt0DDOoUNVsaWZ7RkPwh2GfyyyeLZFGv
         s8OUnalmV0xeCTYT2gg47T/gF0iyhatblc87WhNMZNZ8lHeeLCRdPPloN4I7Ru+5JiBn
         IDyFPCRCSgc/PmepmMs2CRvrk+PQqgqGHGXJLH4ZatyyZ3pXolQmGne4Ay3FbolZo5av
         sFwbBtkO9ZLLvK65cbnSZ1zCn3YmGGa/eJpiwx+ncavw9LH7b9BDAuNJihQ9xWgOaD2L
         RU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737436824; x=1738041624;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IECYlM40D+zruDOMOUzD+1MoRjtsBCDwEaB3RwH3myQ=;
        b=DYrpZw9Epz2qayiKnUcyEjpjj/GSj5T4qlvw97EH4D653M0GkL1pAaW8tqtVEDcJqh
         Ban0Q2MhYm7k5QZ5lh4KmJFdwGjJKMrCeLT2SQOqq2sIO+LtAkWgK0A7HqFOrZRK/rFI
         3sgyr6C9xrDqW0dbo4ZUDZMIEeQcRBB32b1rjjlx1wZYXd+oYSRuKv8Llo9XBAdvMFFl
         hfR8xWaffK3RX6bVRgHKMVSGzVc2EW5VI5/nGNAJPdTDbbvWrhAojvehqPTYvA+K66yN
         G1qswo/4QaRLEwtfl8NAgw6dItxhXf+BH1TfVCwmwks4jTfDNoNczG0eGiIi3MZXITCO
         ahWg==
X-Forwarded-Encrypted: i=1; AJvYcCXptyOKznKN4p2qqKivLUicXUofEw0Gts+xFBBMACfDCr597QXjdlft3PSBUm6ZcWHeb5jlJ96ajVWbkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIJkDSaLUuKJczBCsU2QKsR1/cR9X/9QGYBXI92igN7lxruiYr
	O2B1m1p3QZNg3u+QBp/2rNGivWGASCnJvQwOgnZGw8fm4beUwd51
X-Gm-Gg: ASbGnctzxu5XWb4iWP3Zk5dGudUSmQsD2UylIibDM9BhLVWd78LgXJO6GZrP+xBrV/9
	G8yqOra9idcOwslY4SgsTKOnQQpnHwsG1I9teXUTTLCqtMHBM/0KjtRvhFQ920KwYwPiTK/tpIz
	ejXA7Na3WNMZpRGZ9brbabdH8W3xGiwKaeVSx+fJg1G58F/XM/8Ehr6oFzj2xJAN9yAptPfuztT
	3+lS9wXr696Hhck8xghOY9Q/K9/eQ3YwTYMUZDEeuppW2Y82hg7ISswOV0sIDb8
X-Google-Smtp-Source: AGHT+IGa3qnJZ7ymaxLp0C027bTDyMwNmCEpA39KybaLiQC4CMLlAIO95Bkd2Ge8d/PPw9qHJOVgMQ==
X-Received: by 2002:a17:90b:3503:b0:2ee:9d65:65a7 with SMTP id 98e67ed59e1d1-2f782d7ff77mr21978137a91.29.1737436823682;
        Mon, 20 Jan 2025 21:20:23 -0800 (PST)
Received: from localhost ([138.44.251.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c2bb332sm13067266a91.36.2025.01.20.21.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 21:20:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jan 2025 15:20:17 +1000
Message-Id: <D77HY793RN09.1HTCXBIUXFKSI@gmail.com>
Cc: <seanjc@google.com>, <linuxppc-dev@lists.ozlabs.org>,
 <regressions@lists.linux.dev>, "Christian Zigotzky"
 <chzigotzky@xenosoft.de>, <stable@vger.kernel.org>
Subject: Re: [PATCH 1/5] KVM: e500: always restore irqs
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Paolo Bonzini" <pbonzini@redhat.com>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>
X-Mailer: aerc 0.19.0
References: <20250112095527.434998-1-pbonzini@redhat.com>
 <20250112095527.434998-2-pbonzini@redhat.com>
In-Reply-To: <20250112095527.434998-2-pbonzini@redhat.com>

On Sun Jan 12, 2025 at 7:55 PM AEST, Paolo Bonzini wrote:
> If find_linux_pte fails, IRQs will not be restored.  This is unlikely
> to happen in practice since it would have been reported as hanging
> hosts, but it should of course be fixed anyway.
>
> Cc: stable@vger.kernel.org
> Reported-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/kvm/e500_mmu_host.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu=
_host.c
> index e5a145b578a4..6824e8139801 100644
> --- a/arch/powerpc/kvm/e500_mmu_host.c
> +++ b/arch/powerpc/kvm/e500_mmu_host.c
> @@ -479,7 +479,6 @@ static inline int kvmppc_e500_shadow_map(struct kvmpp=
c_vcpu_e500 *vcpu_e500,
>  		if (pte_present(pte)) {
>  			wimg =3D (pte_val(pte) >> PTE_WIMGE_SHIFT) &
>  				MAS2_WIMGE_MASK;
> -			local_irq_restore(flags);
>  		} else {
>  			local_irq_restore(flags);
>  			pr_err_ratelimited("%s: pte not present: gfn %lx,pfn %lx\n",
> @@ -488,8 +487,9 @@ static inline int kvmppc_e500_shadow_map(struct kvmpp=
c_vcpu_e500 *vcpu_e500,
>  			goto out;
>  		}
>  	}
> +	local_irq_restore(flags);
> +
>  	writable =3D kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
> -
>  	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
>  				ref, gvaddr, stlbe);
> =20

