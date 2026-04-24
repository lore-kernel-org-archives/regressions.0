Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D9E318ECD
	for <regressions@lists.linux.dev>; Fri, 24 Apr 2026 21:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777065500; cv=pass; b=W12CGAIooAqUuHn5dC92iwizlRoegjV5E4pHIi9HEOFE2+6msCXkgMWypQcnBB+nwwBSAUp6VNSLByGc/GOXzX0UNELOLIy99YrtnVfbX+zxRcmZ1Gmkcog2fU3ExLajl0jPkrtbLQC+mKtFjtBlNT+S8aE50WascvdRpHvmBa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777065500; c=relaxed/simple;
	bh=lz585B6WwMiI2wowDHqw9h6Q9k9rsSJa7Fgv8ysQuAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OfFPw0JbcGe7/EptU5QqKGLTod3+F7cZmTSJXJxzhABq93AAFYTvJx3pfTvENvb0Vl3pPPX0pZKARqqYfIhLRAuuEQ0CbMLr3vB5Je6cMFvYzQY49obv+OT5/Nocoaq/iVor0ePEhpxB+9O9oWaYDCHYh4m9r5b2zylEXKDeWts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nv5ZbtH7; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nv5ZbtH7"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9358bc9c50so1126237266b.1
        for <regressions@lists.linux.dev>; Fri, 24 Apr 2026 14:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777065498; cv=none;
        d=google.com; s=arc-20240605;
        b=ZLby0CUWqE8k7O1e9khHf3I+LDoYDOSokhKzaxqVdIJQyqCFqFjSLLzynEHI54zfQm
         2NJCkVA5cheV4NqmsLGvyfSSYlM4MR6yZErUX3VueQ/2kWnEuLJ526CNi0TRn8TOhJa4
         s8hO1ir7CHOru5BldDwYmUDZQJ2DVGoJsifkB2Xd1mAmWnT9jbzuguxaY+iVRo2XUOuK
         t68mZBfwa97INSPax8mSu5y3MByml9uAw6ozgMYFjF/llAJ3i8cNKSUZ2MsALAgP1DjY
         oFD0NM+EgVWfCrD6fkPWe6BtJg64UZ4TPBh+a+qSFJN86U5iLpb5Q3JuM0zAaiGHpSPX
         2cFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U5w6t51wi/NJAU0rulc7jt2qH+Lioz+UwXc7O5pAq7g=;
        fh=7Id7wCJe1bPBH8iOViIqtaZbewXQPZIHLGn4yPkSzMw=;
        b=YDFrnKTBLTdWSTMN5f2ppJ67cBPydPavYjhUBOcgE1/8cJ/Ds0iBt7rh+6bp1MIVsL
         30NS6DJcJpBcNZi6t+lmMoPAmdIqPJgOMl67JBlOYyvejrvdcFKG21ItfI5tgfCvFLmG
         6C7NUwWTq/94N1mwTeYCTTtjWKT7dRqInkmfxDMW1xXbAZb2qTdy2szMO3txrT7NOUxf
         5KJamSXXHB6b2D6R3M3fc7W7qNv2fK9YgbJAfzfRxX1hEOcHnX7MD1PzUwctZAC9cH62
         abYRWjZ/Qk1SDQIuqrN7euY4ebPXAT/mGPUDoNgCQDTK4MR6oURMbxXY7/MV9dbmPWBh
         C/QQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777065498; x=1777670298; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5w6t51wi/NJAU0rulc7jt2qH+Lioz+UwXc7O5pAq7g=;
        b=Nv5ZbtH7xhf1lLk5zv8QueCB3OmzqwL4SJXmOnAzt7J/ylogGj/DBvOppkxFm31lEn
         SgxusTEoHJmyolw2CPDUiX0/65EKG1kzr+a2XH8ZzZFm3PTMZx2Wqkw4DY687lp0LvdY
         hYI9XsuGM8OgIpRutBx53pcbZUcvLomt1pPcOAFnWaDTGKdxIXjtvHouykVRKNzdE2Ug
         B7LiUVhUmZz0465Hf67zdxV7Y5/rHvhgGxkjqPqAoMzsskn2rgEEiKQQzYuPlzXETDn6
         24jiy5f2dCmLiXqRFyisGL8uc4GZNGYxT2Q7CWq6qTYh04hrsHglGV8Obf/RnwxEigKi
         FBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777065498; x=1777670298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U5w6t51wi/NJAU0rulc7jt2qH+Lioz+UwXc7O5pAq7g=;
        b=Qoh9wi7nuXkyts7Dz91hKYaRJTatRha2vF9yZfjrDZYrxnle9bG6AP6+wF9V59FuE/
         o6VJvP4qBLnTnnyKIQ0ffMM+j6iyVbZ1WBILoCjD0S2GXSuXe+P5i6lI0SvQkF0eLyp+
         cDb65YvZAsaRh93kPF/u54NpQrl9bvVp5b6yvrLR7oCU2TDBlaTMp9d48RpU74qoOXqD
         COXCuITR9nlEg5ozb3Iu6ssyBHFhc9U0cQPpgj1XhsOLCJsDKc68tvh6klsdiklvIIAa
         YDGB0pyeAHBlcp52LHDqno/eCK3k8dkciNKV5flnQeI5m+FZMKdal2nvCNdujUkuetqf
         Xtag==
