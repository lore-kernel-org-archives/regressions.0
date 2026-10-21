Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792546751;
	b=MrR+tk7P9Yh6Cv8eqVTh6H8WIo/CgjNCe8MSxbsAnobqnp9oV+4DMOeii89CCu3emfXw
	 r6Ut4p8LeTqAkJO/VPjI6EWFyeRMyyP7MznEpAQ/ufBzxhMIBsT4ejYtU7LGJXVnOREZ7
	 HmHFTSR9RAZ7VFk03e7r/88j7EgcLsib02vr4uWXDRIFNPsMxuhDKbarq3KOhiDXv4ThF
	 o4EKFYm98jHNxRDCnmTz5eDE+FrZfaGxy6KL4QQ9DkIsfY2Pst41Agg+sV6Pa19TtT+5Y
	 oNDtKappjTEGl1GhOxhfpiJz16DfDRz6uJKDDLFDxCCuLyHZQjPDFiEtJQb/flLgELQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792546751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WSiF9ZRHxfVHL6+d7Plpelwg9wUAXFen0DqgWRBIyYw=;
	b=xQPIIBqYhC+oSMClIrtvlLsCqIPEVsrYbVXCDGMBhP2GvLdtZXARzdPhc0i+4f3OKGkj
	 F8boGThCCGpleaZWbOx//0byRZO3z7n1sO/yF8a3UvJDvf0tyNMPWpD+Dpu8X5q/hZx32
	 ka0DpQSoU5+LfPQeLA0Fjp3/6b2c7lypcoJTlyXqX1PlVi5Qmj/LVQl7agymjGfOEdWUn
	 VooV79/RB1dzkFFsApWgkkUvsrMYdMdCj04nvnBujGCHXbUc5ZNBFRoVR+Dos0snbGxgq
	 qTNbCJFkxGyjknKbnD/xEhzRPih27mgllhiF0t3FYIwC3/yCAxAHomcXnlh94RVIbxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rKgto0vC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5BC606A319
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 01:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E5BC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rKgto0vC
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so187510241.3
        for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 18:39:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792546750; cv=none;
        d=google.com; s=arc-20260327;
        b=F593kcd/vRFcHwJRDIkUGFntv02vnouHu23e8Y6xVtt4oqGgUzqpt8oKTrF6397cnk
         a94y4ppUE+tSJqxgE1hfZyha9kE0+Ssz3LZGSRBhpovUhGUgyREj0dPIsJdZoj/BF3YA
         eDP4eaS1R7ODSfh5S6PhJLyxu/o7EpsbThGh5pUvliJiiYKrNfrcbWPjPEJUY31Cl5Fl
         39A7GdMrIPa/NQgnGPEby4ZuTZQzj7pMu65doUssZNw9S/F2egahDb7anlpBvJCIdqWg
         9EDO/4YBiUFatK+hxOVahL1r5Nf/PwzBXIrU8qHfIReHV/US5tgEAV3WSfkiCEoQjQVU
         YHEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WSiF9ZRHxfVHL6+d7Plpelwg9wUAXFen0DqgWRBIyYw=;
        fh=evJH44fUWGILn8rUFokS4V+rXZs01lb8AHULSoJkM/4=;
        b=pj0oRbT2uYopgY0FBKY055273S59aR0Prvjsu9sXb0GY9I7RLQR4f4v2TUc1hB222B
         b+410P1LdoQ0EGOuA/ecROsWqN4SSSZ3wjvMm/oqJLH2ZdLRrB+eL1/KlAfz5evXuLVY
         PyEPLFwBjhxkrTdIevcf/Ej5P8QMJkOjTs9QHZr00csW7L5B63R/M+LWtucNbd0e29ft
         zUMMXBORGZ1W2DbWNrViantP2dkQEPAJa7H5hagIAYwLZXweP/C3HhXHzJoPHRbnK4h1
         /JhTqjBTL5wc4efwKGtV3tfeYN/ZLQVsG13Bd1Esk0P5LmULhWfPzyDobDoEea1P9LXE
         roiQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792546750; x=1793151550; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WSiF9ZRHxfVHL6+d7Plpelwg9wUAXFen0DqgWRBIyYw=;
        b=rKgto0vCQs8BkEAZsAKXkh6eUAjNxtQ++CJNd+ddvCZ4vfylYvevYUofi+GsC2Xvod
         i4N44z3j0OOISZ6kUtxB1gx6ct9+LWbl3z/SXrNIybX4d4d/3gDutzy/EIKtWPFN/Ja9
         mppAGyqdIaJLS9VJbpd0ypgwYRhrYY932zwzXuZORmHp+6r/W541vH499lPwbaFOzz2K
         yppRKxVNn25Ba2GINZUPCCjL1MTEBYqlAHmx46wvksLqnyazxKNI8UgqlHm8N94Q9jdQ
         hQTJJDpZvg2z7SJZn3ogOJdFwgY9cPcbBnj1hwA8+BVSBhk61BeYinRXGa1a+Q/tIcn4
         AECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792546750; x=1793151550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WSiF9ZRHxfVHL6+d7Plpelwg9wUAXFen0DqgWRBIyYw=;
        b=eYxLQW8PaBtivGn71iHGxu01pL2iMqa7EB+YB6a0PZZ8Az7LUfC6GZktvKb0tkxIfh
         LhCKwjBLMChy2Gj1F/jgINEhyKXvUu4bGhOyt3Uz616R4s0MxPVmg09bFUgpnid/iQ1K
         odGDstMilrMUGG+wSZUXu+OA/aH+GA+wDe5dJf2XA4Z4M1J10lvfMLBUnsX1NX48exJg
         vRKPPs4YFSEkBCRT93KUMI/bW2UB+kJLZOKlsupyx+8P8eaWD90jKsJuxQhglEcRR1u6
         yHVcduqndYijgIDkU5CrBxMBLugizwCHqF7e4D9/6JQwYWcYPUbqebexRblS8wMQH0t3
         4V9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxBvUJ5YLwKY3pARxCeBphHzBhw+KYKYU5F+z14+tv/29HutI/JdNFREg6jBelI+CZbBzYHMrmtHTuTyg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLBNjnNAq1m3kxuFli+P/TTe6710kDWXsp/Ue2H8n+I9yH9kQND
	PCeTE2O0cRMZkw6lDvu3R4QawtG5RO+cEEDXVR45fMn47zj3Dj/Yrji0la/6Z/8YeAGHzbJUfUC
	Co1Js6sWBaXUmvFhwCFp095S15RbP3Qo=
