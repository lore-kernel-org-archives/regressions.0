Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635F71D559
	for <regressions@lists.linux.dev>; Fri, 26 Jan 2024 16:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706286310; cv=none; b=GFy44PmYCn2r3q7NhFBpI+YIcAuBecXwmm46xHUR+wbs4eacnspLKbuZ2TKVCCADzehiksW/jzyN8eAWBsMWcX15brBaKnJhcm9NBgwsTd0zNosVjVe3HZMkEBtrzCbRw/MVYhLvKOHe5EIEhinHzGCNWJMF/sHChZS7WU9nfFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706286310; c=relaxed/simple;
	bh=rkyEAQM+6UgoIhUpKglpYh+/fPUTA002BGUcrih7qMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eMlJ0xMiVlq4L7LmWZG+xZpckfv7x474bUSxpmx6piuU9ou8ej7HGJDkc/TKPQNRgPORikrWqM/eZ24z6q5jbMd7NIDjfP/VCuURvPLTDZBkLhmpOV8h1yVWq1iJOOOgGtjLOk0RXi+1J4GL2tWSlAy/HPg+sTksHiHwiCv/c44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GcN56TJy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GcN56TJy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706286308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k9jGyRunXhx9f3fqCutMQZMdux8M2R/dgAiwcOqK1p8=;
	b=GcN56TJyK+4TkENokQsEX2Vaq4YLluktYQYeWNX6VjU5Oz6dSWoZ7Hhs3pTLDv+D2wF/og
	45vSHjACkON10Q9x84JgSHfJgojJVZyKBLd0uAfpZHA8ydlO/Z0qq6T1hye4aRNeYf/yj5
	RV38vGip9O2LlMlYPRhfb2glC4vpsAc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-vtNLtAPNP82g77q9HyWEVg-1; Fri, 26 Jan 2024 11:25:06 -0500
X-MC-Unique: vtNLtAPNP82g77q9HyWEVg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a2c653c7b35so39695866b.0
        for <regressions@lists.linux.dev>; Fri, 26 Jan 2024 08:25:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706286305; x=1706891105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k9jGyRunXhx9f3fqCutMQZMdux8M2R/dgAiwcOqK1p8=;
        b=mQzluafQ3vtnpBvi17JCWS/xCN8BPSlBRieug+ZLyD4+nH/aBL2xeSVVY1OI/pkDSv
         C1IvEC2J9Qdl9XGuMCo5zD0nwDZbPgcxu7OZkIwbNF1gTZk19INSYwJ5ymunPQ7viPdB
         DxqmgrBs83zmkzA265FbJmLBtXc9gFxNgjVZO7TkeznNXeOrkh+3LkGPeDpXF9vlTxiL
         neVZ1TSqPXINEd/gLkjJ1sdx2VPHZfTvemfQooUwazrNntU8DJzQm4cjx+9gAvkQFilM
         A44HOpnf00yNAVaPy1lQQVItrC+r2UYKEbPk+MyUo0z4l7hvuczilt9rEz1GcGFyO3oJ
         SHwA==
X-Gm-Message-State: AOJu0Yxgc8ExzhbtM7fyBKnEkG488NC/kiFCD9RNZ/4WjzehczysKjHM
	uKzbns+bK7EAKuVMYt4EHNLSNJ88v7okxozwuvSsa6H1UxosX9WUIS06huEIWVgZn38sdTgqBup
	K4S75ex+JUGfbfSvHvFbJ9b/igVZ3v49EGshWYu+gC5svGxtV+iK+QdVlmjcg
X-Received: by 2002:a17:906:ae50:b0:a2b:63ca:cee0 with SMTP id lf16-20020a170906ae5000b00a2b63cacee0mr614143ejb.11.1706286305235;
        Fri, 26 Jan 2024 08:25:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3ETPAiVnGLgfl4B6csIWfBVfcLCExa8peKEnvKQEF6HoRJQJ8bTZfqNJQzuChVxRteDhFOw==
X-Received: by 2002:a17:906:ae50:b0:a2b:63ca:cee0 with SMTP id lf16-20020a170906ae5000b00a2b63cacee0mr614140ejb.11.1706286304945;
        Fri, 26 Jan 2024 08:25:04 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l26-20020a1709060e1a00b00a2bf375ceebsm776744eji.208.2024.01.26.08.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 08:25:04 -0800 (PST)
Message-ID: <7c6e5e19-075c-4dd6-bbcf-89c7b5fe67b6@redhat.com>
Date: Fri, 26 Jan 2024 17:25:03 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH regression fix 1/2] Input: atkbd - Skip ATKBD_CMD_SETLEDS
 when skipping ATKBD_CMD_GETID