X-Gm-Message-State: AOJu0YxxED2yXRu5iZigaz4fqhUf3RaKemAjR/T9P0hCIGt4O/3C9lfl
	gptk+VWHixDxx7iwhUnEFVfzHuzMTkqAhFZTW4NABzmS7WetAde1fNgTh3bulrhgCgK0VZlEOjb
	R9bxoYkYcPFIc9JWtydOCsoNaXdynA1E=
X-Gm-Gg: AeBDieunRSqTBz2/ApUI62E3byIut1Yg21HBToc1jUoRsRHYrqiQwqicWwlyOelTdST
	3iZ35AtGmwlnZWoT43ev+wazLQrECWTbNK4RQl7m/vqdEYKBck+zGJzLfJ7lX6IvkFJ1IeQhDEJ
	UCt8B+XFS4Bi1JNYaaWjS2evJx5ZAE1DykoMjvcni8Mq4hYh+9DNvLEzdkxEqBfGnExpnxJSbbp
	Wns2zFogimRqZmv8tootqiDohkp6BZPtNXXzd+TRpvHpjB/y3SzFfacUkWqNPadXKImVNRaN0qd
	H+t1kEAIjSUEl/9/0g==
X-Received: by 2002:a17:907:2d09:b0:bad:6134:7125 with SMTP id
 a640c23a62f3a-bad61347395mr313790766b.38.1777065497270; Fri, 24 Apr 2026
 14:18:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <12879883.O9o76ZdvQC@rafael.j.wysocki> <5107109.31r3eYUQgx@rafael.j.wysocki>
 <CAGAxtY0av_gAk6Up9W8RHjrzWurHEou4RBNnv5wwSEsTUNT52Q@mail.gmail.com> <12895688.O9o76ZdvQC@rafael.j.wysocki>
In-Reply-To: <12895688.O9o76ZdvQC@rafael.j.wysocki>
From: Evgeny Sagatov <evgeny.sagatov@gmail.com>
Date: Sat, 25 Apr 2026 00:18:02 +0300
X-Gm-Features: AQROBzBbz2A88RJqj9dFXx4Zfq70CenLvK7W2crgZXC-_gqkK-m5N4_vzzAGsQY
Message-ID: <CAGAxtY13R3F6M4HFiwwsx8SEbcUsu5mQKJrayaCGFp14cEB2wg@mail.gmail.com>
Subject: Re: Pressing the power button causes the device to freeze completely
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: regressions@lists.linux.dev, linux-acpi@vger.kernel.org, 
	Thorsten Leemhuis <regressions@leemhuis.info>, LKML <linux-kernel@vger.kernel.org>, 
	Wysocki Rafael J <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

