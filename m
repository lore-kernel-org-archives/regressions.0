Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DE537CD23
	for <regressions@lists.linux.dev>; Tue, 28 Apr 2026 21:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777410331; cv=pass; b=LNTjqQ7v9xa/o5MwM4Ypc+xjDDJCyYmdLmsz4ygLd3S5uRgL5vBYGjEy3FhyHw42PgEslNlOAgrtYiqURHANTEVAty8lbVhvb7C/LiyrM6+jFUAk74QnGOj2s78V/f+VPKMSF9w2SBapUExGVX0L47vpg8gezL7U2a2mmR4/0Gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777410331; c=relaxed/simple;
	bh=1yuXwi+NqO9qPAU8oODt9J+EEmGmc1IBnbpHbe4Kmn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S10ydVG9NWKiE2nAgFx2DobWSYSxnyQmJB+Y4KcFqTj8XM2IPROMtGdC0FDlk3IEU2UzK7pHP/KEFLi3v9Tt19FXKkFDLN1kZrau77RFR1CNyqs/ZwnFOOuyR6S6uRA6FMKcbO29XfS3Rxms0AJSgcaWll9AVHZRA23U0Wkkn1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXj3KK/s; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXj3KK/s"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6729c6f0ca7so14566879a12.0
        for <regressions@lists.linux.dev>; Tue, 28 Apr 2026 14:05:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777410328; cv=none;
        d=google.com; s=arc-20240605;
        b=Nx57faFZU1VvwR1VuD2SQyjcnWSZ+2Km1m+6ujjt2Ki5JmrVm3Ht0BdlwsUP5hv3U3
         sTFuHO7Wowr43aOs1CXLsNTxlgtkmc8c6SiRXXZ8DN6FbPJjlSM60bYHAtjXJpvSVNpM
         I/UUfChoyqE4+NIhvDiuRdEJO+M7oKYhbmeuXriY3iuKIxjjcx/7ua20W9VvATvBqeZu
         B5Sgc9mfrlwDLNTnXxHdpbOBcDrvAfBD/ptO9mbKFoCeFb+XW2E0A7n9jsycrN+ntCQt
         SLDCekaKgBFuPyJ4CcNsTM+3ihRn7yTwg4buPnJVKgj7+5dqS40Pdinu809ICX+P/40c
         Wgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MYqCNgCYe/2QmSmAUXHuU+yjG/QUozFu1M4rpW5vIC8=;
        fh=7Id7wCJe1bPBH8iOViIqtaZbewXQPZIHLGn4yPkSzMw=;
        b=XvtaQVw10g6AvSfXjKzvUiKgxve3Wo+8hxRTVITLEaE44ASc2Tw643OSpBz+oF8OC5
         8ISx0vLBUHn/hkh+nA4qvra6BGQ/LRx6T7Ay6csdDpIeAkimUwkUQ0ku2j8nTDWInQfv
         zYSD7iyHjR+mjXCunqoQR2Zu5mLlMArxEl/kqdEF+m2G5IuamSqyWQArCB28G/ieIEnu
         7PRcW1e4jfz+1R8c9FMkh5zgDs/GK+8cdjR7X5fK74y29wo+buVJd9p+i6G7OB3EONzN
         rSSWCaxxAt/ZK7Xz49iKbpLBny2XWn2YaxZJJL3bl+v9Y3LAeYBrBRbBHEDUt1PmXjAy
         W+jQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777410328; x=1778015128; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYqCNgCYe/2QmSmAUXHuU+yjG/QUozFu1M4rpW5vIC8=;
        b=DXj3KK/sgS4lcmME+bBZ5KPOqYyPbhO+f8DnCk0ak9HZnuRgs0eu5wjjP37GOf5Tz/
         2yq+kpr5x8Dw1lhyK+CSdeWNTcvlh/AtZhmg4GGsBAfsUTsb5B1NHH/Wa89/JHCgHWw/
         eZTXlSda7nu+Zj8djZgc8jSgNXawZPFAdGGhCuXRBZjNSOUrthxpe+Csz6+TImirSoiW
         h7Wve3Yzx2aeYK/5RXk1zeD6lqoo83Zb8BwEWKaT16ZvBcHIO6uonk84c3O4TgManbaL
         K53IAnYnTz3mHzLkQQnpfmCopWPrLzpcAIEFJ4x61HWGK6GolnUdt0eqrLatdV86znbA
         po+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777410328; x=1778015128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MYqCNgCYe/2QmSmAUXHuU+yjG/QUozFu1M4rpW5vIC8=;
        b=RPZSMVlnzr4KyC0TiijzSzI5tGtMQx7/+8gUm8RWMxYyc9W6KyeCrsKSIpqG3XBwsV
         aY3juyCUNJ8YWsnRsp0HzKujp+EEXHTlig/aKwvXmfX1zU5+1Hyb0c+uJCGxxJ8QN40G
         LJUhDXj6vV4L7imu/9NjxzO8fvrH5AZKUd1EHDJwNKQ0yFO5a0CxD3hE5ct0DHGMWauW
         3o7ZspOK4y1ECDcCp2x1BOylRUeLei0X6rACnRYr96VGM1IQSsZoyAzYEF7jBTnREnYb
         vE/S63/cpxa3NIdzCWmJeEDSzSxk3A8DXZV5RBqM2j80cZwAC2JlE99qdUx4koftJzj7
         XLkQ==
