Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BE5F9C1
	for <regressions@lists.linux.dev>; Fri,  2 Feb 2024 04:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706849807; cv=none; b=D7HFpMhwURMqO/9MA1uggAkdwQPra3+HsZ9LBdqImpSE12yBeVrShPwks50Ndd2hgKTO8AT+2RZKH7Qxmpqy5ldxOSQEDU1lcpVSfy//+BG9nEZc+8wY2JQ5ajRug3NXLpW+1Dj2i6Ye0XSP9vPGlA8sw91W1vBFO+hsySkZ6T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706849807; c=relaxed/simple;
	bh=VwBoSb/V7TcqEYO+IMJjfTn/Zoe4yK102sNVcscuwF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkT4gR6tH2RvJxqeZb4eiwusU5krrzsqKelTQT1WXePAptBb5bJ6uN6PjgPElePxKeIl3H/wsA2bjiJWheF4S0Q91g08N2eAokNAFAr8ZjRYGbVrhbTkIawe8SmGfiZqs7Rt4bXuR2W0Wgo/Gf7E8xYb1QfDj9SsRCOfZu92FRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtoJ9TNu; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtoJ9TNu"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so1422854a12.0
        for <regressions@lists.linux.dev>; Thu, 01 Feb 2024 20:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706849805; x=1707454605; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ffwccEJwM3X88Nsb0fh+JyW5l/872KQTV4sk735VzA=;
        b=AtoJ9TNu6jXtBn2BsqB0Nuhd7NFa4ZjvPOVCIDejhQFYyV+ChFN7jJ0xLjWo8HkQm2
         rO1IbEL/UMxGkye8mrx267ucTsgPUjyKWr/nUF9KJ6Fv9oHtWApcz4ud0XQogXeLoYq1
         JOFvXe1OrI4dOG/FuPUnuvwf/ciawCMfSPQvgJvhaK27c0nzgJITizLpfoXcf9W/EDVT
         YSKum9SaVqWhmgvcdxi8f9KzgNcyVh62AWAZ2eZKJ6XxsE2KAg8FK3hBf0pSni+c9nqI
         4oSIkh/BxitDfLUcHXikRCd0YWip8G1mGILBn7FxE7Rwc0zZfXnbDQioyd+c6z+Ii05R
         6G2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706849805; x=1707454605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ffwccEJwM3X88Nsb0fh+JyW5l/872KQTV4sk735VzA=;
        b=wKSm2RFSrq1cHRHAlG4mVzYdH85M0R2t3Sy6WZeTYaymWf8RMbPcOMAYQO3xKS/APE
         fjj9HuzMykiK3N16ez88QjAj2D7t48/8P3/MjlhnBKf2qASCASQ+wRNH4DA0qiGhu7ir
         vLxZXybI8v+DBGqJgwdfK7FZIc+mYpCqAN4olT+oq0P6cXZR0rpiIW7qLxXH3QRD6sEI
         mmotNzgtx+mxdkX7hpd3zJj9M3xNv8ecd7/QUlhT4BS2iMhx3B75BFX9Z9lFJk5WI3TH
         eVyS1P0MjbZkc7fmvUESn9gdbowX8LzdSUZ8YeC0OqKHLKPjctPLrneYCP76WCm/7M35
         MRkg==
X-Gm-Message-State: AOJu0YyOjKNP4vY1cwOVb6DSG0V9MQMvAayf1izKVkCozCIJaUrJMyCN
	g0L3tNS1RrBFa1trbQbNTaAPLEyd3dVVd1ryzlOf1Rkmj/5kfON5
X-Google-Smtp-Source: AGHT+IGgLVZbww0XpQ9vw73ddoiQRtdj4pdLxOncNNvPGlP2aDoWBqeNbSQFRrZPgbmREiJMyJnESQ==
X-Received: by 2002:a05:6a20:3d06:b0:19c:6a60:b433 with SMTP id y6-20020a056a203d0600b0019c6a60b433mr4888775pzi.3.1706849805521;
        Thu, 01 Feb 2024 20:56:45 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX9TM6nv40KZJfTQb9AvCFB3ucZY0S1zNsQ5Do4wcmczMxBH+qPYM0uScT2hlSMnjwbKcS7YqN8Zg44kywAGpaPb3wEjn3X7USpSikl6hUC1Up12n0DXCd/1uirVEW53J1qHEn8gMABPLtym5kc9D6ezjCOJHmU1T8vU1vVstj2TtfwLZrzvV/MEdsoa5Vc229Mls4ODj0P8+xDUg==
Received: from google.com ([2620:15c:9d:2:c30c:2f35:dc97:44fc])
        by smtp.gmail.com with ESMTPSA id mn16-20020a1709030a5000b001d9033b9d8csm681585plb.59.2024.02.01.20.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 20:56:45 -0800 (PST)
Date: Thu, 1 Feb 2024 20:56:42 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, stable@vger.kernel.org,
	regressions@lists.linux.dev, linux-input@vger.kernel.org
Subject: Re: [PATCH regression fix 2/2] Input: atkbd - Do not skip
 atkbd_deactivate() when skipping ATKBD_CMD_GETID
Message-ID: <Zbx2Cuhfy-rpcvCE@google.com>
References: <20240126160724.13278-1-hdegoede@redhat.com>
 <20240126160724.13278-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126160724.13278-3-hdegoede@redhat.com>

On Fri, Jan 26, 2024 at 05:07:24PM +0100, Hans de Goede wrote:
> After commit 936e4d49ecbc ("Input: atkbd - skip ATKBD_CMD_GETID in
> translated mode") not only the getid command is skipped, but also
> the de-activating of the keyboard at the end of atkbd_probe(), potentially
> re-introducing the problem fixed by commit be2d7e4233a4 ("Input: atkbd -
> fix multi-byte scancode handling on reconnect").
> 
> Make sure multi-byte scancode handling on reconnect is still handled
> correctly by not skipping the atkbd_deactivate() call.
> 
> Fixes: 936e4d49ecbc ("Input: atkbd - skip ATKBD_CMD_GETID in translated mode")
> Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/input/keyboard/atkbd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> index c229bd6b3f7f..7f67f9f2946b 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -826,7 +826,7 @@ static int atkbd_probe(struct atkbd *atkbd)
>  
>  	if (atkbd_skip_getid(atkbd)) {
>  		atkbd->id = 0xab83;
> -		return 0;
> +		goto deactivate_kbd;
>  	}
>  
>  /*
> @@ -863,6 +863,7 @@ static int atkbd_probe(struct atkbd *atkbd)
>  		return -1;
>  	}
>  
> +deactivate_kbd:
>  /*
>   * Make sure nothing is coming from the keyboard and disturbs our
>   * internal state.

I wonder if we need to do the same for the case when we go into SET LEDS
branch... This can be done in a separate patch though.

Thanks.

-- 
Dmitry