dmesg | grep "Fast frequency"
Nothing was displayed.

The PC froze when I pressed the power button. Nothing in the log.

I applied this patch after deleting all the previous ones. Is this correct?

I received this message when applying a patch. Perhaps we have
different versions of the source code? I'm using 7.0.0.
patching file drivers/acpi/acpica/evevent.c
patching file drivers/cpufreq/acpi-cpufreq.c
Hunk #1 succeeded at 895 (offset -17 lines).
patching file drivers/cpufreq/cpufreq.c

=D0=BF=D1=82, 24 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 22:45, Raf=
ael J. Wysocki <rafael@kernel.org>:
>
> On Friday, April 24, 2026 7:06:50 PM CEST Evgeny Sagatov wrote:
> > dmesg | grep "Fast frequency"
> > [    8.903099] cpufreq: CPU0: Fast frequency switching enabled
> > [    8.903181] cpufreq: CPU1: Fast frequency switching enabled
> > [    8.903247] cpufreq: CPU2: Fast frequency switching enabled
> > [    8.903316] cpufreq: CPU3: Fast frequency switching enabled
>
> If it is enabled, let's try to disable it and see what happens.
>
> > When I pressed the power button, the PC froze. Nothing in the log.
>
> Below is an updated version of the previous patch which additionally
> disables fast frequency switching in the ACPI cpufreq driver that is
> in use on your system.
>
> The "Fast frequency switching enabled" messages should not be there
> any more in the log with this patch applied (please verify) and
> please check if pressing the power button will still lock up the
> system.
>
> ---
>  drivers/acpi/acpica/evevent.c  |    5 +++++
>  drivers/cpufreq/acpi-cpufreq.c |    3 +--
>  drivers/cpufreq/cpufreq.c      |    1 +
>  3 files changed, 7 insertions(+), 2 deletions(-)
>
> --- a/drivers/acpi/acpica/evevent.c
> +++ b/drivers/acpi/acpica/evevent.c
> @@ -243,6 +243,11 @@ static u32 acpi_ev_fixed_event_dispatch(
>         (void)acpi_write_bit_register(acpi_gbl_fixed_event_info[event].
>                                       status_register_id, ACPI_CLEAR_STAT=
US);
>
> +       if (event =3D=3D ACPI_EVENT_POWER_BUTTON) {
> +               pr_info("ACPI power button event\n");
> +               return (ACPI_INTERRUPT_HANDLED);
> +       }
> +
>         /*
>          * Make sure that a handler exists. If not, report an error
>          * and disable the event to prevent further interrupts.
> --- a/drivers/cpufreq/acpi-cpufreq.c
> +++ b/drivers/cpufreq/acpi-cpufreq.c
> @@ -912,8 +912,7 @@ static int acpi_cpufreq_cpu_init(struct
>          */
>         data->resume =3D 1;
>
> -       policy->fast_switch_possible =3D !acpi_pstate_strict &&
> -               !(policy_is_shared(policy) && policy->shared_type !=3D CP=
UFREQ_SHARED_TYPE_ANY);
> +       policy->fast_switch_possible =3D false;
>
>         if (perf->states[0].core_frequency * 1000 !=3D freq_table[0].freq=
uency)
>                 pr_warn(FW_WARN "P-state 0 is not max freq\n");
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -473,6 +473,7 @@ void cpufreq_enable_fast_switch(struct c
>         if (cpufreq_fast_switch_count >=3D 0) {
>                 cpufreq_fast_switch_count++;
>                 policy->fast_switch_enabled =3D true;
> +               pr_info("CPU%u: Fast frequency switching enabled\n", poli=
cy->cpu);
>         } else {
>                 pr_warn("CPU%u: Fast frequency switching not enabled\n",
>                         policy->cpu);
>
>
>