X-Gm-Message-State: AOJu0YxzIgdw+b04dVoIcZdcH0DWIVNibwcKyIeCKRXcJCev+lsMH5Se
	/KJpAOkVgUzUq5+ArCkXrNA9OjAagjB2d1Bn54Vrd0LZSSqUGXvNpFx3LKXku5HM0Fout1vHHH8
	AkRplQeVD4OPTU2rec6i8qR3Nlj94d7c=
X-Gm-Gg: AeBDiev31HCS8vk2tiLBBsz3yimPb4gxg2yWJ/xQVBZ4vRQJBO3164eKrQmEvidoO55
	XiddYMJTS7bZzVAdX5NnOwt7qqG6+edXakNg4RJzSi3b7Y0Daa7xahlm/C1/lnXFpJwjI3mZirw
	eGv69YwASqa2huWGB/o66t2IuLWwhAvd+nSAU4EICj4UoV4fMjkwwi/IBJcf4NDZKfq/O4a/YSy
	g1twLUfuFlEuGjAQj9VaTHPZ5fLj7q7TcvGISY7rvVjfyl/zPX//epe8axXYABToWc+QQe8lAgr
	uanxm24ppwHBkVCyZiQ/7usj6g83
X-Received: by 2002:a17:906:4785:b0:baa:77ac:97a with SMTP id
 a640c23a62f3a-bb93e655b30mr56610966b.36.1777410327474; Tue, 28 Apr 2026
 14:05:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <12879883.O9o76ZdvQC@rafael.j.wysocki> <6281827.lOV4Wx5bFT@rafael.j.wysocki>
 <CAGAxtY1VBXN_6xY0WiraJt-BQiYp_kSdTt8xbPkgP8xPB26=WQ@mail.gmail.com> <12904177.O9o76ZdvQC@rafael.j.wysocki>
In-Reply-To: <12904177.O9o76ZdvQC@rafael.j.wysocki>
From: Evgeny Sagatov <evgeny.sagatov@gmail.com>
Date: Wed, 29 Apr 2026 00:05:14 +0300
X-Gm-Features: AVHnY4Ki0QIR34i68-Z6MwECjgIbd1TRovLm9MfERd7YAUb8T7QA0bS1UzvhZ1o
Message-ID: <CAGAxtY2SEkx7OgMgM5ypA8qsBN0h6pcs111VjnhD-5ZGq7Je6Q@mail.gmail.com>
Subject: Re: Pressing the power button causes the device to freeze completely
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: regressions@lists.linux.dev, linux-acpi@vger.kernel.org, 
	Thorsten Leemhuis <regressions@leemhuis.info>, LKML <linux-kernel@vger.kernel.org>, 
	Wysocki Rafael J <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The PC also froze with this patch when I pressed the power button.

=D0=B2=D1=82, 28 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 22:58, Raf=
ael J. Wysocki <rafael@kernel.org>:
>
> On Tuesday, April 28, 2026 9:11:34 PM CEST Evgeny Sagatov wrote:
> > Yes, the PC froze when I pressed the power button.
>
> Well, in that case, let's try to serialize all accesses to I/O ports
> used in the ACPI code.
>
> The patch below replaces the previous one, please give it a go.
>
> ---
>  drivers/acpi/osl.c             |    6 ++++++
>  drivers/cpufreq/acpi-cpufreq.c |    4 +++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> --- a/drivers/acpi/osl.c
> +++ b/drivers/acpi/osl.c
> @@ -664,6 +664,8 @@ u64 acpi_os_get_timer(void)
>                 (ACPI_100NSEC_PER_SEC / HZ);
>  }
>
> +static DEFINE_RAW_SPINLOCK(acpi_os_port_lock);
> +
>  acpi_status acpi_os_read_port(acpi_io_address port, u32 *value, u32 widt=
h)
>  {
>         u32 dummy;
> @@ -682,6 +684,8 @@ acpi_status acpi_os_read_port(acpi_io_ad
>         else
>                 value =3D &dummy;
>
> +       guard(raw_spinlock_irqsave)(&acpi_os_port_lock);
> +
>         if (width <=3D 8) {
>                 *value =3D inb(port);
>         } else if (width <=3D 16) {
> @@ -703,6 +707,8 @@ acpi_status acpi_os_write_port(acpi_io_a
>         if (!IS_ENABLED(CONFIG_HAS_IOPORT))
>                 return AE_NOT_IMPLEMENTED;
>
> +       guard(raw_spinlock_irqsave)(&acpi_os_port_lock);
> +
>         if (width <=3D 8) {
>                 outb(value, port);
>         } else if (width <=3D 16) {
> --- a/drivers/cpufreq/acpi-cpufreq.c
> +++ b/drivers/cpufreq/acpi-cpufreq.c
> @@ -913,7 +913,9 @@ static int acpi_cpufreq_cpu_init(struct
>         data->resume =3D 1;
>
>         policy->fast_switch_possible =3D !acpi_pstate_strict &&
> -               !(policy_is_shared(policy) && policy->shared_type !=3D CP=
UFREQ_SHARED_TYPE_ANY);
> +               (!policy_is_shared(policy) ||
> +                policy->shared_type =3D=3D CPUFREQ_SHARED_TYPE_ANY) &&
> +               perf->control_register.space_id !=3D ACPI_ADR_SPACE_SYSTE=
M_IO;
>
>         if (perf->states[0].core_frequency * 1000 !=3D freq_table[0].freq=
uency)
>                 pr_warn(FW_WARN "P-state 0 is not max freq\n");
>
>
>