X-Gm-Gg: AYBFou0QGT42Z6fN0DWdpuLx2e952AYbFdCypeRIM4r69iCXahTmK7B08+VpaYNiXXk
	p721YwrqScE/yuKFeBBoEkhq0gox4IVkUjF8THg/0B8zdm7t/o2GhvIVQ4DOz4jzzKuyNY2lgj6
	uB/v/vI8u4T7SVGnMWr8oa1a6cPe+AfUuP7AbMglG2kHs3qEoZLmogQcZvsX4kCB6Il/vE1ESH6
	nFlW65DRvqhKvbdOl3jk7VBkpL08nl6NHxXWV0wDidY9GadhADRJiuKnVI1UNrGigw+N98KxjoJ
	zF7EYEudgzWTJFsFEC7OxIYBa8M7FwF5D9OpoZ6cp6wEWH6LAC6ybP2J1o8yFeRTJ25AxkMxD4w
	ufPNLXm5SeEbL+BxawSvUYVE2qxhAeW8Ise7yqDuCFt8feVhBEdc6+wgTjr29PaSO5KK4cZnE+G
	ZCK+OcSgwj+/3n
X-Received: by 2002:a05:6102:6898:b0:7bb:c382:2ff4 with SMTP id
 ada2fe7eead31-7cc926d09femr331804137.20.1792546750177; Tue, 20 Oct 2026
 18:39:10 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAO+rqLhpPvY0NLrAnZjFXz0gOXnA6zsXxK8xCgtA42XUkSsAeg@mail.gmail.com>
 <CAKYAXd9Otv_doQutE+gzKJ+Pp9Wi5mjCZpFdfobGJER5=hM4JA@mail.gmail.com>
In-Reply-To: <CAKYAXd9Otv_doQutE+gzKJ+Pp9Wi5mjCZpFdfobGJER5=hM4JA@mail.gmail.com>
From: mixalhs <mike.michalo@gmail.com>
Date: Wed, 21 Oct 2026 03:38:58 +0200
X-Gm-Features: AclHuK9RyFq7y8v2hFeW-t-2ocUmNLTtLtkJyT_1QOMCWXh_VqahldxvXMOXKCU
Message-ID: <CAO+rqLj3Cnhe6b1eF2OQ=ZSw4=WTiMDdfjvFPpMJycY1dqOmGA@mail.gmail.com>
Subject: Re: ksmbd: Kerberos login fails on 7.3 with released ksmbd-tools
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yup, will do.
WIll figure out how to make them both work for the least pain and send
the patch.

Thanks,
Michalis

On Wed, Oct 21, 2026 at 3:31=E2=80=AFAM Namjae Jeon <linkinjeon@kernel.org>=
 wrote:
>
> On Wed, Oct 21, 2026 at 9:39=E2=80=AFAM mixalhs <mike.michalo@gmail.com> =
wrote:
> >
> > Hi Namjae,
> >
> > Kerberos session setup fails on 7.3 with the latest released
> > ksmbd-tools (3.5.7), and ksmbd-tools master fails the same way on 7.2.
> >
> > struct ksmbd_spnego_authen_response gained a __u64 session_expiry field
> > before payload[] in 7.3 (commit a47634cd729b, not in 7.2), making it
> > 168 bytes; in ksmbd-tools 3.5.7 it is still 156 bytes.  ksmbd-tools
> > only gained the field on master on Oct 18 (4c0ca83), after 3.5.7, and
> > always sends the new layout.  ipc_validate_msg() requires
> > msg_sz =3D=3D sizeof(*resp) + session_key_len + spnego_blob_len, so any
> > mismatch is dropped.
> >
> > Tested with a local MIT KDC and smbclient --use-kerberos=3Drequired, sa=
me
> > realm and user throughout:
> >
> >                     ksmbd-tools 3.5.7    ksmbd-tools master
> >   7.2 (mainline)    login OK             NT_STATUS_INVALID_PARAMETER
> >   7.3 (ksmbd-next)  NT_STATUS_LOGON_FAILURE   login OK
> >
> > In both failing cases ksmbd.mountd logs "Authenticated user `testuser'"
> > and the kernel logs "SPNEGO_AUTHEN_REQUEST failure".  NTLM logins are
> > not affected.
> >
> > From the code, 6.6.y, 6.12.y and 6.18.y also require the old 156-byte
> > size, so a ksmbd-tools release built from master would break Kerberos
> > there as well (only 7.2 tested).
> >
> > Would you like the kernel to accept the old response size again, with
> > ksmbd-tools sending the new layout only to kernels that support it?
> > I'd be more tan happy to write and test the kernel side. :)
> Thanks for the report and testing. The approach sounds good. Please
> send the patch for this issue. Could you also update ksmbd-tools ?
> Thanks!