To: Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, stable@vger.kernel.org,
 regressions@lists.linux.dev, linux-input@vger.kernel.org
References: <20240126160724.13278-1-hdegoede@redhat.com>
 <20240126160724.13278-2-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240126160724.13278-2-hdegoede@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/26/24 17:07, Hans de Goede wrote:
> After commit 936e4d49ecbc ("Input: atkbd - skip ATKBD_CMD_GETID in
> translated mode") the keyboard on Dell XPS 13 9350 / 9360 / 9370 models
> has stopped working after a suspend/resume.
> 
> The problem appears to be that atkbd_probe() fails when called
> from atkbd_reconnect() on resume, which on systems where
> ATKBD_CMD_GETID is skipped can only happen by ATKBD_CMD_SETLEDS
> failing. ATKBD_CMD_SETLEDS failing because ATKBD_CMD_GETID was
> skipped is weird, but apparently that is what is happening.

Thinking more about it, what is likely happening here is that
ATKBD_CMD_SETLEDS is being send from atkbd_probe() where as
before atkbd_probe() would call ATKBD_CMD_GETID() and if that
succeeded (which it likely did) atkbd_probe() would continue with
calling atkbd_deactivate() and then exit, never calling
ATKBD_CMD_SETLEDS (at least not from atkbd_probe()).

So the problem seems to be that the embedded controller
does not like receiving ending ATKBD_CMD_SETLEDS as
the first command after resume and that being the first
command after resume is new behavior introduced by
936e4d49ecbc ("Input: atkbd - skip ATKBD_CMD_GETID in translated mode")

After applying both patches from this set (which is what
Paul tested), the ATKBD_CMD_GETID will still be skipped
but instead of replacing it with a ATKBD_CMD_SETLEDS
atkbd_probe() now continues with calling atkbd_deactivate()
and then exits as before the recent changes.

So after applying both patches here the behavior change
compared to before 936e4d49ecbc is limited to just
skipping ATKBD_CMD_GETID rather then effectively
replacing it with ATKBD_CMD_SETLEDS.

Regards,

Hans






> 
> Fix this by also skipping ATKBD_CMD_SETLEDS when skipping
> ATKBD_CMD_GETID.
> 
> Fixes: 936e4d49ecbc ("Input: atkbd - skip ATKBD_CMD_GETID in translated mode")
> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Closes: https://lore.kernel.org/linux-input/0aa4a61f-c939-46fe-a572-08022e8931c7@molgen.mpg.de/
> Closes: https://bbs.archlinux.org/viewtopic.php?pid=2146300
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218424
> Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2260517
> Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/input/keyboard/atkbd.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> index 13ef6284223d..c229bd6b3f7f 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -811,7 +811,6 @@ static int atkbd_probe(struct atkbd *atkbd)
>  {
>  	struct ps2dev *ps2dev = &atkbd->ps2dev;
>  	unsigned char param[2];
> -	bool skip_getid;
>  
>  /*
>   * Some systems, where the bit-twiddling when testing the io-lines of the
> @@ -825,6 +824,11 @@ static int atkbd_probe(struct atkbd *atkbd)
>  				 "keyboard reset failed on %s\n",
>  				 ps2dev->serio->phys);
>  
> +	if (atkbd_skip_getid(atkbd)) {
> +		atkbd->id = 0xab83;
> +		return 0;
> +	}
> +
>  /*
>   * Then we check the keyboard ID. We should get 0xab83 under normal conditions.
>   * Some keyboards report different values, but the first byte is always 0xab or
> @@ -833,18 +837,17 @@ static int atkbd_probe(struct atkbd *atkbd)
>   */
>  
>  	param[0] = param[1] = 0xa5;	/* initialize with invalid values */
> -	skip_getid = atkbd_skip_getid(atkbd);
> -	if (skip_getid || ps2_command(ps2dev, param, ATKBD_CMD_GETID)) {
> +	if (ps2_command(ps2dev, param, ATKBD_CMD_GETID)) {
>  
>  /*
> - * If the get ID command was skipped or failed, we check if we can at least set
> + * If the get ID command failed, we check if we can at least set
>   * the LEDs on the keyboard. This should work on every keyboard out there.
>   * It also turns the LEDs off, which we want anyway.
>   */
>  		param[0] = 0;
>  		if (ps2_command(ps2dev, param, ATKBD_CMD_SETLEDS))
>  			return -1;
> -		atkbd->id = skip_getid ? 0xab83 : 0xabba;
> +		atkbd->id = 0xabba;
>  		return 0;
>  	}
>  

