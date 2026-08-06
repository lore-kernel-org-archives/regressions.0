Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32888437466
	for <regressions@lists.linux.dev>; Thu,  6 Aug 2026 09:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786010108; cv=pass; b=nZq1Ttes0uh8iJTCN+BuSTxkhBfsR3HRIPlcvFVyfuvPvjQYlBJoW84ly36IQsADQLj70P389l6F9fOSnCCZkLJT5uUJ155pRONB+jl1y9t45VadiZ3HQgIk9eBJqI6vQ0ic7a/hhtoMvdBCEUm0X5tc8MPesDpKgZ0U8uB3WxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786010108; c=relaxed/simple;
	bh=KTqd0lpP09EibOiKqFQAK/d7YclsTCvhaaQ0Bd3pIog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=my3uE9bziN3Kk48i44Z9szL++MXlecP3vnIHFOnjh5y7yDQnpfLOdV+rsom1UktA6IDGtQyESQIJlAXwPF+bp8DmuZXmQNfXalgL+ur8KMoSjo1uiv7sONicEVQCJ3Cyfn9b3v4muu4iS2c5WsWbfJt9UErD1mtyVVRGa3raSwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nxU3FKgC; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nxU3FKgC"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-667923d86a7so1434322d50.0
        for <regressions@lists.linux.dev>; Thu, 06 Aug 2026 02:55:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786010106; cv=none;
        d=google.com; s=arc-20260327;
        b=fEClPsdn3SwqVETRD9Yvmg8XevmkBMPe0gxjIvWO+uL9VAQf5uMvzuh/FyxxzVEYjr
         l7YOK8knREgskQibdLVlEMYwZmUO5YetfE3+BA34jdcRRStDqv78GlbvyOGzhAdeSml6
         UqHIxLz2MU2Gdzrnqxtl7Z6UE6osLE5xquXDyHOHV3lVePFkzErh03bQvSlOARGlWbvs
         1/4NjCt6xSp6o+2EY1bWLEgjKuUSjYjYbbQC3oTVheLTYfg4PLAqwS4vgMWbIpQrpfeg
         oFyJE+iECxj2ST3ZE3sUWy0j3RtJunbq2wuU+gEK3Huzw2HkhwsZHIkKup91kMLFvMAy
         sSIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KTqd0lpP09EibOiKqFQAK/d7YclsTCvhaaQ0Bd3pIog=;
        fh=/lGKMAl8wA//+oqnxyF3ydt+34FydtmSuHB8aVJCiok=;
        b=DLq1lTN35I6w7Jf0dwTZf2oEu0tsOVGa8HicV83EjVlAnOqBQVVN/mCgtM8WmtkmL7
         lIimqWECOviG6wvuNAYk+IH59bnZoXtdYL0YmhFuskBWtz28LvsAEdRwmndloeVyN7/2
         z5YnPvJnfKhaIPJtVJWeuNmqX5tUsB/ieWEgM9BGtCNe6mOW3XHN0rTPpZer9YrUvvGM
         fBYX7ludZLiPuZAe/m7s9EEGfaQxpfSG89C96MrUOam8xhdW3YIgmS5t9KzyTx85b4lR
         0Y1OJpH4N21eWbh68DrCauh3A4v9M1WnKVHq+YbSmrDJwErFyQZyZOv1MPkY0jYA5x09
         fb/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786010106; x=1786614906; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KTqd0lpP09EibOiKqFQAK/d7YclsTCvhaaQ0Bd3pIog=;
        b=nxU3FKgC++NbiSaR9rSRu4U2oUrpKNfTdFJmitI4W4bhJ/qsL8VXZFza6GZ5bGH3zR
         4wSDhNziJjyatqoAkHMSHcJFNvED1rcq9b0zu0+DclDpxiCKtTRjQ1Ou1EnbPkKpnWAA
         iOUdrss0ccJjR1xv2TKj42euJh96qzazCsdXFMgSnHhqTI+vqk+kySToGSqemgZRd5O8
         KCnMwshaQjmHTl3DR/M/vcoc06mZlOvS1QX27oGFGr1X8zRmCr3cmWvj6HKsBs7HWI+k
         2G3LF5Mm1C45O5Z4OoPQX/0yq9DKcR8sUjrpXOKAzZd/E/+bRnFzSkNNDVPlzdERG4DO
         DcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786010106; x=1786614906;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTqd0lpP09EibOiKqFQAK/d7YclsTCvhaaQ0Bd3pIog=;
        b=Uv4d0XaT0VbBBzsw+HqYQx5RfhfxrYmg5KpgeIPANZRxI7HrUTMxXR6JgyhQhFYIKY
         yybGeAPuVpbUiT+XDszBsQNHf6qT4HQDG6AS+4Lg5rmZf24O9hzzbMjvzMQNMTkaxZba
         HmvBPWNoEStg236Ig1btL8xlN/i/HV3ZNjE6yDZonIACsLhod2T5Ik0BjcfrAd3fszNd
         I91EGW6unYpIe8zhXzmeZMKhLeRzM7PS9sPrq1PZ0hkPV5IvFWt+tInIEurZPn/8Re59
         1Yf6b45BLorQ9RMHpKbSUvF+k3Vk3uRp+5hJgStWTFN+gvjiAfjo3QU1+nCf9gVDzRnx
         ShaA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/iptE1BnOLXzTGEgt1QwwD578E2IP8Gg9iQc/8WadzH7MxzddoXwLkKAb87GGK/RD96ICgnGKf2KKVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUcAamdMumsphEtwh01eTeTmpZ4QdNht1q3c84KzNYtoudgZs9
	n2xYJJTMbLwTD3nNfxOLf6fxjqr2KrpmMEKWV7qBgCzIeeDW0PrDrW0ISkXMJcA7dCtT2fUms89
	K5OltqYTeSzu+WCFmb/RAoVS9Nm33ThE=
X-Gm-Gg: AR+sD134Dd10W4NV9SiJRAYSwPK1IYhAwGQjr+LjAdA+u2y9yqDec3PUCfpogjfXHik
	rg8+2Jiwj25SWrhw5cb3JZesl2tg8jACkt19kNJtU5Xhcqk1hdv4lXS+KBIH5MgBfDF02szxQGZ
	GWdcUJ/cvnBrhAPPCjst/wj2W+2tvQnVwo5eWo6RJgCnOSyf1N7mG2r5saqf0uAhdtU2hD53UXq
	uvtmdZi7ntKQ+tBNg2u32DauIzMhY28fUaP1Gk1zxYy6SDXFiIU2rKIjCxb1MV8E9rQcFYx9T1+
	xzz3GOexVh6tSLrIBGgit/tv9Vv4F3SkiR5teJ2riSJ7LgnItVM9w2UL5zgtPiFdTA7lt5ObsgV
	JUdXOlA0NBro=
X-Received: by 2002:a05:690e:b8d:b0:667:c8ae:f683 with SMTP id
 956f58d0204a3-66abad23602mr1541113d50.4.1786010105998; Thu, 06 Aug 2026
 02:55:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJOGg3z6LJPDsdPNBxajgy8_wQxfhYBRxe4EiurZf3kPU5A5Bw@mail.gmail.com>
 <f42cc94c-ff60-4999-b473-c2fc5b1b4199@intel.com> <CAJZ5v0j1Tucb0yzS8=3U_X1E4ziztjgOsiYrc_QfUUKZfScCPA@mail.gmail.com>
In-Reply-To: <CAJZ5v0j1Tucb0yzS8=3U_X1E4ziztjgOsiYrc_QfUUKZfScCPA@mail.gmail.com>
From: Julien <julien82453@gmail.com>
Date: Thu, 6 Aug 2026 11:54:54 +0200
X-Gm-Features: AUfX_mxsuSxYb4bRTLw_auynOoK9idt7FQzZIelPKJrVZG-Vnf3CPDnTHMYa3ew
Message-ID: <CAJOGg3zhEFner5pze-eX+6jh5D8nJppyWkNN5bWtg7MZ7cW9_Q@mail.gmail.com>
Subject: Re: [REGRESSION] no TPM device after "tpm_crb: Convert ACPI driver to
 a platform one"
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, regressions@lists.linux.dev, 
	jarkko@kernel.org, linux-integrity@vger.kernel.org, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Please try the attached patch and let me know how it goes.
>
> It applies on top of the current mainline, but it may be adjusted to
> older kernels, so please let me know if you need that.

Thanks. The patch seems to be working. /dev/tpm0 and /dev/tpmrm0 are
back and a command like tpm2_get_random 16 succeeds.

> I think that these messages have been present in the kernel logs for
> quite some time, but previously they were not connected to any
> functional issues.

You are right that the messages were already present before. I see
them in the commit before "tpm_crb: Convert ACPI driver to a platform
one".

Here is what the logs say now:
acpi MSFT0101:00: Adjusting resource [mem 0xfed4000-0xfed40fff] to
[mem 0xfed40040-0xfed4103f]
tpm_crb_acpi MSFT0101:00: [Firmware Bug]: Bad ACPI memory layout

The second message was already there before too.

I'm sorry for sending multiple times the same email. I'm still learning.

On Wed, Aug 5, 2026 at 6:01=E2=80=AFPM Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Tue, Aug 4, 2026 at 9:08=E2=80=AFPM Wysocki, Rafael J
> <rafael.j.wysocki@intel.com> wrote:
> >
> > Hi,
> >
> > On 8/2/2026 2:54 PM, Julien wrote:
> > > Hello,
> > >
> > > Please keep in mind this is my first time reporting a Linux kernel
> > > regression.
> > >
> > > Since commit 48fe2cddc85c ("tpm_crb: Convert ACPI driver to a platfor=
m
> > > one"), my TPM device is no longer available. Both /dev/tpm0 and
> > > /dev/tpmrm0 are missing.
> > >
> > > Log messages:
> > > platform MSFT0101:00: failed to claim resource 1: [mem
> > > 0xfed40000-0xfed40fff]
> > > acpi MSFT0101:00: platform device creation failed: -16
> > >
> > So there's no platform device for the driver to bind to.
> >
> > I think that these messages have been present in the kernel logs for
> > quite some time, but previously they were not connected to any
> > functional issues.
> >
> >
> > > I added some debug logging:
> > > ACPI resourcet[0] =3D [mem 0xfed40040-0xfed4103f flags 0x200]
> > > ACPI resourcet[1] =3D [mem 0xfed40000-0xfed40fff flags 0x200]
> > >
> > > I think the failure happens in kernel/resource.c: __insert_resource()
> > > because of the two memory regions overlapping.
> > >
> > This is quite plausible, but if that's the case, it should be fixable.
> >
> > Let me figure out something.
>
> Please try the attached patch and let me know how it goes.
>
> It applies on top of the current mainline, but it may be adjusted to
> older kernels, so please let me know if you need that.
